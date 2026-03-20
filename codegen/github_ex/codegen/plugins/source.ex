defmodule GitHubEx.Codegen.Plugins.Source do
  @moduledoc false

  alias GitHubEx.Codegen
  alias PristineCodegen.Source.Dataset

  @http_methods ~w(get post put patch delete head options)
  @default_pagination_limit_param "per_page"

  @spec load(module(), keyword()) :: Dataset.t()
  def load(_provider_module, opts) when is_list(opts) do
    paths = Codegen.paths(opts)
    spec = paths.full_spec_path |> File.read!() |> Jason.decode!()
    entries = operation_entries(spec)
    {operations, pagination_policies} = build_operations(entries, spec)

    %Dataset{
      operations: operations,
      schemas: [],
      auth_policies: [],
      pagination_policies: pagination_policies,
      docs_inventory: docs_inventory(paths.project_root, operations),
      fingerprints: fingerprints(paths)
    }
  end

  defp build_operations(entries, spec) do
    components = Map.get(spec, "components", %{})

    entries =
      entries
      |> Enum.map(&build_entry(&1, components))
      |> assign_unique_function_names()
      |> Enum.sort_by(&{inspect(&1.module), Atom.to_string(&1.function), &1.path_template})

    Enum.map_reduce(entries, %{}, fn entry, policies ->
      {pagination_policy_id, pagination_policy} = pagination_policy(entry, components)

      policies =
        case pagination_policy do
          nil -> policies
          policy -> Map.put_new(policies, pagination_policy_id, policy)
        end

      {build_operation(entry, pagination_policy_id), policies}
    end)
    |> then(fn {operations, policies} ->
      {operations, policies |> Map.values() |> Enum.sort_by(& &1.id)}
    end)
  end

  defp build_entry({path, method, operation, shared_parameters}, components) do
    parameters =
      shared_parameters ++ Map.get(operation, "parameters", [])

    module =
      operation
      |> Map.get("tags", ["Misc"])
      |> List.first()
      |> module_from_tag()

    function = operation_function_name(operation, method, path)

    %{
      id: operation["operationId"] || "#{method} #{path}",
      method: String.to_atom(method),
      module: module,
      function: function,
      path_template: path,
      responses: Map.get(operation, "responses", %{}),
      summary: normalize_text(operation["summary"]),
      description: normalize_text(operation["description"]),
      docs_url: get_in(operation, ["externalDocs", "url"]),
      path_params: normalize_params(parameters, "path", components),
      query_params: normalize_params(parameters, "query", components),
      header_params: normalize_params(parameters, "header", components),
      body: body_partition(method, request_content_types(operation, components)),
      form_data: form_data_partition(request_content_types(operation, components)),
      auth_policy_id: nil,
      runtime_metadata: runtime_metadata(module, function, String.to_atom(method), path)
    }
  end

  defp build_operation(entry, pagination_policy_id) do
    %{
      id: entry.id,
      module: entry.module,
      function: entry.function,
      method: entry.method,
      path_template: entry.path_template,
      summary: entry.summary,
      description: entry.description,
      path_params: entry.path_params,
      query_params: entry.query_params,
      header_params: entry.header_params,
      body: entry.body,
      form_data: entry.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth_policy_id: entry.auth_policy_id,
      pagination_policy_id: pagination_policy_id,
      runtime_metadata: entry.runtime_metadata,
      docs_metadata: %{
        doc: operation_doc(entry.summary, entry.description),
        doc_url: entry.docs_url,
        examples: []
      }
    }
  end

  defp pagination_policy(entry, components) do
    items_path = inferred_items_path(entry, components)

    if paginatable?(entry, items_path) do
      policy_id = pagination_policy_id(items_path)

      {policy_id,
       %{
         id: policy_id,
         strategy: :link_header,
         request_mapping: %{limit_param: @default_pagination_limit_param},
         response_mapping: %{link_header: "link"},
         default_limit: nil,
         items_path: items_path
       }}
    else
      {nil, nil}
    end
  end

  defp paginatable?(_entry, :unknown), do: false

  defp paginatable?(entry, _items_path) do
    summary = entry.summary || ""
    function_name = Atom.to_string(entry.function)
    query_names = Enum.map(entry.query_params, & &1.name)

    entry.method == :get and
      (String.starts_with?(summary, "List ") or
         String.starts_with?(function_name, "list_") or
         String.starts_with?(entry.path_template, "/search/") or
         Enum.any?(query_names, &(&1 in ["page", @default_pagination_limit_param])))
  end

  defp pagination_policy_id(nil), do: "github.link_header.array"
  defp pagination_policy_id(items_path), do: "github.link_header.#{Enum.join(items_path, ".")}"

  defp inferred_items_path(entry, components) do
    case success_response_schema(entry, components) do
      nil ->
        :unknown

      schema ->
        infer_items_path(schema, components)
    end
  end

  defp infer_items_path(schema, components) do
    schema = resolve_schema(schema, components)

    cond do
      schema == nil ->
        :unknown

      array_schema?(schema, components) ->
        nil

      true ->
        infer_object_items_path(object_array_properties(schema, components))
    end
  end

  defp object_array_properties(schema, components) do
    schema
    |> object_properties(components)
    |> Enum.filter(fn {_name, property_schema} -> array_schema?(property_schema, components) end)
    |> Enum.map(&elem(&1, 0))
    |> Enum.sort()
  end

  defp object_properties(nil, _components), do: []

  defp object_properties(schema, components) do
    schema = resolve_schema(schema, components)

    direct_properties =
      schema
      |> Map.get("properties", %{})
      |> Enum.to_list()

    composed_properties =
      schema
      |> Map.get("allOf", [])
      |> Enum.flat_map(&object_properties(&1, components))

    (direct_properties ++ composed_properties)
    |> Enum.uniq_by(&elem(&1, 0))
  end

  defp array_schema?(nil, _components), do: false

  defp array_schema?(schema, components) do
    schema = resolve_schema(schema, components)

    cond do
      Map.get(schema, "type") == "array" ->
        true

      is_list(schema["anyOf"]) ->
        Enum.any?(schema["anyOf"], &array_schema?(&1, components))

      is_list(schema["oneOf"]) ->
        Enum.any?(schema["oneOf"], &array_schema?(&1, components))

      is_list(schema["allOf"]) ->
        Enum.any?(schema["allOf"], &array_schema?(&1, components))

      true ->
        false
    end
  end

  defp success_response_schema(entry, components) do
    entry.responses
    |> Enum.sort_by(fn {status, _response} -> success_status_rank(status) end)
    |> Enum.find_value(fn {status, response} ->
      if success_status?(status) do
        response
        |> resolve_response(components)
        |> response_schema(components)
      end
    end)
  end

  defp response_schema(nil, _components), do: nil

  defp response_schema(response, components) do
    response
    |> Map.get("content", %{})
    |> preferred_content_schema()
    |> resolve_schema(components)
  end

  defp preferred_content_schema(content) when is_map(content) and map_size(content) > 0 do
    content
    |> Enum.sort_by(fn {content_type, _schema} -> content_type_sort_key(content_type) end)
    |> hd()
    |> elem(1)
    |> Map.get("schema")
  end

  defp preferred_content_schema(_content), do: nil

  defp content_type_sort_key("application/json"), do: {0, "application/json"}
  defp content_type_sort_key(other), do: {1, other}

  defp success_status_rank("200"), do: 0
  defp success_status_rank("201"), do: 1
  defp success_status_rank("202"), do: 2
  defp success_status_rank("203"), do: 3
  defp success_status_rank("204"), do: 4
  defp success_status_rank(status), do: {9, status}

  defp success_status?(status) when is_binary(status) do
    case Integer.parse(status) do
      {code, ""} -> code in 200..299
      _other -> false
    end
  end

  defp normalize_params(parameters, location, components) do
    parameters
    |> Enum.map(&resolve_parameter(&1, components))
    |> Enum.filter(&(&1["in"] == location))
    |> Enum.map(fn parameter ->
      %{
        name: parameter["name"],
        key: parameter_name_atom(parameter["name"]),
        required: parameter["required"] || false
      }
    end)
    |> Enum.uniq_by(&{&1.name, &1.key})
  end

  defp request_content_types(operation, components) do
    operation
    |> Map.get("requestBody", %{})
    |> resolve_request_body(components)
    |> Map.get("content", %{})
    |> Map.keys()
  end

  defp body_partition("get", []), do: %{mode: :none}
  defp body_partition("get", _content_types), do: %{mode: :key, key: {"body", :body}}
  defp body_partition("head", []), do: %{mode: :none}
  defp body_partition("head", _content_types), do: %{mode: :key, key: {"body", :body}}
  defp body_partition(_method, []), do: %{mode: :none}

  defp body_partition(_method, content_types) do
    cond do
      Enum.any?(content_types, &String.contains?(&1, "json")) ->
        %{mode: :remaining}

      Enum.any?(content_types, &String.contains?(&1, "form")) ->
        %{mode: :none}

      true ->
        %{mode: :key, key: {"body", :body}}
    end
  end

  defp form_data_partition(content_types) do
    if Enum.any?(content_types, &String.contains?(&1, "form")) do
      %{mode: :remaining}
    else
      %{mode: :none}
    end
  end

  defp runtime_metadata(module, function, method, path) do
    resource = runtime_resource(path)

    %{
      resource: resource,
      retry_group: runtime_retry_group(method, resource),
      circuit_breaker: runtime_circuit_breaker(resource),
      rate_limit_group: "github.integration",
      telemetry_event: telemetry_event(module, function),
      timeout_ms: nil
    }
  end

  defp runtime_resource("/applications/" <> _rest), do: "oauth_application"

  defp runtime_resource("/app/installations/" <> rest) do
    if String.ends_with?(rest, "/access_tokens"), do: "app_auth", else: "app_api"
  end

  defp runtime_resource("/app" <> _rest), do: "app_api"
  defp runtime_resource(_path), do: "core_api"

  defp runtime_retry_group(_method, "oauth_application"), do: "github.oauth"
  defp runtime_retry_group(_method, "app_auth"), do: "github.app_auth"
  defp runtime_retry_group(method, _resource) when method in [:get, :head], do: "github.read"
  defp runtime_retry_group(:delete, _resource), do: "github.delete"
  defp runtime_retry_group(_method, _resource), do: "github.write"

  defp runtime_circuit_breaker("oauth_application"), do: "oauth"
  defp runtime_circuit_breaker("app_auth"), do: "app_auth"
  defp runtime_circuit_breaker(_resource), do: "core_api"

  defp telemetry_event(module, function) do
    [
      :github_ex,
      module |> Module.split() |> List.last() |> Macro.underscore() |> String.to_atom(),
      function
    ]
  end

  defp docs_inventory(project_root, operations) do
    %{
      guides: doc_entries(project_root, Path.wildcard(Path.join(project_root, "guides/*.md"))),
      examples:
        doc_entries(
          project_root,
          Path.wildcard(Path.join(project_root, "examples/**/*.{md,ex,exs}"))
        ),
      operations:
        operations
        |> Enum.map(fn operation ->
          {operation.id,
           %{
             module: inspect(operation.module),
             function: Atom.to_string(operation.function),
             method: Atom.to_string(operation.method),
             path: operation.path_template,
             doc: operation.docs_metadata.doc,
             doc_url: operation.docs_metadata.doc_url
           }}
        end)
        |> Map.new()
    }
  end

  defp doc_entries(project_root, paths) do
    paths
    |> Enum.sort()
    |> Enum.map(fn path ->
      %{
        id: path |> Path.basename() |> Path.rootname(),
        path: Path.relative_to(path, project_root),
        title: doc_title(path)
      }
    end)
  end

  defp doc_title(path) do
    path
    |> File.read!()
    |> String.split("\n")
    |> Enum.find_value(fn line ->
      case String.trim(line) do
        "# " <> title -> title
        _other -> nil
      end
    end)
    |> case do
      nil -> path |> Path.basename() |> Path.rootname() |> String.replace("_", " ")
      title -> title
    end
  end

  defp fingerprints(paths) do
    %{
      sources:
        [paths.full_spec_path]
        |> Enum.filter(&File.exists?/1)
        |> Enum.sort()
        |> Enum.map(&fingerprint_source(&1, paths.project_root)),
      generation: %{
        compiler: "pristine_codegen",
        provider: "github_ex",
        source_strategy: "openapi_only",
        version: application_version(:pristine_codegen)
      }
    }
  end

  defp fingerprint_source(path, project_root) do
    %{
      path: Path.relative_to(path, project_root),
      kind: fingerprint_kind(path),
      sha256: sha256_file(path)
    }
  end

  defp fingerprint_kind(path) do
    cond do
      String.contains?(path, "/openapi/") -> :openapi
      true -> :source
    end
  end

  defp operation_entries(spec) do
    spec
    |> Map.get("paths", %{})
    |> Enum.flat_map(fn {path, methods} ->
      shared_parameters = Map.get(methods, "parameters", [])

      Enum.flat_map(methods, fn
        {method, operation} when method in @http_methods and is_map(operation) ->
          [{path, method, operation, shared_parameters}]

        _other ->
          []
      end)
    end)
    |> Enum.sort_by(fn {path, method, operation, _shared_parameters} ->
      {operation["operationId"] || "#{method} #{path}", method, path}
    end)
  end

  defp assign_unique_function_names(entries) do
    entries
    |> Enum.group_by(&{&1.module, &1.function})
    |> Enum.flat_map(fn
      {_key, [entry]} ->
        [entry]

      {{_module, function}, duplicates} ->
        duplicates
        |> Enum.with_index(1)
        |> Enum.map(fn {entry, index} ->
          %{entry | function: String.to_atom("#{function}_#{index}")}
        end)
    end)
  end

  defp operation_function_name(operation, method, path) do
    operation_id =
      operation["operationId"] ||
        [method, path]
        |> Enum.join("_")

    operation_id
    |> String.split("/")
    |> List.last()
    |> Macro.underscore()
    |> String.replace(~r/[^a-z0-9_]/, "_")
    |> String.trim("_")
    |> case do
      "" -> :"operation_#{:erlang.phash2({method, path})}"
      name -> String.to_atom(name)
    end
  end

  defp module_from_tag(nil), do: GitHubEx.Misc

  defp module_from_tag(tag) do
    tag
    |> to_string()
    |> String.split(~r/[^a-zA-Z0-9]+/, trim: true)
    |> Enum.map_join(&Macro.camelize/1)
    |> case do
      "" -> "Misc"
      module_name -> module_name
    end
    |> then(&Module.concat([GitHubEx, &1]))
  end

  defp infer_object_items_path([]), do: :unknown

  defp infer_object_items_path(array_properties) do
    cond do
      "items" in array_properties -> ["items"]
      match?([_single], array_properties) -> [hd(array_properties)]
      true -> :unknown
    end
  end

  defp operation_doc(summary, description) do
    [summary, description]
    |> Enum.reject(&blank?/1)
    |> Enum.join("\n\n")
  end

  defp normalize_text(nil), do: nil
  defp normalize_text(""), do: nil
  defp normalize_text(text), do: String.trim(text)

  defp resolve_parameter(%{"$ref" => "#/components/parameters/" <> name}, components) do
    components
    |> Map.get("parameters", %{})
    |> Map.get(name, %{})
  end

  defp resolve_parameter(parameter, _components), do: parameter

  defp resolve_request_body(%{"$ref" => "#/components/requestBodies/" <> name}, components) do
    components
    |> Map.get("requestBodies", %{})
    |> Map.get(name, %{})
  end

  defp resolve_request_body(request_body, _components), do: request_body || %{}

  defp resolve_response(%{"$ref" => "#/components/responses/" <> name}, components) do
    components
    |> Map.get("responses", %{})
    |> Map.get(name, %{})
  end

  defp resolve_response(response, _components), do: response

  defp resolve_schema(nil, _components), do: nil

  defp resolve_schema(%{"$ref" => "#/components/schemas/" <> name}, components) do
    components
    |> Map.get("schemas", %{})
    |> Map.get(name)
    |> resolve_schema(components)
  end

  defp resolve_schema(schema, _components), do: schema

  defp parameter_name_atom(name) do
    name
    |> to_string()
    |> Macro.underscore()
    |> String.replace(~r/[^a-z0-9_]/, "_")
    |> String.trim("_")
    |> String.to_atom()
  end

  defp sha256_file(path) do
    path
    |> File.read!()
    |> then(&:crypto.hash(:sha256, &1))
    |> Base.encode16(case: :lower)
  end

  defp application_version(app) do
    case Application.spec(app, :vsn) do
      nil -> "dev"
      vsn -> List.to_string(vsn)
    end
  end

  defp blank?(value), do: value in [nil, ""]
end

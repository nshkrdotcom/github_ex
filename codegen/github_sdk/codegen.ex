defmodule GitHubSDK.Codegen do
  @moduledoc """
  Build-time generation workflow for the GitHub REST SDK package.
  """

  @profile :github_sdk
  @default_spec_filename "api.github.com.2026-03-10.codegen.json"

  @spec profile() :: atom()
  def profile, do: @profile

  @spec project_root() :: String.t()
  def project_root do
    Path.expand("../..", __DIR__)
  end

  @spec paths(keyword()) :: map()
  def paths(opts \\ []) when is_list(opts) do
    project_root = Keyword.get(opts, :project_root, project_root())
    upstream_dir = Keyword.get(opts, :upstream_dir, Path.join(project_root, "priv/upstream"))

    %{
      generated_artifact_dir:
        Keyword.get(opts, :generated_artifact_dir, Path.join(project_root, "priv/generated")),
      generated_dir:
        Keyword.get(opts, :generated_dir, Path.join(project_root, "lib/github_sdk/generated")),
      project_root: project_root,
      spec_dir: Keyword.get(opts, :spec_dir, Path.join(upstream_dir, "openapi")),
      spec_path:
        Keyword.get(
          opts,
          :spec_path,
          Path.join(upstream_dir, Path.join("openapi", @default_spec_filename))
        ),
      upstream_dir: upstream_dir
    }
  end

  @spec generate!(keyword()) :: map()
  def generate!(opts \\ []) when is_list(opts) do
    paths = paths(opts)
    prepare_dirs!(paths)
    ensure_spec!(paths.spec_path)

    state =
      paths.spec_path
      |> File.read!()
      |> Jason.decode!()
      |> build_state(paths)

    persist_artifacts!(state, paths)
    state
  end

  defp prepare_dirs!(paths) do
    File.mkdir_p!(paths.spec_dir)
    File.rm_rf!(paths.generated_dir)
    File.mkdir_p!(paths.generated_dir)
    File.rm_rf!(paths.generated_artifact_dir)
    File.mkdir_p!(paths.generated_artifact_dir)
  end

  defp ensure_spec!(path) do
    case File.stat(path) do
      {:ok, %File.Stat{}} ->
        :ok

      {:error, _reason} ->
        raise ArgumentError,
              "missing committed GitHub REST codegen spec at #{path}; run mix github.refresh first"
    end
  end

  defp persist_artifacts!(state, paths) do
    operations = state.operations
    generated_files = state.generated_files

    summary = %{
      generated_files: generated_files,
      operation_count: length(operations),
      operation_modules: operations |> Enum.map(& &1.module) |> Enum.uniq() |> Enum.sort(),
      operations: Enum.map(operations, &persistable_operation/1),
      profile: Atom.to_string(profile()),
      schema_count: 0,
      spec_path: Path.relative_to(paths.spec_path, paths.project_root)
    }

    File.write!(
      Path.join(paths.generated_artifact_dir, "manifest.json"),
      Jason.encode_to_iodata!(summary, pretty: true)
    )

    File.write!(
      Path.join(paths.generated_artifact_dir, "open_api_state.snapshot.term"),
      :erlang.term_to_binary(%{
        operations: Enum.map(operations, &persistable_operation/1),
        schema_count: 0
      })
    )

    File.write!(
      Path.join(paths.generated_artifact_dir, "docs_manifest.json"),
      Jason.encode_to_iodata!(state.docs_manifest, pretty: true)
    )
  end

  defp build_state(spec, paths) do
    components = Map.get(spec, "components", %{})

    operations =
      spec
      |> Map.fetch!("paths")
      |> Enum.flat_map(fn {path, methods} ->
        shared_parameters = Map.get(methods, "parameters", [])

        Enum.flat_map(methods, fn {method, operation} ->
          build_operation_entry(path, method, operation, shared_parameters, components)
        end)
      end)
      |> assign_unique_function_names()

    operations
    |> Enum.group_by(& &1.module)
    |> Enum.map(fn {module_name, module_operations} ->
      file_path = Path.join(paths.generated_dir, "#{Macro.underscore(module_name)}.ex")

      file_path
      |> File.write!(format_source!(render_module_source(module_name, module_operations)))

      file_path
    end)

    %{
      docs_manifest: build_docs_manifest(operations, paths),
      generated_files:
        paths.generated_dir
        |> Path.join("*.ex")
        |> Path.wildcard()
        |> Enum.sort(),
      operations: operations
    }
  end

  defp build_operation(path, method, operation, components) do
    tag =
      operation
      |> Map.get("tags", ["Misc"])
      |> List.first()
      |> to_string()

    module_name = camelize(tag)
    function = operation_function_name(operation, method, path)
    parameters = operation_parameters(operation, components)
    content_types = request_content_types(operation, components)

    %{
      auth_strategy: auth_strategy(path),
      body_mode: body_mode(method, content_types),
      call: {Module.concat([GitHubSDK, module_name]), function},
      circuit_breaker: circuit_breaker(path),
      description: normalize_text(operation["description"]),
      form_data_mode: form_data_mode(content_types),
      function: function,
      header_params: parameters.header,
      method: String.to_atom(method),
      module: module_name,
      operation_id: operation["operationId"] || "#{method} #{path}",
      path: path,
      path_params: parameters.path,
      query_params: parameters.query,
      rate_limit: "github.integration",
      resource: resource(path),
      retry: retry_group(method, path),
      summary: normalize_text(operation["summary"]),
      use_default_auth: auth_strategy(path) != :oauth_application
    }
  end

  defp build_docs_manifest(operations, paths) do
    %{
      "generated_files" =>
        paths.generated_dir |> Path.join("*.ex") |> Path.wildcard() |> Enum.sort(),
      "operations" =>
        Enum.map(operations, fn operation ->
          %{
            "doc" => operation_doc(operation),
            "function" => Atom.to_string(operation.function),
            "method" => Atom.to_string(operation.method),
            "module" => operation.module,
            "operation_id" => operation.operation_id,
            "path" => operation.path
          }
        end)
    }
  end

  defp operation_doc(operation) do
    [operation.summary, operation.description]
    |> Enum.reject(&is_nil/1)
    |> Enum.join("\n\n")
  end

  defp render_module_source(module_name, operations) do
    operations_doc =
      operations
      |> Enum.map(fn operation ->
        "  * `#{operation.operation_id}`"
      end)
      |> Enum.join("\n")

    functions =
      operations
      |> Enum.sort_by(&{&1.function, &1.path})
      |> Enum.map_join("\n\n", &render_function_source(module_name, &1))

    """
    defmodule GitHubSDK.#{module_name} do
      @moduledoc \"\"\"
      Generated GitHub REST operations for the `#{module_name}` namespace.

      ## Operations

    #{operations_doc}
      \"\"\"

      @type result :: {:ok, term()} | {:error, GitHubSDK.Error.t()}

    #{functions}
    end
    """
  end

  defp render_function_source(module_name, operation) do
    doc = render_doc_literal(operation)

    """
      @doc #{doc}
      @spec #{operation.function}(GitHubSDK.Client.t()) :: result
      @spec #{operation.function}(GitHubSDK.Client.t(), map()) :: result
      def #{operation.function}(client, params \\\\ %{}) when is_map(params) do
        GitHubSDK.GeneratedSupport.execute(client, params, %{
          auth_strategy: #{inspect(operation.auth_strategy)},
          body_mode: #{inspect(operation.body_mode)},
          call: {GitHubSDK.#{module_name}, :#{operation.function}},
          circuit_breaker: #{inspect(operation.circuit_breaker)},
          form_data_mode: #{inspect(operation.form_data_mode)},
          headers: #{inspect(operation.header_params)},
          method: :#{operation.method},
          path: #{inspect(operation.path_params)},
          path_template: #{inspect(operation.path)},
          query: #{inspect(operation.query_params)},
          rate_limit: #{inspect(operation.rate_limit)},
          resource: #{inspect(operation.resource)},
          retry: #{inspect(operation.retry)},
          use_default_auth: #{inspect(operation.use_default_auth)}
        })
      end
    """
  end

  defp render_doc_literal(operation) do
    doc =
      [
        operation.summary,
        operation.description,
        "Path: #{operation.path}",
        "Method: #{operation.method}"
      ]
      |> Enum.reject(&is_nil/1)
      |> Enum.join("\n\n")

    inspect(doc)
  end

  defp operation_parameters(operation, components) do
    parameters =
      operation
      |> Map.get("parameters", [])
      |> Enum.reduce(%{header: [], path: [], query: []}, fn parameter, acc ->
        parameter = resolve_ref(parameter, components)
        name = parameter["name"]
        atom = parameter_name_atom(name)

        case parameter["in"] do
          "path" -> update_in(acc.path, &[{name, atom} | &1])
          "query" -> update_in(acc.query, &[{name, atom} | &1])
          "header" -> update_in(acc.header, &[{name, atom} | &1])
          _ -> acc
        end
      end)

    Map.new(parameters, fn {kind, entries} ->
      {kind, Enum.reverse(entries)}
    end)
  end

  defp request_content_types(operation, components) do
    operation
    |> Map.get("requestBody", %{})
    |> resolve_ref(components)
    |> Map.get("content", %{})
    |> Map.keys()
  end

  defp body_mode("get", []), do: :none
  defp body_mode("get", _content_types), do: {:key, {"body", :body}}
  defp body_mode("head", []), do: :none
  defp body_mode("head", _content_types), do: {:key, {"body", :body}}
  defp body_mode(_method, []), do: :none

  defp body_mode(_method, content_types) do
    cond do
      Enum.any?(content_types, &String.contains?(&1, "json")) ->
        :remaining

      Enum.any?(content_types, &String.contains?(&1, "form")) ->
        :none

      true ->
        {:key, {"body", :body}}
    end
  end

  defp form_data_mode(content_types) do
    case Enum.find(content_types, &String.contains?(&1, "form")) do
      nil -> :none
      _content_type -> :remaining
    end
  end

  defp auth_strategy("/applications/" <> _rest), do: :oauth_application
  defp auth_strategy(_path), do: :default

  defp resource("/applications/" <> _rest), do: "oauth_application"

  defp resource("/app/installations/" <> rest) do
    if String.ends_with?(rest, "/access_tokens"), do: "app_auth", else: "app_api"
  end

  defp resource("/app" <> _rest), do: "app_api"
  defp resource(_path), do: "core_api"

  defp retry_group(_method, "/applications/" <> _rest), do: "github.oauth"

  defp retry_group(_method, "/app/installations/" <> rest) do
    if String.ends_with?(rest, "/access_tokens"), do: "github.app_auth", else: "github.write"
  end

  defp retry_group("get", _path), do: "github.read"
  defp retry_group("head", _path), do: "github.read"
  defp retry_group("delete", _path), do: "github.delete"
  defp retry_group(_method, _path), do: "github.write"

  defp circuit_breaker(path) do
    case resource(path) do
      "oauth_application" -> "oauth"
      "app_auth" -> "app_auth"
      _ -> "core_api"
    end
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

  defp assign_unique_function_names(operations) do
    operations
    |> Enum.group_by(&{&1.module, &1.function})
    |> Enum.flat_map(fn
      {_key, [operation]} ->
        [operation]

      {{_module, function}, duplicates} ->
        duplicates
        |> Enum.with_index(1)
        |> Enum.map(fn {operation, index} ->
          %{operation | function: String.to_atom("#{function}_#{index}")}
        end)
    end)
    |> Enum.sort_by(&{&1.module, &1.path, &1.function})
  end

  defp parameter_name_atom(name) do
    name
    |> to_string()
    |> Macro.underscore()
    |> String.replace(~r/[^a-z0-9_]/, "_")
    |> String.trim("_")
    |> String.to_atom()
  end

  defp camelize(value) do
    value
    |> to_string()
    |> String.split(~r/[^a-zA-Z0-9]+/, trim: true)
    |> Enum.map(&Macro.camelize/1)
    |> Enum.join()
    |> case do
      "" -> "Misc"
      other -> other
    end
  end

  defp normalize_text(nil), do: nil
  defp normalize_text(""), do: nil
  defp normalize_text(value), do: String.trim(value)

  defp resolve_ref(%{"$ref" => "#/components/parameters/" <> name}, components) do
    components
    |> Map.get("parameters", %{})
    |> Map.get(name, %{})
  end

  defp resolve_ref(%{"$ref" => "#/components/requestBodies/" <> name}, components) do
    components
    |> Map.get("requestBodies", %{})
    |> Map.get(name, %{})
  end

  defp resolve_ref(value, _components), do: value

  defp persistable_operation(operation) do
    operation
    |> Map.drop([:call])
    |> Map.update!(:function, &Atom.to_string/1)
    |> Map.update!(:method, &Atom.to_string/1)
    |> Map.update!(:body_mode, &normalize_mode/1)
    |> Map.update!(:form_data_mode, &normalize_mode/1)
    |> Map.update!(
      :header_params,
      &Enum.map(&1, fn {name, atom} -> %{name: name, key: Atom.to_string(atom)} end)
    )
    |> Map.update!(
      :path_params,
      &Enum.map(&1, fn {name, atom} -> %{name: name, key: Atom.to_string(atom)} end)
    )
    |> Map.update!(
      :query_params,
      &Enum.map(&1, fn {name, atom} -> %{name: name, key: Atom.to_string(atom)} end)
    )
  end

  defp normalize_mode({:key, {name, atom}}),
    do: %{mode: "key", name: name, key: Atom.to_string(atom)}

  defp normalize_mode(mode) when is_atom(mode), do: Atom.to_string(mode)

  defp format_source!(source) do
    formatted =
      source
      |> Code.format_string!()
      |> IO.iodata_to_binary()

    formatted <> "\n"
  end

  defp build_operation_entry(path, method, operation, shared_parameters, components)
       when method in ["get", "post", "put", "patch", "delete", "head", "options"] do
    operation =
      Map.update(operation, "parameters", shared_parameters, fn parameters ->
        shared_parameters ++ parameters
      end)

    [build_operation(path, method, operation, components)]
  end

  defp build_operation_entry(_path, _method, _operation, _shared_parameters, _components), do: []
end

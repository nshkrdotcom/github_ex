defmodule GitHubEx.Codegen.Renderer do
  @moduledoc """
  Renderer overrides that emit `GitHubEx.<Resource>.<verb>(client, params)` functions.
  """

  use OpenAPI.Renderer

  alias OpenAPI.Processor.Operation
  alias OpenAPI.Processor.Schema, as: ProcessedSchema
  alias OpenAPI.Renderer.File
  alias OpenAPI.Renderer.State
  alias OpenAPI.Renderer.Util
  alias Pristine.OpenAPI.DocComposer
  alias Pristine.OpenAPI.RendererMetadata
  alias Pristine.OpenAPI.RendererShared
  alias Pristine.OpenAPI.SchemaMaterialization

  @impl OpenAPI.Renderer
  def render(state, file) do
    OpenAPI.Renderer.render(state, file)
  end

  @impl OpenAPI.Renderer
  def format(state, file) do
    state
    |> OpenAPI.Renderer.format(file)
    |> Pristine.OpenAPI.Renderer.rewrite_nested_module_aliases_in_source()
  end

  @impl OpenAPI.Renderer
  def render_default_client(_state, _file), do: nil

  @impl OpenAPI.Renderer
  def render_moduledoc(state, file) do
    moduledoc = DocComposer.module_doc(file, source_contexts: source_contexts(state))

    runtime_alias =
      if file.schemas == [] do
        nil
      else
        quote(do: alias(Pristine.SDK.OpenAPI.Runtime, as: OpenAPIRuntime))
      end

    Util.clean_list([
      quote(do: @moduledoc(unquote(moduledoc))),
      runtime_alias
    ])
  end

  @impl OpenAPI.Renderer
  def render_operations(_state, %File{operations: []}), do: []

  def render_operations(state, file) do
    OpenAPI.Renderer.render_operations(state, file)
  end

  @impl OpenAPI.Renderer
  def render_operation_doc(state, operation) do
    operation =
      Map.put(
        operation,
        :security,
        RendererShared.security_requirements(operation, config(state))
      )

    docstring = DocComposer.operation_doc(operation, source_contexts: source_contexts(state))
    quote do: @doc(unquote(docstring))
  end

  @impl OpenAPI.Renderer
  def render_schema(state, file) do
    %State{implementation: implementation} = state
    %{module: module, operations: operations, schemas: schemas} = file

    non_operation_schemas =
      schemas
      |> Enum.filter(&(&1.output_format == :struct))
      |> Enum.group_by(&{&1.module_name, &1.type_name})
      |> Enum.map(fn {_module_and_type, grouped} ->
        RendererShared.merge_schema_group(grouped, state.schemas)
      end)
      |> List.flatten()
      |> Enum.sort_by(& &1.type_name)

    output_schemas =
      schemas
      |> Enum.filter(fn
        %ProcessedSchema{output_format: :struct} ->
          true

        %ProcessedSchema{context: [{:request, ^module, _, _}], output_format: :typed_map} ->
          true

        %ProcessedSchema{context: [{:response, ^module, _, _, _}], output_format: :typed_map} ->
          true

        %ProcessedSchema{module_name: ^module, output_format: :typed_map, type_name: :t} ->
          true

        %ProcessedSchema{context: [{:field, parent_ref, _}], output_format: :typed_map} ->
          parent_is_output_schema?(parent_ref, module, state)

        _else ->
          false
      end)
      |> Enum.group_by(&{&1.module_name, &1.type_name})
      |> Enum.map(fn {_module_and_type, grouped} ->
        RendererShared.merge_schema_group(grouped, state.schemas)
      end)
      |> List.flatten()
      |> Enum.sort_by(& &1.type_name)

    types =
      cond do
        output_schemas == [] ->
          []

        operations == [] ->
          implementation.render_schema_types(state, output_schemas)

        true ->
          implementation.render_schema_types(state, non_operation_schemas)
      end

    struct =
      if non_operation_schemas == [] do
        []
      else
        implementation.render_schema_struct(state, non_operation_schemas)
      end

    field_function =
      if length(output_schemas) > 0 do
        implementation.render_schema_field_function(state, output_schemas)
      else
        []
      end

    Util.clean_list([types, struct, field_function])
  end

  @impl OpenAPI.Renderer
  def render_schema_field_function(_state, []), do: []

  def render_schema_field_function(state, schemas) do
    default_type =
      schemas
      |> Enum.map(& &1.type_name)
      |> Enum.sort()
      |> then(fn [first | _rest] = types -> Enum.find(types, first, &(&1 == :t)) end)

    default = render_field_function(state, schemas, default_type)

    runtime_helpers = [
      render_openapi_field_function(state, schemas, default_type),
      render_schema_function(default_type, schemas),
      render_decode_function(default_type)
    ]

    Util.clean_list([default, runtime_helpers])
  end

  @impl OpenAPI.Renderer
  def render_operation_spec(state, operation) do
    %Operation{function_name: name, responses: responses} = operation

    client = quote(do: client :: GitHubEx.Client.t())
    params = quote(do: params :: map())
    return_type = render_return_type(state, responses)

    case config(state)[:types][:specs] do
      false ->
        []

      :callback ->
        quote do
          @callback unquote(name)(unquote(client), unquote(params)) :: unquote(return_type)
        end

      :callback_comprehensive ->
        [
          quote do
            @callback unquote(name)(unquote(client)) :: unquote(return_type)
          end,
          quote do
            @callback unquote(name)(unquote(client), unquote(params)) :: unquote(return_type)
          end
        ]

      :spec_comprehensive ->
        [
          quote do
            @spec unquote(name)(unquote(client)) :: unquote(return_type)
          end,
          quote do
            @spec unquote(name)(unquote(client), unquote(params)) :: unquote(return_type)
          end
        ]

      _default ->
        quote do
          @spec unquote(name)(unquote(client), unquote(params)) :: unquote(return_type)
        end
    end
  end

  @impl OpenAPI.Renderer
  def render_operation_function(state, operation) do
    %Operation{
      function_name: function_name,
      module_name: module_name,
      request_body: request_body,
      request_method: request_method,
      request_path: request_path,
      responses: responses
    } = operation

    partition_spec = RendererShared.request_partition_spec(state, operation)
    oauth_application? = oauth_application_operation?(operation)

    module_name =
      Module.concat([
        config(state)[:base_module],
        module_name
      ])

    auth =
      if oauth_application? do
        quote(do: GitHubEx.Client.oauth_application_request_auth(params))
      else
        quote(do: partition.auth)
      end

    partition_params =
      if oauth_application? do
        quote(do: GitHubEx.Client.drop_oauth_application_credentials(params))
      else
        quote(do: GitHubEx.Client.drop_request_controls(params))
      end

    request = [
      quote(do: {:args, clean_params}),
      quote(do: {:call, {unquote(module_name), unquote(function_name)}}),
      quote(do: {:opts, request_opts}),
      quote(do: {:path_template, unquote(request_path)}),
      quote(do: {:method, unquote(request_method)}),
      quote(do: {:path_params, partition.path_params}),
      quote(do: {:query, partition.query}),
      quote(do: {:body, partition.body}),
      quote(do: {:form_data, partition.form_data}),
      quote(do: {:auth, unquote(auth)}),
      quote(do: {:use_default_auth, unquote(!oauth_application?)}),
      RendererShared.render_security_info(operation, config(state)),
      RendererShared.render_request_info(state, request_body, :list, &readable_type/2),
      RendererShared.render_response_info(state, responses, &readable_type/2)
    ]

    request =
      request
      |> Kernel.++(render_runtime_metadata(operation))
      |> Enum.reject(&is_nil/1)

    quote do
      def unquote(function_name)(client, params \\ %{}) when is_map(params) do
        request_opts = GitHubEx.Client.request_opts(params)
        clean_params = unquote(partition_params)
        partition = partition(clean_params, unquote(Macro.escape(partition_spec)))

        GitHubEx.Client.execute_generated_request(client, %{
          unquote_splicing(request)
        })
      end
    end
  end

  defp render_runtime_metadata(%Operation{} = operation) do
    resource = runtime_resource(operation.request_path)
    retry_group = runtime_retry_group(operation.request_method, resource)
    circuit_breaker = runtime_circuit_breaker(resource)

    [
      quote(do: {:resource, unquote(resource)}),
      quote(do: {:retry, unquote(retry_group)}),
      quote(do: {:circuit_breaker, unquote(circuit_breaker)}),
      quote(do: {:rate_limit, "github.integration"})
    ]
  end

  defp runtime_resource(path) do
    cond do
      String.starts_with?(path, "/applications/") ->
        "oauth_application"

      String.starts_with?(path, "/app/installations/") and
          String.ends_with?(path, "/access_tokens") ->
        "app_auth"

      String.starts_with?(path, "/app") ->
        "app_api"

      true ->
        "core_api"
    end
  end

  defp runtime_retry_group(_method, "oauth_application"), do: "github.oauth"
  defp runtime_retry_group(_method, "app_auth"), do: "github.app_auth"

  defp runtime_retry_group(method, _resource) when method in [:get, :head] do
    "github.read"
  end

  defp runtime_retry_group(:delete, _resource), do: "github.delete"
  defp runtime_retry_group(_method, _resource), do: "github.write"

  defp runtime_circuit_breaker("oauth_application"), do: "oauth"
  defp runtime_circuit_breaker("app_auth"), do: "app_auth"
  defp runtime_circuit_breaker(_resource), do: "core_api"

  defp render_return_type(_state, []), do: quote(do: :ok)

  defp render_return_type(state, responses) do
    %State{implementation: implementation} = state

    {success, error} =
      responses
      |> Enum.reject(fn {_status, schemas} -> map_size(schemas) == 0 end)
      |> Enum.reject(fn {status, _schemas} -> status >= 300 and status < 400 end)
      |> Enum.split_with(fn {status, _schemas} -> status < 300 end)

    ok =
      if success == [] do
        quote(do: :ok)
      else
        type =
          success
          |> Enum.flat_map(fn {_status, schemas} -> Map.values(schemas) end)
          |> then(&implementation.render_type(state, {:union, &1}))

        quote(do: {:ok, unquote(type)})
      end

    error =
      case config(state)[:types][:error] do
        nil ->
          render_error_union(state, error)

        error_type ->
          quote(do: {:error, unquote(render_configured_type(state, error_type))})
      end

    {:|, [], [ok, error]}
  end

  defp render_error_union(_state, []), do: quote(do: :error)

  defp render_error_union(state, error) do
    %State{implementation: implementation} = state

    type =
      error
      |> Enum.flat_map(fn {_status, schemas} -> Map.values(schemas) end)
      |> then(&implementation.render_type(state, {:union, &1}))

    quote(do: {:error, unquote(type)})
  end

  defp render_configured_type(state, {module, type}) when is_atom(module) and is_atom(type) do
    %State{implementation: implementation} = state
    implementation.render_type(state, {module, type})
  end

  defp render_configured_type(_state, module) when is_atom(module) do
    quote(do: unquote(module).t())
  end

  defp render_field_function(state, schemas, default_type) do
    docstring =
      quote do
        @doc false
      end

    typespec =
      quote do
        @spec __fields__(atom) :: keyword
      end

    header =
      quote do
        def __fields__(type \\ unquote(default_type))
      end

    clauses =
      schemas
      |> Enum.sort_by(& &1.type_name)
      |> Enum.map(fn %ProcessedSchema{fields: fields, type_name: type_name} ->
        rendered_fields =
          fields
          |> Enum.reject(& &1.private)
          |> Enum.sort_by(& &1.name)
          |> Enum.map(fn field ->
            quote do
              {unquote(String.to_atom(field.name)), unquote(readable_type(state, field.type))}
            end
          end)

        quote do
          def __fields__(unquote(type_name)) do
            unquote(rendered_fields)
          end
        end
      end)

    Util.clean_list([docstring, typespec, header, clauses])
  end

  defp render_openapi_field_function(state, schemas, default_type) do
    typespec =
      quote do
        @doc false
        @spec __openapi_fields__(atom) :: [map()]
      end

    header =
      quote do
        def __openapi_fields__(type \\ unquote(default_type))
      end

    clauses =
      Enum.map(schemas, fn %ProcessedSchema{fields: fields, type_name: type_name} ->
        openapi_fields =
          fields
          |> Enum.reject(& &1.private)
          |> Enum.sort_by(& &1.name)
          |> Enum.map(&runtime_field_metadata(&1, readable_type(state, &1.type)))

        quote do
          def __openapi_fields__(unquote(type_name)) do
            unquote(Macro.escape(openapi_fields))
          end
        end
      end)

    Util.clean_list([typespec, header, clauses])
  end

  defp runtime_field_metadata(field, rendered_type) do
    %{
      default: runtime_scalar_value(Map.get(field, :default)),
      deprecated: Map.get(field, :deprecated, false),
      description: runtime_scalar_value(Map.get(field, :description)),
      example: runtime_scalar_value(Map.get(field, :example)),
      examples: runtime_shallow_map(Map.get(field, :examples)),
      extensions: runtime_shallow_map(Map.get(field, :extensions)),
      external_docs: runtime_external_docs(Map.get(field, :external_docs)),
      name: Map.get(field, :name),
      nullable: Map.get(field, :nullable, false),
      read_only: Map.get(field, :read_only, false),
      required: Map.get(field, :required, false),
      type: rendered_type,
      write_only: Map.get(field, :write_only, false)
    }
  end

  defp runtime_external_docs(nil), do: nil

  defp runtime_external_docs(external_docs) when is_map(external_docs) do
    %{
      description: Map.get(external_docs, :description) || Map.get(external_docs, "description"),
      url: Map.get(external_docs, :url) || Map.get(external_docs, "url")
    }
  end

  defp runtime_external_docs(external_docs), do: inspect(external_docs)

  defp runtime_scalar_value(nil), do: nil
  defp runtime_scalar_value(value) when is_binary(value), do: value
  defp runtime_scalar_value(value) when is_boolean(value), do: value
  defp runtime_scalar_value(value) when is_number(value), do: value
  defp runtime_scalar_value(value) when is_atom(value), do: value
  defp runtime_scalar_value(_value), do: nil

  defp runtime_shallow_map(nil), do: nil

  defp runtime_shallow_map(value) when is_map(value) do
    Enum.into(value, %{}, fn {key, nested_value} ->
      {to_string(key), runtime_scalar_value(nested_value)}
    end)
  end

  defp runtime_shallow_map(_value), do: nil

  defp render_schema_function(default_type, schemas) do
    typespec =
      quote do
        @doc false
        @spec __schema__(atom) :: Sinter.Schema.t()
      end

    header =
      quote do
        def __schema__(type \\ unquote(default_type))
      end

    clauses =
      Enum.map(schemas, fn %ProcessedSchema{type_name: type_name} ->
        quote do
          def __schema__(unquote(type_name)) do
            OpenAPIRuntime.build_schema(__openapi_fields__(unquote(type_name)))
          end
        end
      end)

    Util.clean_list([typespec, header, clauses])
  end

  defp render_decode_function(default_type) do
    quote do
      @doc false
      @spec decode(term(), atom) :: {:ok, term()} | {:error, term()}
      def decode(data, type \\ unquote(default_type))

      def decode(data, type) do
        OpenAPIRuntime.decode_module_type(__MODULE__, type, data)
      end
    end
  end

  defp parent_is_output_schema?(parent_ref, module, state) do
    case Map.get(state.schemas, parent_ref) do
      %ProcessedSchema{context: [{:request, ^module, _, _}], output_format: :typed_map} ->
        true

      %ProcessedSchema{context: [{:response, ^module, _, _, _}], output_format: :typed_map} ->
        true

      %ProcessedSchema{module_name: ^module, output_format: :typed_map, type_name: :t} ->
        true

      %ProcessedSchema{context: [{:field, next_parent_ref, _}], output_format: :typed_map} ->
        parent_is_output_schema?(next_parent_ref, module, state)

      _else ->
        SchemaMaterialization.materialized_typed_map?(
          Map.get(state.schemas, parent_ref),
          module,
          state.schemas
        )
    end
  end

  defp readable_type(state, {:array, type}) do
    [readable_type(state, type)]
  end

  defp readable_type(state, {:union, types}) do
    types =
      types
      |> Enum.flat_map(fn
        {:union, nested} -> nested
        other -> [other]
      end)
      |> Enum.map(&readable_type(state, &1))
      |> Enum.uniq()

    case types do
      [] -> :null
      [type] -> type
      many -> {:union, many}
    end
  end

  defp readable_type(state, {:nullable, type}) do
    {:nullable, readable_type(state, type)}
  end

  defp readable_type(state, {:tuple, types}) do
    {:tuple, Enum.map(types, &readable_type(state, &1))}
  end

  defp readable_type(state, {:map, key_type, value_type}) do
    {:map, readable_type(state, key_type), readable_type(state, value_type)}
  end

  defp readable_type(state, ref) when is_reference(ref) do
    case Map.get(state.schemas, ref) do
      %ProcessedSchema{module_name: nil, type_name: type} ->
        type

      %ProcessedSchema{module_name: schema_module, type_name: type} ->
        module =
          Module.concat([
            config(state)[:base_module],
            schema_module
          ])

        {module, type}

      nil ->
        :map
    end
  end

  defp readable_type(_state, type), do: type

  defp oauth_application_operation?(%Operation{request_path: path}) when is_binary(path) do
    String.starts_with?(path, "/applications/")
  end

  defp source_contexts(state) do
    config(state)[:source_contexts] || %{}
  end

  defp config(%State{profile: profile}) do
    output =
      Application.get_env(:oapi_generator, profile, [])
      |> Keyword.get(:output, [])

    Keyword.merge(output, RendererMetadata.get(profile))
  end
end

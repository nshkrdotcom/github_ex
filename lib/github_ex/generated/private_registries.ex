defmodule GitHubEx.PrivateRegistries do
  @moduledoc """
  Generated Github Ex operations for private registries.
  """

  alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient

  @create_org_private_registry_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a private registry for an organization\n\nCreates a private registry configuration with an encrypted value for an organization. Encrypt your secret using [LibSodium](https://libsodium.gitbook.io/doc/bindings_for_other_languages). For more information, see \"[Encrypting secrets for the REST API](https://docs.github.com/rest/guides/encrypting-secrets-for-the-rest-api).\"\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec create_org_private_registry(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_org_private_registry(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_org_private_registry_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_org_private_registry_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_org_private_registry_partition_spec)

    %{
      id: "private-registries/create-org-private-registry",
      args: params,
      call: {__MODULE__, :create_org_private_registry},
      opts: opts,
      method: :post,
      path_template: "/orgs/{org}/private-registries",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :private_registries, :create_org_private_registry],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_org_private_registry_partition_spec %{
    path: [{"org", :org}, {"secret_name", :secret_name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a private registry for an organization\n\nDelete a private registry configuration at the organization-level.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec delete_org_private_registry(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_org_private_registry(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_org_private_registry_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_org_private_registry_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_org_private_registry_partition_spec)

    %{
      id: "private-registries/delete-org-private-registry",
      args: params,
      call: {__MODULE__, :delete_org_private_registry},
      opts: opts,
      method: :delete,
      path_template: "/orgs/{org}/private-registries/{secret_name}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :private_registries, :delete_org_private_registry],
      timeout: nil,
      pagination: nil
    }
  end

  @get_org_private_registry_partition_spec %{
    path: [{"org", :org}, {"secret_name", :secret_name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a private registry for an organization\n\nGet the configuration of a single private registry defined for an organization, omitting its encrypted value.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec get_org_private_registry(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_org_private_registry(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_org_private_registry_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_org_private_registry_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_org_private_registry_partition_spec)

    %{
      id: "private-registries/get-org-private-registry",
      args: params,
      call: {__MODULE__, :get_org_private_registry},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/private-registries/{secret_name}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :private_registries, :get_org_private_registry],
      timeout: nil,
      pagination: nil
    }
  end

  @get_org_public_key_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get private registries public key for an organization\n\nGets the org public key, which is needed to encrypt private registry secrets. You need to encrypt a secret before you can create or update secrets.\n\nOAuth tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec get_org_public_key(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_org_public_key(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_org_public_key_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_org_public_key_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_org_public_key_partition_spec)

    %{
      id: "private-registries/get-org-public-key",
      args: params,
      call: {__MODULE__, :get_org_public_key},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/private-registries/public-key",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :private_registries, :get_org_public_key],
      timeout: nil,
      pagination: nil
    }
  end

  @list_org_private_registries_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List private registries for an organization\n\nLists all private registry configurations available at the organization-level without revealing their encrypted\nvalues.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec list_org_private_registries(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_org_private_registries(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_org_private_registries_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_org_private_registries(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_org_private_registries(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_org_private_registries_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_org_private_registries_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_org_private_registries_partition_spec)

    %{
      id: "private-registries/list-org-private-registries",
      args: params,
      call: {__MODULE__, :list_org_private_registries},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/private-registries",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :private_registries, :list_org_private_registries],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["configurations"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @update_org_private_registry_partition_spec %{
    path: [{"org", :org}, {"secret_name", :secret_name}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update a private registry for an organization\n\nUpdates a private registry configuration with an encrypted value for an organization. Encrypt your secret using [LibSodium](https://libsodium.gitbook.io/doc/bindings_for_other_languages). For more information, see \"[Encrypting secrets for the REST API](https://docs.github.com/rest/guides/encrypting-secrets-for-the-rest-api).\"\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec update_org_private_registry(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_org_private_registry(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_org_private_registry_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_org_private_registry_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_org_private_registry_partition_spec)

    %{
      id: "private-registries/update-org-private-registry",
      args: params,
      call: {__MODULE__, :update_org_private_registry},
      opts: opts,
      method: :patch,
      path_template: "/orgs/{org}/private-registries/{secret_name}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :private_registries, :update_org_private_registry],
      timeout: nil,
      pagination: nil
    }
  end

  @spec normalize_request_opts!(list()) :: keyword()
  defp normalize_request_opts!(opts) when is_list(opts) do
    if Keyword.keyword?(opts) do
      opts
    else
      raise ArgumentError, "request opts must be a keyword list"
    end
  end
end

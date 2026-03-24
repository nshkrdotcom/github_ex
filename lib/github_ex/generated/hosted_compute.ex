defmodule GitHubEx.HostedCompute do
  @moduledoc """
  Generated Github Ex operations for hosted compute.
  """

  alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient

  @create_network_configuration_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a hosted compute network configuration for an organization\n\nCreates a hosted compute network configuration for an organization.\n\nOAuth app tokens and personal access tokens (classic) need the `write:network_configurations` scope to use this endpoint."
  @spec create_network_configuration_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def create_network_configuration_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_network_configuration_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_network_configuration_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @create_network_configuration_for_org_partition_spec)

    %{
      id: "hosted-compute/create-network-configuration-for-org",
      args: params,
      call: {__MODULE__, :create_network_configuration_for_org},
      opts: opts,
      method: :post,
      path_template: "/orgs/{org}/settings/network-configurations",
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
      telemetry: [:github_ex, :hosted_compute, :create_network_configuration_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_network_configuration_from_org_partition_spec %{
    path: [{"org", :org}, {"network_configuration_id", :network_configuration_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a hosted compute network configuration from an organization\n\nDeletes a hosted compute network configuration from an organization.\n\nOAuth app tokens and personal access tokens (classic) need the `write:network_configurations` scope to use this endpoint."
  @spec delete_network_configuration_from_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def delete_network_configuration_from_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_network_configuration_from_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_network_configuration_from_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @delete_network_configuration_from_org_partition_spec)

    %{
      id: "hosted-compute/delete-network-configuration-from-org",
      args: params,
      call: {__MODULE__, :delete_network_configuration_from_org},
      opts: opts,
      method: :delete,
      path_template: "/orgs/{org}/settings/network-configurations/{network_configuration_id}",
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
      telemetry: [:github_ex, :hosted_compute, :delete_network_configuration_from_org],
      timeout: nil,
      pagination: nil
    }
  end

  @get_network_configuration_for_org_partition_spec %{
    path: [{"org", :org}, {"network_configuration_id", :network_configuration_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a hosted compute network configuration for an organization\n\nGets a hosted compute network configuration configured in an organization.\n\nOAuth app tokens and personal access tokens (classic) need the `read:network_configurations` scope to use this endpoint."
  @spec get_network_configuration_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_network_configuration_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_network_configuration_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_network_configuration_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_network_configuration_for_org_partition_spec)

    %{
      id: "hosted-compute/get-network-configuration-for-org",
      args: params,
      call: {__MODULE__, :get_network_configuration_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/settings/network-configurations/{network_configuration_id}",
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
      telemetry: [:github_ex, :hosted_compute, :get_network_configuration_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @get_network_settings_for_org_partition_spec %{
    path: [{"org", :org}, {"network_settings_id", :network_settings_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a hosted compute network settings resource for an organization\n\nGets a hosted compute network settings resource configured for an organization.\n\nOAuth app tokens and personal access tokens (classic) need the `read:network_configurations` scope to use this endpoint."
  @spec get_network_settings_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_network_settings_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_network_settings_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_network_settings_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_network_settings_for_org_partition_spec)

    %{
      id: "hosted-compute/get-network-settings-for-org",
      args: params,
      call: {__MODULE__, :get_network_settings_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/settings/network-settings/{network_settings_id}",
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
      telemetry: [:github_ex, :hosted_compute, :get_network_settings_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @list_network_configurations_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List hosted compute network configurations for an organization\n\nLists all hosted compute network configurations configured in an organization.\n\nOAuth app tokens and personal access tokens (classic) need the `read:network_configurations` scope to use this endpoint."
  @spec list_network_configurations_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_network_configurations_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_network_configurations_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_network_configurations_for_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_network_configurations_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_network_configurations_for_org_request(client, params, opts) end,
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

  defp build_list_network_configurations_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @list_network_configurations_for_org_partition_spec)

    %{
      id: "hosted-compute/list-network-configurations-for-org",
      args: params,
      call: {__MODULE__, :list_network_configurations_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/settings/network-configurations",
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
      telemetry: [:github_ex, :hosted_compute, :list_network_configurations_for_org],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["network_configurations"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @update_network_configuration_for_org_partition_spec %{
    path: [{"org", :org}, {"network_configuration_id", :network_configuration_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update a hosted compute network configuration for an organization\n\nUpdates a hosted compute network configuration for an organization.\n\nOAuth app tokens and personal access tokens (classic) need the `write:network_configurations` scope to use this endpoint."
  @spec update_network_configuration_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def update_network_configuration_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_network_configuration_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_network_configuration_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @update_network_configuration_for_org_partition_spec)

    %{
      id: "hosted-compute/update-network-configuration-for-org",
      args: params,
      call: {__MODULE__, :update_network_configuration_for_org},
      opts: opts,
      method: :patch,
      path_template: "/orgs/{org}/settings/network-configurations/{network_configuration_id}",
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
      telemetry: [:github_ex, :hosted_compute, :update_network_configuration_for_org],
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

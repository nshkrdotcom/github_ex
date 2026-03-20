defmodule GitHubEx.HostedCompute do
  @moduledoc """
  Generated Github Ex operations for hosted compute.
  """

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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_create_network_configuration_for_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_create_network_configuration_for_org_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @create_network_configuration_for_org_partition_spec)

    Pristine.Operation.new(%{
      id: "hosted-compute/create-network-configuration-for-org",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :hosted_compute, :create_network_configuration_for_org],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_delete_network_configuration_from_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_delete_network_configuration_from_org_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @delete_network_configuration_from_org_partition_spec)

    Pristine.Operation.new(%{
      id: "hosted-compute/delete-network-configuration-from-org",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :hosted_compute, :delete_network_configuration_from_org],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_network_configuration_for_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_network_configuration_for_org_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @get_network_configuration_for_org_partition_spec)

    Pristine.Operation.new(%{
      id: "hosted-compute/get-network-configuration-for-org",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :hosted_compute, :get_network_configuration_for_org],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_network_settings_for_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_network_settings_for_org_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_network_settings_for_org_partition_spec)

    Pristine.Operation.new(%{
      id: "hosted-compute/get-network-settings-for-org",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :hosted_compute, :get_network_settings_for_org],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_network_configurations_for_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_network_configurations_for_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_network_configurations_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_network_configurations_for_org_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          case Pristine.execute(runtime_client, operation, opts) do
            {:ok, response} ->
              items = List.wrap(Pristine.Operation.items(operation, response))
              {items, Pristine.Operation.next_page(operation, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_network_configurations_for_org_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @list_network_configurations_for_org_partition_spec)

    Pristine.Operation.new(%{
      id: "hosted-compute/list-network-configurations-for-org",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :hosted_compute, :list_network_configurations_for_org],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: ["network_configurations"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_update_network_configuration_for_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_update_network_configuration_for_org_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @update_network_configuration_for_org_partition_spec)

    Pristine.Operation.new(%{
      id: "hosted-compute/update-network-configuration-for-org",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :hosted_compute, :update_network_configuration_for_org],
        timeout_ms: nil
      },
      pagination: nil
    })
  end
end

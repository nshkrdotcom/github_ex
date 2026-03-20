defmodule GitHubEx.Campaigns do
  @moduledoc """
  Generated Github Ex operations for campaigns.
  """

  @create_campaign_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Create a campaign for an organization\n\nCreate a campaign for an organization.\n\nThe authenticated user must be an owner or security manager for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint.\n\nFine-grained tokens must have the \"Code scanning alerts\" repository permissions (read) on all repositories included\nin the campaign."
  @spec create_campaign(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_campaign(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_create_campaign_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_create_campaign_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @create_campaign_partition_spec)

    Pristine.Operation.new(%{
      id: "campaigns/create-campaign",
      method: :post,
      path_template: "/orgs/{org}/campaigns",
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
        telemetry_event: [:github_ex, :campaigns, :create_campaign],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_campaign_partition_spec %{
    path: [{"org", :org}, {"campaign_number", :campaign_number}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Delete a campaign for an organization\n\nDeletes a campaign in an organization.\n\nThe authenticated user must be an owner or security manager for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint."
  @spec delete_campaign(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_campaign(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_delete_campaign_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_delete_campaign_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_campaign_partition_spec)

    Pristine.Operation.new(%{
      id: "campaigns/delete-campaign",
      method: :delete,
      path_template: "/orgs/{org}/campaigns/{campaign_number}",
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
        telemetry_event: [:github_ex, :campaigns, :delete_campaign],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_campaign_summary_partition_spec %{
    path: [{"org", :org}, {"campaign_number", :campaign_number}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get a campaign for an organization\n\nGets a campaign for an organization.\n\nThe authenticated user must be an owner or security manager for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint."
  @spec get_campaign_summary(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_campaign_summary(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_campaign_summary_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_campaign_summary_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_campaign_summary_partition_spec)

    Pristine.Operation.new(%{
      id: "campaigns/get-campaign-summary",
      method: :get,
      path_template: "/orgs/{org}/campaigns/{campaign_number}",
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
        telemetry_event: [:github_ex, :campaigns, :get_campaign_summary],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @list_org_campaigns_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [
      {"page", :page},
      {"per_page", :per_page},
      {"direction", :direction},
      {"state", :state},
      {"sort", :sort}
    ],
    headers: []
  }

  @doc "List campaigns for an organization\n\nLists campaigns in an organization.\n\nThe authenticated user must be an owner or security manager for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint."
  @spec list_org_campaigns(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_org_campaigns(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_org_campaigns_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_org_campaigns(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_org_campaigns(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_org_campaigns_operation(params) end,
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

  defp build_list_org_campaigns_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_org_campaigns_partition_spec)

    Pristine.Operation.new(%{
      id: "campaigns/list-org-campaigns",
      method: :get,
      path_template: "/orgs/{org}/campaigns",
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
        telemetry_event: [:github_ex, :campaigns, :list_org_campaigns],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: nil,
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
  end

  @update_campaign_partition_spec %{
    path: [{"org", :org}, {"campaign_number", :campaign_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Update a campaign\n\nUpdates a campaign in an organization.\n\nThe authenticated user must be an owner or security manager for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint."
  @spec update_campaign(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_campaign(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_update_campaign_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_update_campaign_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @update_campaign_partition_spec)

    Pristine.Operation.new(%{
      id: "campaigns/update-campaign",
      method: :patch,
      path_template: "/orgs/{org}/campaigns/{campaign_number}",
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
        telemetry_event: [:github_ex, :campaigns, :update_campaign],
        timeout_ms: nil
      },
      pagination: nil
    })
  end
end

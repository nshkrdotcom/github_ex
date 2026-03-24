defmodule GitHubEx.Campaigns do
  @moduledoc """
  Generated Github Ex operations for campaigns.
  """

  alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient

  @create_campaign_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a campaign for an organization\n\nCreate a campaign for an organization.\n\nThe authenticated user must be an owner or security manager for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint.\n\nFine-grained tokens must have the \"Code scanning alerts\" repository permissions (read) on all repositories included\nin the campaign."
  @spec create_campaign(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_campaign(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_campaign_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_campaign_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_campaign_partition_spec)

    %{
      id: "campaigns/create-campaign",
      args: params,
      call: {__MODULE__, :create_campaign},
      opts: opts,
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :campaigns, :create_campaign],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_campaign_partition_spec %{
    path: [{"org", :org}, {"campaign_number", :campaign_number}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a campaign for an organization\n\nDeletes a campaign in an organization.\n\nThe authenticated user must be an owner or security manager for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint."
  @spec delete_campaign(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_campaign(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_campaign_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_campaign_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_campaign_partition_spec)

    %{
      id: "campaigns/delete-campaign",
      args: params,
      call: {__MODULE__, :delete_campaign},
      opts: opts,
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
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :campaigns, :delete_campaign],
      timeout: nil,
      pagination: nil
    }
  end

  @get_campaign_summary_partition_spec %{
    path: [{"org", :org}, {"campaign_number", :campaign_number}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a campaign for an organization\n\nGets a campaign for an organization.\n\nThe authenticated user must be an owner or security manager for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint."
  @spec get_campaign_summary(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_campaign_summary(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_campaign_summary_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_campaign_summary_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_campaign_summary_partition_spec)

    %{
      id: "campaigns/get-campaign-summary",
      args: params,
      call: {__MODULE__, :get_campaign_summary},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :campaigns, :get_campaign_summary],
      timeout: nil,
      pagination: nil
    }
  end

  @list_org_campaigns_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"page", :page},
      {"per_page", :per_page},
      {"direction", :direction},
      {"state", :state},
      {"sort", :sort}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List campaigns for an organization\n\nLists campaigns in an organization.\n\nThe authenticated user must be an owner or security manager for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint."
  @spec list_org_campaigns(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_org_campaigns(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_org_campaigns_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_org_campaigns(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_org_campaigns(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_org_campaigns_request(client, params, opts) end,
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

  defp build_list_org_campaigns_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_org_campaigns_partition_spec)

    %{
      id: "campaigns/list-org-campaigns",
      args: params,
      call: {__MODULE__, :list_org_campaigns},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :campaigns, :list_org_campaigns],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: nil,
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @update_campaign_partition_spec %{
    path: [{"org", :org}, {"campaign_number", :campaign_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update a campaign\n\nUpdates a campaign in an organization.\n\nThe authenticated user must be an owner or security manager for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint."
  @spec update_campaign(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_campaign(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_campaign_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_campaign_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_campaign_partition_spec)

    %{
      id: "campaigns/update-campaign",
      args: params,
      call: {__MODULE__, :update_campaign},
      opts: opts,
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :campaigns, :update_campaign],
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

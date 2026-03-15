defmodule GitHubEx.Campaigns do
  @moduledoc """
  Generated GitHub REST operations for the `Campaigns` namespace.

  ## Operations

  * `campaigns/create-campaign`
  * `campaigns/list-org-campaigns`
  * `campaigns/delete-campaign`
  * `campaigns/get-campaign-summary`
  * `campaigns/update-campaign`
  """

  @type result :: {:ok, term()} | {:error, GitHubEx.Error.t()}

  @doc "Create a campaign for an organization\n\nPath: /orgs/{org}/campaigns\n\nMethod: post"
  @spec create_campaign(GitHubEx.Client.t()) :: result
  @spec create_campaign(GitHubEx.Client.t(), map()) :: result
  def create_campaign(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Campaigns, :create_campaign},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/campaigns",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Delete a campaign for an organization\n\nPath: /orgs/{org}/campaigns/{campaign_number}\n\nMethod: delete"
  @spec delete_campaign(GitHubEx.Client.t()) :: result
  @spec delete_campaign(GitHubEx.Client.t(), map()) :: result
  def delete_campaign(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Campaigns, :delete_campaign},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"campaign_number", :campaign_number}],
      path_template: "/orgs/{org}/campaigns/{campaign_number}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Get a campaign for an organization\n\nPath: /orgs/{org}/campaigns/{campaign_number}\n\nMethod: get"
  @spec get_campaign_summary(GitHubEx.Client.t()) :: result
  @spec get_campaign_summary(GitHubEx.Client.t(), map()) :: result
  def get_campaign_summary(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Campaigns, :get_campaign_summary},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"campaign_number", :campaign_number}],
      path_template: "/orgs/{org}/campaigns/{campaign_number}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List campaigns for an organization\n\nPath: /orgs/{org}/campaigns\n\nMethod: get"
  @spec list_org_campaigns(GitHubEx.Client.t()) :: result
  @spec list_org_campaigns(GitHubEx.Client.t(), map()) :: result
  def list_org_campaigns(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Campaigns, :list_org_campaigns},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/campaigns",
      query: [
        {"page", :page},
        {"per_page", :per_page},
        {"direction", :direction},
        {"state", :state},
        {"sort", :sort}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Update a campaign\n\nPath: /orgs/{org}/campaigns/{campaign_number}\n\nMethod: patch"
  @spec update_campaign(GitHubEx.Client.t()) :: result
  @spec update_campaign(GitHubEx.Client.t(), map()) :: result
  def update_campaign(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Campaigns, :update_campaign},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"org", :org}, {"campaign_number", :campaign_number}],
      path_template: "/orgs/{org}/campaigns/{campaign_number}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

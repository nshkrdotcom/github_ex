defmodule GitHubSDK.Copilot do
  @moduledoc """
  Generated GitHub REST operations for the `Copilot` namespace.

  ## Operations

  * `copilot/get-copilot-organization-details`
  * `copilot/list-copilot-seats`
  * `copilot/add-copilot-seats-for-teams`
  * `copilot/cancel-copilot-seat-assignment-for-teams`
  * `copilot/add-copilot-seats-for-users`
  * `copilot/cancel-copilot-seat-assignment-for-users`
  * `copilot/copilot-content-exclusion-for-organization`
  * `copilot/set-copilot-content-exclusion-for-organization`
  * `copilot/copilot-metrics-for-organization`
  * `copilot/get-copilot-seat-details-for-user`
  * `copilot/copilot-metrics-for-team`
  """

  @type result :: {:ok, term()} | {:error, GitHubSDK.Error.t()}

  @doc "Add teams to the Copilot subscription for an organization\n\nPath: /orgs/{org}/copilot/billing/selected_teams\n\nMethod: post"
  @spec add_copilot_seats_for_teams(GitHubSDK.Client.t()) :: result
  @spec add_copilot_seats_for_teams(GitHubSDK.Client.t(), map()) :: result
  def add_copilot_seats_for_teams(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Copilot, :add_copilot_seats_for_teams},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/copilot/billing/selected_teams",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Add users to the Copilot subscription for an organization\n\nPath: /orgs/{org}/copilot/billing/selected_users\n\nMethod: post"
  @spec add_copilot_seats_for_users(GitHubSDK.Client.t()) :: result
  @spec add_copilot_seats_for_users(GitHubSDK.Client.t(), map()) :: result
  def add_copilot_seats_for_users(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Copilot, :add_copilot_seats_for_users},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/copilot/billing/selected_users",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Remove teams from the Copilot subscription for an organization\n\nPath: /orgs/{org}/copilot/billing/selected_teams\n\nMethod: delete"
  @spec cancel_copilot_seat_assignment_for_teams(GitHubSDK.Client.t()) :: result
  @spec cancel_copilot_seat_assignment_for_teams(GitHubSDK.Client.t(), map()) :: result
  def cancel_copilot_seat_assignment_for_teams(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Copilot, :cancel_copilot_seat_assignment_for_teams},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/copilot/billing/selected_teams",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove users from the Copilot subscription for an organization\n\nPath: /orgs/{org}/copilot/billing/selected_users\n\nMethod: delete"
  @spec cancel_copilot_seat_assignment_for_users(GitHubSDK.Client.t()) :: result
  @spec cancel_copilot_seat_assignment_for_users(GitHubSDK.Client.t(), map()) :: result
  def cancel_copilot_seat_assignment_for_users(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Copilot, :cancel_copilot_seat_assignment_for_users},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/copilot/billing/selected_users",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Get Copilot content exclusion rules for an organization\n\nPath: /orgs/{org}/copilot/content_exclusion\n\nMethod: get"
  @spec copilot_content_exclusion_for_organization(GitHubSDK.Client.t()) :: result
  @spec copilot_content_exclusion_for_organization(GitHubSDK.Client.t(), map()) :: result
  def copilot_content_exclusion_for_organization(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Copilot, :copilot_content_exclusion_for_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/copilot/content_exclusion",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get Copilot metrics for an organization\n\nPath: /orgs/{org}/copilot/metrics\n\nMethod: get"
  @spec copilot_metrics_for_organization(GitHubSDK.Client.t()) :: result
  @spec copilot_metrics_for_organization(GitHubSDK.Client.t(), map()) :: result
  def copilot_metrics_for_organization(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Copilot, :copilot_metrics_for_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/copilot/metrics",
      query: [{"since", :since}, {"until", :until}, {"page", :page}, {"per_page", :per_page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get Copilot metrics for a team\n\nPath: /orgs/{org}/team/{team_slug}/copilot/metrics\n\nMethod: get"
  @spec copilot_metrics_for_team(GitHubSDK.Client.t()) :: result
  @spec copilot_metrics_for_team(GitHubSDK.Client.t(), map()) :: result
  def copilot_metrics_for_team(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Copilot, :copilot_metrics_for_team},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"team_slug", :team_slug}],
      path_template: "/orgs/{org}/team/{team_slug}/copilot/metrics",
      query: [{"since", :since}, {"until", :until}, {"page", :page}, {"per_page", :per_page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get Copilot seat information and settings for an organization\n\nPath: /orgs/{org}/copilot/billing\n\nMethod: get"
  @spec get_copilot_organization_details(GitHubSDK.Client.t()) :: result
  @spec get_copilot_organization_details(GitHubSDK.Client.t(), map()) :: result
  def get_copilot_organization_details(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Copilot, :get_copilot_organization_details},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/copilot/billing",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get Copilot seat assignment details for a user\n\nPath: /orgs/{org}/members/{username}/copilot\n\nMethod: get"
  @spec get_copilot_seat_details_for_user(GitHubSDK.Client.t()) :: result
  @spec get_copilot_seat_details_for_user(GitHubSDK.Client.t(), map()) :: result
  def get_copilot_seat_details_for_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Copilot, :get_copilot_seat_details_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"username", :username}],
      path_template: "/orgs/{org}/members/{username}/copilot",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List all Copilot seat assignments for an organization\n\nPath: /orgs/{org}/copilot/billing/seats\n\nMethod: get"
  @spec list_copilot_seats(GitHubSDK.Client.t()) :: result
  @spec list_copilot_seats(GitHubSDK.Client.t(), map()) :: result
  def list_copilot_seats(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Copilot, :list_copilot_seats},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/copilot/billing/seats",
      query: [{"page", :page}, {"per_page", :per_page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Set Copilot content exclusion rules for an organization\n\nPath: /orgs/{org}/copilot/content_exclusion\n\nMethod: put"
  @spec set_copilot_content_exclusion_for_organization(GitHubSDK.Client.t()) :: result
  @spec set_copilot_content_exclusion_for_organization(GitHubSDK.Client.t(), map()) :: result
  def set_copilot_content_exclusion_for_organization(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Copilot, :set_copilot_content_exclusion_for_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/copilot/content_exclusion",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

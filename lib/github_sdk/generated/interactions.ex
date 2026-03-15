defmodule GitHubSDK.Interactions do
  @moduledoc """
  Generated GitHub REST operations for the `Interactions` namespace.

  ## Operations

  * `interactions/get-restrictions-for-org`
  * `interactions/remove-restrictions-for-org`
  * `interactions/set-restrictions-for-org`
  * `interactions/get-restrictions-for-repo`
  * `interactions/remove-restrictions-for-repo`
  * `interactions/set-restrictions-for-repo`
  * `interactions/get-restrictions-for-authenticated-user`
  * `interactions/remove-restrictions-for-authenticated-user`
  * `interactions/set-restrictions-for-authenticated-user`
  """

  @type result :: {:ok, term()} | {:error, GitHubSDK.Error.t()}

  @doc "Get interaction restrictions for your public repositories\n\nPath: /user/interaction-limits\n\nMethod: get"
  @spec get_restrictions_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec get_restrictions_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def get_restrictions_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Interactions, :get_restrictions_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/user/interaction-limits",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get interaction restrictions for an organization\n\nPath: /orgs/{org}/interaction-limits\n\nMethod: get"
  @spec get_restrictions_for_org(GitHubSDK.Client.t()) :: result
  @spec get_restrictions_for_org(GitHubSDK.Client.t(), map()) :: result
  def get_restrictions_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Interactions, :get_restrictions_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/interaction-limits",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get interaction restrictions for a repository\n\nPath: /repos/{owner}/{repo}/interaction-limits\n\nMethod: get"
  @spec get_restrictions_for_repo(GitHubSDK.Client.t()) :: result
  @spec get_restrictions_for_repo(GitHubSDK.Client.t(), map()) :: result
  def get_restrictions_for_repo(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Interactions, :get_restrictions_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/interaction-limits",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Remove interaction restrictions from your public repositories\n\nPath: /user/interaction-limits\n\nMethod: delete"
  @spec remove_restrictions_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec remove_restrictions_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def remove_restrictions_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Interactions, :remove_restrictions_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [],
      path_template: "/user/interaction-limits",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove interaction restrictions for an organization\n\nPath: /orgs/{org}/interaction-limits\n\nMethod: delete"
  @spec remove_restrictions_for_org(GitHubSDK.Client.t()) :: result
  @spec remove_restrictions_for_org(GitHubSDK.Client.t(), map()) :: result
  def remove_restrictions_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Interactions, :remove_restrictions_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/interaction-limits",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove interaction restrictions for a repository\n\nPath: /repos/{owner}/{repo}/interaction-limits\n\nMethod: delete"
  @spec remove_restrictions_for_repo(GitHubSDK.Client.t()) :: result
  @spec remove_restrictions_for_repo(GitHubSDK.Client.t(), map()) :: result
  def remove_restrictions_for_repo(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Interactions, :remove_restrictions_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/interaction-limits",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Set interaction restrictions for your public repositories\n\nPath: /user/interaction-limits\n\nMethod: put"
  @spec set_restrictions_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec set_restrictions_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def set_restrictions_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Interactions, :set_restrictions_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [],
      path_template: "/user/interaction-limits",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set interaction restrictions for an organization\n\nPath: /orgs/{org}/interaction-limits\n\nMethod: put"
  @spec set_restrictions_for_org(GitHubSDK.Client.t()) :: result
  @spec set_restrictions_for_org(GitHubSDK.Client.t(), map()) :: result
  def set_restrictions_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Interactions, :set_restrictions_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/interaction-limits",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set interaction restrictions for a repository\n\nPath: /repos/{owner}/{repo}/interaction-limits\n\nMethod: put"
  @spec set_restrictions_for_repo(GitHubSDK.Client.t()) :: result
  @spec set_restrictions_for_repo(GitHubSDK.Client.t(), map()) :: result
  def set_restrictions_for_repo(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Interactions, :set_restrictions_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/interaction-limits",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

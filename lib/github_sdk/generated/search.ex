defmodule GitHubSDK.Search do
  @moduledoc """
  Generated GitHub REST operations for the `Search` namespace.

  ## Operations

  * `search/code`
  * `search/commits`
  * `search/issues-and-pull-requests`
  * `search/labels`
  * `search/repos`
  * `search/topics`
  * `search/users`
  """

  @type result :: {:ok, term()} | {:error, GitHubSDK.Error.t()}

  @doc "Search code\n\nPath: /search/code\n\nMethod: get"
  @spec code(GitHubSDK.Client.t()) :: result
  @spec code(GitHubSDK.Client.t(), map()) :: result
  def code(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Search, :code},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/search/code",
      query: [
        {"q", :q},
        {"sort", :sort},
        {"order", :order},
        {"per_page", :per_page},
        {"page", :page}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Search commits\n\nPath: /search/commits\n\nMethod: get"
  @spec commits(GitHubSDK.Client.t()) :: result
  @spec commits(GitHubSDK.Client.t(), map()) :: result
  def commits(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Search, :commits},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/search/commits",
      query: [
        {"q", :q},
        {"sort", :sort},
        {"order", :order},
        {"per_page", :per_page},
        {"page", :page}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Search issues and pull requests\n\nPath: /search/issues\n\nMethod: get"
  @spec issues_and_pull_requests(GitHubSDK.Client.t()) :: result
  @spec issues_and_pull_requests(GitHubSDK.Client.t(), map()) :: result
  def issues_and_pull_requests(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Search, :issues_and_pull_requests},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/search/issues",
      query: [
        {"q", :q},
        {"sort", :sort},
        {"order", :order},
        {"per_page", :per_page},
        {"page", :page},
        {"advanced_search", :advanced_search}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Search labels\n\nPath: /search/labels\n\nMethod: get"
  @spec labels(GitHubSDK.Client.t()) :: result
  @spec labels(GitHubSDK.Client.t(), map()) :: result
  def labels(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Search, :labels},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/search/labels",
      query: [
        {"repository_id", :repository_id},
        {"q", :q},
        {"sort", :sort},
        {"order", :order},
        {"per_page", :per_page},
        {"page", :page}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Search repositories\n\nPath: /search/repositories\n\nMethod: get"
  @spec repos(GitHubSDK.Client.t()) :: result
  @spec repos(GitHubSDK.Client.t(), map()) :: result
  def repos(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Search, :repos},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/search/repositories",
      query: [
        {"q", :q},
        {"sort", :sort},
        {"order", :order},
        {"per_page", :per_page},
        {"page", :page}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Search topics\n\nPath: /search/topics\n\nMethod: get"
  @spec topics(GitHubSDK.Client.t()) :: result
  @spec topics(GitHubSDK.Client.t(), map()) :: result
  def topics(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Search, :topics},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/search/topics",
      query: [{"q", :q}, {"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Search users\n\nPath: /search/users\n\nMethod: get"
  @spec users(GitHubSDK.Client.t()) :: result
  @spec users(GitHubSDK.Client.t(), map()) :: result
  def users(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Search, :users},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/search/users",
      query: [
        {"q", :q},
        {"sort", :sort},
        {"order", :order},
        {"per_page", :per_page},
        {"page", :page}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end
end

defmodule GitHubSDK.EnterpriseTeams do
  @moduledoc """
  Generated GitHub REST operations for the `EnterpriseTeams` namespace.

  ## Operations

  * `enterprise-teams/create`
  * `enterprise-teams/list`
  * `enterprise-teams/delete`
  * `enterprise-teams/get`
  * `enterprise-teams/update`
  """

  @type result :: {:ok, term()} | {:error, GitHubSDK.Error.t()}

  @doc "Create an enterprise team\n\nPath: /enterprises/{enterprise}/teams\n\nMethod: post"
  @spec create(GitHubSDK.Client.t()) :: result
  @spec create(GitHubSDK.Client.t(), map()) :: result
  def create(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.EnterpriseTeams, :create},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"enterprise", :enterprise}],
      path_template: "/enterprises/{enterprise}/teams",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Delete an enterprise team\n\nPath: /enterprises/{enterprise}/teams/{team_slug}\n\nMethod: delete"
  @spec delete(GitHubSDK.Client.t()) :: result
  @spec delete(GitHubSDK.Client.t(), map()) :: result
  def delete(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.EnterpriseTeams, :delete},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"enterprise", :enterprise}, {"team_slug", :team_slug}],
      path_template: "/enterprises/{enterprise}/teams/{team_slug}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Get an enterprise team\n\nPath: /enterprises/{enterprise}/teams/{team_slug}\n\nMethod: get"
  @spec get(GitHubSDK.Client.t()) :: result
  @spec get(GitHubSDK.Client.t(), map()) :: result
  def get(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.EnterpriseTeams, :get},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"enterprise", :enterprise}, {"team_slug", :team_slug}],
      path_template: "/enterprises/{enterprise}/teams/{team_slug}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List enterprise teams\n\nPath: /enterprises/{enterprise}/teams\n\nMethod: get"
  @spec list(GitHubSDK.Client.t()) :: result
  @spec list(GitHubSDK.Client.t(), map()) :: result
  def list(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.EnterpriseTeams, :list},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"enterprise", :enterprise}],
      path_template: "/enterprises/{enterprise}/teams",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Update an enterprise team\n\nPath: /enterprises/{enterprise}/teams/{team_slug}\n\nMethod: patch"
  @spec update(GitHubSDK.Client.t()) :: result
  @spec update(GitHubSDK.Client.t(), map()) :: result
  def update(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.EnterpriseTeams, :update},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"enterprise", :enterprise}, {"team_slug", :team_slug}],
      path_template: "/enterprises/{enterprise}/teams/{team_slug}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

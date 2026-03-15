defmodule GitHubEx.EnterpriseTeamMemberships do
  @moduledoc """
  Generated GitHub REST operations for the `EnterpriseTeamMemberships` namespace.

  ## Operations

  * `enterprise-team-memberships/list`
  * `enterprise-team-memberships/bulk-add`
  * `enterprise-team-memberships/bulk-remove`
  * `enterprise-team-memberships/add`
  * `enterprise-team-memberships/get`
  * `enterprise-team-memberships/remove`
  """

  @type result :: {:ok, term()} | {:error, GitHubEx.Error.t()}

  @doc "Add team member\n\nPath: /enterprises/{enterprise}/teams/{enterprise-team}/memberships/{username}\n\nMethod: put"
  @spec add(GitHubEx.Client.t()) :: result
  @spec add(GitHubEx.Client.t(), map()) :: result
  def add(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.EnterpriseTeamMemberships, :add},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [
        {"enterprise", :enterprise},
        {"enterprise-team", :enterprise_team},
        {"username", :username}
      ],
      path_template: "/enterprises/{enterprise}/teams/{enterprise-team}/memberships/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Bulk add team members\n\nPath: /enterprises/{enterprise}/teams/{enterprise-team}/memberships/add\n\nMethod: post"
  @spec bulk_add(GitHubEx.Client.t()) :: result
  @spec bulk_add(GitHubEx.Client.t(), map()) :: result
  def bulk_add(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.EnterpriseTeamMemberships, :bulk_add},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"enterprise", :enterprise}, {"enterprise-team", :enterprise_team}],
      path_template: "/enterprises/{enterprise}/teams/{enterprise-team}/memberships/add",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Bulk remove team members\n\nPath: /enterprises/{enterprise}/teams/{enterprise-team}/memberships/remove\n\nMethod: post"
  @spec bulk_remove(GitHubEx.Client.t()) :: result
  @spec bulk_remove(GitHubEx.Client.t(), map()) :: result
  def bulk_remove(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.EnterpriseTeamMemberships, :bulk_remove},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"enterprise", :enterprise}, {"enterprise-team", :enterprise_team}],
      path_template: "/enterprises/{enterprise}/teams/{enterprise-team}/memberships/remove",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Get enterprise team membership\n\nPath: /enterprises/{enterprise}/teams/{enterprise-team}/memberships/{username}\n\nMethod: get"
  @spec get(GitHubEx.Client.t()) :: result
  @spec get(GitHubEx.Client.t(), map()) :: result
  def get(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.EnterpriseTeamMemberships, :get},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [
        {"enterprise", :enterprise},
        {"enterprise-team", :enterprise_team},
        {"username", :username}
      ],
      path_template: "/enterprises/{enterprise}/teams/{enterprise-team}/memberships/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List members in an enterprise team\n\nPath: /enterprises/{enterprise}/teams/{enterprise-team}/memberships\n\nMethod: get"
  @spec list(GitHubEx.Client.t()) :: result
  @spec list(GitHubEx.Client.t(), map()) :: result
  def list(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.EnterpriseTeamMemberships, :list},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"enterprise", :enterprise}, {"enterprise-team", :enterprise_team}],
      path_template: "/enterprises/{enterprise}/teams/{enterprise-team}/memberships",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Remove team membership\n\nPath: /enterprises/{enterprise}/teams/{enterprise-team}/memberships/{username}\n\nMethod: delete"
  @spec remove(GitHubEx.Client.t()) :: result
  @spec remove(GitHubEx.Client.t(), map()) :: result
  def remove(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.EnterpriseTeamMemberships, :remove},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [
        {"enterprise", :enterprise},
        {"enterprise-team", :enterprise_team},
        {"username", :username}
      ],
      path_template: "/enterprises/{enterprise}/teams/{enterprise-team}/memberships/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end
end

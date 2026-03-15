defmodule GitHubEx.EnterpriseTeamOrganizations do
  @moduledoc """
  Generated GitHub REST operations for the `EnterpriseTeamOrganizations` namespace.

  ## Operations

  * `enterprise-team-organizations/get-assignments`
  * `enterprise-team-organizations/bulk-add`
  * `enterprise-team-organizations/bulk-remove`
  * `enterprise-team-organizations/add`
  * `enterprise-team-organizations/delete`
  * `enterprise-team-organizations/get-assignment`
  """

  @type result :: {:ok, term()} | {:error, GitHubEx.Error.t()}

  @doc "Add an organization assignment\n\nPath: /enterprises/{enterprise}/teams/{enterprise-team}/organizations/{org}\n\nMethod: put"
  @spec add(GitHubEx.Client.t()) :: result
  @spec add(GitHubEx.Client.t(), map()) :: result
  def add(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.EnterpriseTeamOrganizations, :add},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"enterprise", :enterprise}, {"enterprise-team", :enterprise_team}, {"org", :org}],
      path_template: "/enterprises/{enterprise}/teams/{enterprise-team}/organizations/{org}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Add organization assignments\n\nPath: /enterprises/{enterprise}/teams/{enterprise-team}/organizations/add\n\nMethod: post"
  @spec bulk_add(GitHubEx.Client.t()) :: result
  @spec bulk_add(GitHubEx.Client.t(), map()) :: result
  def bulk_add(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.EnterpriseTeamOrganizations, :bulk_add},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"enterprise", :enterprise}, {"enterprise-team", :enterprise_team}],
      path_template: "/enterprises/{enterprise}/teams/{enterprise-team}/organizations/add",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Remove organization assignments\n\nPath: /enterprises/{enterprise}/teams/{enterprise-team}/organizations/remove\n\nMethod: post"
  @spec bulk_remove(GitHubEx.Client.t()) :: result
  @spec bulk_remove(GitHubEx.Client.t(), map()) :: result
  def bulk_remove(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.EnterpriseTeamOrganizations, :bulk_remove},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"enterprise", :enterprise}, {"enterprise-team", :enterprise_team}],
      path_template: "/enterprises/{enterprise}/teams/{enterprise-team}/organizations/remove",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Delete an organization assignment\n\nPath: /enterprises/{enterprise}/teams/{enterprise-team}/organizations/{org}\n\nMethod: delete"
  @spec delete(GitHubEx.Client.t()) :: result
  @spec delete(GitHubEx.Client.t(), map()) :: result
  def delete(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.EnterpriseTeamOrganizations, :delete},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"enterprise", :enterprise}, {"enterprise-team", :enterprise_team}, {"org", :org}],
      path_template: "/enterprises/{enterprise}/teams/{enterprise-team}/organizations/{org}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Get organization assignment\n\nPath: /enterprises/{enterprise}/teams/{enterprise-team}/organizations/{org}\n\nMethod: get"
  @spec get_assignment(GitHubEx.Client.t()) :: result
  @spec get_assignment(GitHubEx.Client.t(), map()) :: result
  def get_assignment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.EnterpriseTeamOrganizations, :get_assignment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"enterprise", :enterprise}, {"enterprise-team", :enterprise_team}, {"org", :org}],
      path_template: "/enterprises/{enterprise}/teams/{enterprise-team}/organizations/{org}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get organization assignments\n\nPath: /enterprises/{enterprise}/teams/{enterprise-team}/organizations\n\nMethod: get"
  @spec get_assignments(GitHubEx.Client.t()) :: result
  @spec get_assignments(GitHubEx.Client.t(), map()) :: result
  def get_assignments(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.EnterpriseTeamOrganizations, :get_assignments},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"enterprise", :enterprise}, {"enterprise-team", :enterprise_team}],
      path_template: "/enterprises/{enterprise}/teams/{enterprise-team}/organizations",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end
end

defmodule GitHubSDK.Teams do
  @moduledoc """
  Generated GitHub REST operations for the `Teams` namespace.

  ## Operations

  * `teams/create`
  * `teams/list`
  * `teams/delete-in-org`
  * `teams/get-by-name`
  * `teams/update-in-org`
  * `teams/list-pending-invitations-in-org`
  * `teams/list-members-in-org`
  * `teams/add-or-update-membership-for-user-in-org`
  * `teams/get-membership-for-user-in-org`
  * `teams/remove-membership-for-user-in-org`
  * `teams/list-repos-in-org`
  * `teams/add-or-update-repo-permissions-in-org`
  * `teams/check-permissions-for-repo-in-org`
  * `teams/remove-repo-in-org`
  * `teams/list-child-in-org`
  * `teams/delete-legacy`
  * `teams/get-legacy`
  * `teams/update-legacy`
  * `teams/list-pending-invitations-legacy`
  * `teams/list-members-legacy`
  * `teams/add-member-legacy`
  * `teams/get-member-legacy`
  * `teams/remove-member-legacy`
  * `teams/add-or-update-membership-for-user-legacy`
  * `teams/get-membership-for-user-legacy`
  * `teams/remove-membership-for-user-legacy`
  * `teams/list-repos-legacy`
  * `teams/add-or-update-repo-permissions-legacy`
  * `teams/check-permissions-for-repo-legacy`
  * `teams/remove-repo-legacy`
  * `teams/list-child-legacy`
  * `teams/list-for-authenticated-user`
  """

  @type result :: {:ok, term()} | {:error, GitHubSDK.Error.t()}

  @doc "Add team member (Legacy)\n\nPath: /teams/{team_id}/members/{username}\n\nMethod: put"
  @spec add_member_legacy(GitHubSDK.Client.t()) :: result
  @spec add_member_legacy(GitHubSDK.Client.t(), map()) :: result
  def add_member_legacy(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Teams, :add_member_legacy},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"team_id", :team_id}, {"username", :username}],
      path_template: "/teams/{team_id}/members/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Add or update team membership for a user\n\nPath: /orgs/{org}/teams/{team_slug}/memberships/{username}\n\nMethod: put"
  @spec add_or_update_membership_for_user_in_org(GitHubSDK.Client.t()) :: result
  @spec add_or_update_membership_for_user_in_org(GitHubSDK.Client.t(), map()) :: result
  def add_or_update_membership_for_user_in_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Teams, :add_or_update_membership_for_user_in_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"team_slug", :team_slug}, {"username", :username}],
      path_template: "/orgs/{org}/teams/{team_slug}/memberships/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Add or update team membership for a user (Legacy)\n\nPath: /teams/{team_id}/memberships/{username}\n\nMethod: put"
  @spec add_or_update_membership_for_user_legacy(GitHubSDK.Client.t()) :: result
  @spec add_or_update_membership_for_user_legacy(GitHubSDK.Client.t(), map()) :: result
  def add_or_update_membership_for_user_legacy(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Teams, :add_or_update_membership_for_user_legacy},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"team_id", :team_id}, {"username", :username}],
      path_template: "/teams/{team_id}/memberships/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Add or update team repository permissions\n\nPath: /orgs/{org}/teams/{team_slug}/repos/{owner}/{repo}\n\nMethod: put"
  @spec add_or_update_repo_permissions_in_org(GitHubSDK.Client.t()) :: result
  @spec add_or_update_repo_permissions_in_org(GitHubSDK.Client.t(), map()) :: result
  def add_or_update_repo_permissions_in_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Teams, :add_or_update_repo_permissions_in_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"team_slug", :team_slug}, {"owner", :owner}, {"repo", :repo}],
      path_template: "/orgs/{org}/teams/{team_slug}/repos/{owner}/{repo}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Add or update team repository permissions (Legacy)\n\nPath: /teams/{team_id}/repos/{owner}/{repo}\n\nMethod: put"
  @spec add_or_update_repo_permissions_legacy(GitHubSDK.Client.t()) :: result
  @spec add_or_update_repo_permissions_legacy(GitHubSDK.Client.t(), map()) :: result
  def add_or_update_repo_permissions_legacy(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Teams, :add_or_update_repo_permissions_legacy},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"team_id", :team_id}, {"owner", :owner}, {"repo", :repo}],
      path_template: "/teams/{team_id}/repos/{owner}/{repo}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Check team permissions for a repository\n\nPath: /orgs/{org}/teams/{team_slug}/repos/{owner}/{repo}\n\nMethod: get"
  @spec check_permissions_for_repo_in_org(GitHubSDK.Client.t()) :: result
  @spec check_permissions_for_repo_in_org(GitHubSDK.Client.t(), map()) :: result
  def check_permissions_for_repo_in_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Teams, :check_permissions_for_repo_in_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"team_slug", :team_slug}, {"owner", :owner}, {"repo", :repo}],
      path_template: "/orgs/{org}/teams/{team_slug}/repos/{owner}/{repo}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Check team permissions for a repository (Legacy)\n\nPath: /teams/{team_id}/repos/{owner}/{repo}\n\nMethod: get"
  @spec check_permissions_for_repo_legacy(GitHubSDK.Client.t()) :: result
  @spec check_permissions_for_repo_legacy(GitHubSDK.Client.t(), map()) :: result
  def check_permissions_for_repo_legacy(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Teams, :check_permissions_for_repo_legacy},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"team_id", :team_id}, {"owner", :owner}, {"repo", :repo}],
      path_template: "/teams/{team_id}/repos/{owner}/{repo}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Create a team\n\nPath: /orgs/{org}/teams\n\nMethod: post"
  @spec create(GitHubSDK.Client.t()) :: result
  @spec create(GitHubSDK.Client.t(), map()) :: result
  def create(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Teams, :create},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/teams",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Delete a team\n\nPath: /orgs/{org}/teams/{team_slug}\n\nMethod: delete"
  @spec delete_in_org(GitHubSDK.Client.t()) :: result
  @spec delete_in_org(GitHubSDK.Client.t(), map()) :: result
  def delete_in_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Teams, :delete_in_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"team_slug", :team_slug}],
      path_template: "/orgs/{org}/teams/{team_slug}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a team (Legacy)\n\nPath: /teams/{team_id}\n\nMethod: delete"
  @spec delete_legacy(GitHubSDK.Client.t()) :: result
  @spec delete_legacy(GitHubSDK.Client.t(), map()) :: result
  def delete_legacy(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Teams, :delete_legacy},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"team_id", :team_id}],
      path_template: "/teams/{team_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Get a team by name\n\nPath: /orgs/{org}/teams/{team_slug}\n\nMethod: get"
  @spec get_by_name(GitHubSDK.Client.t()) :: result
  @spec get_by_name(GitHubSDK.Client.t(), map()) :: result
  def get_by_name(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Teams, :get_by_name},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"team_slug", :team_slug}],
      path_template: "/orgs/{org}/teams/{team_slug}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a team (Legacy)\n\nPath: /teams/{team_id}\n\nMethod: get"
  @spec get_legacy(GitHubSDK.Client.t()) :: result
  @spec get_legacy(GitHubSDK.Client.t(), map()) :: result
  def get_legacy(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Teams, :get_legacy},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"team_id", :team_id}],
      path_template: "/teams/{team_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get team member (Legacy)\n\nPath: /teams/{team_id}/members/{username}\n\nMethod: get"
  @spec get_member_legacy(GitHubSDK.Client.t()) :: result
  @spec get_member_legacy(GitHubSDK.Client.t(), map()) :: result
  def get_member_legacy(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Teams, :get_member_legacy},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"team_id", :team_id}, {"username", :username}],
      path_template: "/teams/{team_id}/members/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get team membership for a user\n\nPath: /orgs/{org}/teams/{team_slug}/memberships/{username}\n\nMethod: get"
  @spec get_membership_for_user_in_org(GitHubSDK.Client.t()) :: result
  @spec get_membership_for_user_in_org(GitHubSDK.Client.t(), map()) :: result
  def get_membership_for_user_in_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Teams, :get_membership_for_user_in_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"team_slug", :team_slug}, {"username", :username}],
      path_template: "/orgs/{org}/teams/{team_slug}/memberships/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get team membership for a user (Legacy)\n\nPath: /teams/{team_id}/memberships/{username}\n\nMethod: get"
  @spec get_membership_for_user_legacy(GitHubSDK.Client.t()) :: result
  @spec get_membership_for_user_legacy(GitHubSDK.Client.t(), map()) :: result
  def get_membership_for_user_legacy(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Teams, :get_membership_for_user_legacy},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"team_id", :team_id}, {"username", :username}],
      path_template: "/teams/{team_id}/memberships/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List teams\n\nPath: /orgs/{org}/teams\n\nMethod: get"
  @spec list(GitHubSDK.Client.t()) :: result
  @spec list(GitHubSDK.Client.t(), map()) :: result
  def list(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Teams, :list},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/teams",
      query: [{"per_page", :per_page}, {"page", :page}, {"team_type", :team_type}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List child teams\n\nPath: /orgs/{org}/teams/{team_slug}/teams\n\nMethod: get"
  @spec list_child_in_org(GitHubSDK.Client.t()) :: result
  @spec list_child_in_org(GitHubSDK.Client.t(), map()) :: result
  def list_child_in_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Teams, :list_child_in_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"team_slug", :team_slug}],
      path_template: "/orgs/{org}/teams/{team_slug}/teams",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List child teams (Legacy)\n\nPath: /teams/{team_id}/teams\n\nMethod: get"
  @spec list_child_legacy(GitHubSDK.Client.t()) :: result
  @spec list_child_legacy(GitHubSDK.Client.t(), map()) :: result
  def list_child_legacy(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Teams, :list_child_legacy},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"team_id", :team_id}],
      path_template: "/teams/{team_id}/teams",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List teams for the authenticated user\n\nPath: /user/teams\n\nMethod: get"
  @spec list_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec list_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def list_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Teams, :list_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/user/teams",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List team members\n\nPath: /orgs/{org}/teams/{team_slug}/members\n\nMethod: get"
  @spec list_members_in_org(GitHubSDK.Client.t()) :: result
  @spec list_members_in_org(GitHubSDK.Client.t(), map()) :: result
  def list_members_in_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Teams, :list_members_in_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"team_slug", :team_slug}],
      path_template: "/orgs/{org}/teams/{team_slug}/members",
      query: [{"role", :role}, {"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List team members (Legacy)\n\nPath: /teams/{team_id}/members\n\nMethod: get"
  @spec list_members_legacy(GitHubSDK.Client.t()) :: result
  @spec list_members_legacy(GitHubSDK.Client.t(), map()) :: result
  def list_members_legacy(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Teams, :list_members_legacy},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"team_id", :team_id}],
      path_template: "/teams/{team_id}/members",
      query: [{"role", :role}, {"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List pending team invitations\n\nPath: /orgs/{org}/teams/{team_slug}/invitations\n\nMethod: get"
  @spec list_pending_invitations_in_org(GitHubSDK.Client.t()) :: result
  @spec list_pending_invitations_in_org(GitHubSDK.Client.t(), map()) :: result
  def list_pending_invitations_in_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Teams, :list_pending_invitations_in_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"team_slug", :team_slug}],
      path_template: "/orgs/{org}/teams/{team_slug}/invitations",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List pending team invitations (Legacy)\n\nPath: /teams/{team_id}/invitations\n\nMethod: get"
  @spec list_pending_invitations_legacy(GitHubSDK.Client.t()) :: result
  @spec list_pending_invitations_legacy(GitHubSDK.Client.t(), map()) :: result
  def list_pending_invitations_legacy(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Teams, :list_pending_invitations_legacy},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"team_id", :team_id}],
      path_template: "/teams/{team_id}/invitations",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List team repositories\n\nPath: /orgs/{org}/teams/{team_slug}/repos\n\nMethod: get"
  @spec list_repos_in_org(GitHubSDK.Client.t()) :: result
  @spec list_repos_in_org(GitHubSDK.Client.t(), map()) :: result
  def list_repos_in_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Teams, :list_repos_in_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"team_slug", :team_slug}],
      path_template: "/orgs/{org}/teams/{team_slug}/repos",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List team repositories (Legacy)\n\nPath: /teams/{team_id}/repos\n\nMethod: get"
  @spec list_repos_legacy(GitHubSDK.Client.t()) :: result
  @spec list_repos_legacy(GitHubSDK.Client.t(), map()) :: result
  def list_repos_legacy(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Teams, :list_repos_legacy},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"team_id", :team_id}],
      path_template: "/teams/{team_id}/repos",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Remove team member (Legacy)\n\nPath: /teams/{team_id}/members/{username}\n\nMethod: delete"
  @spec remove_member_legacy(GitHubSDK.Client.t()) :: result
  @spec remove_member_legacy(GitHubSDK.Client.t(), map()) :: result
  def remove_member_legacy(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Teams, :remove_member_legacy},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"team_id", :team_id}, {"username", :username}],
      path_template: "/teams/{team_id}/members/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove team membership for a user\n\nPath: /orgs/{org}/teams/{team_slug}/memberships/{username}\n\nMethod: delete"
  @spec remove_membership_for_user_in_org(GitHubSDK.Client.t()) :: result
  @spec remove_membership_for_user_in_org(GitHubSDK.Client.t(), map()) :: result
  def remove_membership_for_user_in_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Teams, :remove_membership_for_user_in_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"team_slug", :team_slug}, {"username", :username}],
      path_template: "/orgs/{org}/teams/{team_slug}/memberships/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove team membership for a user (Legacy)\n\nPath: /teams/{team_id}/memberships/{username}\n\nMethod: delete"
  @spec remove_membership_for_user_legacy(GitHubSDK.Client.t()) :: result
  @spec remove_membership_for_user_legacy(GitHubSDK.Client.t(), map()) :: result
  def remove_membership_for_user_legacy(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Teams, :remove_membership_for_user_legacy},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"team_id", :team_id}, {"username", :username}],
      path_template: "/teams/{team_id}/memberships/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove a repository from a team\n\nPath: /orgs/{org}/teams/{team_slug}/repos/{owner}/{repo}\n\nMethod: delete"
  @spec remove_repo_in_org(GitHubSDK.Client.t()) :: result
  @spec remove_repo_in_org(GitHubSDK.Client.t(), map()) :: result
  def remove_repo_in_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Teams, :remove_repo_in_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"team_slug", :team_slug}, {"owner", :owner}, {"repo", :repo}],
      path_template: "/orgs/{org}/teams/{team_slug}/repos/{owner}/{repo}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove a repository from a team (Legacy)\n\nPath: /teams/{team_id}/repos/{owner}/{repo}\n\nMethod: delete"
  @spec remove_repo_legacy(GitHubSDK.Client.t()) :: result
  @spec remove_repo_legacy(GitHubSDK.Client.t(), map()) :: result
  def remove_repo_legacy(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Teams, :remove_repo_legacy},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"team_id", :team_id}, {"owner", :owner}, {"repo", :repo}],
      path_template: "/teams/{team_id}/repos/{owner}/{repo}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Update a team\n\nPath: /orgs/{org}/teams/{team_slug}\n\nMethod: patch"
  @spec update_in_org(GitHubSDK.Client.t()) :: result
  @spec update_in_org(GitHubSDK.Client.t(), map()) :: result
  def update_in_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Teams, :update_in_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"org", :org}, {"team_slug", :team_slug}],
      path_template: "/orgs/{org}/teams/{team_slug}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update a team (Legacy)\n\nPath: /teams/{team_id}\n\nMethod: patch"
  @spec update_legacy(GitHubSDK.Client.t()) :: result
  @spec update_legacy(GitHubSDK.Client.t(), map()) :: result
  def update_legacy(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Teams, :update_legacy},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"team_id", :team_id}],
      path_template: "/teams/{team_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

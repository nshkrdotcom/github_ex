defmodule GitHubSDK.Migrations do
  @moduledoc """
  Generated GitHub REST operations for the `Migrations` namespace.

  ## Operations

  * `migrations/list-for-org`
  * `migrations/start-for-org`
  * `migrations/get-status-for-org`
  * `migrations/delete-archive-for-org`
  * `migrations/download-archive-for-org`
  * `migrations/unlock-repo-for-org`
  * `migrations/list-repos-for-org`
  * `migrations/cancel-import`
  * `migrations/get-import-status`
  * `migrations/start-import`
  * `migrations/update-import`
  * `migrations/get-commit-authors`
  * `migrations/map-commit-author`
  * `migrations/get-large-files`
  * `migrations/set-lfs-preference`
  * `migrations/list-for-authenticated-user`
  * `migrations/start-for-authenticated-user`
  * `migrations/get-status-for-authenticated-user`
  * `migrations/delete-archive-for-authenticated-user`
  * `migrations/get-archive-for-authenticated-user`
  * `migrations/unlock-repo-for-authenticated-user`
  * `migrations/list-repos-for-authenticated-user`
  """

  @type result :: {:ok, term()} | {:error, GitHubSDK.Error.t()}

  @doc "Cancel an import\n\nPath: /repos/{owner}/{repo}/import\n\nMethod: delete"
  @spec cancel_import(GitHubSDK.Client.t()) :: result
  @spec cancel_import(GitHubSDK.Client.t(), map()) :: result
  def cancel_import(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Migrations, :cancel_import},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/import",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a user migration archive\n\nPath: /user/migrations/{migration_id}/archive\n\nMethod: delete"
  @spec delete_archive_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec delete_archive_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def delete_archive_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Migrations, :delete_archive_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"migration_id", :migration_id}],
      path_template: "/user/migrations/{migration_id}/archive",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete an organization migration archive\n\nPath: /orgs/{org}/migrations/{migration_id}/archive\n\nMethod: delete"
  @spec delete_archive_for_org(GitHubSDK.Client.t()) :: result
  @spec delete_archive_for_org(GitHubSDK.Client.t(), map()) :: result
  def delete_archive_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Migrations, :delete_archive_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"migration_id", :migration_id}],
      path_template: "/orgs/{org}/migrations/{migration_id}/archive",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Download an organization migration archive\n\nPath: /orgs/{org}/migrations/{migration_id}/archive\n\nMethod: get"
  @spec download_archive_for_org(GitHubSDK.Client.t()) :: result
  @spec download_archive_for_org(GitHubSDK.Client.t(), map()) :: result
  def download_archive_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Migrations, :download_archive_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"migration_id", :migration_id}],
      path_template: "/orgs/{org}/migrations/{migration_id}/archive",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Download a user migration archive\n\nPath: /user/migrations/{migration_id}/archive\n\nMethod: get"
  @spec get_archive_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec get_archive_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def get_archive_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Migrations, :get_archive_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"migration_id", :migration_id}],
      path_template: "/user/migrations/{migration_id}/archive",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get commit authors\n\nPath: /repos/{owner}/{repo}/import/authors\n\nMethod: get"
  @spec get_commit_authors(GitHubSDK.Client.t()) :: result
  @spec get_commit_authors(GitHubSDK.Client.t(), map()) :: result
  def get_commit_authors(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Migrations, :get_commit_authors},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/import/authors",
      query: [{"since", :since}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get an import status\n\nPath: /repos/{owner}/{repo}/import\n\nMethod: get"
  @spec get_import_status(GitHubSDK.Client.t()) :: result
  @spec get_import_status(GitHubSDK.Client.t(), map()) :: result
  def get_import_status(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Migrations, :get_import_status},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/import",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get large files\n\nPath: /repos/{owner}/{repo}/import/large_files\n\nMethod: get"
  @spec get_large_files(GitHubSDK.Client.t()) :: result
  @spec get_large_files(GitHubSDK.Client.t(), map()) :: result
  def get_large_files(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Migrations, :get_large_files},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/import/large_files",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a user migration status\n\nPath: /user/migrations/{migration_id}\n\nMethod: get"
  @spec get_status_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec get_status_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def get_status_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Migrations, :get_status_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"migration_id", :migration_id}],
      path_template: "/user/migrations/{migration_id}",
      query: [{"exclude", :exclude}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get an organization migration status\n\nPath: /orgs/{org}/migrations/{migration_id}\n\nMethod: get"
  @spec get_status_for_org(GitHubSDK.Client.t()) :: result
  @spec get_status_for_org(GitHubSDK.Client.t(), map()) :: result
  def get_status_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Migrations, :get_status_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"migration_id", :migration_id}],
      path_template: "/orgs/{org}/migrations/{migration_id}",
      query: [{"exclude", :exclude}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List user migrations\n\nPath: /user/migrations\n\nMethod: get"
  @spec list_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec list_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def list_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Migrations, :list_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/user/migrations",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List organization migrations\n\nPath: /orgs/{org}/migrations\n\nMethod: get"
  @spec list_for_org(GitHubSDK.Client.t()) :: result
  @spec list_for_org(GitHubSDK.Client.t(), map()) :: result
  def list_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Migrations, :list_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/migrations",
      query: [{"per_page", :per_page}, {"page", :page}, {"exclude", :exclude}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repositories for a user migration\n\nPath: /user/migrations/{migration_id}/repositories\n\nMethod: get"
  @spec list_repos_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec list_repos_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def list_repos_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Migrations, :list_repos_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"migration_id", :migration_id}],
      path_template: "/user/migrations/{migration_id}/repositories",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repositories in an organization migration\n\nPath: /orgs/{org}/migrations/{migration_id}/repositories\n\nMethod: get"
  @spec list_repos_for_org(GitHubSDK.Client.t()) :: result
  @spec list_repos_for_org(GitHubSDK.Client.t(), map()) :: result
  def list_repos_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Migrations, :list_repos_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"migration_id", :migration_id}],
      path_template: "/orgs/{org}/migrations/{migration_id}/repositories",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Map a commit author\n\nPath: /repos/{owner}/{repo}/import/authors/{author_id}\n\nMethod: patch"
  @spec map_commit_author(GitHubSDK.Client.t()) :: result
  @spec map_commit_author(GitHubSDK.Client.t(), map()) :: result
  def map_commit_author(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Migrations, :map_commit_author},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"owner", :owner}, {"repo", :repo}, {"author_id", :author_id}],
      path_template: "/repos/{owner}/{repo}/import/authors/{author_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update Git LFS preference\n\nPath: /repos/{owner}/{repo}/import/lfs\n\nMethod: patch"
  @spec set_lfs_preference(GitHubSDK.Client.t()) :: result
  @spec set_lfs_preference(GitHubSDK.Client.t(), map()) :: result
  def set_lfs_preference(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Migrations, :set_lfs_preference},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/import/lfs",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Start a user migration\n\nPath: /user/migrations\n\nMethod: post"
  @spec start_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec start_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def start_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Migrations, :start_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [],
      path_template: "/user/migrations",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Start an organization migration\n\nPath: /orgs/{org}/migrations\n\nMethod: post"
  @spec start_for_org(GitHubSDK.Client.t()) :: result
  @spec start_for_org(GitHubSDK.Client.t(), map()) :: result
  def start_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Migrations, :start_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/migrations",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Start an import\n\nPath: /repos/{owner}/{repo}/import\n\nMethod: put"
  @spec start_import(GitHubSDK.Client.t()) :: result
  @spec start_import(GitHubSDK.Client.t(), map()) :: result
  def start_import(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Migrations, :start_import},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/import",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Unlock a user repository\n\nPath: /user/migrations/{migration_id}/repos/{repo_name}/lock\n\nMethod: delete"
  @spec unlock_repo_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec unlock_repo_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def unlock_repo_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Migrations, :unlock_repo_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"migration_id", :migration_id}, {"repo_name", :repo_name}],
      path_template: "/user/migrations/{migration_id}/repos/{repo_name}/lock",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Unlock an organization repository\n\nPath: /orgs/{org}/migrations/{migration_id}/repos/{repo_name}/lock\n\nMethod: delete"
  @spec unlock_repo_for_org(GitHubSDK.Client.t()) :: result
  @spec unlock_repo_for_org(GitHubSDK.Client.t(), map()) :: result
  def unlock_repo_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Migrations, :unlock_repo_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"migration_id", :migration_id}, {"repo_name", :repo_name}],
      path_template: "/orgs/{org}/migrations/{migration_id}/repos/{repo_name}/lock",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Update an import\n\nPath: /repos/{owner}/{repo}/import\n\nMethod: patch"
  @spec update_import(GitHubSDK.Client.t()) :: result
  @spec update_import(GitHubSDK.Client.t(), map()) :: result
  def update_import(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Migrations, :update_import},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/import",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

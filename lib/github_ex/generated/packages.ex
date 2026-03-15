defmodule GitHubEx.Packages do
  @moduledoc """
  Generated GitHub REST operations for the `Packages` namespace.

  ## Operations

  * `packages/list-docker-migration-conflicting-packages-for-organization`
  * `packages/list-packages-for-organization`
  * `packages/delete-package-for-org`
  * `packages/get-package-for-organization`
  * `packages/restore-package-for-org`
  * `packages/get-all-package-versions-for-package-owned-by-org`
  * `packages/delete-package-version-for-org`
  * `packages/get-package-version-for-organization`
  * `packages/restore-package-version-for-org`
  * `packages/list-docker-migration-conflicting-packages-for-authenticated-user`
  * `packages/list-packages-for-authenticated-user`
  * `packages/delete-package-for-authenticated-user`
  * `packages/get-package-for-authenticated-user`
  * `packages/restore-package-for-authenticated-user`
  * `packages/get-all-package-versions-for-package-owned-by-authenticated-user`
  * `packages/delete-package-version-for-authenticated-user`
  * `packages/get-package-version-for-authenticated-user`
  * `packages/restore-package-version-for-authenticated-user`
  * `packages/list-docker-migration-conflicting-packages-for-user`
  * `packages/list-packages-for-user`
  * `packages/delete-package-for-user`
  * `packages/get-package-for-user`
  * `packages/restore-package-for-user`
  * `packages/get-all-package-versions-for-package-owned-by-user`
  * `packages/delete-package-version-for-user`
  * `packages/get-package-version-for-user`
  * `packages/restore-package-version-for-user`
  """

  @type result :: {:ok, term()} | {:error, GitHubEx.Error.t()}

  @doc "Delete a package for the authenticated user\n\nPath: /user/packages/{package_type}/{package_name}\n\nMethod: delete"
  @spec delete_package_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec delete_package_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def delete_package_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Packages, :delete_package_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"package_type", :package_type}, {"package_name", :package_name}],
      path_template: "/user/packages/{package_type}/{package_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a package for an organization\n\nPath: /orgs/{org}/packages/{package_type}/{package_name}\n\nMethod: delete"
  @spec delete_package_for_org(GitHubEx.Client.t()) :: result
  @spec delete_package_for_org(GitHubEx.Client.t(), map()) :: result
  def delete_package_for_org(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Packages, :delete_package_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"package_type", :package_type}, {"package_name", :package_name}, {"org", :org}],
      path_template: "/orgs/{org}/packages/{package_type}/{package_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a package for a user\n\nPath: /users/{username}/packages/{package_type}/{package_name}\n\nMethod: delete"
  @spec delete_package_for_user(GitHubEx.Client.t()) :: result
  @spec delete_package_for_user(GitHubEx.Client.t(), map()) :: result
  def delete_package_for_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Packages, :delete_package_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [
        {"package_type", :package_type},
        {"package_name", :package_name},
        {"username", :username}
      ],
      path_template: "/users/{username}/packages/{package_type}/{package_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a package version for the authenticated user\n\nPath: /user/packages/{package_type}/{package_name}/versions/{package_version_id}\n\nMethod: delete"
  @spec delete_package_version_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec delete_package_version_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def delete_package_version_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Packages, :delete_package_version_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [
        {"package_type", :package_type},
        {"package_name", :package_name},
        {"package_version_id", :package_version_id}
      ],
      path_template: "/user/packages/{package_type}/{package_name}/versions/{package_version_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete package version for an organization\n\nPath: /orgs/{org}/packages/{package_type}/{package_name}/versions/{package_version_id}\n\nMethod: delete"
  @spec delete_package_version_for_org(GitHubEx.Client.t()) :: result
  @spec delete_package_version_for_org(GitHubEx.Client.t(), map()) :: result
  def delete_package_version_for_org(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Packages, :delete_package_version_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [
        {"package_type", :package_type},
        {"package_name", :package_name},
        {"org", :org},
        {"package_version_id", :package_version_id}
      ],
      path_template:
        "/orgs/{org}/packages/{package_type}/{package_name}/versions/{package_version_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete package version for a user\n\nPath: /users/{username}/packages/{package_type}/{package_name}/versions/{package_version_id}\n\nMethod: delete"
  @spec delete_package_version_for_user(GitHubEx.Client.t()) :: result
  @spec delete_package_version_for_user(GitHubEx.Client.t(), map()) :: result
  def delete_package_version_for_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Packages, :delete_package_version_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [
        {"package_type", :package_type},
        {"package_name", :package_name},
        {"username", :username},
        {"package_version_id", :package_version_id}
      ],
      path_template:
        "/users/{username}/packages/{package_type}/{package_name}/versions/{package_version_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "List package versions for a package owned by the authenticated user\n\nPath: /user/packages/{package_type}/{package_name}/versions\n\nMethod: get"
  @spec get_all_package_versions_for_package_owned_by_authenticated_user(GitHubEx.Client.t()) ::
          result
  @spec get_all_package_versions_for_package_owned_by_authenticated_user(
          GitHubEx.Client.t(),
          map()
        ) :: result
  def get_all_package_versions_for_package_owned_by_authenticated_user(client, params \\ %{})
      when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call:
        {GitHubEx.Packages, :get_all_package_versions_for_package_owned_by_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"package_type", :package_type}, {"package_name", :package_name}],
      path_template: "/user/packages/{package_type}/{package_name}/versions",
      query: [{"page", :page}, {"per_page", :per_page}, {"state", :state}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List package versions for a package owned by an organization\n\nPath: /orgs/{org}/packages/{package_type}/{package_name}/versions\n\nMethod: get"
  @spec get_all_package_versions_for_package_owned_by_org(GitHubEx.Client.t()) :: result
  @spec get_all_package_versions_for_package_owned_by_org(GitHubEx.Client.t(), map()) :: result
  def get_all_package_versions_for_package_owned_by_org(client, params \\ %{})
      when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Packages, :get_all_package_versions_for_package_owned_by_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"package_type", :package_type}, {"package_name", :package_name}, {"org", :org}],
      path_template: "/orgs/{org}/packages/{package_type}/{package_name}/versions",
      query: [{"page", :page}, {"per_page", :per_page}, {"state", :state}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List package versions for a package owned by a user\n\nPath: /users/{username}/packages/{package_type}/{package_name}/versions\n\nMethod: get"
  @spec get_all_package_versions_for_package_owned_by_user(GitHubEx.Client.t()) :: result
  @spec get_all_package_versions_for_package_owned_by_user(GitHubEx.Client.t(), map()) :: result
  def get_all_package_versions_for_package_owned_by_user(client, params \\ %{})
      when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Packages, :get_all_package_versions_for_package_owned_by_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [
        {"package_type", :package_type},
        {"package_name", :package_name},
        {"username", :username}
      ],
      path_template: "/users/{username}/packages/{package_type}/{package_name}/versions",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a package for the authenticated user\n\nPath: /user/packages/{package_type}/{package_name}\n\nMethod: get"
  @spec get_package_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec get_package_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def get_package_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Packages, :get_package_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"package_type", :package_type}, {"package_name", :package_name}],
      path_template: "/user/packages/{package_type}/{package_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a package for an organization\n\nPath: /orgs/{org}/packages/{package_type}/{package_name}\n\nMethod: get"
  @spec get_package_for_organization(GitHubEx.Client.t()) :: result
  @spec get_package_for_organization(GitHubEx.Client.t(), map()) :: result
  def get_package_for_organization(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Packages, :get_package_for_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"package_type", :package_type}, {"package_name", :package_name}, {"org", :org}],
      path_template: "/orgs/{org}/packages/{package_type}/{package_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a package for a user\n\nPath: /users/{username}/packages/{package_type}/{package_name}\n\nMethod: get"
  @spec get_package_for_user(GitHubEx.Client.t()) :: result
  @spec get_package_for_user(GitHubEx.Client.t(), map()) :: result
  def get_package_for_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Packages, :get_package_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [
        {"package_type", :package_type},
        {"package_name", :package_name},
        {"username", :username}
      ],
      path_template: "/users/{username}/packages/{package_type}/{package_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a package version for the authenticated user\n\nPath: /user/packages/{package_type}/{package_name}/versions/{package_version_id}\n\nMethod: get"
  @spec get_package_version_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec get_package_version_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def get_package_version_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Packages, :get_package_version_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [
        {"package_type", :package_type},
        {"package_name", :package_name},
        {"package_version_id", :package_version_id}
      ],
      path_template: "/user/packages/{package_type}/{package_name}/versions/{package_version_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a package version for an organization\n\nPath: /orgs/{org}/packages/{package_type}/{package_name}/versions/{package_version_id}\n\nMethod: get"
  @spec get_package_version_for_organization(GitHubEx.Client.t()) :: result
  @spec get_package_version_for_organization(GitHubEx.Client.t(), map()) :: result
  def get_package_version_for_organization(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Packages, :get_package_version_for_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [
        {"package_type", :package_type},
        {"package_name", :package_name},
        {"org", :org},
        {"package_version_id", :package_version_id}
      ],
      path_template:
        "/orgs/{org}/packages/{package_type}/{package_name}/versions/{package_version_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a package version for a user\n\nPath: /users/{username}/packages/{package_type}/{package_name}/versions/{package_version_id}\n\nMethod: get"
  @spec get_package_version_for_user(GitHubEx.Client.t()) :: result
  @spec get_package_version_for_user(GitHubEx.Client.t(), map()) :: result
  def get_package_version_for_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Packages, :get_package_version_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [
        {"package_type", :package_type},
        {"package_name", :package_name},
        {"package_version_id", :package_version_id},
        {"username", :username}
      ],
      path_template:
        "/users/{username}/packages/{package_type}/{package_name}/versions/{package_version_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get list of conflicting packages during Docker migration for authenticated-user\n\nPath: /user/docker/conflicts\n\nMethod: get"
  @spec list_docker_migration_conflicting_packages_for_authenticated_user(GitHubEx.Client.t()) ::
          result
  @spec list_docker_migration_conflicting_packages_for_authenticated_user(
          GitHubEx.Client.t(),
          map()
        ) :: result
  def list_docker_migration_conflicting_packages_for_authenticated_user(client, params \\ %{})
      when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call:
        {GitHubEx.Packages, :list_docker_migration_conflicting_packages_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/user/docker/conflicts",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get list of conflicting packages during Docker migration for organization\n\nPath: /orgs/{org}/docker/conflicts\n\nMethod: get"
  @spec list_docker_migration_conflicting_packages_for_organization(GitHubEx.Client.t()) :: result
  @spec list_docker_migration_conflicting_packages_for_organization(GitHubEx.Client.t(), map()) ::
          result
  def list_docker_migration_conflicting_packages_for_organization(client, params \\ %{})
      when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Packages, :list_docker_migration_conflicting_packages_for_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/docker/conflicts",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get list of conflicting packages during Docker migration for user\n\nPath: /users/{username}/docker/conflicts\n\nMethod: get"
  @spec list_docker_migration_conflicting_packages_for_user(GitHubEx.Client.t()) :: result
  @spec list_docker_migration_conflicting_packages_for_user(GitHubEx.Client.t(), map()) :: result
  def list_docker_migration_conflicting_packages_for_user(client, params \\ %{})
      when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Packages, :list_docker_migration_conflicting_packages_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"username", :username}],
      path_template: "/users/{username}/docker/conflicts",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List packages for the authenticated user's namespace\n\nPath: /user/packages\n\nMethod: get"
  @spec list_packages_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec list_packages_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def list_packages_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Packages, :list_packages_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/user/packages",
      query: [
        {"package_type", :package_type},
        {"visibility", :visibility},
        {"page", :page},
        {"per_page", :per_page}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List packages for an organization\n\nPath: /orgs/{org}/packages\n\nMethod: get"
  @spec list_packages_for_organization(GitHubEx.Client.t()) :: result
  @spec list_packages_for_organization(GitHubEx.Client.t(), map()) :: result
  def list_packages_for_organization(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Packages, :list_packages_for_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/packages",
      query: [
        {"package_type", :package_type},
        {"visibility", :visibility},
        {"page", :page},
        {"per_page", :per_page}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List packages for a user\n\nPath: /users/{username}/packages\n\nMethod: get"
  @spec list_packages_for_user(GitHubEx.Client.t()) :: result
  @spec list_packages_for_user(GitHubEx.Client.t(), map()) :: result
  def list_packages_for_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Packages, :list_packages_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"username", :username}],
      path_template: "/users/{username}/packages",
      query: [
        {"package_type", :package_type},
        {"visibility", :visibility},
        {"page", :page},
        {"per_page", :per_page}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Restore a package for the authenticated user\n\nPath: /user/packages/{package_type}/{package_name}/restore\n\nMethod: post"
  @spec restore_package_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec restore_package_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def restore_package_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Packages, :restore_package_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"package_type", :package_type}, {"package_name", :package_name}],
      path_template: "/user/packages/{package_type}/{package_name}/restore",
      query: [{"token", :token}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Restore a package for an organization\n\nPath: /orgs/{org}/packages/{package_type}/{package_name}/restore\n\nMethod: post"
  @spec restore_package_for_org(GitHubEx.Client.t()) :: result
  @spec restore_package_for_org(GitHubEx.Client.t(), map()) :: result
  def restore_package_for_org(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Packages, :restore_package_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"package_type", :package_type}, {"package_name", :package_name}, {"org", :org}],
      path_template: "/orgs/{org}/packages/{package_type}/{package_name}/restore",
      query: [{"token", :token}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Restore a package for a user\n\nPath: /users/{username}/packages/{package_type}/{package_name}/restore\n\nMethod: post"
  @spec restore_package_for_user(GitHubEx.Client.t()) :: result
  @spec restore_package_for_user(GitHubEx.Client.t(), map()) :: result
  def restore_package_for_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Packages, :restore_package_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [
        {"package_type", :package_type},
        {"package_name", :package_name},
        {"username", :username}
      ],
      path_template: "/users/{username}/packages/{package_type}/{package_name}/restore",
      query: [{"token", :token}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Restore a package version for the authenticated user\n\nPath: /user/packages/{package_type}/{package_name}/versions/{package_version_id}/restore\n\nMethod: post"
  @spec restore_package_version_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec restore_package_version_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def restore_package_version_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Packages, :restore_package_version_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [
        {"package_type", :package_type},
        {"package_name", :package_name},
        {"package_version_id", :package_version_id}
      ],
      path_template:
        "/user/packages/{package_type}/{package_name}/versions/{package_version_id}/restore",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Restore package version for an organization\n\nPath: /orgs/{org}/packages/{package_type}/{package_name}/versions/{package_version_id}/restore\n\nMethod: post"
  @spec restore_package_version_for_org(GitHubEx.Client.t()) :: result
  @spec restore_package_version_for_org(GitHubEx.Client.t(), map()) :: result
  def restore_package_version_for_org(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Packages, :restore_package_version_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [
        {"package_type", :package_type},
        {"package_name", :package_name},
        {"org", :org},
        {"package_version_id", :package_version_id}
      ],
      path_template:
        "/orgs/{org}/packages/{package_type}/{package_name}/versions/{package_version_id}/restore",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Restore package version for a user\n\nPath: /users/{username}/packages/{package_type}/{package_name}/versions/{package_version_id}/restore\n\nMethod: post"
  @spec restore_package_version_for_user(GitHubEx.Client.t()) :: result
  @spec restore_package_version_for_user(GitHubEx.Client.t(), map()) :: result
  def restore_package_version_for_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Packages, :restore_package_version_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [
        {"package_type", :package_type},
        {"package_name", :package_name},
        {"username", :username},
        {"package_version_id", :package_version_id}
      ],
      path_template:
        "/users/{username}/packages/{package_type}/{package_name}/versions/{package_version_id}/restore",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

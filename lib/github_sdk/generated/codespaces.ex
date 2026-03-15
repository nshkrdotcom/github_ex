defmodule GitHubSDK.Codespaces do
  @moduledoc """
  Generated GitHub REST operations for the `Codespaces` namespace.

  ## Operations

  * `codespaces/list-in-organization`
  * `codespaces/set-codespaces-access`
  * `codespaces/delete-codespaces-access-users`
  * `codespaces/set-codespaces-access-users`
  * `codespaces/list-org-secrets`
  * `codespaces/get-org-public-key`
  * `codespaces/create-or-update-org-secret`
  * `codespaces/delete-org-secret`
  * `codespaces/get-org-secret`
  * `codespaces/list-selected-repos-for-org-secret`
  * `codespaces/set-selected-repos-for-org-secret`
  * `codespaces/add-selected-repo-to-org-secret`
  * `codespaces/remove-selected-repo-from-org-secret`
  * `codespaces/get-codespaces-for-user-in-org`
  * `codespaces/delete-from-organization`
  * `codespaces/stop-in-organization`
  * `codespaces/create-with-repo-for-authenticated-user`
  * `codespaces/list-in-repository-for-authenticated-user`
  * `codespaces/list-devcontainers-in-repository-for-authenticated-user`
  * `codespaces/repo-machines-for-authenticated-user`
  * `codespaces/pre-flight-with-repo-for-authenticated-user`
  * `codespaces/check-permissions-for-devcontainer`
  * `codespaces/list-repo-secrets`
  * `codespaces/get-repo-public-key`
  * `codespaces/create-or-update-repo-secret`
  * `codespaces/delete-repo-secret`
  * `codespaces/get-repo-secret`
  * `codespaces/create-with-pr-for-authenticated-user`
  * `codespaces/create-for-authenticated-user`
  * `codespaces/list-for-authenticated-user`
  * `codespaces/list-secrets-for-authenticated-user`
  * `codespaces/get-public-key-for-authenticated-user`
  * `codespaces/create-or-update-secret-for-authenticated-user`
  * `codespaces/delete-secret-for-authenticated-user`
  * `codespaces/get-secret-for-authenticated-user`
  * `codespaces/list-repositories-for-secret-for-authenticated-user`
  * `codespaces/set-repositories-for-secret-for-authenticated-user`
  * `codespaces/add-repository-for-secret-for-authenticated-user`
  * `codespaces/remove-repository-for-secret-for-authenticated-user`
  * `codespaces/delete-for-authenticated-user`
  * `codespaces/get-for-authenticated-user`
  * `codespaces/update-for-authenticated-user`
  * `codespaces/export-for-authenticated-user`
  * `codespaces/get-export-details-for-authenticated-user`
  * `codespaces/codespace-machines-for-authenticated-user`
  * `codespaces/publish-for-authenticated-user`
  * `codespaces/start-for-authenticated-user`
  * `codespaces/stop-for-authenticated-user`
  """

  @type result :: {:ok, term()} | {:error, GitHubSDK.Error.t()}

  @doc "Add a selected repository to a user secret\n\nPath: /user/codespaces/secrets/{secret_name}/repositories/{repository_id}\n\nMethod: put"
  @spec add_repository_for_secret_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec add_repository_for_secret_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def add_repository_for_secret_for_authenticated_user(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :add_repository_for_secret_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"secret_name", :secret_name}, {"repository_id", :repository_id}],
      path_template: "/user/codespaces/secrets/{secret_name}/repositories/{repository_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Add selected repository to an organization secret\n\nPath: /orgs/{org}/codespaces/secrets/{secret_name}/repositories/{repository_id}\n\nMethod: put"
  @spec add_selected_repo_to_org_secret(GitHubSDK.Client.t()) :: result
  @spec add_selected_repo_to_org_secret(GitHubSDK.Client.t(), map()) :: result
  def add_selected_repo_to_org_secret(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :add_selected_repo_to_org_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"secret_name", :secret_name}, {"repository_id", :repository_id}],
      path_template: "/orgs/{org}/codespaces/secrets/{secret_name}/repositories/{repository_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Check if permissions defined by a devcontainer have been accepted by the authenticated user\n\nPath: /repos/{owner}/{repo}/codespaces/permissions_check\n\nMethod: get"
  @spec check_permissions_for_devcontainer(GitHubSDK.Client.t()) :: result
  @spec check_permissions_for_devcontainer(GitHubSDK.Client.t(), map()) :: result
  def check_permissions_for_devcontainer(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :check_permissions_for_devcontainer},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/codespaces/permissions_check",
      query: [{"ref", :ref}, {"devcontainer_path", :devcontainer_path}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List machine types for a codespace\n\nPath: /user/codespaces/{codespace_name}/machines\n\nMethod: get"
  @spec codespace_machines_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec codespace_machines_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def codespace_machines_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :codespace_machines_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"codespace_name", :codespace_name}],
      path_template: "/user/codespaces/{codespace_name}/machines",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Create a codespace for the authenticated user\n\nPath: /user/codespaces\n\nMethod: post"
  @spec create_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec create_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def create_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Codespaces, :create_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [],
      path_template: "/user/codespaces",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create or update an organization secret\n\nPath: /orgs/{org}/codespaces/secrets/{secret_name}\n\nMethod: put"
  @spec create_or_update_org_secret(GitHubSDK.Client.t()) :: result
  @spec create_or_update_org_secret(GitHubSDK.Client.t(), map()) :: result
  def create_or_update_org_secret(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Codespaces, :create_or_update_org_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"secret_name", :secret_name}],
      path_template: "/orgs/{org}/codespaces/secrets/{secret_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create or update a repository secret\n\nPath: /repos/{owner}/{repo}/codespaces/secrets/{secret_name}\n\nMethod: put"
  @spec create_or_update_repo_secret(GitHubSDK.Client.t()) :: result
  @spec create_or_update_repo_secret(GitHubSDK.Client.t(), map()) :: result
  def create_or_update_repo_secret(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Codespaces, :create_or_update_repo_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}, {"secret_name", :secret_name}],
      path_template: "/repos/{owner}/{repo}/codespaces/secrets/{secret_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create or update a secret for the authenticated user\n\nPath: /user/codespaces/secrets/{secret_name}\n\nMethod: put"
  @spec create_or_update_secret_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec create_or_update_secret_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def create_or_update_secret_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Codespaces, :create_or_update_secret_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"secret_name", :secret_name}],
      path_template: "/user/codespaces/secrets/{secret_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a codespace from a pull request\n\nPath: /repos/{owner}/{repo}/pulls/{pull_number}/codespaces\n\nMethod: post"
  @spec create_with_pr_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec create_with_pr_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def create_with_pr_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Codespaces, :create_with_pr_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"pull_number", :pull_number}],
      path_template: "/repos/{owner}/{repo}/pulls/{pull_number}/codespaces",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a codespace in a repository\n\nPath: /repos/{owner}/{repo}/codespaces\n\nMethod: post"
  @spec create_with_repo_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec create_with_repo_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def create_with_repo_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Codespaces, :create_with_repo_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/codespaces",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Remove users from Codespaces access for an organization\n\nPath: /orgs/{org}/codespaces/access/selected_users\n\nMethod: delete"
  @spec delete_codespaces_access_users(GitHubSDK.Client.t()) :: result
  @spec delete_codespaces_access_users(GitHubSDK.Client.t(), map()) :: result
  def delete_codespaces_access_users(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Codespaces, :delete_codespaces_access_users},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/codespaces/access/selected_users",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a codespace for the authenticated user\n\nPath: /user/codespaces/{codespace_name}\n\nMethod: delete"
  @spec delete_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec delete_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def delete_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :delete_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"codespace_name", :codespace_name}],
      path_template: "/user/codespaces/{codespace_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a codespace from the organization\n\nPath: /orgs/{org}/members/{username}/codespaces/{codespace_name}\n\nMethod: delete"
  @spec delete_from_organization(GitHubSDK.Client.t()) :: result
  @spec delete_from_organization(GitHubSDK.Client.t(), map()) :: result
  def delete_from_organization(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :delete_from_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"username", :username}, {"codespace_name", :codespace_name}],
      path_template: "/orgs/{org}/members/{username}/codespaces/{codespace_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete an organization secret\n\nPath: /orgs/{org}/codespaces/secrets/{secret_name}\n\nMethod: delete"
  @spec delete_org_secret(GitHubSDK.Client.t()) :: result
  @spec delete_org_secret(GitHubSDK.Client.t(), map()) :: result
  def delete_org_secret(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :delete_org_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"secret_name", :secret_name}],
      path_template: "/orgs/{org}/codespaces/secrets/{secret_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a repository secret\n\nPath: /repos/{owner}/{repo}/codespaces/secrets/{secret_name}\n\nMethod: delete"
  @spec delete_repo_secret(GitHubSDK.Client.t()) :: result
  @spec delete_repo_secret(GitHubSDK.Client.t(), map()) :: result
  def delete_repo_secret(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :delete_repo_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"secret_name", :secret_name}],
      path_template: "/repos/{owner}/{repo}/codespaces/secrets/{secret_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a secret for the authenticated user\n\nPath: /user/codespaces/secrets/{secret_name}\n\nMethod: delete"
  @spec delete_secret_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec delete_secret_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def delete_secret_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :delete_secret_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"secret_name", :secret_name}],
      path_template: "/user/codespaces/secrets/{secret_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Export a codespace for the authenticated user\n\nPath: /user/codespaces/{codespace_name}/exports\n\nMethod: post"
  @spec export_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec export_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def export_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :export_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"codespace_name", :codespace_name}],
      path_template: "/user/codespaces/{codespace_name}/exports",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "List codespaces for a user in organization\n\nPath: /orgs/{org}/members/{username}/codespaces\n\nMethod: get"
  @spec get_codespaces_for_user_in_org(GitHubSDK.Client.t()) :: result
  @spec get_codespaces_for_user_in_org(GitHubSDK.Client.t(), map()) :: result
  def get_codespaces_for_user_in_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :get_codespaces_for_user_in_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"username", :username}],
      path_template: "/orgs/{org}/members/{username}/codespaces",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get details about a codespace export\n\nPath: /user/codespaces/{codespace_name}/exports/{export_id}\n\nMethod: get"
  @spec get_export_details_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec get_export_details_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def get_export_details_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :get_export_details_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"codespace_name", :codespace_name}, {"export_id", :export_id}],
      path_template: "/user/codespaces/{codespace_name}/exports/{export_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a codespace for the authenticated user\n\nPath: /user/codespaces/{codespace_name}\n\nMethod: get"
  @spec get_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec get_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def get_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :get_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"codespace_name", :codespace_name}],
      path_template: "/user/codespaces/{codespace_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get an organization public key\n\nPath: /orgs/{org}/codespaces/secrets/public-key\n\nMethod: get"
  @spec get_org_public_key(GitHubSDK.Client.t()) :: result
  @spec get_org_public_key(GitHubSDK.Client.t(), map()) :: result
  def get_org_public_key(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :get_org_public_key},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/codespaces/secrets/public-key",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get an organization secret\n\nPath: /orgs/{org}/codespaces/secrets/{secret_name}\n\nMethod: get"
  @spec get_org_secret(GitHubSDK.Client.t()) :: result
  @spec get_org_secret(GitHubSDK.Client.t(), map()) :: result
  def get_org_secret(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :get_org_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"secret_name", :secret_name}],
      path_template: "/orgs/{org}/codespaces/secrets/{secret_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get public key for the authenticated user\n\nPath: /user/codespaces/secrets/public-key\n\nMethod: get"
  @spec get_public_key_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec get_public_key_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def get_public_key_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :get_public_key_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/user/codespaces/secrets/public-key",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a repository public key\n\nPath: /repos/{owner}/{repo}/codespaces/secrets/public-key\n\nMethod: get"
  @spec get_repo_public_key(GitHubSDK.Client.t()) :: result
  @spec get_repo_public_key(GitHubSDK.Client.t(), map()) :: result
  def get_repo_public_key(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :get_repo_public_key},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/codespaces/secrets/public-key",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a repository secret\n\nPath: /repos/{owner}/{repo}/codespaces/secrets/{secret_name}\n\nMethod: get"
  @spec get_repo_secret(GitHubSDK.Client.t()) :: result
  @spec get_repo_secret(GitHubSDK.Client.t(), map()) :: result
  def get_repo_secret(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :get_repo_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"secret_name", :secret_name}],
      path_template: "/repos/{owner}/{repo}/codespaces/secrets/{secret_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a secret for the authenticated user\n\nPath: /user/codespaces/secrets/{secret_name}\n\nMethod: get"
  @spec get_secret_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec get_secret_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def get_secret_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :get_secret_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"secret_name", :secret_name}],
      path_template: "/user/codespaces/secrets/{secret_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List devcontainer configurations in a repository for the authenticated user\n\nPath: /repos/{owner}/{repo}/codespaces/devcontainers\n\nMethod: get"
  @spec list_devcontainers_in_repository_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec list_devcontainers_in_repository_for_authenticated_user(GitHubSDK.Client.t(), map()) ::
          result
  def list_devcontainers_in_repository_for_authenticated_user(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :list_devcontainers_in_repository_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/codespaces/devcontainers",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List codespaces for the authenticated user\n\nPath: /user/codespaces\n\nMethod: get"
  @spec list_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec list_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def list_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :list_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/user/codespaces",
      query: [{"per_page", :per_page}, {"page", :page}, {"repository_id", :repository_id}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List codespaces for the organization\n\nPath: /orgs/{org}/codespaces\n\nMethod: get"
  @spec list_in_organization(GitHubSDK.Client.t()) :: result
  @spec list_in_organization(GitHubSDK.Client.t(), map()) :: result
  def list_in_organization(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :list_in_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/codespaces",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List codespaces in a repository for the authenticated user\n\nPath: /repos/{owner}/{repo}/codespaces\n\nMethod: get"
  @spec list_in_repository_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec list_in_repository_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def list_in_repository_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :list_in_repository_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/codespaces",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List organization secrets\n\nPath: /orgs/{org}/codespaces/secrets\n\nMethod: get"
  @spec list_org_secrets(GitHubSDK.Client.t()) :: result
  @spec list_org_secrets(GitHubSDK.Client.t(), map()) :: result
  def list_org_secrets(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :list_org_secrets},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/codespaces/secrets",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repository secrets\n\nPath: /repos/{owner}/{repo}/codespaces/secrets\n\nMethod: get"
  @spec list_repo_secrets(GitHubSDK.Client.t()) :: result
  @spec list_repo_secrets(GitHubSDK.Client.t(), map()) :: result
  def list_repo_secrets(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :list_repo_secrets},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/codespaces/secrets",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List selected repositories for a user secret\n\nPath: /user/codespaces/secrets/{secret_name}/repositories\n\nMethod: get"
  @spec list_repositories_for_secret_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec list_repositories_for_secret_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def list_repositories_for_secret_for_authenticated_user(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :list_repositories_for_secret_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"secret_name", :secret_name}],
      path_template: "/user/codespaces/secrets/{secret_name}/repositories",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List secrets for the authenticated user\n\nPath: /user/codespaces/secrets\n\nMethod: get"
  @spec list_secrets_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec list_secrets_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def list_secrets_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :list_secrets_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/user/codespaces/secrets",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List selected repositories for an organization secret\n\nPath: /orgs/{org}/codespaces/secrets/{secret_name}/repositories\n\nMethod: get"
  @spec list_selected_repos_for_org_secret(GitHubSDK.Client.t()) :: result
  @spec list_selected_repos_for_org_secret(GitHubSDK.Client.t(), map()) :: result
  def list_selected_repos_for_org_secret(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :list_selected_repos_for_org_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"secret_name", :secret_name}],
      path_template: "/orgs/{org}/codespaces/secrets/{secret_name}/repositories",
      query: [{"page", :page}, {"per_page", :per_page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get default attributes for a codespace\n\nPath: /repos/{owner}/{repo}/codespaces/new\n\nMethod: get"
  @spec pre_flight_with_repo_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec pre_flight_with_repo_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def pre_flight_with_repo_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :pre_flight_with_repo_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/codespaces/new",
      query: [{"ref", :ref}, {"client_ip", :client_ip}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Create a repository from an unpublished codespace\n\nPath: /user/codespaces/{codespace_name}/publish\n\nMethod: post"
  @spec publish_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec publish_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def publish_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Codespaces, :publish_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"codespace_name", :codespace_name}],
      path_template: "/user/codespaces/{codespace_name}/publish",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Remove a selected repository from a user secret\n\nPath: /user/codespaces/secrets/{secret_name}/repositories/{repository_id}\n\nMethod: delete"
  @spec remove_repository_for_secret_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec remove_repository_for_secret_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def remove_repository_for_secret_for_authenticated_user(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :remove_repository_for_secret_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"secret_name", :secret_name}, {"repository_id", :repository_id}],
      path_template: "/user/codespaces/secrets/{secret_name}/repositories/{repository_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove selected repository from an organization secret\n\nPath: /orgs/{org}/codespaces/secrets/{secret_name}/repositories/{repository_id}\n\nMethod: delete"
  @spec remove_selected_repo_from_org_secret(GitHubSDK.Client.t()) :: result
  @spec remove_selected_repo_from_org_secret(GitHubSDK.Client.t(), map()) :: result
  def remove_selected_repo_from_org_secret(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :remove_selected_repo_from_org_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"secret_name", :secret_name}, {"repository_id", :repository_id}],
      path_template: "/orgs/{org}/codespaces/secrets/{secret_name}/repositories/{repository_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "List available machine types for a repository\n\nPath: /repos/{owner}/{repo}/codespaces/machines\n\nMethod: get"
  @spec repo_machines_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec repo_machines_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def repo_machines_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :repo_machines_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/codespaces/machines",
      query: [{"location", :location}, {"client_ip", :client_ip}, {"ref", :ref}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Manage access control for organization codespaces\n\nPath: /orgs/{org}/codespaces/access\n\nMethod: put"
  @spec set_codespaces_access(GitHubSDK.Client.t()) :: result
  @spec set_codespaces_access(GitHubSDK.Client.t(), map()) :: result
  def set_codespaces_access(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Codespaces, :set_codespaces_access},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/codespaces/access",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Add users to Codespaces access for an organization\n\nPath: /orgs/{org}/codespaces/access/selected_users\n\nMethod: post"
  @spec set_codespaces_access_users(GitHubSDK.Client.t()) :: result
  @spec set_codespaces_access_users(GitHubSDK.Client.t(), map()) :: result
  def set_codespaces_access_users(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Codespaces, :set_codespaces_access_users},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/codespaces/access/selected_users",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set selected repositories for a user secret\n\nPath: /user/codespaces/secrets/{secret_name}/repositories\n\nMethod: put"
  @spec set_repositories_for_secret_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec set_repositories_for_secret_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def set_repositories_for_secret_for_authenticated_user(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Codespaces, :set_repositories_for_secret_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"secret_name", :secret_name}],
      path_template: "/user/codespaces/secrets/{secret_name}/repositories",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set selected repositories for an organization secret\n\nPath: /orgs/{org}/codespaces/secrets/{secret_name}/repositories\n\nMethod: put"
  @spec set_selected_repos_for_org_secret(GitHubSDK.Client.t()) :: result
  @spec set_selected_repos_for_org_secret(GitHubSDK.Client.t(), map()) :: result
  def set_selected_repos_for_org_secret(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Codespaces, :set_selected_repos_for_org_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"secret_name", :secret_name}],
      path_template: "/orgs/{org}/codespaces/secrets/{secret_name}/repositories",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Start a codespace for the authenticated user\n\nPath: /user/codespaces/{codespace_name}/start\n\nMethod: post"
  @spec start_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec start_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def start_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :start_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"codespace_name", :codespace_name}],
      path_template: "/user/codespaces/{codespace_name}/start",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Stop a codespace for the authenticated user\n\nPath: /user/codespaces/{codespace_name}/stop\n\nMethod: post"
  @spec stop_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec stop_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def stop_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :stop_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"codespace_name", :codespace_name}],
      path_template: "/user/codespaces/{codespace_name}/stop",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Stop a codespace for an organization user\n\nPath: /orgs/{org}/members/{username}/codespaces/{codespace_name}/stop\n\nMethod: post"
  @spec stop_in_organization(GitHubSDK.Client.t()) :: result
  @spec stop_in_organization(GitHubSDK.Client.t(), map()) :: result
  def stop_in_organization(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Codespaces, :stop_in_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}, {"username", :username}, {"codespace_name", :codespace_name}],
      path_template: "/orgs/{org}/members/{username}/codespaces/{codespace_name}/stop",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update a codespace for the authenticated user\n\nPath: /user/codespaces/{codespace_name}\n\nMethod: patch"
  @spec update_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec update_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def update_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Codespaces, :update_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"codespace_name", :codespace_name}],
      path_template: "/user/codespaces/{codespace_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

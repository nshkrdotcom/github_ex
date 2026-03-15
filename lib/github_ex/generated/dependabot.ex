defmodule GitHubEx.Dependabot do
  @moduledoc """
  Generated GitHub REST operations for the `Dependabot` namespace.

  ## Operations

  * `dependabot/list-alerts-for-enterprise`
  * `dependabot/repository-access-for-org`
  * `dependabot/update-repository-access-for-org`
  * `dependabot/set-repository-access-default-level`
  * `dependabot/list-alerts-for-org`
  * `dependabot/list-org-secrets`
  * `dependabot/get-org-public-key`
  * `dependabot/create-or-update-org-secret`
  * `dependabot/delete-org-secret`
  * `dependabot/get-org-secret`
  * `dependabot/list-selected-repos-for-org-secret`
  * `dependabot/set-selected-repos-for-org-secret`
  * `dependabot/add-selected-repo-to-org-secret`
  * `dependabot/remove-selected-repo-from-org-secret`
  * `dependabot/list-alerts-for-repo`
  * `dependabot/get-alert`
  * `dependabot/update-alert`
  * `dependabot/list-repo-secrets`
  * `dependabot/get-repo-public-key`
  * `dependabot/create-or-update-repo-secret`
  * `dependabot/delete-repo-secret`
  * `dependabot/get-repo-secret`
  """

  @type result :: {:ok, term()} | {:error, GitHubEx.Error.t()}

  @doc "Add selected repository to an organization secret\n\nPath: /orgs/{org}/dependabot/secrets/{secret_name}/repositories/{repository_id}\n\nMethod: put"
  @spec add_selected_repo_to_org_secret(GitHubEx.Client.t()) :: result
  @spec add_selected_repo_to_org_secret(GitHubEx.Client.t(), map()) :: result
  def add_selected_repo_to_org_secret(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Dependabot, :add_selected_repo_to_org_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"secret_name", :secret_name}, {"repository_id", :repository_id}],
      path_template: "/orgs/{org}/dependabot/secrets/{secret_name}/repositories/{repository_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create or update an organization secret\n\nPath: /orgs/{org}/dependabot/secrets/{secret_name}\n\nMethod: put"
  @spec create_or_update_org_secret(GitHubEx.Client.t()) :: result
  @spec create_or_update_org_secret(GitHubEx.Client.t(), map()) :: result
  def create_or_update_org_secret(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Dependabot, :create_or_update_org_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"secret_name", :secret_name}],
      path_template: "/orgs/{org}/dependabot/secrets/{secret_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create or update a repository secret\n\nPath: /repos/{owner}/{repo}/dependabot/secrets/{secret_name}\n\nMethod: put"
  @spec create_or_update_repo_secret(GitHubEx.Client.t()) :: result
  @spec create_or_update_repo_secret(GitHubEx.Client.t(), map()) :: result
  def create_or_update_repo_secret(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Dependabot, :create_or_update_repo_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}, {"secret_name", :secret_name}],
      path_template: "/repos/{owner}/{repo}/dependabot/secrets/{secret_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Delete an organization secret\n\nPath: /orgs/{org}/dependabot/secrets/{secret_name}\n\nMethod: delete"
  @spec delete_org_secret(GitHubEx.Client.t()) :: result
  @spec delete_org_secret(GitHubEx.Client.t(), map()) :: result
  def delete_org_secret(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Dependabot, :delete_org_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"secret_name", :secret_name}],
      path_template: "/orgs/{org}/dependabot/secrets/{secret_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a repository secret\n\nPath: /repos/{owner}/{repo}/dependabot/secrets/{secret_name}\n\nMethod: delete"
  @spec delete_repo_secret(GitHubEx.Client.t()) :: result
  @spec delete_repo_secret(GitHubEx.Client.t(), map()) :: result
  def delete_repo_secret(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Dependabot, :delete_repo_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"secret_name", :secret_name}],
      path_template: "/repos/{owner}/{repo}/dependabot/secrets/{secret_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Get a Dependabot alert\n\nPath: /repos/{owner}/{repo}/dependabot/alerts/{alert_number}\n\nMethod: get"
  @spec get_alert(GitHubEx.Client.t()) :: result
  @spec get_alert(GitHubEx.Client.t(), map()) :: result
  def get_alert(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Dependabot, :get_alert},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"alert_number", :alert_number}],
      path_template: "/repos/{owner}/{repo}/dependabot/alerts/{alert_number}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get an organization public key\n\nPath: /orgs/{org}/dependabot/secrets/public-key\n\nMethod: get"
  @spec get_org_public_key(GitHubEx.Client.t()) :: result
  @spec get_org_public_key(GitHubEx.Client.t(), map()) :: result
  def get_org_public_key(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Dependabot, :get_org_public_key},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/dependabot/secrets/public-key",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get an organization secret\n\nPath: /orgs/{org}/dependabot/secrets/{secret_name}\n\nMethod: get"
  @spec get_org_secret(GitHubEx.Client.t()) :: result
  @spec get_org_secret(GitHubEx.Client.t(), map()) :: result
  def get_org_secret(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Dependabot, :get_org_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"secret_name", :secret_name}],
      path_template: "/orgs/{org}/dependabot/secrets/{secret_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a repository public key\n\nPath: /repos/{owner}/{repo}/dependabot/secrets/public-key\n\nMethod: get"
  @spec get_repo_public_key(GitHubEx.Client.t()) :: result
  @spec get_repo_public_key(GitHubEx.Client.t(), map()) :: result
  def get_repo_public_key(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Dependabot, :get_repo_public_key},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/dependabot/secrets/public-key",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a repository secret\n\nPath: /repos/{owner}/{repo}/dependabot/secrets/{secret_name}\n\nMethod: get"
  @spec get_repo_secret(GitHubEx.Client.t()) :: result
  @spec get_repo_secret(GitHubEx.Client.t(), map()) :: result
  def get_repo_secret(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Dependabot, :get_repo_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"secret_name", :secret_name}],
      path_template: "/repos/{owner}/{repo}/dependabot/secrets/{secret_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List Dependabot alerts for an enterprise\n\nPath: /enterprises/{enterprise}/dependabot/alerts\n\nMethod: get"
  @spec list_alerts_for_enterprise(GitHubEx.Client.t()) :: result
  @spec list_alerts_for_enterprise(GitHubEx.Client.t(), map()) :: result
  def list_alerts_for_enterprise(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Dependabot, :list_alerts_for_enterprise},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"enterprise", :enterprise}],
      path_template: "/enterprises/{enterprise}/dependabot/alerts",
      query: [
        {"state", :state},
        {"severity", :severity},
        {"ecosystem", :ecosystem},
        {"package", :package},
        {"epss_percentage", :epss_percentage},
        {"has", :has},
        {"assignee", :assignee},
        {"scope", :scope},
        {"sort", :sort},
        {"direction", :direction},
        {"before", :before},
        {"after", :after},
        {"per_page", :per_page}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List Dependabot alerts for an organization\n\nPath: /orgs/{org}/dependabot/alerts\n\nMethod: get"
  @spec list_alerts_for_org(GitHubEx.Client.t()) :: result
  @spec list_alerts_for_org(GitHubEx.Client.t(), map()) :: result
  def list_alerts_for_org(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Dependabot, :list_alerts_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/dependabot/alerts",
      query: [
        {"state", :state},
        {"severity", :severity},
        {"ecosystem", :ecosystem},
        {"package", :package},
        {"epss_percentage", :epss_percentage},
        {"artifact_registry_url", :artifact_registry_url},
        {"artifact_registry", :artifact_registry},
        {"has", :has},
        {"assignee", :assignee},
        {"runtime_risk", :runtime_risk},
        {"scope", :scope},
        {"sort", :sort},
        {"direction", :direction},
        {"before", :before},
        {"after", :after},
        {"per_page", :per_page}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List Dependabot alerts for a repository\n\nPath: /repos/{owner}/{repo}/dependabot/alerts\n\nMethod: get"
  @spec list_alerts_for_repo(GitHubEx.Client.t()) :: result
  @spec list_alerts_for_repo(GitHubEx.Client.t(), map()) :: result
  def list_alerts_for_repo(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Dependabot, :list_alerts_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/dependabot/alerts",
      query: [
        {"state", :state},
        {"severity", :severity},
        {"ecosystem", :ecosystem},
        {"package", :package},
        {"manifest", :manifest},
        {"epss_percentage", :epss_percentage},
        {"has", :has},
        {"assignee", :assignee},
        {"scope", :scope},
        {"sort", :sort},
        {"direction", :direction},
        {"before", :before},
        {"after", :after},
        {"per_page", :per_page}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List organization secrets\n\nPath: /orgs/{org}/dependabot/secrets\n\nMethod: get"
  @spec list_org_secrets(GitHubEx.Client.t()) :: result
  @spec list_org_secrets(GitHubEx.Client.t(), map()) :: result
  def list_org_secrets(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Dependabot, :list_org_secrets},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/dependabot/secrets",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repository secrets\n\nPath: /repos/{owner}/{repo}/dependabot/secrets\n\nMethod: get"
  @spec list_repo_secrets(GitHubEx.Client.t()) :: result
  @spec list_repo_secrets(GitHubEx.Client.t(), map()) :: result
  def list_repo_secrets(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Dependabot, :list_repo_secrets},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/dependabot/secrets",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List selected repositories for an organization secret\n\nPath: /orgs/{org}/dependabot/secrets/{secret_name}/repositories\n\nMethod: get"
  @spec list_selected_repos_for_org_secret(GitHubEx.Client.t()) :: result
  @spec list_selected_repos_for_org_secret(GitHubEx.Client.t(), map()) :: result
  def list_selected_repos_for_org_secret(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Dependabot, :list_selected_repos_for_org_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"secret_name", :secret_name}],
      path_template: "/orgs/{org}/dependabot/secrets/{secret_name}/repositories",
      query: [{"page", :page}, {"per_page", :per_page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Remove selected repository from an organization secret\n\nPath: /orgs/{org}/dependabot/secrets/{secret_name}/repositories/{repository_id}\n\nMethod: delete"
  @spec remove_selected_repo_from_org_secret(GitHubEx.Client.t()) :: result
  @spec remove_selected_repo_from_org_secret(GitHubEx.Client.t(), map()) :: result
  def remove_selected_repo_from_org_secret(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Dependabot, :remove_selected_repo_from_org_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"secret_name", :secret_name}, {"repository_id", :repository_id}],
      path_template: "/orgs/{org}/dependabot/secrets/{secret_name}/repositories/{repository_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Lists the repositories Dependabot can access in an organization\n\nPath: /organizations/{org}/dependabot/repository-access\n\nMethod: get"
  @spec repository_access_for_org(GitHubEx.Client.t()) :: result
  @spec repository_access_for_org(GitHubEx.Client.t(), map()) :: result
  def repository_access_for_org(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Dependabot, :repository_access_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/organizations/{org}/dependabot/repository-access",
      query: [{"page", :page}, {"per_page", :per_page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Set the default repository access level for Dependabot\n\nPath: /organizations/{org}/dependabot/repository-access/default-level\n\nMethod: put"
  @spec set_repository_access_default_level(GitHubEx.Client.t()) :: result
  @spec set_repository_access_default_level(GitHubEx.Client.t(), map()) :: result
  def set_repository_access_default_level(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Dependabot, :set_repository_access_default_level},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}],
      path_template: "/organizations/{org}/dependabot/repository-access/default-level",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set selected repositories for an organization secret\n\nPath: /orgs/{org}/dependabot/secrets/{secret_name}/repositories\n\nMethod: put"
  @spec set_selected_repos_for_org_secret(GitHubEx.Client.t()) :: result
  @spec set_selected_repos_for_org_secret(GitHubEx.Client.t(), map()) :: result
  def set_selected_repos_for_org_secret(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Dependabot, :set_selected_repos_for_org_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"secret_name", :secret_name}],
      path_template: "/orgs/{org}/dependabot/secrets/{secret_name}/repositories",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update a Dependabot alert\n\nPath: /repos/{owner}/{repo}/dependabot/alerts/{alert_number}\n\nMethod: patch"
  @spec update_alert(GitHubEx.Client.t()) :: result
  @spec update_alert(GitHubEx.Client.t(), map()) :: result
  def update_alert(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Dependabot, :update_alert},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"owner", :owner}, {"repo", :repo}, {"alert_number", :alert_number}],
      path_template: "/repos/{owner}/{repo}/dependabot/alerts/{alert_number}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Updates Dependabot's repository access list for an organization\n\nPath: /organizations/{org}/dependabot/repository-access\n\nMethod: patch"
  @spec update_repository_access_for_org(GitHubEx.Client.t()) :: result
  @spec update_repository_access_for_org(GitHubEx.Client.t(), map()) :: result
  def update_repository_access_for_org(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Dependabot, :update_repository_access_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"org", :org}],
      path_template: "/organizations/{org}/dependabot/repository-access",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

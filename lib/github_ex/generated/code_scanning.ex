defmodule GitHubEx.CodeScanning do
  @moduledoc """
  Generated GitHub REST operations for the `CodeScanning` namespace.

  ## Operations

  * `code-scanning/list-alerts-for-org`
  * `code-scanning/list-alerts-for-repo`
  * `code-scanning/get-alert`
  * `code-scanning/update-alert`
  * `code-scanning/create-autofix`
  * `code-scanning/get-autofix`
  * `code-scanning/commit-autofix`
  * `code-scanning/list-alert-instances`
  * `code-scanning/list-recent-analyses`
  * `code-scanning/delete-analysis`
  * `code-scanning/get-analysis`
  * `code-scanning/list-codeql-databases`
  * `code-scanning/delete-codeql-database`
  * `code-scanning/get-codeql-database`
  * `code-scanning/create-variant-analysis`
  * `code-scanning/get-variant-analysis`
  * `code-scanning/get-variant-analysis-repo-task`
  * `code-scanning/get-default-setup`
  * `code-scanning/update-default-setup`
  * `code-scanning/upload-sarif`
  * `code-scanning/get-sarif`
  """

  @type result :: {:ok, term()} | {:error, GitHubEx.Error.t()}

  @doc "Commit an autofix for a code scanning alert\n\nPath: /repos/{owner}/{repo}/code-scanning/alerts/{alert_number}/autofix/commits\n\nMethod: post"
  @spec commit_autofix(GitHubEx.Client.t()) :: result
  @spec commit_autofix(GitHubEx.Client.t(), map()) :: result
  def commit_autofix(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.CodeScanning, :commit_autofix},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"alert_number", :alert_number}],
      path_template: "/repos/{owner}/{repo}/code-scanning/alerts/{alert_number}/autofix/commits",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create an autofix for a code scanning alert\n\nPath: /repos/{owner}/{repo}/code-scanning/alerts/{alert_number}/autofix\n\nMethod: post"
  @spec create_autofix(GitHubEx.Client.t()) :: result
  @spec create_autofix(GitHubEx.Client.t(), map()) :: result
  def create_autofix(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.CodeScanning, :create_autofix},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"alert_number", :alert_number}],
      path_template: "/repos/{owner}/{repo}/code-scanning/alerts/{alert_number}/autofix",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a CodeQL variant analysis\n\nPath: /repos/{owner}/{repo}/code-scanning/codeql/variant-analyses\n\nMethod: post"
  @spec create_variant_analysis(GitHubEx.Client.t()) :: result
  @spec create_variant_analysis(GitHubEx.Client.t(), map()) :: result
  def create_variant_analysis(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.CodeScanning, :create_variant_analysis},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/code-scanning/codeql/variant-analyses",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Delete a code scanning analysis from a repository\n\nPath: /repos/{owner}/{repo}/code-scanning/analyses/{analysis_id}\n\nMethod: delete"
  @spec delete_analysis(GitHubEx.Client.t()) :: result
  @spec delete_analysis(GitHubEx.Client.t(), map()) :: result
  def delete_analysis(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.CodeScanning, :delete_analysis},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"analysis_id", :analysis_id}],
      path_template: "/repos/{owner}/{repo}/code-scanning/analyses/{analysis_id}",
      query: [{"confirm_delete", :confirm_delete}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a CodeQL database\n\nPath: /repos/{owner}/{repo}/code-scanning/codeql/databases/{language}\n\nMethod: delete"
  @spec delete_codeql_database(GitHubEx.Client.t()) :: result
  @spec delete_codeql_database(GitHubEx.Client.t(), map()) :: result
  def delete_codeql_database(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.CodeScanning, :delete_codeql_database},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"language", :language}],
      path_template: "/repos/{owner}/{repo}/code-scanning/codeql/databases/{language}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Get a code scanning alert\n\nPath: /repos/{owner}/{repo}/code-scanning/alerts/{alert_number}\n\nMethod: get"
  @spec get_alert(GitHubEx.Client.t()) :: result
  @spec get_alert(GitHubEx.Client.t(), map()) :: result
  def get_alert(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.CodeScanning, :get_alert},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"alert_number", :alert_number}],
      path_template: "/repos/{owner}/{repo}/code-scanning/alerts/{alert_number}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a code scanning analysis for a repository\n\nPath: /repos/{owner}/{repo}/code-scanning/analyses/{analysis_id}\n\nMethod: get"
  @spec get_analysis(GitHubEx.Client.t()) :: result
  @spec get_analysis(GitHubEx.Client.t(), map()) :: result
  def get_analysis(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.CodeScanning, :get_analysis},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"analysis_id", :analysis_id}],
      path_template: "/repos/{owner}/{repo}/code-scanning/analyses/{analysis_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get the status of an autofix for a code scanning alert\n\nPath: /repos/{owner}/{repo}/code-scanning/alerts/{alert_number}/autofix\n\nMethod: get"
  @spec get_autofix(GitHubEx.Client.t()) :: result
  @spec get_autofix(GitHubEx.Client.t(), map()) :: result
  def get_autofix(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.CodeScanning, :get_autofix},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"alert_number", :alert_number}],
      path_template: "/repos/{owner}/{repo}/code-scanning/alerts/{alert_number}/autofix",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a CodeQL database for a repository\n\nPath: /repos/{owner}/{repo}/code-scanning/codeql/databases/{language}\n\nMethod: get"
  @spec get_codeql_database(GitHubEx.Client.t()) :: result
  @spec get_codeql_database(GitHubEx.Client.t(), map()) :: result
  def get_codeql_database(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.CodeScanning, :get_codeql_database},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"language", :language}],
      path_template: "/repos/{owner}/{repo}/code-scanning/codeql/databases/{language}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a code scanning default setup configuration\n\nPath: /repos/{owner}/{repo}/code-scanning/default-setup\n\nMethod: get"
  @spec get_default_setup(GitHubEx.Client.t()) :: result
  @spec get_default_setup(GitHubEx.Client.t(), map()) :: result
  def get_default_setup(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.CodeScanning, :get_default_setup},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/code-scanning/default-setup",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get information about a SARIF upload\n\nPath: /repos/{owner}/{repo}/code-scanning/sarifs/{sarif_id}\n\nMethod: get"
  @spec get_sarif(GitHubEx.Client.t()) :: result
  @spec get_sarif(GitHubEx.Client.t(), map()) :: result
  def get_sarif(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.CodeScanning, :get_sarif},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"sarif_id", :sarif_id}],
      path_template: "/repos/{owner}/{repo}/code-scanning/sarifs/{sarif_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get the summary of a CodeQL variant analysis\n\nPath: /repos/{owner}/{repo}/code-scanning/codeql/variant-analyses/{codeql_variant_analysis_id}\n\nMethod: get"
  @spec get_variant_analysis(GitHubEx.Client.t()) :: result
  @spec get_variant_analysis(GitHubEx.Client.t(), map()) :: result
  def get_variant_analysis(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.CodeScanning, :get_variant_analysis},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"codeql_variant_analysis_id", :codeql_variant_analysis_id}
      ],
      path_template:
        "/repos/{owner}/{repo}/code-scanning/codeql/variant-analyses/{codeql_variant_analysis_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get the analysis status of a repository in a CodeQL variant analysis\n\nPath: /repos/{owner}/{repo}/code-scanning/codeql/variant-analyses/{codeql_variant_analysis_id}/repos/{repo_owner}/{repo_name}\n\nMethod: get"
  @spec get_variant_analysis_repo_task(GitHubEx.Client.t()) :: result
  @spec get_variant_analysis_repo_task(GitHubEx.Client.t(), map()) :: result
  def get_variant_analysis_repo_task(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.CodeScanning, :get_variant_analysis_repo_task},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"codeql_variant_analysis_id", :codeql_variant_analysis_id},
        {"repo_owner", :repo_owner},
        {"repo_name", :repo_name}
      ],
      path_template:
        "/repos/{owner}/{repo}/code-scanning/codeql/variant-analyses/{codeql_variant_analysis_id}/repos/{repo_owner}/{repo_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List instances of a code scanning alert\n\nPath: /repos/{owner}/{repo}/code-scanning/alerts/{alert_number}/instances\n\nMethod: get"
  @spec list_alert_instances(GitHubEx.Client.t()) :: result
  @spec list_alert_instances(GitHubEx.Client.t(), map()) :: result
  def list_alert_instances(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.CodeScanning, :list_alert_instances},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"alert_number", :alert_number}],
      path_template: "/repos/{owner}/{repo}/code-scanning/alerts/{alert_number}/instances",
      query: [{"page", :page}, {"per_page", :per_page}, {"ref", :ref}, {"pr", :pr}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List code scanning alerts for an organization\n\nPath: /orgs/{org}/code-scanning/alerts\n\nMethod: get"
  @spec list_alerts_for_org(GitHubEx.Client.t()) :: result
  @spec list_alerts_for_org(GitHubEx.Client.t(), map()) :: result
  def list_alerts_for_org(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.CodeScanning, :list_alerts_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/code-scanning/alerts",
      query: [
        {"tool_name", :tool_name},
        {"tool_guid", :tool_guid},
        {"before", :before},
        {"after", :after},
        {"page", :page},
        {"per_page", :per_page},
        {"direction", :direction},
        {"state", :state},
        {"sort", :sort},
        {"severity", :severity},
        {"assignees", :assignees}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List code scanning alerts for a repository\n\nPath: /repos/{owner}/{repo}/code-scanning/alerts\n\nMethod: get"
  @spec list_alerts_for_repo(GitHubEx.Client.t()) :: result
  @spec list_alerts_for_repo(GitHubEx.Client.t(), map()) :: result
  def list_alerts_for_repo(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.CodeScanning, :list_alerts_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/code-scanning/alerts",
      query: [
        {"tool_name", :tool_name},
        {"tool_guid", :tool_guid},
        {"page", :page},
        {"per_page", :per_page},
        {"ref", :ref},
        {"pr", :pr},
        {"direction", :direction},
        {"before", :before},
        {"after", :after},
        {"sort", :sort},
        {"state", :state},
        {"severity", :severity},
        {"assignees", :assignees}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List CodeQL databases for a repository\n\nPath: /repos/{owner}/{repo}/code-scanning/codeql/databases\n\nMethod: get"
  @spec list_codeql_databases(GitHubEx.Client.t()) :: result
  @spec list_codeql_databases(GitHubEx.Client.t(), map()) :: result
  def list_codeql_databases(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.CodeScanning, :list_codeql_databases},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/code-scanning/codeql/databases",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List code scanning analyses for a repository\n\nPath: /repos/{owner}/{repo}/code-scanning/analyses\n\nMethod: get"
  @spec list_recent_analyses(GitHubEx.Client.t()) :: result
  @spec list_recent_analyses(GitHubEx.Client.t(), map()) :: result
  def list_recent_analyses(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.CodeScanning, :list_recent_analyses},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/code-scanning/analyses",
      query: [
        {"tool_name", :tool_name},
        {"tool_guid", :tool_guid},
        {"page", :page},
        {"per_page", :per_page},
        {"pr", :pr},
        {"ref", :ref},
        {"sarif_id", :sarif_id},
        {"direction", :direction},
        {"sort", :sort}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Update a code scanning alert\n\nPath: /repos/{owner}/{repo}/code-scanning/alerts/{alert_number}\n\nMethod: patch"
  @spec update_alert(GitHubEx.Client.t()) :: result
  @spec update_alert(GitHubEx.Client.t(), map()) :: result
  def update_alert(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.CodeScanning, :update_alert},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"owner", :owner}, {"repo", :repo}, {"alert_number", :alert_number}],
      path_template: "/repos/{owner}/{repo}/code-scanning/alerts/{alert_number}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update a code scanning default setup configuration\n\nPath: /repos/{owner}/{repo}/code-scanning/default-setup\n\nMethod: patch"
  @spec update_default_setup(GitHubEx.Client.t()) :: result
  @spec update_default_setup(GitHubEx.Client.t(), map()) :: result
  def update_default_setup(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.CodeScanning, :update_default_setup},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/code-scanning/default-setup",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Upload an analysis as SARIF data\n\nPath: /repos/{owner}/{repo}/code-scanning/sarifs\n\nMethod: post"
  @spec upload_sarif(GitHubEx.Client.t()) :: result
  @spec upload_sarif(GitHubEx.Client.t(), map()) :: result
  def upload_sarif(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.CodeScanning, :upload_sarif},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/code-scanning/sarifs",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

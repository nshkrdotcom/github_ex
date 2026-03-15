defmodule GitHubEx.SecretScanning do
  @moduledoc """
  Generated GitHub REST operations for the `SecretScanning` namespace.

  ## Operations

  * `secret-scanning/list-alerts-for-org`
  * `secret-scanning/list-org-pattern-configs`
  * `secret-scanning/update-org-pattern-configs`
  * `secret-scanning/list-alerts-for-repo`
  * `secret-scanning/get-alert`
  * `secret-scanning/update-alert`
  * `secret-scanning/list-locations-for-alert`
  * `secret-scanning/create-push-protection-bypass`
  * `secret-scanning/get-scan-history`
  """

  @type result :: {:ok, term()} | {:error, GitHubEx.Error.t()}

  @doc "Create a push protection bypass\n\nPath: /repos/{owner}/{repo}/secret-scanning/push-protection-bypasses\n\nMethod: post"
  @spec create_push_protection_bypass(GitHubEx.Client.t()) :: result
  @spec create_push_protection_bypass(GitHubEx.Client.t(), map()) :: result
  def create_push_protection_bypass(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.SecretScanning, :create_push_protection_bypass},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/secret-scanning/push-protection-bypasses",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Get a secret scanning alert\n\nPath: /repos/{owner}/{repo}/secret-scanning/alerts/{alert_number}\n\nMethod: get"
  @spec get_alert(GitHubEx.Client.t()) :: result
  @spec get_alert(GitHubEx.Client.t(), map()) :: result
  def get_alert(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.SecretScanning, :get_alert},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"alert_number", :alert_number}],
      path_template: "/repos/{owner}/{repo}/secret-scanning/alerts/{alert_number}",
      query: [{"hide_secret", :hide_secret}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get secret scanning scan history for a repository\n\nPath: /repos/{owner}/{repo}/secret-scanning/scan-history\n\nMethod: get"
  @spec get_scan_history(GitHubEx.Client.t()) :: result
  @spec get_scan_history(GitHubEx.Client.t(), map()) :: result
  def get_scan_history(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.SecretScanning, :get_scan_history},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/secret-scanning/scan-history",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List secret scanning alerts for an organization\n\nPath: /orgs/{org}/secret-scanning/alerts\n\nMethod: get"
  @spec list_alerts_for_org(GitHubEx.Client.t()) :: result
  @spec list_alerts_for_org(GitHubEx.Client.t(), map()) :: result
  def list_alerts_for_org(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.SecretScanning, :list_alerts_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/secret-scanning/alerts",
      query: [
        {"state", :state},
        {"secret_type", :secret_type},
        {"resolution", :resolution},
        {"assignee", :assignee},
        {"sort", :sort},
        {"direction", :direction},
        {"page", :page},
        {"per_page", :per_page},
        {"before", :before},
        {"after", :after},
        {"validity", :validity},
        {"is_publicly_leaked", :is_publicly_leaked},
        {"is_multi_repo", :is_multi_repo},
        {"hide_secret", :hide_secret}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List secret scanning alerts for a repository\n\nPath: /repos/{owner}/{repo}/secret-scanning/alerts\n\nMethod: get"
  @spec list_alerts_for_repo(GitHubEx.Client.t()) :: result
  @spec list_alerts_for_repo(GitHubEx.Client.t(), map()) :: result
  def list_alerts_for_repo(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.SecretScanning, :list_alerts_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/secret-scanning/alerts",
      query: [
        {"state", :state},
        {"secret_type", :secret_type},
        {"resolution", :resolution},
        {"assignee", :assignee},
        {"sort", :sort},
        {"direction", :direction},
        {"page", :page},
        {"per_page", :per_page},
        {"before", :before},
        {"after", :after},
        {"validity", :validity},
        {"is_publicly_leaked", :is_publicly_leaked},
        {"is_multi_repo", :is_multi_repo},
        {"hide_secret", :hide_secret}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List locations for a secret scanning alert\n\nPath: /repos/{owner}/{repo}/secret-scanning/alerts/{alert_number}/locations\n\nMethod: get"
  @spec list_locations_for_alert(GitHubEx.Client.t()) :: result
  @spec list_locations_for_alert(GitHubEx.Client.t(), map()) :: result
  def list_locations_for_alert(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.SecretScanning, :list_locations_for_alert},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"alert_number", :alert_number}],
      path_template: "/repos/{owner}/{repo}/secret-scanning/alerts/{alert_number}/locations",
      query: [{"page", :page}, {"per_page", :per_page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List organization pattern configurations\n\nPath: /orgs/{org}/secret-scanning/pattern-configurations\n\nMethod: get"
  @spec list_org_pattern_configs(GitHubEx.Client.t()) :: result
  @spec list_org_pattern_configs(GitHubEx.Client.t(), map()) :: result
  def list_org_pattern_configs(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.SecretScanning, :list_org_pattern_configs},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/secret-scanning/pattern-configurations",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Update a secret scanning alert\n\nPath: /repos/{owner}/{repo}/secret-scanning/alerts/{alert_number}\n\nMethod: patch"
  @spec update_alert(GitHubEx.Client.t()) :: result
  @spec update_alert(GitHubEx.Client.t(), map()) :: result
  def update_alert(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.SecretScanning, :update_alert},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"owner", :owner}, {"repo", :repo}, {"alert_number", :alert_number}],
      path_template: "/repos/{owner}/{repo}/secret-scanning/alerts/{alert_number}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update organization pattern configurations\n\nPath: /orgs/{org}/secret-scanning/pattern-configurations\n\nMethod: patch"
  @spec update_org_pattern_configs(GitHubEx.Client.t()) :: result
  @spec update_org_pattern_configs(GitHubEx.Client.t(), map()) :: result
  def update_org_pattern_configs(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.SecretScanning, :update_org_pattern_configs},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/secret-scanning/pattern-configurations",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

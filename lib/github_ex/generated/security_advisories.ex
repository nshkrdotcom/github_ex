defmodule GitHubEx.SecurityAdvisories do
  @moduledoc """
  Generated GitHub REST operations for the `SecurityAdvisories` namespace.

  ## Operations

  * `security-advisories/list-global-advisories`
  * `security-advisories/get-global-advisory`
  * `security-advisories/list-org-repository-advisories`
  * `security-advisories/create-repository-advisory`
  * `security-advisories/list-repository-advisories`
  * `security-advisories/create-private-vulnerability-report`
  * `security-advisories/get-repository-advisory`
  * `security-advisories/update-repository-advisory`
  * `security-advisories/create-repository-advisory-cve-request`
  * `security-advisories/create-fork`
  """

  @type result :: {:ok, term()} | {:error, GitHubEx.Error.t()}

  @doc "Create a temporary private fork\n\nPath: /repos/{owner}/{repo}/security-advisories/{ghsa_id}/forks\n\nMethod: post"
  @spec create_fork(GitHubEx.Client.t()) :: result
  @spec create_fork(GitHubEx.Client.t(), map()) :: result
  def create_fork(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.SecurityAdvisories, :create_fork},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"ghsa_id", :ghsa_id}],
      path_template: "/repos/{owner}/{repo}/security-advisories/{ghsa_id}/forks",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Privately report a security vulnerability\n\nPath: /repos/{owner}/{repo}/security-advisories/reports\n\nMethod: post"
  @spec create_private_vulnerability_report(GitHubEx.Client.t()) :: result
  @spec create_private_vulnerability_report(GitHubEx.Client.t(), map()) :: result
  def create_private_vulnerability_report(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.SecurityAdvisories, :create_private_vulnerability_report},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/security-advisories/reports",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a repository security advisory\n\nPath: /repos/{owner}/{repo}/security-advisories\n\nMethod: post"
  @spec create_repository_advisory(GitHubEx.Client.t()) :: result
  @spec create_repository_advisory(GitHubEx.Client.t(), map()) :: result
  def create_repository_advisory(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.SecurityAdvisories, :create_repository_advisory},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/security-advisories",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Request a CVE for a repository security advisory\n\nPath: /repos/{owner}/{repo}/security-advisories/{ghsa_id}/cve\n\nMethod: post"
  @spec create_repository_advisory_cve_request(GitHubEx.Client.t()) :: result
  @spec create_repository_advisory_cve_request(GitHubEx.Client.t(), map()) :: result
  def create_repository_advisory_cve_request(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.SecurityAdvisories, :create_repository_advisory_cve_request},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"ghsa_id", :ghsa_id}],
      path_template: "/repos/{owner}/{repo}/security-advisories/{ghsa_id}/cve",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Get a global security advisory\n\nPath: /advisories/{ghsa_id}\n\nMethod: get"
  @spec get_global_advisory(GitHubEx.Client.t()) :: result
  @spec get_global_advisory(GitHubEx.Client.t(), map()) :: result
  def get_global_advisory(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.SecurityAdvisories, :get_global_advisory},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"ghsa_id", :ghsa_id}],
      path_template: "/advisories/{ghsa_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a repository security advisory\n\nPath: /repos/{owner}/{repo}/security-advisories/{ghsa_id}\n\nMethod: get"
  @spec get_repository_advisory(GitHubEx.Client.t()) :: result
  @spec get_repository_advisory(GitHubEx.Client.t(), map()) :: result
  def get_repository_advisory(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.SecurityAdvisories, :get_repository_advisory},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"ghsa_id", :ghsa_id}],
      path_template: "/repos/{owner}/{repo}/security-advisories/{ghsa_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List global security advisories\n\nPath: /advisories\n\nMethod: get"
  @spec list_global_advisories(GitHubEx.Client.t()) :: result
  @spec list_global_advisories(GitHubEx.Client.t(), map()) :: result
  def list_global_advisories(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.SecurityAdvisories, :list_global_advisories},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/advisories",
      query: [
        {"ghsa_id", :ghsa_id},
        {"type", :type},
        {"cve_id", :cve_id},
        {"ecosystem", :ecosystem},
        {"severity", :severity},
        {"cwes", :cwes},
        {"is_withdrawn", :is_withdrawn},
        {"affects", :affects},
        {"published", :published},
        {"updated", :updated},
        {"modified", :modified},
        {"epss_percentage", :epss_percentage},
        {"epss_percentile", :epss_percentile},
        {"before", :before},
        {"after", :after},
        {"direction", :direction},
        {"per_page", :per_page},
        {"sort", :sort}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repository security advisories for an organization\n\nPath: /orgs/{org}/security-advisories\n\nMethod: get"
  @spec list_org_repository_advisories(GitHubEx.Client.t()) :: result
  @spec list_org_repository_advisories(GitHubEx.Client.t(), map()) :: result
  def list_org_repository_advisories(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.SecurityAdvisories, :list_org_repository_advisories},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/security-advisories",
      query: [
        {"direction", :direction},
        {"sort", :sort},
        {"before", :before},
        {"after", :after},
        {"per_page", :per_page},
        {"state", :state}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repository security advisories\n\nPath: /repos/{owner}/{repo}/security-advisories\n\nMethod: get"
  @spec list_repository_advisories(GitHubEx.Client.t()) :: result
  @spec list_repository_advisories(GitHubEx.Client.t(), map()) :: result
  def list_repository_advisories(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.SecurityAdvisories, :list_repository_advisories},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/security-advisories",
      query: [
        {"direction", :direction},
        {"sort", :sort},
        {"before", :before},
        {"after", :after},
        {"per_page", :per_page},
        {"state", :state}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Update a repository security advisory\n\nPath: /repos/{owner}/{repo}/security-advisories/{ghsa_id}\n\nMethod: patch"
  @spec update_repository_advisory(GitHubEx.Client.t()) :: result
  @spec update_repository_advisory(GitHubEx.Client.t(), map()) :: result
  def update_repository_advisory(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.SecurityAdvisories, :update_repository_advisory},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"owner", :owner}, {"repo", :repo}, {"ghsa_id", :ghsa_id}],
      path_template: "/repos/{owner}/{repo}/security-advisories/{ghsa_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

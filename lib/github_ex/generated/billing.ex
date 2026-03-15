defmodule GitHubEx.Billing do
  @moduledoc """
  Generated GitHub REST operations for the `Billing` namespace.

  ## Operations

  * `billing/get-all-budgets-org`
  * `billing/delete-budget-org`
  * `billing/get-budget-org`
  * `billing/update-budget-org`
  * `billing/get-github-billing-premium-request-usage-report-org`
  * `billing/get-github-billing-usage-report-org`
  * `billing/get-github-billing-usage-summary-report-org`
  * `billing/get-github-billing-premium-request-usage-report-user`
  * `billing/get-github-billing-usage-report-user`
  * `billing/get-github-billing-usage-summary-report-user`
  """

  @type result :: {:ok, term()} | {:error, GitHubEx.Error.t()}

  @doc "Delete a budget for an organization\n\nPath: /organizations/{org}/settings/billing/budgets/{budget_id}\n\nMethod: delete"
  @spec delete_budget_org(GitHubEx.Client.t()) :: result
  @spec delete_budget_org(GitHubEx.Client.t(), map()) :: result
  def delete_budget_org(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Billing, :delete_budget_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"budget_id", :budget_id}],
      path_template: "/organizations/{org}/settings/billing/budgets/{budget_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Get all budgets for an organization\n\nPath: /organizations/{org}/settings/billing/budgets\n\nMethod: get"
  @spec get_all_budgets_org(GitHubEx.Client.t()) :: result
  @spec get_all_budgets_org(GitHubEx.Client.t(), map()) :: result
  def get_all_budgets_org(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Billing, :get_all_budgets_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/organizations/{org}/settings/billing/budgets",
      query: [{"page", :page}, {"per_page", :per_page}, {"scope", :scope}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a budget by ID for an organization\n\nPath: /organizations/{org}/settings/billing/budgets/{budget_id}\n\nMethod: get"
  @spec get_budget_org(GitHubEx.Client.t()) :: result
  @spec get_budget_org(GitHubEx.Client.t(), map()) :: result
  def get_budget_org(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Billing, :get_budget_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"budget_id", :budget_id}],
      path_template: "/organizations/{org}/settings/billing/budgets/{budget_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get billing premium request usage report for an organization\n\nPath: /organizations/{org}/settings/billing/premium_request/usage\n\nMethod: get"
  @spec get_github_billing_premium_request_usage_report_org(GitHubEx.Client.t()) :: result
  @spec get_github_billing_premium_request_usage_report_org(GitHubEx.Client.t(), map()) :: result
  def get_github_billing_premium_request_usage_report_org(client, params \\ %{})
      when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Billing, :get_github_billing_premium_request_usage_report_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/organizations/{org}/settings/billing/premium_request/usage",
      query: [
        {"year", :year},
        {"month", :month},
        {"day", :day},
        {"user", :user},
        {"model", :model},
        {"product", :product}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get billing premium request usage report for a user\n\nPath: /users/{username}/settings/billing/premium_request/usage\n\nMethod: get"
  @spec get_github_billing_premium_request_usage_report_user(GitHubEx.Client.t()) :: result
  @spec get_github_billing_premium_request_usage_report_user(GitHubEx.Client.t(), map()) :: result
  def get_github_billing_premium_request_usage_report_user(client, params \\ %{})
      when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Billing, :get_github_billing_premium_request_usage_report_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"username", :username}],
      path_template: "/users/{username}/settings/billing/premium_request/usage",
      query: [
        {"year", :year},
        {"month", :month},
        {"day", :day},
        {"model", :model},
        {"product", :product}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get billing usage report for an organization\n\nPath: /organizations/{org}/settings/billing/usage\n\nMethod: get"
  @spec get_github_billing_usage_report_org(GitHubEx.Client.t()) :: result
  @spec get_github_billing_usage_report_org(GitHubEx.Client.t(), map()) :: result
  def get_github_billing_usage_report_org(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Billing, :get_github_billing_usage_report_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/organizations/{org}/settings/billing/usage",
      query: [{"year", :year}, {"month", :month}, {"day", :day}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get billing usage report for a user\n\nPath: /users/{username}/settings/billing/usage\n\nMethod: get"
  @spec get_github_billing_usage_report_user(GitHubEx.Client.t()) :: result
  @spec get_github_billing_usage_report_user(GitHubEx.Client.t(), map()) :: result
  def get_github_billing_usage_report_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Billing, :get_github_billing_usage_report_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"username", :username}],
      path_template: "/users/{username}/settings/billing/usage",
      query: [{"year", :year}, {"month", :month}, {"day", :day}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get billing usage summary for an organization\n\nPath: /organizations/{org}/settings/billing/usage/summary\n\nMethod: get"
  @spec get_github_billing_usage_summary_report_org(GitHubEx.Client.t()) :: result
  @spec get_github_billing_usage_summary_report_org(GitHubEx.Client.t(), map()) :: result
  def get_github_billing_usage_summary_report_org(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Billing, :get_github_billing_usage_summary_report_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/organizations/{org}/settings/billing/usage/summary",
      query: [
        {"year", :year},
        {"month", :month},
        {"day", :day},
        {"repository", :repository},
        {"product", :product},
        {"sku", :sku}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get billing usage summary for a user\n\nPath: /users/{username}/settings/billing/usage/summary\n\nMethod: get"
  @spec get_github_billing_usage_summary_report_user(GitHubEx.Client.t()) :: result
  @spec get_github_billing_usage_summary_report_user(GitHubEx.Client.t(), map()) :: result
  def get_github_billing_usage_summary_report_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Billing, :get_github_billing_usage_summary_report_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"username", :username}],
      path_template: "/users/{username}/settings/billing/usage/summary",
      query: [
        {"year", :year},
        {"month", :month},
        {"day", :day},
        {"repository", :repository},
        {"product", :product},
        {"sku", :sku}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Update a budget for an organization\n\nPath: /organizations/{org}/settings/billing/budgets/{budget_id}\n\nMethod: patch"
  @spec update_budget_org(GitHubEx.Client.t()) :: result
  @spec update_budget_org(GitHubEx.Client.t(), map()) :: result
  def update_budget_org(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Billing, :update_budget_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"org", :org}, {"budget_id", :budget_id}],
      path_template: "/organizations/{org}/settings/billing/budgets/{budget_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

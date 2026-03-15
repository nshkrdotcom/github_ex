defmodule GitHubEx.Checks do
  @moduledoc """
  Generated GitHub REST operations for the `Checks` namespace.

  ## Operations

  * `checks/create`
  * `checks/get`
  * `checks/update`
  * `checks/list-annotations`
  * `checks/rerequest-run`
  * `checks/create-suite`
  * `checks/set-suites-preferences`
  * `checks/get-suite`
  * `checks/list-for-suite`
  * `checks/rerequest-suite`
  * `checks/list-for-ref`
  * `checks/list-suites-for-ref`
  """

  @type result :: {:ok, term()} | {:error, GitHubEx.Error.t()}

  @doc "Create a check run\n\nPath: /repos/{owner}/{repo}/check-runs\n\nMethod: post"
  @spec create(GitHubEx.Client.t()) :: result
  @spec create(GitHubEx.Client.t(), map()) :: result
  def create(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Checks, :create},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/check-runs",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a check suite\n\nPath: /repos/{owner}/{repo}/check-suites\n\nMethod: post"
  @spec create_suite(GitHubEx.Client.t()) :: result
  @spec create_suite(GitHubEx.Client.t(), map()) :: result
  def create_suite(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Checks, :create_suite},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/check-suites",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Get a check run\n\nPath: /repos/{owner}/{repo}/check-runs/{check_run_id}\n\nMethod: get"
  @spec get(GitHubEx.Client.t()) :: result
  @spec get(GitHubEx.Client.t(), map()) :: result
  def get(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Checks, :get},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"check_run_id", :check_run_id}],
      path_template: "/repos/{owner}/{repo}/check-runs/{check_run_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a check suite\n\nPath: /repos/{owner}/{repo}/check-suites/{check_suite_id}\n\nMethod: get"
  @spec get_suite(GitHubEx.Client.t()) :: result
  @spec get_suite(GitHubEx.Client.t(), map()) :: result
  def get_suite(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Checks, :get_suite},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"check_suite_id", :check_suite_id}],
      path_template: "/repos/{owner}/{repo}/check-suites/{check_suite_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List check run annotations\n\nPath: /repos/{owner}/{repo}/check-runs/{check_run_id}/annotations\n\nMethod: get"
  @spec list_annotations(GitHubEx.Client.t()) :: result
  @spec list_annotations(GitHubEx.Client.t(), map()) :: result
  def list_annotations(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Checks, :list_annotations},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"check_run_id", :check_run_id}],
      path_template: "/repos/{owner}/{repo}/check-runs/{check_run_id}/annotations",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List check runs for a Git reference\n\nPath: /repos/{owner}/{repo}/commits/{ref}/check-runs\n\nMethod: get"
  @spec list_for_ref(GitHubEx.Client.t()) :: result
  @spec list_for_ref(GitHubEx.Client.t(), map()) :: result
  def list_for_ref(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Checks, :list_for_ref},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"ref", :ref}],
      path_template: "/repos/{owner}/{repo}/commits/{ref}/check-runs",
      query: [
        {"check_name", :check_name},
        {"status", :status},
        {"filter", :filter},
        {"per_page", :per_page},
        {"page", :page},
        {"app_id", :app_id}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List check runs in a check suite\n\nPath: /repos/{owner}/{repo}/check-suites/{check_suite_id}/check-runs\n\nMethod: get"
  @spec list_for_suite(GitHubEx.Client.t()) :: result
  @spec list_for_suite(GitHubEx.Client.t(), map()) :: result
  def list_for_suite(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Checks, :list_for_suite},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"check_suite_id", :check_suite_id}],
      path_template: "/repos/{owner}/{repo}/check-suites/{check_suite_id}/check-runs",
      query: [
        {"check_name", :check_name},
        {"status", :status},
        {"filter", :filter},
        {"per_page", :per_page},
        {"page", :page}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List check suites for a Git reference\n\nPath: /repos/{owner}/{repo}/commits/{ref}/check-suites\n\nMethod: get"
  @spec list_suites_for_ref(GitHubEx.Client.t()) :: result
  @spec list_suites_for_ref(GitHubEx.Client.t(), map()) :: result
  def list_suites_for_ref(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Checks, :list_suites_for_ref},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"ref", :ref}],
      path_template: "/repos/{owner}/{repo}/commits/{ref}/check-suites",
      query: [
        {"app_id", :app_id},
        {"check_name", :check_name},
        {"per_page", :per_page},
        {"page", :page}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Rerequest a check run\n\nPath: /repos/{owner}/{repo}/check-runs/{check_run_id}/rerequest\n\nMethod: post"
  @spec rerequest_run(GitHubEx.Client.t()) :: result
  @spec rerequest_run(GitHubEx.Client.t(), map()) :: result
  def rerequest_run(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Checks, :rerequest_run},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"check_run_id", :check_run_id}],
      path_template: "/repos/{owner}/{repo}/check-runs/{check_run_id}/rerequest",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Rerequest a check suite\n\nPath: /repos/{owner}/{repo}/check-suites/{check_suite_id}/rerequest\n\nMethod: post"
  @spec rerequest_suite(GitHubEx.Client.t()) :: result
  @spec rerequest_suite(GitHubEx.Client.t(), map()) :: result
  def rerequest_suite(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Checks, :rerequest_suite},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"check_suite_id", :check_suite_id}],
      path_template: "/repos/{owner}/{repo}/check-suites/{check_suite_id}/rerequest",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update repository preferences for check suites\n\nPath: /repos/{owner}/{repo}/check-suites/preferences\n\nMethod: patch"
  @spec set_suites_preferences(GitHubEx.Client.t()) :: result
  @spec set_suites_preferences(GitHubEx.Client.t(), map()) :: result
  def set_suites_preferences(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Checks, :set_suites_preferences},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/check-suites/preferences",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update a check run\n\nPath: /repos/{owner}/{repo}/check-runs/{check_run_id}\n\nMethod: patch"
  @spec update(GitHubEx.Client.t()) :: result
  @spec update(GitHubEx.Client.t(), map()) :: result
  def update(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Checks, :update},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"owner", :owner}, {"repo", :repo}, {"check_run_id", :check_run_id}],
      path_template: "/repos/{owner}/{repo}/check-runs/{check_run_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

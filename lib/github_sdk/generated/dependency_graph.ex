defmodule GitHubSDK.DependencyGraph do
  @moduledoc """
  Generated GitHub REST operations for the `DependencyGraph` namespace.

  ## Operations

  * `dependency-graph/diff-range`
  * `dependency-graph/export-sbom`
  * `dependency-graph/create-repository-snapshot`
  """

  @type result :: {:ok, term()} | {:error, GitHubSDK.Error.t()}

  @doc "Create a snapshot of dependencies for a repository\n\nPath: /repos/{owner}/{repo}/dependency-graph/snapshots\n\nMethod: post"
  @spec create_repository_snapshot(GitHubSDK.Client.t()) :: result
  @spec create_repository_snapshot(GitHubSDK.Client.t(), map()) :: result
  def create_repository_snapshot(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.DependencyGraph, :create_repository_snapshot},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/dependency-graph/snapshots",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Get a diff of the dependencies between commits\n\nPath: /repos/{owner}/{repo}/dependency-graph/compare/{basehead}\n\nMethod: get"
  @spec diff_range(GitHubSDK.Client.t()) :: result
  @spec diff_range(GitHubSDK.Client.t(), map()) :: result
  def diff_range(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.DependencyGraph, :diff_range},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"basehead", :basehead}],
      path_template: "/repos/{owner}/{repo}/dependency-graph/compare/{basehead}",
      query: [{"name", :name}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Export a software bill of materials (SBOM) for a repository.\n\nPath: /repos/{owner}/{repo}/dependency-graph/sbom\n\nMethod: get"
  @spec export_sbom(GitHubSDK.Client.t()) :: result
  @spec export_sbom(GitHubSDK.Client.t(), map()) :: result
  def export_sbom(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.DependencyGraph, :export_sbom},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/dependency-graph/sbom",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end
end

defmodule GitHubEx.DependencyGraph do
  @moduledoc """
  Generated Github Ex operations for dependency graph.
  """

  @create_repository_snapshot_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a snapshot of dependencies for a repository\n\nCreate a new snapshot of a repository's dependencies.\n\nThe authenticated user must have access to the repository.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec create_repository_snapshot(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_repository_snapshot(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_create_repository_snapshot_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_create_repository_snapshot_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @create_repository_snapshot_partition_spec)

    Pristine.Operation.new(%{
      id: "dependency-graph/create-repository-snapshot",
      method: :post,
      path_template: "/repos/{owner}/{repo}/dependency-graph/snapshots",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :dependency_graph, :create_repository_snapshot],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @diff_range_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"basehead", :basehead}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"name", :name}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a diff of the dependencies between commits\n\nGets the diff of the dependency changes between two commits of a repository, based on the changes to the dependency manifests made in those commits."
  @spec diff_range(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def diff_range(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_diff_range_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_diff_range_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @diff_range_partition_spec)

    Pristine.Operation.new(%{
      id: "dependency-graph/diff-range",
      method: :get,
      path_template: "/repos/{owner}/{repo}/dependency-graph/compare/{basehead}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :dependency_graph, :diff_range],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @export_sbom_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Export a software bill of materials (SBOM) for a repository.\n\nExports the software bill of materials (SBOM) for a repository in SPDX JSON format."
  @spec export_sbom(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def export_sbom(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_export_sbom_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_export_sbom_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @export_sbom_partition_spec)

    Pristine.Operation.new(%{
      id: "dependency-graph/export-sbom",
      method: :get,
      path_template: "/repos/{owner}/{repo}/dependency-graph/sbom",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :dependency_graph, :export_sbom],
        timeout_ms: nil
      },
      pagination: nil
    })
  end
end

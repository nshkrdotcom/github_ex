defmodule GitHubEx.DependencyGraph do
  @moduledoc """
  Generated Github Ex operations for dependency graph.
  """

  alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient

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
    opts = normalize_request_opts!(opts)
    request = build_create_repository_snapshot_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_repository_snapshot_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_repository_snapshot_partition_spec)

    %{
      id: "dependency-graph/create-repository-snapshot",
      args: params,
      call: {__MODULE__, :create_repository_snapshot},
      opts: opts,
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :dependency_graph, :create_repository_snapshot],
      timeout: nil,
      pagination: nil
    }
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
    opts = normalize_request_opts!(opts)
    request = build_diff_range_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_diff_range_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @diff_range_partition_spec)

    %{
      id: "dependency-graph/diff-range",
      args: params,
      call: {__MODULE__, :diff_range},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :dependency_graph, :diff_range],
      timeout: nil,
      pagination: nil
    }
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
    opts = normalize_request_opts!(opts)
    request = build_export_sbom_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_export_sbom_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @export_sbom_partition_spec)

    %{
      id: "dependency-graph/export-sbom",
      args: params,
      call: {__MODULE__, :export_sbom},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :dependency_graph, :export_sbom],
      timeout: nil,
      pagination: nil
    }
  end

  @spec normalize_request_opts!(list()) :: keyword()
  defp normalize_request_opts!(opts) when is_list(opts) do
    if Keyword.keyword?(opts) do
      opts
    else
      raise ArgumentError, "request opts must be a keyword list"
    end
  end
end

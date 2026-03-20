defmodule GitHubEx.Meta do
  @moduledoc """
  Generated Github Ex operations for meta.
  """

  @get_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get GitHub meta information\n\nReturns meta information about GitHub, including a list of GitHub's IP addresses. For more information, see \"[About GitHub's IP addresses](https://docs.github.com/articles/about-github-s-ip-addresses/).\"\n\nThe API's response also includes a list of GitHub's domain names.\n\nThe values shown in the documentation's response are example values. You must always query the API directly to get the latest values.\n\n> [!NOTE]\n> This endpoint returns both IPv4 and IPv6 addresses. However, not all features support IPv6. You should refer to the specific documentation for each feature to determine if IPv6 is supported."
  @spec get(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_partition_spec)

    Pristine.Operation.new(%{
      id: "meta/get",
      method: :get,
      path_template: "/meta",
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
        telemetry_event: [:github_ex, :meta, :get],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_all_versions_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get all API versions\n\nGet all supported GitHub API versions."
  @spec get_all_versions(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_all_versions(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_all_versions_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_all_versions_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_all_versions_partition_spec)

    Pristine.Operation.new(%{
      id: "meta/get-all-versions",
      method: :get,
      path_template: "/versions",
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
        telemetry_event: [:github_ex, :meta, :get_all_versions],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_octocat_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"s", :s}],
    headers: []
  }

  @doc "Get Octocat\n\nGet the octocat as ASCII art"
  @spec get_octocat(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_octocat(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_octocat_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_octocat_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_octocat_partition_spec)

    Pristine.Operation.new(%{
      id: "meta/get-octocat",
      method: :get,
      path_template: "/octocat",
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
        telemetry_event: [:github_ex, :meta, :get_octocat],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_zen_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get the Zen of GitHub\n\nGet a random sentence from the Zen of GitHub"
  @spec get_zen(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_zen(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_zen_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_zen_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_zen_partition_spec)

    Pristine.Operation.new(%{
      id: "meta/get-zen",
      method: :get,
      path_template: "/zen",
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
        telemetry_event: [:github_ex, :meta, :get_zen],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @root_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "GitHub API Root\n\nGet Hypermedia links to resources accessible in GitHub's REST API"
  @spec root(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def root(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_root_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_root_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @root_partition_spec)

    Pristine.Operation.new(%{
      id: "meta/root",
      method: :get,
      path_template: "/",
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
        telemetry_event: [:github_ex, :meta, :root],
        timeout_ms: nil
      },
      pagination: nil
    })
  end
end

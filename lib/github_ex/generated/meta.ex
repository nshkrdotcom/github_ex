defmodule GitHubEx.Meta do
  @moduledoc """
  Generated Github Ex operations for meta.
  """

  alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient

  @get_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get GitHub meta information\n\nReturns meta information about GitHub, including a list of GitHub's IP addresses. For more information, see \"[About GitHub's IP addresses](https://docs.github.com/articles/about-github-s-ip-addresses/).\"\n\nThe API's response also includes a list of GitHub's domain names.\n\nThe values shown in the documentation's response are example values. You must always query the API directly to get the latest values.\n\n> [!NOTE]\n> This endpoint returns both IPv4 and IPv6 addresses. However, not all features support IPv6. You should refer to the specific documentation for each feature to determine if IPv6 is supported."
  @spec get(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_partition_spec)

    %{
      id: "meta/get",
      args: params,
      call: {__MODULE__, :get},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :meta, :get],
      timeout: nil,
      pagination: nil
    }
  end

  @get_all_versions_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get all API versions\n\nGet all supported GitHub API versions."
  @spec get_all_versions(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_all_versions(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_all_versions_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_all_versions_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_all_versions_partition_spec)

    %{
      id: "meta/get-all-versions",
      args: params,
      call: {__MODULE__, :get_all_versions},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :meta, :get_all_versions],
      timeout: nil,
      pagination: nil
    }
  end

  @get_octocat_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"s", :s}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get Octocat\n\nGet the octocat as ASCII art"
  @spec get_octocat(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_octocat(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_octocat_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_octocat_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_octocat_partition_spec)

    %{
      id: "meta/get-octocat",
      args: params,
      call: {__MODULE__, :get_octocat},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :meta, :get_octocat],
      timeout: nil,
      pagination: nil
    }
  end

  @get_zen_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get the Zen of GitHub\n\nGet a random sentence from the Zen of GitHub"
  @spec get_zen(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_zen(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_zen_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_zen_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_zen_partition_spec)

    %{
      id: "meta/get-zen",
      args: params,
      call: {__MODULE__, :get_zen},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :meta, :get_zen],
      timeout: nil,
      pagination: nil
    }
  end

  @root_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "GitHub API Root\n\nGet Hypermedia links to resources accessible in GitHub's REST API"
  @spec root(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def root(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_root_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_root_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @root_partition_spec)

    %{
      id: "meta/root",
      args: params,
      call: {__MODULE__, :root},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :meta, :root],
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

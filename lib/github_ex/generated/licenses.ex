defmodule GitHubEx.Licenses do
  @moduledoc """
  Generated Github Ex operations for licenses.
  """

  alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient

  @get_partition_spec %{
    path: [{"license", :license}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a license\n\nGets information about a specific license. For more information, see \"[Licensing a repository ](https://docs.github.com/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository).\""
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
      id: "licenses/get",
      args: params,
      call: {__MODULE__, :get},
      opts: opts,
      method: :get,
      path_template: "/licenses/{license}",
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
      telemetry: [:github_ex, :licenses, :get],
      timeout: nil,
      pagination: nil
    }
  end

  @get_all_commonly_used_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"featured", :featured}, {"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get all commonly used licenses\n\nLists the most commonly used licenses on GitHub. For more information, see \"[Licensing a repository ](https://docs.github.com/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/licensing-a-repository).\""
  @spec get_all_commonly_used(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_all_commonly_used(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_all_commonly_used_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_get_all_commonly_used(term(), map(), keyword()) :: Enumerable.t()
  def stream_get_all_commonly_used(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_get_all_commonly_used_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_get_all_commonly_used_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_all_commonly_used_partition_spec)

    %{
      id: "licenses/get-all-commonly-used",
      args: params,
      call: {__MODULE__, :get_all_commonly_used},
      opts: opts,
      method: :get,
      path_template: "/licenses",
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
      telemetry: [:github_ex, :licenses, :get_all_commonly_used],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: nil,
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @get_for_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"ref", :ref}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get the license for a repository\n\nThis method returns the contents of the repository's license file, if one is detected.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.raw+json`**: Returns the raw contents of the license.\n- **`application/vnd.github.html+json`**: Returns the license contents in HTML. Markup languages are rendered to HTML using GitHub's open-source [Markup library](https://github.com/github/markup)."
  @spec get_for_repo(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_for_repo_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_for_repo_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_for_repo_partition_spec)

    %{
      id: "licenses/get-for-repo",
      args: params,
      call: {__MODULE__, :get_for_repo},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/license",
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
      telemetry: [:github_ex, :licenses, :get_for_repo],
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

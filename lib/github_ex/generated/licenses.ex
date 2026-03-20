defmodule GitHubEx.Licenses do
  @moduledoc """
  Generated Github Ex operations for licenses.
  """

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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_partition_spec)

    Pristine.Operation.new(%{
      id: "licenses/get",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :licenses, :get],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_all_commonly_used_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_get_all_commonly_used(term(), map(), keyword()) :: Enumerable.t()
  def stream_get_all_commonly_used(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_get_all_commonly_used_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          case Pristine.execute(runtime_client, operation, opts) do
            {:ok, response} ->
              items = List.wrap(Pristine.Operation.items(operation, response))
              {items, Pristine.Operation.next_page(operation, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_get_all_commonly_used_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_all_commonly_used_partition_spec)

    Pristine.Operation.new(%{
      id: "licenses/get-all-commonly-used",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :licenses, :get_all_commonly_used],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: nil,
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_for_repo_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_for_repo_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_for_repo_partition_spec)

    Pristine.Operation.new(%{
      id: "licenses/get-for-repo",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :licenses, :get_for_repo],
        timeout_ms: nil
      },
      pagination: nil
    })
  end
end

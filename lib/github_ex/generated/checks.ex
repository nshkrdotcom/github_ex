defmodule GitHubEx.Checks do
  @moduledoc """
  Generated Github Ex operations for checks.
  """

  alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient

  @create_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a check run\n\nCreates a new check run for a specific commit in a repository.\n\nTo create a check run, you must use a GitHub App. OAuth apps and authenticated users are not able to create a check suite.\n\nIn a check suite, GitHub limits the number of check runs with the same name to 1000. Once these check runs exceed 1000, GitHub will start to automatically delete older check runs.\n\n> [!NOTE]\n> The Checks API only looks for pushes in the repository where the check suite or check run were created. Pushes to a branch in a forked repository are not detected and return an empty `pull_requests` array."
  @spec create(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_partition_spec)

    %{
      id: "checks/create",
      args: params,
      call: {__MODULE__, :create},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/check-runs",
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
      telemetry: [:github_ex, :checks, :create],
      timeout: nil,
      pagination: nil
    }
  end

  @create_suite_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a check suite\n\nCreates a check suite manually. By default, check suites are automatically created when you create a [check run](https://docs.github.com/rest/checks/runs). You only need to use this endpoint for manually creating check suites when you've disabled automatic creation using \"[Update repository preferences for check suites](https://docs.github.com/rest/checks/suites#update-repository-preferences-for-check-suites)\".\n\n> [!NOTE]\n> The Checks API only looks for pushes in the repository where the check suite or check run were created. Pushes to a branch in a forked repository are not detected and return an empty `pull_requests` array and a `null` value for `head_branch`.\n\nOAuth apps and personal access tokens (classic) cannot use this endpoint."
  @spec create_suite(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_suite(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_suite_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_suite_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_suite_partition_spec)

    %{
      id: "checks/create-suite",
      args: params,
      call: {__MODULE__, :create_suite},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/check-suites",
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
      telemetry: [:github_ex, :checks, :create_suite],
      timeout: nil,
      pagination: nil
    }
  end

  @get_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"check_run_id", :check_run_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a check run\n\nGets a single check run using its `id`.\n\n> [!NOTE]\n> The Checks API only looks for pushes in the repository where the check suite or check run were created. Pushes to a branch in a forked repository are not detected and return an empty `pull_requests` array.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint on a private repository."
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
      id: "checks/get",
      args: params,
      call: {__MODULE__, :get},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/check-runs/{check_run_id}",
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
      telemetry: [:github_ex, :checks, :get],
      timeout: nil,
      pagination: nil
    }
  end

  @get_suite_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"check_suite_id", :check_suite_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a check suite\n\nGets a single check suite using its `id`.\n\n> [!NOTE]\n> The Checks API only looks for pushes in the repository where the check suite or check run were created. Pushes to a branch in a forked repository are not detected and return an empty `pull_requests` array and a `null` value for `head_branch`.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint on a private repository."
  @spec get_suite(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_suite(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_suite_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_suite_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_suite_partition_spec)

    %{
      id: "checks/get-suite",
      args: params,
      call: {__MODULE__, :get_suite},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/check-suites/{check_suite_id}",
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
      telemetry: [:github_ex, :checks, :get_suite],
      timeout: nil,
      pagination: nil
    }
  end

  @list_annotations_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"check_run_id", :check_run_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List check run annotations\n\nLists annotations for a check run using the annotation `id`.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint on a private repository."
  @spec list_annotations(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_annotations(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_annotations_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_annotations(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_annotations(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_annotations_request(client, params, opts) end,
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

  defp build_list_annotations_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_annotations_partition_spec)

    %{
      id: "checks/list-annotations",
      args: params,
      call: {__MODULE__, :list_annotations},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/check-runs/{check_run_id}/annotations",
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
      telemetry: [:github_ex, :checks, :list_annotations],
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

  @list_for_ref_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"ref", :ref}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"check_name", :check_name},
      {"status", :status},
      {"filter", :filter},
      {"per_page", :per_page},
      {"page", :page},
      {"app_id", :app_id}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List check runs for a Git reference\n\nLists check runs for a commit ref. The `ref` can be a SHA, branch name, or a tag name.\n\n> [!NOTE]\n> The endpoints to manage checks only look for pushes in the repository where the check suite or check run were created. Pushes to a branch in a forked repository are not detected and return an empty `pull_requests` array.\n\nIf there are more than 1000 check suites on a single git reference, this endpoint will limit check runs to the 1000 most recent check suites. To iterate over all possible check runs, use the [List check suites for a Git reference](https://docs.github.com/rest/reference/checks#list-check-suites-for-a-git-reference) endpoint and provide the `check_suite_id` parameter to the [List check runs in a check suite](https://docs.github.com/rest/reference/checks#list-check-runs-in-a-check-suite) endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint on a private repository."
  @spec list_for_ref(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_for_ref(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_for_ref_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_for_ref(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_for_ref(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_for_ref_request(client, params, opts) end,
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

  defp build_list_for_ref_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_for_ref_partition_spec)

    %{
      id: "checks/list-for-ref",
      args: params,
      call: {__MODULE__, :list_for_ref},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/commits/{ref}/check-runs",
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
      telemetry: [:github_ex, :checks, :list_for_ref],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["check_runs"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_for_suite_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"check_suite_id", :check_suite_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"check_name", :check_name},
      {"status", :status},
      {"filter", :filter},
      {"per_page", :per_page},
      {"page", :page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List check runs in a check suite\n\nLists check runs for a check suite using its `id`.\n\n> [!NOTE]\n> The endpoints to manage checks only look for pushes in the repository where the check suite or check run were created. Pushes to a branch in a forked repository are not detected and return an empty `pull_requests` array.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint on a private repository."
  @spec list_for_suite(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_for_suite(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_for_suite_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_for_suite(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_for_suite(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_for_suite_request(client, params, opts) end,
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

  defp build_list_for_suite_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_for_suite_partition_spec)

    %{
      id: "checks/list-for-suite",
      args: params,
      call: {__MODULE__, :list_for_suite},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/check-suites/{check_suite_id}/check-runs",
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
      telemetry: [:github_ex, :checks, :list_for_suite],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["check_runs"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_suites_for_ref_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"ref", :ref}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"app_id", :app_id},
      {"check_name", :check_name},
      {"per_page", :per_page},
      {"page", :page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List check suites for a Git reference\n\nLists check suites for a commit `ref`. The `ref` can be a SHA, branch name, or a tag name.\n\n> [!NOTE]\n> The endpoints to manage checks only look for pushes in the repository where the check suite or check run were created. Pushes to a branch in a forked repository are not detected and return an empty `pull_requests` array and a `null` value for `head_branch`.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint on a private repository."
  @spec list_suites_for_ref(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_suites_for_ref(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_suites_for_ref_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_suites_for_ref(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_suites_for_ref(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_suites_for_ref_request(client, params, opts) end,
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

  defp build_list_suites_for_ref_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_suites_for_ref_partition_spec)

    %{
      id: "checks/list-suites-for-ref",
      args: params,
      call: {__MODULE__, :list_suites_for_ref},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/commits/{ref}/check-suites",
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
      telemetry: [:github_ex, :checks, :list_suites_for_ref],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["check_suites"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @rerequest_run_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"check_run_id", :check_run_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Rerequest a check run\n\nTriggers GitHub to rerequest an existing check run, without pushing new code to a repository. This endpoint will trigger the [`check_run` webhook](https://docs.github.com/webhooks/event-payloads/#check_run) event with the action `rerequested`. When a check run is `rerequested`, the `status` of the check suite it belongs to is reset to `queued` and the `conclusion` is cleared. The check run itself is not updated. GitHub apps recieving the [`check_run` webhook](https://docs.github.com/webhooks/event-payloads/#check_run) with the `rerequested` action should then decide if the check run should be reset or updated and call the [update `check_run` endpoint](https://docs.github.com/rest/checks/runs#update-a-check-run) to update the check_run if desired.\n\nFor more information about how to re-run GitHub Actions jobs, see \"[Re-run a job from a workflow run](https://docs.github.com/rest/actions/workflow-runs#re-run-a-job-from-a-workflow-run)\"."
  @spec rerequest_run(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def rerequest_run(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_rerequest_run_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_rerequest_run_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @rerequest_run_partition_spec)

    %{
      id: "checks/rerequest-run",
      args: params,
      call: {__MODULE__, :rerequest_run},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/check-runs/{check_run_id}/rerequest",
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
      telemetry: [:github_ex, :checks, :rerequest_run],
      timeout: nil,
      pagination: nil
    }
  end

  @rerequest_suite_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"check_suite_id", :check_suite_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Rerequest a check suite\n\nTriggers GitHub to rerequest an existing check suite, without pushing new code to a repository. This endpoint will trigger the [`check_suite` webhook](https://docs.github.com/webhooks/event-payloads/#check_suite) event with the action `rerequested`. When a check suite is `rerequested`, its `status` is reset to `queued` and the `conclusion` is cleared."
  @spec rerequest_suite(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def rerequest_suite(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_rerequest_suite_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_rerequest_suite_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @rerequest_suite_partition_spec)

    %{
      id: "checks/rerequest-suite",
      args: params,
      call: {__MODULE__, :rerequest_suite},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/check-suites/{check_suite_id}/rerequest",
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
      telemetry: [:github_ex, :checks, :rerequest_suite],
      timeout: nil,
      pagination: nil
    }
  end

  @set_suites_preferences_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update repository preferences for check suites\n\nChanges the default automatic flow when creating check suites. By default, a check suite is automatically created each time code is pushed to a repository. When you disable the automatic creation of check suites, you can manually [Create a check suite](https://docs.github.com/rest/checks/suites#create-a-check-suite).\nYou must have admin permissions in the repository to set preferences for check suites."
  @spec set_suites_preferences(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def set_suites_preferences(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_set_suites_preferences_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_suites_preferences_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @set_suites_preferences_partition_spec)

    %{
      id: "checks/set-suites-preferences",
      args: params,
      call: {__MODULE__, :set_suites_preferences},
      opts: opts,
      method: :patch,
      path_template: "/repos/{owner}/{repo}/check-suites/preferences",
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
      telemetry: [:github_ex, :checks, :set_suites_preferences],
      timeout: nil,
      pagination: nil
    }
  end

  @update_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"check_run_id", :check_run_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update a check run\n\nUpdates a check run for a specific commit in a repository.\n\n> [!NOTE]\n> The endpoints to manage checks only look for pushes in the repository where the check suite or check run were created. Pushes to a branch in a forked repository are not detected and return an empty `pull_requests` array.\n\nOAuth apps and personal access tokens (classic) cannot use this endpoint."
  @spec update(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_partition_spec)

    %{
      id: "checks/update",
      args: params,
      call: {__MODULE__, :update},
      opts: opts,
      method: :patch,
      path_template: "/repos/{owner}/{repo}/check-runs/{check_run_id}",
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
      telemetry: [:github_ex, :checks, :update],
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

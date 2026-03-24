defmodule GitHubEx.Classroom do
  @moduledoc """
  Generated Github Ex operations for classroom.
  """

  alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient

  @get_a_classroom_partition_spec %{
    path: [{"classroom_id", :classroom_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a classroom\n\nGets a GitHub Classroom classroom for the current user. Classroom will only be returned if the current user is an administrator of the GitHub Classroom."
  @spec get_a_classroom(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_a_classroom(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_a_classroom_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_a_classroom_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_a_classroom_partition_spec)

    %{
      id: "classroom/get-a-classroom",
      args: params,
      call: {__MODULE__, :get_a_classroom},
      opts: opts,
      method: :get,
      path_template: "/classrooms/{classroom_id}",
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
      telemetry: [:github_ex, :classroom, :get_a_classroom],
      timeout: nil,
      pagination: nil
    }
  end

  @get_an_assignment_partition_spec %{
    path: [{"assignment_id", :assignment_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get an assignment\n\nGets a GitHub Classroom assignment. Assignment will only be returned if the current user is an administrator of the GitHub Classroom for the assignment."
  @spec get_an_assignment(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_an_assignment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_an_assignment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_an_assignment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_an_assignment_partition_spec)

    %{
      id: "classroom/get-an-assignment",
      args: params,
      call: {__MODULE__, :get_an_assignment},
      opts: opts,
      method: :get,
      path_template: "/assignments/{assignment_id}",
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
      telemetry: [:github_ex, :classroom, :get_an_assignment],
      timeout: nil,
      pagination: nil
    }
  end

  @get_assignment_grades_partition_spec %{
    path: [{"assignment_id", :assignment_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get assignment grades\n\nGets grades for a GitHub Classroom assignment. Grades will only be returned if the current user is an administrator of the GitHub Classroom for the assignment."
  @spec get_assignment_grades(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_assignment_grades(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_assignment_grades_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_assignment_grades_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_assignment_grades_partition_spec)

    %{
      id: "classroom/get-assignment-grades",
      args: params,
      call: {__MODULE__, :get_assignment_grades},
      opts: opts,
      method: :get,
      path_template: "/assignments/{assignment_id}/grades",
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
      telemetry: [:github_ex, :classroom, :get_assignment_grades],
      timeout: nil,
      pagination: nil
    }
  end

  @list_accepted_assignments_for_an_assignment_partition_spec %{
    path: [{"assignment_id", :assignment_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"page", :page}, {"per_page", :per_page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List accepted assignments for an assignment\n\nLists any assignment repositories that have been created by students accepting a GitHub Classroom assignment. Accepted assignments will only be returned if the current user is an administrator of the GitHub Classroom for the assignment."
  @spec list_accepted_assignments_for_an_assignment(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_accepted_assignments_for_an_assignment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_accepted_assignments_for_an_assignment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_accepted_assignments_for_an_assignment(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_list_accepted_assignments_for_an_assignment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_accepted_assignments_for_an_assignment_request(client, params, opts) end,
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

  defp build_list_accepted_assignments_for_an_assignment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @list_accepted_assignments_for_an_assignment_partition_spec)

    %{
      id: "classroom/list-accepted-assignments-for-an-assignment",
      args: params,
      call: {__MODULE__, :list_accepted_assignments_for_an_assignment},
      opts: opts,
      method: :get,
      path_template: "/assignments/{assignment_id}/accepted_assignments",
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
      telemetry: [:github_ex, :classroom, :list_accepted_assignments_for_an_assignment],
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

  @list_assignments_for_a_classroom_partition_spec %{
    path: [{"classroom_id", :classroom_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"page", :page}, {"per_page", :per_page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List assignments for a classroom\n\nLists GitHub Classroom assignments for a classroom. Assignments will only be returned if the current user is an administrator of the GitHub Classroom."
  @spec list_assignments_for_a_classroom(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_assignments_for_a_classroom(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_assignments_for_a_classroom_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_assignments_for_a_classroom(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_assignments_for_a_classroom(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_assignments_for_a_classroom_request(client, params, opts) end,
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

  defp build_list_assignments_for_a_classroom_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_assignments_for_a_classroom_partition_spec)

    %{
      id: "classroom/list-assignments-for-a-classroom",
      args: params,
      call: {__MODULE__, :list_assignments_for_a_classroom},
      opts: opts,
      method: :get,
      path_template: "/classrooms/{classroom_id}/assignments",
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
      telemetry: [:github_ex, :classroom, :list_assignments_for_a_classroom],
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

  @list_classrooms_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"page", :page}, {"per_page", :per_page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List classrooms\n\nLists GitHub Classroom classrooms for the current user. Classrooms will only be returned if the current user is an administrator of one or more GitHub Classrooms."
  @spec list_classrooms(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_classrooms(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_classrooms_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_classrooms(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_classrooms(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_classrooms_request(client, params, opts) end,
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

  defp build_list_classrooms_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_classrooms_partition_spec)

    %{
      id: "classroom/list-classrooms",
      args: params,
      call: {__MODULE__, :list_classrooms},
      opts: opts,
      method: :get,
      path_template: "/classrooms",
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
      telemetry: [:github_ex, :classroom, :list_classrooms],
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

  @spec normalize_request_opts!(list()) :: keyword()
  defp normalize_request_opts!(opts) when is_list(opts) do
    if Keyword.keyword?(opts) do
      opts
    else
      raise ArgumentError, "request opts must be a keyword list"
    end
  end
end

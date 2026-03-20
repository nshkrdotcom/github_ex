defmodule GitHubEx.Classroom do
  @moduledoc """
  Generated Github Ex operations for classroom.
  """

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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_a_classroom_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_a_classroom_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_a_classroom_partition_spec)

    Pristine.Operation.new(%{
      id: "classroom/get-a-classroom",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :classroom, :get_a_classroom],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_an_assignment_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_an_assignment_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_an_assignment_partition_spec)

    Pristine.Operation.new(%{
      id: "classroom/get-an-assignment",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :classroom, :get_an_assignment],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_assignment_grades_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_assignment_grades_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_assignment_grades_partition_spec)

    Pristine.Operation.new(%{
      id: "classroom/get-assignment-grades",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :classroom, :get_assignment_grades],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_accepted_assignments_for_an_assignment_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_accepted_assignments_for_an_assignment(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_list_accepted_assignments_for_an_assignment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_accepted_assignments_for_an_assignment_operation(params) end,
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

  defp build_list_accepted_assignments_for_an_assignment_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @list_accepted_assignments_for_an_assignment_partition_spec
      )

    Pristine.Operation.new(%{
      id: "classroom/list-accepted-assignments-for-an-assignment",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :classroom, :list_accepted_assignments_for_an_assignment],
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_assignments_for_a_classroom_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_assignments_for_a_classroom(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_assignments_for_a_classroom(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_assignments_for_a_classroom_operation(params) end,
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

  defp build_list_assignments_for_a_classroom_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @list_assignments_for_a_classroom_partition_spec)

    Pristine.Operation.new(%{
      id: "classroom/list-assignments-for-a-classroom",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :classroom, :list_assignments_for_a_classroom],
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_classrooms_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_classrooms(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_classrooms(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_classrooms_operation(params) end,
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

  defp build_list_classrooms_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_classrooms_partition_spec)

    Pristine.Operation.new(%{
      id: "classroom/list-classrooms",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :classroom, :list_classrooms],
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
end

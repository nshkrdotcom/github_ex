defmodule GitHubEx.Classroom do
  @moduledoc """
  Generated GitHub REST operations for the `Classroom` namespace.

  ## Operations

  * `classroom/get-an-assignment`
  * `classroom/list-accepted-assignments-for-an-assignment`
  * `classroom/get-assignment-grades`
  * `classroom/list-classrooms`
  * `classroom/get-a-classroom`
  * `classroom/list-assignments-for-a-classroom`
  """

  @type result :: {:ok, term()} | {:error, GitHubEx.Error.t()}

  @doc "Get a classroom\n\nPath: /classrooms/{classroom_id}\n\nMethod: get"
  @spec get_a_classroom(GitHubEx.Client.t()) :: result
  @spec get_a_classroom(GitHubEx.Client.t(), map()) :: result
  def get_a_classroom(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Classroom, :get_a_classroom},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"classroom_id", :classroom_id}],
      path_template: "/classrooms/{classroom_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get an assignment\n\nPath: /assignments/{assignment_id}\n\nMethod: get"
  @spec get_an_assignment(GitHubEx.Client.t()) :: result
  @spec get_an_assignment(GitHubEx.Client.t(), map()) :: result
  def get_an_assignment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Classroom, :get_an_assignment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"assignment_id", :assignment_id}],
      path_template: "/assignments/{assignment_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get assignment grades\n\nPath: /assignments/{assignment_id}/grades\n\nMethod: get"
  @spec get_assignment_grades(GitHubEx.Client.t()) :: result
  @spec get_assignment_grades(GitHubEx.Client.t(), map()) :: result
  def get_assignment_grades(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Classroom, :get_assignment_grades},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"assignment_id", :assignment_id}],
      path_template: "/assignments/{assignment_id}/grades",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List accepted assignments for an assignment\n\nPath: /assignments/{assignment_id}/accepted_assignments\n\nMethod: get"
  @spec list_accepted_assignments_for_an_assignment(GitHubEx.Client.t()) :: result
  @spec list_accepted_assignments_for_an_assignment(GitHubEx.Client.t(), map()) :: result
  def list_accepted_assignments_for_an_assignment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Classroom, :list_accepted_assignments_for_an_assignment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"assignment_id", :assignment_id}],
      path_template: "/assignments/{assignment_id}/accepted_assignments",
      query: [{"page", :page}, {"per_page", :per_page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List assignments for a classroom\n\nPath: /classrooms/{classroom_id}/assignments\n\nMethod: get"
  @spec list_assignments_for_a_classroom(GitHubEx.Client.t()) :: result
  @spec list_assignments_for_a_classroom(GitHubEx.Client.t(), map()) :: result
  def list_assignments_for_a_classroom(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Classroom, :list_assignments_for_a_classroom},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"classroom_id", :classroom_id}],
      path_template: "/classrooms/{classroom_id}/assignments",
      query: [{"page", :page}, {"per_page", :per_page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List classrooms\n\nPath: /classrooms\n\nMethod: get"
  @spec list_classrooms(GitHubEx.Client.t()) :: result
  @spec list_classrooms(GitHubEx.Client.t(), map()) :: result
  def list_classrooms(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Classroom, :list_classrooms},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/classrooms",
      query: [{"page", :page}, {"per_page", :per_page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end
end

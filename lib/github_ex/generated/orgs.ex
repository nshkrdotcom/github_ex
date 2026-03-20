defmodule GitHubEx.Orgs do
  @moduledoc """
  Generated Github Ex operations for orgs.
  """

  @get_route_stats_by_actor_partition_spec %{
    path: [{"org", :org}, {"actor_type", :actor_type}, {"actor_id", :actor_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"min_timestamp", :min_timestamp},
      {"max_timestamp", :max_timestamp},
      {"page", :page},
      {"per_page", :per_page},
      {"direction", :direction},
      {"sort", :sort},
      {"api_route_substring", :api_route_substring}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get route stats by actor\n\nGet API request count statistics for an actor broken down by route within a specified time frame."
  @spec get_route_stats_by_actor(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_route_stats_by_actor(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_get_route_stats_by_actor_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_get_route_stats_by_actor(term(), map(), keyword()) :: Enumerable.t()
  def stream_get_route_stats_by_actor(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_get_route_stats_by_actor_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_get_route_stats_by_actor_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_route_stats_by_actor_partition_spec)

    Pristine.Operation.new(%{
      id: "api-insights/get-route-stats-by-actor",
      method: :get,
      path_template: "/orgs/{org}/insights/api/route-stats/{actor_type}/{actor_id}",
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
        telemetry_event: [:github_ex, :orgs, :get_route_stats_by_actor],
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

  @get_subject_stats_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"min_timestamp", :min_timestamp},
      {"max_timestamp", :max_timestamp},
      {"page", :page},
      {"per_page", :per_page},
      {"direction", :direction},
      {"sort", :sort},
      {"subject_name_substring", :subject_name_substring}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get subject stats\n\nGet API request statistics for all subjects within an organization within a specified time frame. Subjects can be users or GitHub Apps."
  @spec get_subject_stats(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_subject_stats(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_get_subject_stats_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_get_subject_stats(term(), map(), keyword()) :: Enumerable.t()
  def stream_get_subject_stats(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_get_subject_stats_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_get_subject_stats_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_subject_stats_partition_spec)

    Pristine.Operation.new(%{
      id: "api-insights/get-subject-stats",
      method: :get,
      path_template: "/orgs/{org}/insights/api/subject-stats",
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
        telemetry_event: [:github_ex, :orgs, :get_subject_stats],
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

  @get_summary_stats_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"min_timestamp", :min_timestamp}, {"max_timestamp", :max_timestamp}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get summary stats\n\nGet overall statistics of API requests made within an organization by all users and apps within a specified time frame."
  @spec get_summary_stats(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_summary_stats(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_get_summary_stats_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_get_summary_stats_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_summary_stats_partition_spec)

    Pristine.Operation.new(%{
      id: "api-insights/get-summary-stats",
      method: :get,
      path_template: "/orgs/{org}/insights/api/summary-stats",
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
        telemetry_event: [:github_ex, :orgs, :get_summary_stats],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_summary_stats_by_actor_partition_spec %{
    path: [{"org", :org}, {"actor_type", :actor_type}, {"actor_id", :actor_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"min_timestamp", :min_timestamp}, {"max_timestamp", :max_timestamp}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get summary stats by actor\n\nGet overall statistics of API requests within the organization made by a specific actor. Actors can be GitHub App installations, OAuth apps or other tokens on behalf of a user."
  @spec get_summary_stats_by_actor(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_summary_stats_by_actor(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_get_summary_stats_by_actor_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_get_summary_stats_by_actor_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_summary_stats_by_actor_partition_spec)

    Pristine.Operation.new(%{
      id: "api-insights/get-summary-stats-by-actor",
      method: :get,
      path_template: "/orgs/{org}/insights/api/summary-stats/{actor_type}/{actor_id}",
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
        telemetry_event: [:github_ex, :orgs, :get_summary_stats_by_actor],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_summary_stats_by_user_partition_spec %{
    path: [{"org", :org}, {"user_id", :user_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"min_timestamp", :min_timestamp}, {"max_timestamp", :max_timestamp}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get summary stats by user\n\nGet overall statistics of API requests within the organization for a user."
  @spec get_summary_stats_by_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_summary_stats_by_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_get_summary_stats_by_user_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_get_summary_stats_by_user_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_summary_stats_by_user_partition_spec)

    Pristine.Operation.new(%{
      id: "api-insights/get-summary-stats-by-user",
      method: :get,
      path_template: "/orgs/{org}/insights/api/summary-stats/users/{user_id}",
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
        telemetry_event: [:github_ex, :orgs, :get_summary_stats_by_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_time_stats_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"min_timestamp", :min_timestamp},
      {"max_timestamp", :max_timestamp},
      {"timestamp_increment", :timestamp_increment}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get time stats\n\nGet the number of API requests and rate-limited requests made within an organization over a specified time period."
  @spec get_time_stats(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_time_stats(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_get_time_stats_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_get_time_stats_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_time_stats_partition_spec)

    Pristine.Operation.new(%{
      id: "api-insights/get-time-stats",
      method: :get,
      path_template: "/orgs/{org}/insights/api/time-stats",
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
        telemetry_event: [:github_ex, :orgs, :get_time_stats],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_time_stats_by_actor_partition_spec %{
    path: [{"org", :org}, {"actor_type", :actor_type}, {"actor_id", :actor_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"min_timestamp", :min_timestamp},
      {"max_timestamp", :max_timestamp},
      {"timestamp_increment", :timestamp_increment}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get time stats by actor\n\nGet the number of API requests and rate-limited requests made within an organization by a specific actor within a specified time period."
  @spec get_time_stats_by_actor(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_time_stats_by_actor(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_get_time_stats_by_actor_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_get_time_stats_by_actor_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_time_stats_by_actor_partition_spec)

    Pristine.Operation.new(%{
      id: "api-insights/get-time-stats-by-actor",
      method: :get,
      path_template: "/orgs/{org}/insights/api/time-stats/{actor_type}/{actor_id}",
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
        telemetry_event: [:github_ex, :orgs, :get_time_stats_by_actor],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_time_stats_by_user_partition_spec %{
    path: [{"org", :org}, {"user_id", :user_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"min_timestamp", :min_timestamp},
      {"max_timestamp", :max_timestamp},
      {"timestamp_increment", :timestamp_increment}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get time stats by user\n\nGet the number of API requests and rate-limited requests made within an organization by a specific user over a specified time period."
  @spec get_time_stats_by_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_time_stats_by_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_get_time_stats_by_user_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_get_time_stats_by_user_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_time_stats_by_user_partition_spec)

    Pristine.Operation.new(%{
      id: "api-insights/get-time-stats-by-user",
      method: :get,
      path_template: "/orgs/{org}/insights/api/time-stats/users/{user_id}",
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
        telemetry_event: [:github_ex, :orgs, :get_time_stats_by_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_user_stats_partition_spec %{
    path: [{"org", :org}, {"user_id", :user_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"min_timestamp", :min_timestamp},
      {"max_timestamp", :max_timestamp},
      {"page", :page},
      {"per_page", :per_page},
      {"direction", :direction},
      {"sort", :sort},
      {"actor_name_substring", :actor_name_substring}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get user stats\n\nGet API usage statistics within an organization for a user broken down by the type of access."
  @spec get_user_stats(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_user_stats(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_get_user_stats_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_get_user_stats(term(), map(), keyword()) :: Enumerable.t()
  def stream_get_user_stats(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_get_user_stats_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_get_user_stats_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_user_stats_partition_spec)

    Pristine.Operation.new(%{
      id: "api-insights/get-user-stats",
      method: :get,
      path_template: "/orgs/{org}/insights/api/user-stats/{user_id}",
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
        telemetry_event: [:github_ex, :orgs, :get_user_stats],
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

  @add_security_manager_team_partition_spec %{
    path: [{"org", :org}, {"team_slug", :team_slug}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add a security manager team\n\n> [!WARNING]\n> **Closing down notice:** This operation is closing down and will be removed starting January 1, 2026. Please use the \"[Organization Roles](https://docs.github.com/rest/orgs/organization-roles)\" endpoints instead."
  @spec add_security_manager_team(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def add_security_manager_team(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_add_security_manager_team_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_add_security_manager_team_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @add_security_manager_team_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/add-security-manager-team",
      method: :put,
      path_template: "/orgs/{org}/security-managers/teams/{team_slug}",
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
        telemetry_event: [:github_ex, :orgs, :add_security_manager_team],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @assign_team_to_org_role_partition_spec %{
    path: [{"org", :org}, {"team_slug", :team_slug}, {"role_id", :role_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Assign an organization role to a team\n\nAssigns an organization role to a team in an organization. For more information on organization roles, see \"[Using organization roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles).\"\n\nThe authenticated user must be an administrator for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec assign_team_to_org_role(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def assign_team_to_org_role(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_assign_team_to_org_role_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_assign_team_to_org_role_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @assign_team_to_org_role_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/assign-team-to-org-role",
      method: :put,
      path_template: "/orgs/{org}/organization-roles/teams/{team_slug}/{role_id}",
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
        telemetry_event: [:github_ex, :orgs, :assign_team_to_org_role],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @assign_user_to_org_role_partition_spec %{
    path: [{"org", :org}, {"username", :username}, {"role_id", :role_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Assign an organization role to a user\n\nAssigns an organization role to a member of an organization. For more information on organization roles, see \"[Using organization roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles).\"\n\nThe authenticated user must be an administrator for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec assign_user_to_org_role(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def assign_user_to_org_role(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_assign_user_to_org_role_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_assign_user_to_org_role_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @assign_user_to_org_role_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/assign-user-to-org-role",
      method: :put,
      path_template: "/orgs/{org}/organization-roles/users/{username}/{role_id}",
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
        telemetry_event: [:github_ex, :orgs, :assign_user_to_org_role],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @block_user_partition_spec %{
    path: [{"org", :org}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Block a user from an organization\n\nBlocks the given user on behalf of the specified organization and returns a 204. If the organization cannot block the given user a 422 is returned."
  @spec block_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def block_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_block_user_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_block_user_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @block_user_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/block-user",
      method: :put,
      path_template: "/orgs/{org}/blocks/{username}",
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
        telemetry_event: [:github_ex, :orgs, :block_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @cancel_invitation_partition_spec %{
    path: [{"org", :org}, {"invitation_id", :invitation_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Cancel an organization invitation\n\nCancel an organization invitation. In order to cancel an organization invitation, the authenticated user must be an organization owner.\n\nThis endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications)."
  @spec cancel_invitation(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def cancel_invitation(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_cancel_invitation_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_cancel_invitation_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @cancel_invitation_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/cancel-invitation",
      method: :delete,
      path_template: "/orgs/{org}/invitations/{invitation_id}",
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
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :orgs, :cancel_invitation],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @check_blocked_user_partition_spec %{
    path: [{"org", :org}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Check if a user is blocked by an organization\n\nReturns a 204 if the given user is blocked by the given organization. Returns a 404 if the organization is not blocking the user, or if the user account has been identified as spam by GitHub."
  @spec check_blocked_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def check_blocked_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_check_blocked_user_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_check_blocked_user_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @check_blocked_user_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/check-blocked-user",
      method: :get,
      path_template: "/orgs/{org}/blocks/{username}",
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
        telemetry_event: [:github_ex, :orgs, :check_blocked_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @check_membership_for_user_partition_spec %{
    path: [{"org", :org}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Check organization membership for a user\n\nCheck if a user is, publicly or privately, a member of the organization."
  @spec check_membership_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def check_membership_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_check_membership_for_user_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_check_membership_for_user_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @check_membership_for_user_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/check-membership-for-user",
      method: :get,
      path_template: "/orgs/{org}/members/{username}",
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
        telemetry_event: [:github_ex, :orgs, :check_membership_for_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @check_public_membership_for_user_partition_spec %{
    path: [{"org", :org}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Check public organization membership for a user\n\nCheck if the provided user is a public member of the organization."
  @spec check_public_membership_for_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def check_public_membership_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_check_public_membership_for_user_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_check_public_membership_for_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @check_public_membership_for_user_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/check-public-membership-for-user",
      method: :get,
      path_template: "/orgs/{org}/public_members/{username}",
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
        telemetry_event: [:github_ex, :orgs, :check_public_membership_for_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @convert_member_to_outside_collaborator_partition_spec %{
    path: [{"org", :org}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Convert an organization member to outside collaborator

       When an organization member is converted to an outside collaborator, they'll only have access to the repositories that their current team membership allows. The user will no longer be a member of the organization. For more information, see "[Converting an organization member to an outside collaborator](https://docs.github.com/articles/converting-an-organization-member-to-an-outside-collaborator/)". Converting an organization member to an outside collaborator may be restricted by enterprise administrators. For more information, see "[Enforcing repository management policies in your enterprise](https://docs.github.com/admin/policies/enforcing-policies-for-your-enterprise/enforcing-repository-management-policies-in-your-enterprise#enforcing-a-policy-for-inviting-outside-collaborators-to-repositories)."
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec convert_member_to_outside_collaborator(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def convert_member_to_outside_collaborator(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_convert_member_to_outside_collaborator_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_convert_member_to_outside_collaborator_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @convert_member_to_outside_collaborator_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/convert-member-to-outside-collaborator",
      method: :put,
      path_template: "/orgs/{org}/outside_collaborators/{username}",
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
        telemetry_event: [:github_ex, :orgs, :convert_member_to_outside_collaborator],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @create_artifact_deployment_record_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create an artifact deployment record\n\nCreate or update deployment records for an artifact associated\nwith an organization.\nThis endpoint allows you to record information about a specific\nartifact, such as its name, digest, environments, cluster, and\ndeployment.\nThe deployment name has to be uniqe within a cluster (i.e a\ncombination of logical, physical environment and cluster) as it\nidentifies unique deployment.\nMultiple requests for the same combination of logical, physical\nenvironment, cluster and deployment name will only create one\nrecord, successive request will update the existing record.\nThis allows for a stable tracking of a deployment where the actual\ndeployed artifact can change over time."
  @spec create_artifact_deployment_record(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def create_artifact_deployment_record(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_create_artifact_deployment_record_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_create_artifact_deployment_record_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @create_artifact_deployment_record_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/create-artifact-deployment-record",
      method: :post,
      path_template: "/orgs/{org}/artifacts/metadata/deployment-record",
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
        telemetry_event: [:github_ex, :orgs, :create_artifact_deployment_record],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @create_artifact_storage_record_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create artifact metadata storage record\n\nCreate metadata storage records for artifacts associated with an organization.\nThis endpoint will create a new artifact storage record on behalf of any artifact matching the provided digest and\nassociated with a repository owned by the organization."
  @spec create_artifact_storage_record(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def create_artifact_storage_record(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_create_artifact_storage_record_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_create_artifact_storage_record_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @create_artifact_storage_record_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/create-artifact-storage-record",
      method: :post,
      path_template: "/orgs/{org}/artifacts/metadata/storage-record",
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
        telemetry_event: [:github_ex, :orgs, :create_artifact_storage_record],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @create_invitation_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Create an organization invitation

       Invite people to an organization by using their GitHub user ID or their email address. In order to create invitations in an organization, the authenticated user must be an organization owner.

       This endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications). Creating content too quickly using this endpoint may result in secondary rate limiting. For more information, see "[Rate limits for the API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)"
       and "[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec create_invitation(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_invitation(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_create_invitation_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_create_invitation_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @create_invitation_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/create-invitation",
      method: :post,
      path_template: "/orgs/{org}/invitations",
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
        telemetry_event: [:github_ex, :orgs, :create_invitation],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @create_issue_field_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create issue field for an organization\n\nCreates a new issue field for an organization.\n\nYou can find out more about issue fields in [Managing issue fields in an organization](https://docs.github.com/issues/tracking-your-work-with-issues/using-issues/managing-issue-fields-in-an-organization).\n\nTo use this endpoint, the authenticated user must be an administrator for the organization. OAuth app tokens and\npersonal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec create_issue_field(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_issue_field(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_create_issue_field_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_create_issue_field_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @create_issue_field_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/create-issue-field",
      method: :post,
      path_template: "/orgs/{org}/issue-fields",
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
        telemetry_event: [:github_ex, :orgs, :create_issue_field],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @create_issue_type_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create issue type for an organization\n\nCreate a new issue type for an organization.\n\nYou can find out more about issue types in [Managing issue types in an organization](https://docs.github.com/issues/tracking-your-work-with-issues/configuring-issues/managing-issue-types-in-an-organization).\n\nTo use this endpoint, the authenticated user must be an administrator for the organization. OAuth app tokens and\npersonal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec create_issue_type(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_issue_type(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_create_issue_type_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_create_issue_type_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @create_issue_type_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/create-issue-type",
      method: :post,
      path_template: "/orgs/{org}/issue-types",
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
        telemetry_event: [:github_ex, :orgs, :create_issue_type],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @create_webhook_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create an organization webhook\n\nCreate a hook that posts payloads in JSON format.\n\nYou must be an organization owner to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need `admin:org_hook` scope. OAuth apps cannot list, view, or\nedit webhooks that they did not create and users cannot list, view, or edit webhooks that were created by OAuth apps."
  @spec create_webhook(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_webhook(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_create_webhook_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_create_webhook_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @create_webhook_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/create-webhook",
      method: :post,
      path_template: "/orgs/{org}/hooks",
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
        telemetry_event: [:github_ex, :orgs, :create_webhook],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @custom_properties_for_repos_create_or_update_organization_definition_partition_spec %{
    path: [{"org", :org}, {"custom_property_name", :custom_property_name}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create or update a custom property for an organization\n\nCreates a new or updates an existing custom property that is defined for an organization.\n\nTo use this endpoint, the authenticated user must be one of:\n- An administrator for the organization.\n- A user, or a user on a team, with the fine-grained permission of `custom_properties_org_definitions_manager` in the organization."
  @spec custom_properties_for_repos_create_or_update_organization_definition(
          term(),
          map(),
          keyword()
        ) :: {:ok, term()} | {:error, term()}
  def custom_properties_for_repos_create_or_update_organization_definition(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    operation =
      build_custom_properties_for_repos_create_or_update_organization_definition_operation(params)

    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_custom_properties_for_repos_create_or_update_organization_definition_operation(
         params
       )
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @custom_properties_for_repos_create_or_update_organization_definition_partition_spec
      )

    Pristine.Operation.new(%{
      id: "orgs/custom-properties-for-repos-create-or-update-organization-definition",
      method: :put,
      path_template: "/orgs/{org}/properties/schema/{custom_property_name}",
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
        telemetry_event: [
          :github_ex,
          :orgs,
          :custom_properties_for_repos_create_or_update_organization_definition
        ],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @custom_properties_for_repos_create_or_update_organization_definitions_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create or update custom properties for an organization\n\nCreates new or updates existing custom properties defined for an organization in a batch.\n\nIf the property already exists, the existing property will be replaced with the new values.\nMissing optional values will fall back to default values, previous values will be overwritten.\nE.g. if a property exists with `values_editable_by: org_and_repo_actors` and it's updated without specifying `values_editable_by`, it will be updated to default value `org_actors`.\n\nTo use this endpoint, the authenticated user must be one of:\n  - An administrator for the organization.\n  - A user, or a user on a team, with the fine-grained permission of `custom_properties_org_definitions_manager` in the organization."
  @spec custom_properties_for_repos_create_or_update_organization_definitions(
          term(),
          map(),
          keyword()
        ) :: {:ok, term()} | {:error, term()}
  def custom_properties_for_repos_create_or_update_organization_definitions(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    operation =
      build_custom_properties_for_repos_create_or_update_organization_definitions_operation(
        params
      )

    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_custom_properties_for_repos_create_or_update_organization_definitions_operation(
         params
       )
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @custom_properties_for_repos_create_or_update_organization_definitions_partition_spec
      )

    Pristine.Operation.new(%{
      id: "orgs/custom-properties-for-repos-create-or-update-organization-definitions",
      method: :patch,
      path_template: "/orgs/{org}/properties/schema",
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
        telemetry_event: [
          :github_ex,
          :orgs,
          :custom_properties_for_repos_create_or_update_organization_definitions
        ],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @custom_properties_for_repos_create_or_update_organization_values_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create or update custom property values for organization repositories\n\nCreate new or update existing custom property values for repositories in a batch that belong to an organization.\nEach target repository will have its custom property values updated to match the values provided in the request.\n\nA maximum of 30 repositories can be updated in a single request.\n\nUsing a value of `null` for a custom property will remove or 'unset' the property value from the repository.\n\nTo use this endpoint, the authenticated user must be one of:\n  - An administrator for the organization.\n  - A user, or a user on a team, with the fine-grained permission of `custom_properties_org_values_editor` in the organization."
  @spec custom_properties_for_repos_create_or_update_organization_values(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def custom_properties_for_repos_create_or_update_organization_values(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    operation =
      build_custom_properties_for_repos_create_or_update_organization_values_operation(params)

    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_custom_properties_for_repos_create_or_update_organization_values_operation(params)
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @custom_properties_for_repos_create_or_update_organization_values_partition_spec
      )

    Pristine.Operation.new(%{
      id: "orgs/custom-properties-for-repos-create-or-update-organization-values",
      method: :patch,
      path_template: "/orgs/{org}/properties/values",
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
        telemetry_event: [
          :github_ex,
          :orgs,
          :custom_properties_for_repos_create_or_update_organization_values
        ],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @custom_properties_for_repos_delete_organization_definition_partition_spec %{
    path: [{"org", :org}, {"custom_property_name", :custom_property_name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove a custom property for an organization\n\nRemoves a custom property that is defined for an organization.\n\nTo use this endpoint, the authenticated user must be one of:\n  - An administrator for the organization.\n  - A user, or a user on a team, with the fine-grained permission of `custom_properties_org_definitions_manager` in the organization."
  @spec custom_properties_for_repos_delete_organization_definition(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def custom_properties_for_repos_delete_organization_definition(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_custom_properties_for_repos_delete_organization_definition_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_custom_properties_for_repos_delete_organization_definition_operation(params)
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @custom_properties_for_repos_delete_organization_definition_partition_spec
      )

    Pristine.Operation.new(%{
      id: "orgs/custom-properties-for-repos-delete-organization-definition",
      method: :delete,
      path_template: "/orgs/{org}/properties/schema/{custom_property_name}",
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
        retry_group: "github.delete",
        telemetry_event: [
          :github_ex,
          :orgs,
          :custom_properties_for_repos_delete_organization_definition
        ],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @custom_properties_for_repos_get_organization_definition_partition_spec %{
    path: [{"org", :org}, {"custom_property_name", :custom_property_name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a custom property for an organization\n\nGets a custom property that is defined for an organization.\nOrganization members can read these properties."
  @spec custom_properties_for_repos_get_organization_definition(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def custom_properties_for_repos_get_organization_definition(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_custom_properties_for_repos_get_organization_definition_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_custom_properties_for_repos_get_organization_definition_operation(params)
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @custom_properties_for_repos_get_organization_definition_partition_spec
      )

    Pristine.Operation.new(%{
      id: "orgs/custom-properties-for-repos-get-organization-definition",
      method: :get,
      path_template: "/orgs/{org}/properties/schema/{custom_property_name}",
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
        telemetry_event: [
          :github_ex,
          :orgs,
          :custom_properties_for_repos_get_organization_definition
        ],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @custom_properties_for_repos_get_organization_definitions_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get all custom properties for an organization\n\nGets all custom properties defined for an organization.\nOrganization members can read these properties."
  @spec custom_properties_for_repos_get_organization_definitions(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def custom_properties_for_repos_get_organization_definitions(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_custom_properties_for_repos_get_organization_definitions_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_custom_properties_for_repos_get_organization_definitions_operation(params)
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @custom_properties_for_repos_get_organization_definitions_partition_spec
      )

    Pristine.Operation.new(%{
      id: "orgs/custom-properties-for-repos-get-organization-definitions",
      method: :get,
      path_template: "/orgs/{org}/properties/schema",
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
        telemetry_event: [
          :github_ex,
          :orgs,
          :custom_properties_for_repos_get_organization_definitions
        ],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @custom_properties_for_repos_get_organization_values_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"per_page", :per_page},
      {"page", :page},
      {"repository_query", :repository_query}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List custom property values for organization repositories\n\nLists organization repositories with all of their custom property values.\nOrganization members can read these properties."
  @spec custom_properties_for_repos_get_organization_values(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def custom_properties_for_repos_get_organization_values(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_custom_properties_for_repos_get_organization_values_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_custom_properties_for_repos_get_organization_values(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_custom_properties_for_repos_get_organization_values(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_custom_properties_for_repos_get_organization_values_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_custom_properties_for_repos_get_organization_values_operation(params)
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @custom_properties_for_repos_get_organization_values_partition_spec
      )

    Pristine.Operation.new(%{
      id: "orgs/custom-properties-for-repos-get-organization-values",
      method: :get,
      path_template: "/orgs/{org}/properties/values",
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
        telemetry_event: [:github_ex, :orgs, :custom_properties_for_repos_get_organization_values],
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

  @delete_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete an organization\n\nDeletes an organization and all its repositories.\n\nThe organization login will be unavailable for 90 days after deletion.\n\nPlease review the Terms of Service regarding account deletion before using this endpoint:\n\nhttps://docs.github.com/site-policy/github-terms/github-terms-of-service"
  @spec delete(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_delete_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_delete_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/delete",
      method: :delete,
      path_template: "/orgs/{org}",
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
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :orgs, :delete],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_attestations_bulk_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete attestations in bulk\n\nDelete artifact attestations in bulk by either subject digests or unique ID."
  @spec delete_attestations_bulk(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_attestations_bulk(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_delete_attestations_bulk_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_delete_attestations_bulk_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_attestations_bulk_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/delete-attestations-bulk",
      method: :post,
      path_template: "/orgs/{org}/attestations/delete-request",
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
        telemetry_event: [:github_ex, :orgs, :delete_attestations_bulk],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_attestations_by_id_partition_spec %{
    path: [{"org", :org}, {"attestation_id", :attestation_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete attestations by ID\n\nDelete an artifact attestation by unique ID that is associated with a repository owned by an org."
  @spec delete_attestations_by_id(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_attestations_by_id(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_delete_attestations_by_id_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_delete_attestations_by_id_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_attestations_by_id_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/delete-attestations-by-id",
      method: :delete,
      path_template: "/orgs/{org}/attestations/{attestation_id}",
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
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :orgs, :delete_attestations_by_id],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_attestations_by_subject_digest_partition_spec %{
    path: [{"org", :org}, {"subject_digest", :subject_digest}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete attestations by subject digest\n\nDelete an artifact attestation by subject digest."
  @spec delete_attestations_by_subject_digest(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def delete_attestations_by_subject_digest(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_delete_attestations_by_subject_digest_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_delete_attestations_by_subject_digest_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @delete_attestations_by_subject_digest_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/delete-attestations-by-subject-digest",
      method: :delete,
      path_template: "/orgs/{org}/attestations/digest/{subject_digest}",
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
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :orgs, :delete_attestations_by_subject_digest],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_issue_field_partition_spec %{
    path: [{"org", :org}, {"issue_field_id", :issue_field_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete issue field for an organization\n\nDeletes an issue field for an organization.\n\nYou can find out more about issue fields in [Managing issue fields in an organization](https://docs.github.com/issues/tracking-your-work-with-issues/using-issues/managing-issue-fields-in-an-organization).\n\nTo use this endpoint, the authenticated user must be an administrator for the organization. OAuth app tokens and\npersonal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec delete_issue_field(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_issue_field(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_delete_issue_field_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_delete_issue_field_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_issue_field_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/delete-issue-field",
      method: :delete,
      path_template: "/orgs/{org}/issue-fields/{issue_field_id}",
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
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :orgs, :delete_issue_field],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_issue_type_partition_spec %{
    path: [{"org", :org}, {"issue_type_id", :issue_type_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete issue type for an organization\n\nDeletes an issue type for an organization.\n\nYou can find out more about issue types in [Managing issue types in an organization](https://docs.github.com/issues/tracking-your-work-with-issues/configuring-issues/managing-issue-types-in-an-organization).\n\nTo use this endpoint, the authenticated user must be an administrator for the organization. OAuth app tokens and\npersonal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec delete_issue_type(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_issue_type(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_delete_issue_type_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_delete_issue_type_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_issue_type_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/delete-issue-type",
      method: :delete,
      path_template: "/orgs/{org}/issue-types/{issue_type_id}",
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
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :orgs, :delete_issue_type],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_webhook_partition_spec %{
    path: [{"org", :org}, {"hook_id", :hook_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete an organization webhook\n\nDelete a webhook for an organization.\n\nThe authenticated user must be an organization owner to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need `admin:org_hook` scope. OAuth apps cannot list, view, or edit\nwebhooks that they did not create and users cannot list, view, or edit webhooks that were created by OAuth apps."
  @spec delete_webhook(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_webhook(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_delete_webhook_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_delete_webhook_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_webhook_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/delete-webhook",
      method: :delete,
      path_template: "/orgs/{org}/hooks/{hook_id}",
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
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :orgs, :delete_webhook],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @disable_selected_repository_immutable_releases_organization_partition_spec %{
    path: [{"org", :org}, {"repository_id", :repository_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Disable a selected repository for immutable releases in an organization\n\nRemoves a repository from the list of selected repositories that are enforced for immutable releases in an organization. To use this endpoint, the organization immutable releases policy for `enforced_repositories` must be configured to `selected`.\n\nOAuth tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec disable_selected_repository_immutable_releases_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def disable_selected_repository_immutable_releases_organization(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    operation =
      build_disable_selected_repository_immutable_releases_organization_operation(params)

    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_disable_selected_repository_immutable_releases_organization_operation(params)
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @disable_selected_repository_immutable_releases_organization_partition_spec
      )

    Pristine.Operation.new(%{
      id: "orgs/disable-selected-repository-immutable-releases-organization",
      method: :delete,
      path_template: "/orgs/{org}/settings/immutable-releases/repositories/{repository_id}",
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
        retry_group: "github.delete",
        telemetry_event: [
          :github_ex,
          :orgs,
          :disable_selected_repository_immutable_releases_organization
        ],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @enable_or_disable_security_product_on_all_org_repos_partition_spec %{
    path: [
      {"org", :org},
      {"security_product", :security_product},
      {"enablement", :enablement}
    ],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Enable or disable a security feature for an organization\n\n> [!WARNING]\n> **Closing down notice:** The ability to enable or disable a security feature for all eligible repositories in an organization is closing down. Please use [code security configurations](https://docs.github.com/rest/code-security/configurations) instead. For more information, see the [changelog](https://github.blog/changelog/2024-07-22-deprecation-of-api-endpoint-to-enable-or-disable-a-security-feature-for-an-organization/).\n\nEnables or disables the specified security feature for all eligible repositories in an organization. For more information, see \"[Managing security managers in your organization](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/managing-security-managers-in-your-organization).\"\n\nThe authenticated user must be an organization owner or be member of a team with the security manager role to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org`, `write:org`, or `repo` scopes to use this endpoint."
  @spec enable_or_disable_security_product_on_all_org_repos(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def enable_or_disable_security_product_on_all_org_repos(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_enable_or_disable_security_product_on_all_org_repos_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_enable_or_disable_security_product_on_all_org_repos_operation(params)
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @enable_or_disable_security_product_on_all_org_repos_partition_spec
      )

    Pristine.Operation.new(%{
      id: "orgs/enable-or-disable-security-product-on-all-org-repos",
      method: :post,
      path_template: "/orgs/{org}/{security_product}/{enablement}",
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
        telemetry_event: [:github_ex, :orgs, :enable_or_disable_security_product_on_all_org_repos],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @enable_selected_repository_immutable_releases_organization_partition_spec %{
    path: [{"org", :org}, {"repository_id", :repository_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Enable a selected repository for immutable releases in an organization\n\nAdds a repository to the list of selected repositories that are enforced for immutable releases in an organization. To use this endpoint, the organization immutable releases policy for `enforced_repositories` must be configured to `selected`.\n\nOAuth tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec enable_selected_repository_immutable_releases_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def enable_selected_repository_immutable_releases_organization(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_enable_selected_repository_immutable_releases_organization_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_enable_selected_repository_immutable_releases_organization_operation(params)
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @enable_selected_repository_immutable_releases_organization_partition_spec
      )

    Pristine.Operation.new(%{
      id: "orgs/enable-selected-repository-immutable-releases-organization",
      method: :put,
      path_template: "/orgs/{org}/settings/immutable-releases/repositories/{repository_id}",
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
        telemetry_event: [
          :github_ex,
          :orgs,
          :enable_selected_repository_immutable_releases_organization
        ],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get an organization\n\nGets information about an organization.\n\nWhen the value of `two_factor_requirement_enabled` is `true`, the organization requires all members, billing managers, outside collaborators, guest collaborators, repository collaborators, or everyone with access to any repository within the organization to enable [two-factor authentication](https://docs.github.com/articles/securing-your-account-with-two-factor-authentication-2fa/).\n\nTo see the full details about an organization, the authenticated user must be an organization owner.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to see the full details about an organization.\n\nTo see information about an organization's GitHub plan, GitHub Apps need the `Organization plan` permission."
  @spec get(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_get_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_get_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/get",
      method: :get,
      path_template: "/orgs/{org}",
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
        telemetry_event: [:github_ex, :orgs, :get],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_immutable_releases_settings_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get immutable releases settings for an organization\n\nGets the immutable releases policy for repositories in an organization.\n\nOAuth tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec get_immutable_releases_settings(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_immutable_releases_settings(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_get_immutable_releases_settings_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_get_immutable_releases_settings_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @get_immutable_releases_settings_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/get-immutable-releases-settings",
      method: :get,
      path_template: "/orgs/{org}/settings/immutable-releases",
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
        telemetry_event: [:github_ex, :orgs, :get_immutable_releases_settings],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_immutable_releases_settings_repositories_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"page", :page}, {"per_page", :per_page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List selected repositories for immutable releases enforcement\n\nList all of the repositories that have been selected for immutable releases enforcement in an organization.\n\nOAuth tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec get_immutable_releases_settings_repositories(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_immutable_releases_settings_repositories(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_get_immutable_releases_settings_repositories_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_get_immutable_releases_settings_repositories(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_get_immutable_releases_settings_repositories(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_get_immutable_releases_settings_repositories_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_get_immutable_releases_settings_repositories_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @get_immutable_releases_settings_repositories_partition_spec
      )

    Pristine.Operation.new(%{
      id: "orgs/get-immutable-releases-settings-repositories",
      method: :get,
      path_template: "/orgs/{org}/settings/immutable-releases/repositories",
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
        telemetry_event: [:github_ex, :orgs, :get_immutable_releases_settings_repositories],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: ["repositories"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
  end

  @get_membership_for_authenticated_user_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get an organization membership for the authenticated user\n\nIf the authenticated user is an active or pending member of the organization, this endpoint will return the user's membership. If the authenticated user is not affiliated with the organization, a `404` is returned. This endpoint will return a `403` if the request is made by a GitHub App that is blocked by the organization."
  @spec get_membership_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_membership_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_get_membership_for_authenticated_user_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_get_membership_for_authenticated_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @get_membership_for_authenticated_user_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/get-membership-for-authenticated-user",
      method: :get,
      path_template: "/user/memberships/orgs/{org}",
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
        telemetry_event: [:github_ex, :orgs, :get_membership_for_authenticated_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_membership_for_user_partition_spec %{
    path: [{"org", :org}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get organization membership for a user\n\nIn order to get a user's membership with an organization, the authenticated user must be an organization member. The `state` parameter in the response can be used to identify the user's membership status."
  @spec get_membership_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_membership_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_get_membership_for_user_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_get_membership_for_user_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_membership_for_user_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/get-membership-for-user",
      method: :get,
      path_template: "/orgs/{org}/memberships/{username}",
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
        telemetry_event: [:github_ex, :orgs, :get_membership_for_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_org_role_partition_spec %{
    path: [{"org", :org}, {"role_id", :role_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get an organization role\n\nGets an organization role that is available to this organization. For more information on organization roles, see \"[Using organization roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles).\"\n\nTo use this endpoint, the authenticated user must be one of:\n\n- An administrator for the organization.\n- A user, or a user on a team, with the fine-grained permissions of `read_organization_custom_org_role` in the organization.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec get_org_role(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_org_role(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_get_org_role_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_get_org_role_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_org_role_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/get-org-role",
      method: :get,
      path_template: "/orgs/{org}/organization-roles/{role_id}",
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
        telemetry_event: [:github_ex, :orgs, :get_org_role],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_org_ruleset_history_partition_spec %{
    path: [{"org", :org}, {"ruleset_id", :ruleset_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get organization ruleset history\n\nGet the history of an organization ruleset."
  @spec get_org_ruleset_history(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_org_ruleset_history(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_get_org_ruleset_history_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_get_org_ruleset_history(term(), map(), keyword()) :: Enumerable.t()
  def stream_get_org_ruleset_history(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_get_org_ruleset_history_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_get_org_ruleset_history_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_org_ruleset_history_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/get-org-ruleset-history",
      method: :get,
      path_template: "/orgs/{org}/rulesets/{ruleset_id}/history",
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
        telemetry_event: [:github_ex, :orgs, :get_org_ruleset_history],
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

  @get_org_ruleset_version_partition_spec %{
    path: [
      {"org", :org},
      {"ruleset_id", :ruleset_id},
      {"version_id", :version_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get organization ruleset version\n\nGet a version of an organization ruleset."
  @spec get_org_ruleset_version(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_org_ruleset_version(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_get_org_ruleset_version_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_get_org_ruleset_version_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_org_ruleset_version_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/get-org-ruleset-version",
      method: :get,
      path_template: "/orgs/{org}/rulesets/{ruleset_id}/history/{version_id}",
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
        telemetry_event: [:github_ex, :orgs, :get_org_ruleset_version],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_webhook_partition_spec %{
    path: [{"org", :org}, {"hook_id", :hook_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get an organization webhook\n\nReturns a webhook configured in an organization. To get only the webhook\n`config` properties, see \"[Get a webhook configuration for an organization](/rest/orgs/webhooks#get-a-webhook-configuration-for-an-organization).\n\nYou must be an organization owner to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need `admin:org_hook` scope. OAuth apps cannot list, view, or edit\nwebhooks that they did not create and users cannot list, view, or edit webhooks that were created by OAuth apps."
  @spec get_webhook(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_webhook(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_get_webhook_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_get_webhook_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_webhook_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/get-webhook",
      method: :get,
      path_template: "/orgs/{org}/hooks/{hook_id}",
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
        telemetry_event: [:github_ex, :orgs, :get_webhook],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_webhook_config_for_org_partition_spec %{
    path: [{"org", :org}, {"hook_id", :hook_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a webhook configuration for an organization\n\nReturns the webhook configuration for an organization. To get more information about the webhook, including the `active` state and `events`, use \"[Get an organization webhook ](/rest/orgs/webhooks#get-an-organization-webhook).\"\n\nYou must be an organization owner to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need `admin:org_hook` scope. OAuth apps cannot list, view, or edit\nwebhooks that they did not create and users cannot list, view, or edit webhooks that were created by OAuth apps."
  @spec get_webhook_config_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_webhook_config_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_get_webhook_config_for_org_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_get_webhook_config_for_org_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_webhook_config_for_org_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/get-webhook-config-for-org",
      method: :get,
      path_template: "/orgs/{org}/hooks/{hook_id}/config",
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
        telemetry_event: [:github_ex, :orgs, :get_webhook_config_for_org],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_webhook_delivery_partition_spec %{
    path: [{"org", :org}, {"hook_id", :hook_id}, {"delivery_id", :delivery_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a webhook delivery for an organization webhook\n\nReturns a delivery for a webhook configured in an organization.\n\nYou must be an organization owner to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need `admin:org_hook` scope. OAuth apps cannot list, view, or edit\nwebhooks that they did not create and users cannot list, view, or edit webhooks that were created by OAuth apps."
  @spec get_webhook_delivery(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_webhook_delivery(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_get_webhook_delivery_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_get_webhook_delivery_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_webhook_delivery_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/get-webhook-delivery",
      method: :get,
      path_template: "/orgs/{org}/hooks/{hook_id}/deliveries/{delivery_id}",
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
        telemetry_event: [:github_ex, :orgs, :get_webhook_delivery],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @list_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"since", :since}, {"per_page", :per_page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List organizations\n\nLists all organizations, in the order that they were created.\n\n> [!NOTE]\n> Pagination is powered exclusively by the `since` parameter. Use the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers) to get the URL for the next page of organizations."
  @spec list(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list(term(), map(), keyword()) :: Enumerable.t()
  def stream_list(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/list",
      method: :get,
      path_template: "/organizations",
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
        telemetry_event: [:github_ex, :orgs, :list],
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

  @list_app_installations_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List app installations for an organization\n\nLists all GitHub Apps in an organization. The installation count includes\nall GitHub Apps installed on repositories in the organization.\n\nThe authenticated user must be an organization owner to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:read` scope to use this endpoint."
  @spec list_app_installations(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_app_installations(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_app_installations_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_app_installations(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_app_installations(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_app_installations_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_app_installations_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_app_installations_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/list-app-installations",
      method: :get,
      path_template: "/orgs/{org}/installations",
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
        telemetry_event: [:github_ex, :orgs, :list_app_installations],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: ["installations"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
  end

  @list_artifact_deployment_records_partition_spec %{
    path: [{"org", :org}, {"subject_digest", :subject_digest}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List artifact deployment records\n\nList deployment records for an artifact metadata associated with an organization."
  @spec list_artifact_deployment_records(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_artifact_deployment_records(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_artifact_deployment_records_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_artifact_deployment_records(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_artifact_deployment_records(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_artifact_deployment_records_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_artifact_deployment_records_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @list_artifact_deployment_records_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/list-artifact-deployment-records",
      method: :get,
      path_template: "/orgs/{org}/artifacts/{subject_digest}/metadata/deployment-records",
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
        telemetry_event: [:github_ex, :orgs, :list_artifact_deployment_records],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: ["deployment_records"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
  end

  @list_artifact_storage_records_partition_spec %{
    path: [{"org", :org}, {"subject_digest", :subject_digest}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List artifact storage records\n\nList a collection of artifact storage records with a given subject digest that are associated with repositories owned by an organization.\n\nThe collection of storage records returned by this endpoint is filtered according to the authenticated user's permissions; if the authenticated user cannot read a repository, the attestations associated with that repository will not be included in the response. In addition, when using a fine-grained access token the `content:read` permission is required."
  @spec list_artifact_storage_records(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_artifact_storage_records(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_artifact_storage_records_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_artifact_storage_records(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_artifact_storage_records(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_artifact_storage_records_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_artifact_storage_records_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @list_artifact_storage_records_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/list-artifact-storage-records",
      method: :get,
      path_template: "/orgs/{org}/artifacts/{subject_digest}/metadata/storage-records",
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
        telemetry_event: [:github_ex, :orgs, :list_artifact_storage_records],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: ["storage_records"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
  end

  @list_attestation_repositories_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"per_page", :per_page},
      {"before", :before},
      {"after", :after},
      {"predicate_type", :predicate_type}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List attestation repositories\n\nList repositories owned by the provided organization that have created at least one attested artifact\nResults will be sorted in ascending order by repository ID"
  @spec list_attestation_repositories(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_attestation_repositories(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_attestation_repositories_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_attestation_repositories(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_attestation_repositories(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_attestation_repositories_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_attestation_repositories_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @list_attestation_repositories_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/list-attestation-repositories",
      method: :get,
      path_template: "/orgs/{org}/attestations/repositories",
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
        telemetry_event: [:github_ex, :orgs, :list_attestation_repositories],
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

  @list_attestations_partition_spec %{
    path: [{"org", :org}, {"subject_digest", :subject_digest}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"per_page", :per_page},
      {"before", :before},
      {"after", :after},
      {"predicate_type", :predicate_type}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List attestations\n\nList a collection of artifact attestations with a given subject digest that are associated with repositories owned by an organization.\n\nThe collection of attestations returned by this endpoint is filtered according to the authenticated user's permissions; if the authenticated user cannot read a repository, the attestations associated with that repository will not be included in the response. In addition, when using a fine-grained access token the `attestations:read` permission is required.\n\n**Please note:** in order to offer meaningful security benefits, an attestation's signature and timestamps **must** be cryptographically verified, and the identity of the attestation signer **must** be validated. Attestations can be verified using the [GitHub CLI `attestation verify` command](https://cli.github.com/manual/gh_attestation_verify). For more information, see [our guide on how to use artifact attestations to establish a build's provenance](https://docs.github.com/actions/security-guides/using-artifact-attestations-to-establish-provenance-for-builds)."
  @spec list_attestations(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_attestations(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_attestations_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_attestations(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_attestations(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_attestations_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_attestations_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_attestations_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/list-attestations",
      method: :get,
      path_template: "/orgs/{org}/attestations/{subject_digest}",
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
        telemetry_event: [:github_ex, :orgs, :list_attestations],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: ["attestations"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
  end

  @list_attestations_bulk_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [{"per_page", :per_page}, {"before", :before}, {"after", :after}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List attestations by bulk subject digests\n\nList a collection of artifact attestations associated with any entry in a list of subject digests owned by an organization.\n\nThe collection of attestations returned by this endpoint is filtered according to the authenticated user's permissions; if the authenticated user cannot read a repository, the attestations associated with that repository will not be included in the response. In addition, when using a fine-grained access token the `attestations:read` permission is required.\n\n**Please note:** in order to offer meaningful security benefits, an attestation's signature and timestamps **must** be cryptographically verified, and the identity of the attestation signer **must** be validated. Attestations can be verified using the [GitHub CLI `attestation verify` command](https://cli.github.com/manual/gh_attestation_verify). For more information, see [our guide on how to use artifact attestations to establish a build's provenance](https://docs.github.com/actions/security-guides/using-artifact-attestations-to-establish-provenance-for-builds)."
  @spec list_attestations_bulk(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_attestations_bulk(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_attestations_bulk_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_list_attestations_bulk_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_attestations_bulk_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/list-attestations-bulk",
      method: :post,
      path_template: "/orgs/{org}/attestations/bulk-list",
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
        telemetry_event: [:github_ex, :orgs, :list_attestations_bulk],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @list_blocked_users_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List users blocked by an organization\n\nList the users blocked by an organization."
  @spec list_blocked_users(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_blocked_users(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_blocked_users_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_blocked_users(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_blocked_users(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_blocked_users_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_blocked_users_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_blocked_users_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/list-blocked-users",
      method: :get,
      path_template: "/orgs/{org}/blocks",
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
        telemetry_event: [:github_ex, :orgs, :list_blocked_users],
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

  @list_failed_invitations_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List failed organization invitations\n\nThe return hash contains `failed_at` and `failed_reason` fields which represent the time at which the invitation failed and the reason for the failure."
  @spec list_failed_invitations(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_failed_invitations(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_failed_invitations_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_failed_invitations(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_failed_invitations(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_failed_invitations_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_failed_invitations_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_failed_invitations_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/list-failed-invitations",
      method: :get,
      path_template: "/orgs/{org}/failed_invitations",
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
        telemetry_event: [:github_ex, :orgs, :list_failed_invitations],
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

  @list_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List organizations for the authenticated user\n\nList organizations for the authenticated user.\n\nFor OAuth app tokens and personal access tokens (classic), this endpoint only lists organizations that your authorization allows you to operate on in some way (e.g., you can list teams with `read:org` scope, you can publicize your organization membership with `user` scope, etc.). Therefore, this API requires at least `user` or `read:org` scope for OAuth app tokens and personal access tokens (classic). Requests with insufficient scope will receive a `403 Forbidden` response.\n\n> [!NOTE]\n> Requests using a fine-grained access token will receive a `200 Success` response with an empty list."
  @spec list_for_authenticated_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_for_authenticated_user_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_for_authenticated_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_for_authenticated_user_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_for_authenticated_user_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_for_authenticated_user_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/list-for-authenticated-user",
      method: :get,
      path_template: "/user/orgs",
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
        telemetry_event: [:github_ex, :orgs, :list_for_authenticated_user],
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

  @list_for_user_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List organizations for a user\n\nList [public organization memberships](https://docs.github.com/articles/publicizing-or-concealing-organization-membership) for the specified user.\n\nThis method only lists _public_ memberships, regardless of authentication. If you need to fetch all of the organization memberships (public and private) for the authenticated user, use the [List organizations for the authenticated user](https://docs.github.com/rest/orgs/orgs#list-organizations-for-the-authenticated-user) API instead."
  @spec list_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_for_user_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_for_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_for_user_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_for_user_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_for_user_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/list-for-user",
      method: :get,
      path_template: "/users/{username}/orgs",
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
        telemetry_event: [:github_ex, :orgs, :list_for_user],
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

  @list_invitation_teams_partition_spec %{
    path: [{"org", :org}, {"invitation_id", :invitation_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List organization invitation teams\n\nList all teams associated with an invitation. In order to see invitations in an organization, the authenticated user must be an organization owner."
  @spec list_invitation_teams(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_invitation_teams(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_invitation_teams_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_invitation_teams(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_invitation_teams(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_invitation_teams_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_invitation_teams_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_invitation_teams_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/list-invitation-teams",
      method: :get,
      path_template: "/orgs/{org}/invitations/{invitation_id}/teams",
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
        telemetry_event: [:github_ex, :orgs, :list_invitation_teams],
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

  @list_issue_fields_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List issue fields for an organization\n\nLists all issue fields for an organization. OAuth app tokens and personal access tokens (classic) need the read:org scope to use this endpoint."
  @spec list_issue_fields(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_issue_fields(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_issue_fields_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_issue_fields(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_issue_fields(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_issue_fields_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_issue_fields_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_issue_fields_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/list-issue-fields",
      method: :get,
      path_template: "/orgs/{org}/issue-fields",
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
        telemetry_event: [:github_ex, :orgs, :list_issue_fields],
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

  @list_issue_types_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List issue types for an organization\n\nLists all issue types for an organization. OAuth app tokens and personal access tokens (classic) need the read:org scope to use this endpoint."
  @spec list_issue_types(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_issue_types(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_issue_types_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_issue_types(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_issue_types(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_issue_types_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_issue_types_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_issue_types_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/list-issue-types",
      method: :get,
      path_template: "/orgs/{org}/issue-types",
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
        telemetry_event: [:github_ex, :orgs, :list_issue_types],
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

  @list_members_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"filter", :filter},
      {"role", :role},
      {"per_page", :per_page},
      {"page", :page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List organization members\n\nList all users who are members of an organization. If the authenticated user is also a member of this organization then both concealed and public members will be returned."
  @spec list_members(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_members(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_members_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_members(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_members(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_members_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_members_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_members_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/list-members",
      method: :get,
      path_template: "/orgs/{org}/members",
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
        telemetry_event: [:github_ex, :orgs, :list_members],
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

  @list_memberships_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"state", :state}, {"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List organization memberships for the authenticated user\n\nLists all of the authenticated user's organization memberships."
  @spec list_memberships_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_memberships_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_memberships_for_authenticated_user_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_memberships_for_authenticated_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_memberships_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_memberships_for_authenticated_user_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_memberships_for_authenticated_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @list_memberships_for_authenticated_user_partition_spec
      )

    Pristine.Operation.new(%{
      id: "orgs/list-memberships-for-authenticated-user",
      method: :get,
      path_template: "/user/memberships/orgs",
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
        telemetry_event: [:github_ex, :orgs, :list_memberships_for_authenticated_user],
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

  @list_org_role_teams_partition_spec %{
    path: [{"org", :org}, {"role_id", :role_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List teams that are assigned to an organization role\n\nLists the teams that are assigned to an organization role. For more information on organization roles, see \"[Using organization roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles).\"\n\nTo use this endpoint, you must be an administrator for the organization.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec list_org_role_teams(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_org_role_teams(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_org_role_teams_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_org_role_teams(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_org_role_teams(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_org_role_teams_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_org_role_teams_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_org_role_teams_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/list-org-role-teams",
      method: :get,
      path_template: "/orgs/{org}/organization-roles/{role_id}/teams",
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
        telemetry_event: [:github_ex, :orgs, :list_org_role_teams],
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

  @list_org_role_users_partition_spec %{
    path: [{"org", :org}, {"role_id", :role_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List users that are assigned to an organization role\n\nLists organization members that are assigned to an organization role. For more information on organization roles, see \"[Using organization roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles).\"\n\nTo use this endpoint, you must be an administrator for the organization.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec list_org_role_users(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_org_role_users(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_org_role_users_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_org_role_users(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_org_role_users(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_org_role_users_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_org_role_users_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_org_role_users_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/list-org-role-users",
      method: :get,
      path_template: "/orgs/{org}/organization-roles/{role_id}/users",
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
        telemetry_event: [:github_ex, :orgs, :list_org_role_users],
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

  @list_org_roles_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get all organization roles for an organization\n\nLists the organization roles available in this organization. For more information on organization roles, see \"[Using organization roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles).\"\n\nTo use this endpoint, the authenticated user must be one of:\n\n- An administrator for the organization.\n- A user, or a user on a team, with the fine-grained permissions of `read_organization_custom_org_role` in the organization.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec list_org_roles(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_org_roles(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_org_roles_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_org_roles(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_org_roles(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_org_roles_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_org_roles_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_org_roles_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/list-org-roles",
      method: :get,
      path_template: "/orgs/{org}/organization-roles",
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
        telemetry_event: [:github_ex, :orgs, :list_org_roles],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: ["roles"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
  end

  @list_outside_collaborators_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"filter", :filter}, {"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List outside collaborators for an organization\n\nList all users who are outside collaborators of an organization."
  @spec list_outside_collaborators(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_outside_collaborators(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_outside_collaborators_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_outside_collaborators(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_outside_collaborators(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_outside_collaborators_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_outside_collaborators_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_outside_collaborators_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/list-outside-collaborators",
      method: :get,
      path_template: "/orgs/{org}/outside_collaborators",
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
        telemetry_event: [:github_ex, :orgs, :list_outside_collaborators],
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

  @list_pat_grant_repositories_partition_spec %{
    path: [{"org", :org}, {"pat_id", :pat_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List repositories a fine-grained personal access token has access to\n\nLists the repositories a fine-grained personal access token has access to.\n\nOnly GitHub Apps can use this endpoint."
  @spec list_pat_grant_repositories(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_pat_grant_repositories(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_pat_grant_repositories_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_pat_grant_repositories(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_pat_grant_repositories(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_pat_grant_repositories_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_pat_grant_repositories_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_pat_grant_repositories_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/list-pat-grant-repositories",
      method: :get,
      path_template: "/orgs/{org}/personal-access-tokens/{pat_id}/repositories",
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
        telemetry_event: [:github_ex, :orgs, :list_pat_grant_repositories],
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

  @list_pat_grant_request_repositories_partition_spec %{
    path: [{"org", :org}, {"pat_request_id", :pat_request_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List repositories requested to be accessed by a fine-grained personal access token\n\nLists the repositories a fine-grained personal access token request is requesting access to.\n\nOnly GitHub Apps can use this endpoint."
  @spec list_pat_grant_request_repositories(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_pat_grant_request_repositories(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_pat_grant_request_repositories_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_pat_grant_request_repositories(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_pat_grant_request_repositories(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_pat_grant_request_repositories_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_pat_grant_request_repositories_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @list_pat_grant_request_repositories_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/list-pat-grant-request-repositories",
      method: :get,
      path_template: "/orgs/{org}/personal-access-token-requests/{pat_request_id}/repositories",
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
        telemetry_event: [:github_ex, :orgs, :list_pat_grant_request_repositories],
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

  @list_pat_grant_requests_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"per_page", :per_page},
      {"page", :page},
      {"sort", :sort},
      {"direction", :direction},
      {"owner", :owner},
      {"repository", :repository},
      {"permission", :permission},
      {"last_used_before", :last_used_before},
      {"last_used_after", :last_used_after},
      {"token_id", :token_id}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List requests to access organization resources with fine-grained personal access tokens\n\nLists requests from organization members to access organization resources with a fine-grained personal access token.\n\nOnly GitHub Apps can use this endpoint."
  @spec list_pat_grant_requests(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_pat_grant_requests(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_pat_grant_requests_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_pat_grant_requests(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_pat_grant_requests(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_pat_grant_requests_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_pat_grant_requests_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_pat_grant_requests_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/list-pat-grant-requests",
      method: :get,
      path_template: "/orgs/{org}/personal-access-token-requests",
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
        telemetry_event: [:github_ex, :orgs, :list_pat_grant_requests],
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

  @list_pat_grants_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"per_page", :per_page},
      {"page", :page},
      {"sort", :sort},
      {"direction", :direction},
      {"owner", :owner},
      {"repository", :repository},
      {"permission", :permission},
      {"last_used_before", :last_used_before},
      {"last_used_after", :last_used_after},
      {"token_id", :token_id}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List fine-grained personal access tokens with access to organization resources\n\nLists approved fine-grained personal access tokens owned by organization members that can access organization resources.\n\nOnly GitHub Apps can use this endpoint."
  @spec list_pat_grants(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_pat_grants(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_pat_grants_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_pat_grants(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_pat_grants(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_pat_grants_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_pat_grants_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_pat_grants_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/list-pat-grants",
      method: :get,
      path_template: "/orgs/{org}/personal-access-tokens",
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
        telemetry_event: [:github_ex, :orgs, :list_pat_grants],
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

  @list_pending_invitations_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"per_page", :per_page},
      {"page", :page},
      {"role", :role},
      {"invitation_source", :invitation_source}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List pending organization invitations\n\nThe return hash contains a `role` field which refers to the Organization\nInvitation role and will be one of the following values: `direct_member`, `admin`,\n`billing_manager`, or `hiring_manager`. If the invitee is not a GitHub\nmember, the `login` field in the return hash will be `null`."
  @spec list_pending_invitations(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_pending_invitations(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_pending_invitations_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_pending_invitations(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_pending_invitations(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_pending_invitations_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_pending_invitations_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_pending_invitations_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/list-pending-invitations",
      method: :get,
      path_template: "/orgs/{org}/invitations",
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
        telemetry_event: [:github_ex, :orgs, :list_pending_invitations],
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

  @list_public_members_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List public organization members\n\nMembers of an organization can choose to have their membership publicized or not."
  @spec list_public_members(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_public_members(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_public_members_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_public_members(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_public_members(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_public_members_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_public_members_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_public_members_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/list-public-members",
      method: :get,
      path_template: "/orgs/{org}/public_members",
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
        telemetry_event: [:github_ex, :orgs, :list_public_members],
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

  @list_security_manager_teams_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List security manager teams\n\n> [!WARNING]\n> **Closing down notice:** This operation is closing down and will be removed starting January 1, 2026. Please use the \"[Organization Roles](https://docs.github.com/rest/orgs/organization-roles)\" endpoints instead."
  @spec list_security_manager_teams(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_security_manager_teams(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_security_manager_teams_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_security_manager_teams(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_security_manager_teams(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_security_manager_teams_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_security_manager_teams_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_security_manager_teams_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/list-security-manager-teams",
      method: :get,
      path_template: "/orgs/{org}/security-managers",
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
        telemetry_event: [:github_ex, :orgs, :list_security_manager_teams],
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

  @list_webhook_deliveries_partition_spec %{
    path: [{"org", :org}, {"hook_id", :hook_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"cursor", :cursor}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List deliveries for an organization webhook\n\nReturns a list of webhook deliveries for a webhook configured in an organization.\n\nYou must be an organization owner to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need `admin:org_hook` scope. OAuth apps cannot list, view, or edit\nwebhooks that they did not create and users cannot list, view, or edit webhooks that were created by OAuth apps."
  @spec list_webhook_deliveries(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_webhook_deliveries(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_webhook_deliveries_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_webhook_deliveries(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_webhook_deliveries(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_webhook_deliveries_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_webhook_deliveries_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_webhook_deliveries_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/list-webhook-deliveries",
      method: :get,
      path_template: "/orgs/{org}/hooks/{hook_id}/deliveries",
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
        telemetry_event: [:github_ex, :orgs, :list_webhook_deliveries],
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

  @list_webhooks_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List organization webhooks\n\nList webhooks for an organization.\n\nThe authenticated user must be an organization owner to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need `admin:org_hook` scope. OAuth apps cannot list, view, or edit\nwebhooks that they did not create and users cannot list, view, or edit webhooks that were created by OAuth apps."
  @spec list_webhooks(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_webhooks(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_webhooks_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_webhooks(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_webhooks(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_webhooks_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_webhooks_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_webhooks_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/list-webhooks",
      method: :get,
      path_template: "/orgs/{org}/hooks",
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
        telemetry_event: [:github_ex, :orgs, :list_webhooks],
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

  @ping_webhook_partition_spec %{
    path: [{"org", :org}, {"hook_id", :hook_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Ping an organization webhook\n\nThis will trigger a [ping event](https://docs.github.com/webhooks/#ping-event)\nto be sent to the hook.\n\nYou must be an organization owner to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need `admin:org_hook` scope. OAuth apps cannot list, view, or edit\nwebhooks that they did not create and users cannot list, view, or edit webhooks that were created by OAuth apps."
  @spec ping_webhook(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def ping_webhook(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_ping_webhook_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_ping_webhook_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @ping_webhook_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/ping-webhook",
      method: :post,
      path_template: "/orgs/{org}/hooks/{hook_id}/pings",
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
        telemetry_event: [:github_ex, :orgs, :ping_webhook],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @redeliver_webhook_delivery_partition_spec %{
    path: [{"org", :org}, {"hook_id", :hook_id}, {"delivery_id", :delivery_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Redeliver a delivery for an organization webhook\n\nRedeliver a delivery for a webhook configured in an organization.\n\nYou must be an organization owner to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need `admin:org_hook` scope. OAuth apps cannot list, view, or edit\nwebhooks that they did not create and users cannot list, view, or edit webhooks that were created by OAuth apps."
  @spec redeliver_webhook_delivery(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def redeliver_webhook_delivery(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_redeliver_webhook_delivery_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_redeliver_webhook_delivery_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @redeliver_webhook_delivery_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/redeliver-webhook-delivery",
      method: :post,
      path_template: "/orgs/{org}/hooks/{hook_id}/deliveries/{delivery_id}/attempts",
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
        telemetry_event: [:github_ex, :orgs, :redeliver_webhook_delivery],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @remove_member_partition_spec %{
    path: [{"org", :org}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove an organization member\n\nRemoving a user from this list will remove them from all teams and they will no longer have any access to the organization's repositories.\n\n> [!NOTE]\n> If a user has both direct membership in the organization as well as indirect membership via an enterprise team, only their direct membership will be removed. Their indirect membership via an enterprise team remains until the user is removed from the enterprise team."
  @spec remove_member(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def remove_member(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_remove_member_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_remove_member_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @remove_member_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/remove-member",
      method: :delete,
      path_template: "/orgs/{org}/members/{username}",
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
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :orgs, :remove_member],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @remove_membership_for_user_partition_spec %{
    path: [{"org", :org}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove organization membership for a user\n\nIn order to remove a user's membership with an organization, the authenticated user must be an organization owner.\n\nIf the specified user is an active member of the organization, this will remove them from the organization. If the specified user has been invited to the organization, this will cancel their invitation. The specified user will receive an email notification in both cases.\n\n> [!NOTE]\n> If a user has both direct membership in the organization as well as indirect membership via an enterprise team, only their direct membership will be removed. Their indirect membership via an enterprise team remains until the user is removed from the enterprise team."
  @spec remove_membership_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def remove_membership_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_remove_membership_for_user_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_remove_membership_for_user_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @remove_membership_for_user_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/remove-membership-for-user",
      method: :delete,
      path_template: "/orgs/{org}/memberships/{username}",
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
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :orgs, :remove_membership_for_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @remove_outside_collaborator_partition_spec %{
    path: [{"org", :org}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove outside collaborator from an organization\n\nRemoving a user from this list will remove them from all the organization's repositories."
  @spec remove_outside_collaborator(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def remove_outside_collaborator(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_remove_outside_collaborator_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_remove_outside_collaborator_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @remove_outside_collaborator_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/remove-outside-collaborator",
      method: :delete,
      path_template: "/orgs/{org}/outside_collaborators/{username}",
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
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :orgs, :remove_outside_collaborator],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @remove_public_membership_for_authenticated_user_partition_spec %{
    path: [{"org", :org}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove public organization membership for the authenticated user\n\nRemoves the public membership for the authenticated user from the specified organization, unless public visibility is enforced by default."
  @spec remove_public_membership_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def remove_public_membership_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_remove_public_membership_for_authenticated_user_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_remove_public_membership_for_authenticated_user_operation(params)
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @remove_public_membership_for_authenticated_user_partition_spec
      )

    Pristine.Operation.new(%{
      id: "orgs/remove-public-membership-for-authenticated-user",
      method: :delete,
      path_template: "/orgs/{org}/public_members/{username}",
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
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :orgs, :remove_public_membership_for_authenticated_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @remove_security_manager_team_partition_spec %{
    path: [{"org", :org}, {"team_slug", :team_slug}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove a security manager team\n\n> [!WARNING]\n> **Closing down notice:** This operation is closing down and will be removed starting January 1, 2026. Please use the \"[Organization Roles](https://docs.github.com/rest/orgs/organization-roles)\" endpoints instead."
  @spec remove_security_manager_team(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def remove_security_manager_team(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_remove_security_manager_team_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_remove_security_manager_team_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @remove_security_manager_team_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/remove-security-manager-team",
      method: :delete,
      path_template: "/orgs/{org}/security-managers/teams/{team_slug}",
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
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :orgs, :remove_security_manager_team],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @review_pat_grant_request_partition_spec %{
    path: [{"org", :org}, {"pat_request_id", :pat_request_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Review a request to access organization resources with a fine-grained personal access token\n\nApproves or denies a pending request to access organization resources via a fine-grained personal access token.\n\nOnly GitHub Apps can use this endpoint."
  @spec review_pat_grant_request(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def review_pat_grant_request(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_review_pat_grant_request_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_review_pat_grant_request_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @review_pat_grant_request_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/review-pat-grant-request",
      method: :post,
      path_template: "/orgs/{org}/personal-access-token-requests/{pat_request_id}",
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
        telemetry_event: [:github_ex, :orgs, :review_pat_grant_request],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @review_pat_grant_requests_in_bulk_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Review requests to access organization resources with fine-grained personal access tokens\n\nApproves or denies multiple pending requests to access organization resources via a fine-grained personal access token.\n\nOnly GitHub Apps can use this endpoint."
  @spec review_pat_grant_requests_in_bulk(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def review_pat_grant_requests_in_bulk(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_review_pat_grant_requests_in_bulk_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_review_pat_grant_requests_in_bulk_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @review_pat_grant_requests_in_bulk_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/review-pat-grant-requests-in-bulk",
      method: :post,
      path_template: "/orgs/{org}/personal-access-token-requests",
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
        telemetry_event: [:github_ex, :orgs, :review_pat_grant_requests_in_bulk],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @revoke_all_org_roles_team_partition_spec %{
    path: [{"org", :org}, {"team_slug", :team_slug}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove all organization roles for a team\n\nRemoves all assigned organization roles from a team. For more information on organization roles, see \"[Using organization roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles).\"\n\nThe authenticated user must be an administrator for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec revoke_all_org_roles_team(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def revoke_all_org_roles_team(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_revoke_all_org_roles_team_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_revoke_all_org_roles_team_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @revoke_all_org_roles_team_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/revoke-all-org-roles-team",
      method: :delete,
      path_template: "/orgs/{org}/organization-roles/teams/{team_slug}",
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
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :orgs, :revoke_all_org_roles_team],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @revoke_all_org_roles_user_partition_spec %{
    path: [{"org", :org}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove all organization roles for a user\n\nRevokes all assigned organization roles from a user. For more information on organization roles, see \"[Using organization roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles).\"\n\nThe authenticated user must be an administrator for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec revoke_all_org_roles_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def revoke_all_org_roles_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_revoke_all_org_roles_user_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_revoke_all_org_roles_user_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @revoke_all_org_roles_user_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/revoke-all-org-roles-user",
      method: :delete,
      path_template: "/orgs/{org}/organization-roles/users/{username}",
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
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :orgs, :revoke_all_org_roles_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @revoke_org_role_team_partition_spec %{
    path: [{"org", :org}, {"team_slug", :team_slug}, {"role_id", :role_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove an organization role from a team\n\nRemoves an organization role from a team. For more information on organization roles, see \"[Using organization roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles).\"\n\nThe authenticated user must be an administrator for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec revoke_org_role_team(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def revoke_org_role_team(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_revoke_org_role_team_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_revoke_org_role_team_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @revoke_org_role_team_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/revoke-org-role-team",
      method: :delete,
      path_template: "/orgs/{org}/organization-roles/teams/{team_slug}/{role_id}",
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
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :orgs, :revoke_org_role_team],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @revoke_org_role_user_partition_spec %{
    path: [{"org", :org}, {"username", :username}, {"role_id", :role_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove an organization role from a user\n\nRemove an organization role from a user. For more information on organization roles, see \"[Using organization roles](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/using-organization-roles).\"\n\nThe authenticated user must be an administrator for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec revoke_org_role_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def revoke_org_role_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_revoke_org_role_user_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_revoke_org_role_user_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @revoke_org_role_user_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/revoke-org-role-user",
      method: :delete,
      path_template: "/orgs/{org}/organization-roles/users/{username}/{role_id}",
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
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :orgs, :revoke_org_role_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @set_cluster_deployment_records_partition_spec %{
    path: [{"org", :org}, {"cluster", :cluster}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set cluster deployment records\n\nSet deployment records for a given cluster.\nIf proposed records in the 'deployments' field have identical 'cluster', 'logical_environment',\n'physical_environment', and 'deployment_name' values as existing records, the existing records will be updated.\nIf no existing records match, new records will be created."
  @spec set_cluster_deployment_records(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_cluster_deployment_records(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_set_cluster_deployment_records_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_set_cluster_deployment_records_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @set_cluster_deployment_records_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/set-cluster-deployment-records",
      method: :post,
      path_template: "/orgs/{org}/artifacts/metadata/deployment-record/cluster/{cluster}",
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
        telemetry_event: [:github_ex, :orgs, :set_cluster_deployment_records],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @set_immutable_releases_settings_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set immutable releases settings for an organization\n\nSets the immutable releases policy for repositories in an organization.\n\nOAuth tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec set_immutable_releases_settings(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_immutable_releases_settings(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_set_immutable_releases_settings_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_set_immutable_releases_settings_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @set_immutable_releases_settings_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/set-immutable-releases-settings",
      method: :put,
      path_template: "/orgs/{org}/settings/immutable-releases",
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
        telemetry_event: [:github_ex, :orgs, :set_immutable_releases_settings],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @set_immutable_releases_settings_repositories_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set selected repositories for immutable releases enforcement\n\nReplaces all repositories that have been selected for immutable releases enforcement in an organization. To use this endpoint, the organization immutable releases policy for `enforced_repositories` must be configured to `selected`.\n\nOAuth tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec set_immutable_releases_settings_repositories(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_immutable_releases_settings_repositories(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_set_immutable_releases_settings_repositories_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_set_immutable_releases_settings_repositories_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @set_immutable_releases_settings_repositories_partition_spec
      )

    Pristine.Operation.new(%{
      id: "orgs/set-immutable-releases-settings-repositories",
      method: :put,
      path_template: "/orgs/{org}/settings/immutable-releases/repositories",
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
        telemetry_event: [:github_ex, :orgs, :set_immutable_releases_settings_repositories],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @set_membership_for_user_partition_spec %{
    path: [{"org", :org}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set organization membership for a user\n\nOnly authenticated organization owners can add a member to the organization or update the member's role.\n\n*   If the authenticated user is _adding_ a member to the organization, the invited user will receive an email inviting them to the organization. The user's [membership status](https://docs.github.com/rest/orgs/members#get-organization-membership-for-a-user) will be `pending` until they accept the invitation.\n    \n*   Authenticated users can _update_ a user's membership by passing the `role` parameter. If the authenticated user changes a member's role to `admin`, the affected user will receive an email notifying them that they've been made an organization owner. If the authenticated user changes an owner's role to `member`, no email will be sent.\n\n**Rate limits**\n\nTo prevent abuse, organization owners are limited to creating 50 organization invitations for an organization within a 24 hour period. If the organization is more than one month old or on a paid plan, the limit is 500 invitations per 24 hour period."
  @spec set_membership_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def set_membership_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_set_membership_for_user_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_set_membership_for_user_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @set_membership_for_user_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/set-membership-for-user",
      method: :put,
      path_template: "/orgs/{org}/memberships/{username}",
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
        telemetry_event: [:github_ex, :orgs, :set_membership_for_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @set_public_membership_for_authenticated_user_partition_spec %{
    path: [{"org", :org}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set public organization membership for the authenticated user\n\nThe user can publicize their own membership. (A user cannot publicize the membership for another user.)\n\nNote that you'll need to set `Content-Length` to zero when calling out to this endpoint. For more information, see \"[HTTP method](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method).\""
  @spec set_public_membership_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_public_membership_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_set_public_membership_for_authenticated_user_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_set_public_membership_for_authenticated_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @set_public_membership_for_authenticated_user_partition_spec
      )

    Pristine.Operation.new(%{
      id: "orgs/set-public-membership-for-authenticated-user",
      method: :put,
      path_template: "/orgs/{org}/public_members/{username}",
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
        telemetry_event: [:github_ex, :orgs, :set_public_membership_for_authenticated_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @unblock_user_partition_spec %{
    path: [{"org", :org}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Unblock a user from an organization\n\nUnblocks the given user on behalf of the specified organization."
  @spec unblock_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def unblock_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_unblock_user_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_unblock_user_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @unblock_user_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/unblock-user",
      method: :delete,
      path_template: "/orgs/{org}/blocks/{username}",
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
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :orgs, :unblock_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @update_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update an organization\n\n> [!WARNING]\n> **Closing down notice:** GitHub will replace and discontinue `members_allowed_repository_creation_type` in favor of more granular permissions. The new input parameters are `members_can_create_public_repositories`, `members_can_create_private_repositories` for all organizations and `members_can_create_internal_repositories` for organizations associated with an enterprise account using GitHub Enterprise Cloud or GitHub Enterprise Server 2.20+. For more information, see the [blog post](https://developer.github.com/changes/2019-12-03-internal-visibility-changes).\n\n> [!WARNING]\n> **Closing down notice:** Code security product enablement for new repositories through the organization API is closing down. Please use [code security configurations](https://docs.github.com/rest/code-security/configurations#set-a-code-security-configuration-as-a-default-for-an-organization) to set defaults instead. For more information on setting a default security configuration, see the [changelog](https://github.blog/changelog/2024-07-09-sunsetting-security-settings-defaults-parameters-in-the-organizations-rest-api/).\n\nUpdates the organization's profile and member privileges.\n\nThe authenticated user must be an organization owner to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` or `repo` scope to use this endpoint."
  @spec update(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_update_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_update_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @update_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/update",
      method: :patch,
      path_template: "/orgs/{org}",
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
        telemetry_event: [:github_ex, :orgs, :update],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @update_issue_field_partition_spec %{
    path: [{"org", :org}, {"issue_field_id", :issue_field_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update issue field for an organization\n\nUpdates an issue field for an organization.\n\nYou can find out more about issue fields in [Managing issue fields in an organization](https://docs.github.com/issues/tracking-your-work-with-issues/using-issues/managing-issue-fields-in-an-organization).\n\nTo use this endpoint, the authenticated user must be an administrator for the organization. OAuth app tokens and\npersonal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec update_issue_field(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_issue_field(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_update_issue_field_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_update_issue_field_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @update_issue_field_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/update-issue-field",
      method: :patch,
      path_template: "/orgs/{org}/issue-fields/{issue_field_id}",
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
        telemetry_event: [:github_ex, :orgs, :update_issue_field],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @update_issue_type_partition_spec %{
    path: [{"org", :org}, {"issue_type_id", :issue_type_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update issue type for an organization\n\nUpdates an issue type for an organization.\n\nYou can find out more about issue types in [Managing issue types in an organization](https://docs.github.com/issues/tracking-your-work-with-issues/configuring-issues/managing-issue-types-in-an-organization).\n\nTo use this endpoint, the authenticated user must be an administrator for the organization. OAuth app tokens and\npersonal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec update_issue_type(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_issue_type(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_update_issue_type_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_update_issue_type_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @update_issue_type_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/update-issue-type",
      method: :put,
      path_template: "/orgs/{org}/issue-types/{issue_type_id}",
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
        telemetry_event: [:github_ex, :orgs, :update_issue_type],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @update_membership_for_authenticated_user_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update an organization membership for the authenticated user\n\nConverts the authenticated user to an active member of the organization, if that user has a pending invitation from the organization."
  @spec update_membership_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def update_membership_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_update_membership_for_authenticated_user_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_update_membership_for_authenticated_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @update_membership_for_authenticated_user_partition_spec
      )

    Pristine.Operation.new(%{
      id: "orgs/update-membership-for-authenticated-user",
      method: :patch,
      path_template: "/user/memberships/orgs/{org}",
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
        telemetry_event: [:github_ex, :orgs, :update_membership_for_authenticated_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @update_pat_access_partition_spec %{
    path: [{"org", :org}, {"pat_id", :pat_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update the access a fine-grained personal access token has to organization resources\n\nUpdates the access an organization member has to organization resources via a fine-grained personal access token. Limited to revoking the token's existing access. Limited to revoking a token's existing access.\n\nOnly GitHub Apps can use this endpoint."
  @spec update_pat_access(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_pat_access(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_update_pat_access_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_update_pat_access_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @update_pat_access_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/update-pat-access",
      method: :post,
      path_template: "/orgs/{org}/personal-access-tokens/{pat_id}",
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
        telemetry_event: [:github_ex, :orgs, :update_pat_access],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @update_pat_accesses_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update the access to organization resources via fine-grained personal access tokens\n\nUpdates the access organization members have to organization resources via fine-grained personal access tokens. Limited to revoking a token's existing access.\n\nOnly GitHub Apps can use this endpoint."
  @spec update_pat_accesses(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_pat_accesses(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_update_pat_accesses_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_update_pat_accesses_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @update_pat_accesses_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/update-pat-accesses",
      method: :post,
      path_template: "/orgs/{org}/personal-access-tokens",
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
        telemetry_event: [:github_ex, :orgs, :update_pat_accesses],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @update_webhook_partition_spec %{
    path: [{"org", :org}, {"hook_id", :hook_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update an organization webhook\n\nUpdates a webhook configured in an organization. When you update a webhook,\nthe `secret` will be overwritten. If you previously had a `secret` set, you must\nprovide the same `secret` or set a new `secret` or the secret will be removed. If\nyou are only updating individual webhook `config` properties, use \"[Update a webhook\nconfiguration for an organization](/rest/orgs/webhooks#update-a-webhook-configuration-for-an-organization)\".\n\nYou must be an organization owner to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need `admin:org_hook` scope. OAuth apps cannot list, view, or edit\nwebhooks that they did not create and users cannot list, view, or edit webhooks that were created by OAuth apps."
  @spec update_webhook(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_webhook(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_update_webhook_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_update_webhook_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @update_webhook_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/update-webhook",
      method: :patch,
      path_template: "/orgs/{org}/hooks/{hook_id}",
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
        telemetry_event: [:github_ex, :orgs, :update_webhook],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @update_webhook_config_for_org_partition_spec %{
    path: [{"org", :org}, {"hook_id", :hook_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update a webhook configuration for an organization\n\nUpdates the webhook configuration for an organization. To update more information about the webhook, including the `active` state and `events`, use \"[Update an organization webhook ](/rest/orgs/webhooks#update-an-organization-webhook).\"\n\nYou must be an organization owner to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need `admin:org_hook` scope. OAuth apps cannot list, view, or edit\nwebhooks that they did not create and users cannot list, view, or edit webhooks that were created by OAuth apps."
  @spec update_webhook_config_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def update_webhook_config_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_update_webhook_config_for_org_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_update_webhook_config_for_org_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @update_webhook_config_for_org_partition_spec)

    Pristine.Operation.new(%{
      id: "orgs/update-webhook-config-for-org",
      method: :patch,
      path_template: "/orgs/{org}/hooks/{hook_id}/config",
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
        telemetry_event: [:github_ex, :orgs, :update_webhook_config_for_org],
        timeout_ms: nil
      },
      pagination: nil
    })
  end
end

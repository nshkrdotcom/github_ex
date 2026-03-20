defmodule GitHubEx.EnterpriseTeamMemberships do
  @moduledoc """
  Generated Github Ex operations for enterprise team memberships.
  """

  @add_partition_spec %{
    path: [
      {"enterprise", :enterprise},
      {"enterprise-team", :enterprise_team},
      {"username", :username}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add team member\n\nAdd a team member to an enterprise team."
  @spec add(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def add(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_add_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_add_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @add_partition_spec)

    Pristine.Operation.new(%{
      id: "enterprise-team-memberships/add",
      method: :put,
      path_template: "/enterprises/{enterprise}/teams/{enterprise-team}/memberships/{username}",
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
        telemetry_event: [:github_ex, :enterprise_team_memberships, :add],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @bulk_add_partition_spec %{
    path: [{"enterprise", :enterprise}, {"enterprise-team", :enterprise_team}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Bulk add team members\n\nAdd multiple team members to an enterprise team."
  @spec bulk_add(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def bulk_add(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_bulk_add_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_bulk_add_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @bulk_add_partition_spec)

    Pristine.Operation.new(%{
      id: "enterprise-team-memberships/bulk-add",
      method: :post,
      path_template: "/enterprises/{enterprise}/teams/{enterprise-team}/memberships/add",
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
        telemetry_event: [:github_ex, :enterprise_team_memberships, :bulk_add],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @bulk_remove_partition_spec %{
    path: [{"enterprise", :enterprise}, {"enterprise-team", :enterprise_team}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Bulk remove team members\n\nRemove multiple team members from an enterprise team."
  @spec bulk_remove(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def bulk_remove(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_bulk_remove_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_bulk_remove_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @bulk_remove_partition_spec)

    Pristine.Operation.new(%{
      id: "enterprise-team-memberships/bulk-remove",
      method: :post,
      path_template: "/enterprises/{enterprise}/teams/{enterprise-team}/memberships/remove",
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
        telemetry_event: [:github_ex, :enterprise_team_memberships, :bulk_remove],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_partition_spec %{
    path: [
      {"enterprise", :enterprise},
      {"enterprise-team", :enterprise_team},
      {"username", :username}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get enterprise team membership\n\nReturns whether the user is a member of the enterprise team."
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
      id: "enterprise-team-memberships/get",
      method: :get,
      path_template: "/enterprises/{enterprise}/teams/{enterprise-team}/memberships/{username}",
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
        telemetry_event: [:github_ex, :enterprise_team_memberships, :get],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @list_partition_spec %{
    path: [{"enterprise", :enterprise}, {"enterprise-team", :enterprise_team}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List members in an enterprise team\n\nLists all team members in an enterprise team."
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
      id: "enterprise-team-memberships/list",
      method: :get,
      path_template: "/enterprises/{enterprise}/teams/{enterprise-team}/memberships",
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
        telemetry_event: [:github_ex, :enterprise_team_memberships, :list],
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

  @remove_partition_spec %{
    path: [
      {"enterprise", :enterprise},
      {"enterprise-team", :enterprise_team},
      {"username", :username}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove team membership\n\nRemove membership of a specific user from a particular team in an enterprise."
  @spec remove(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def remove(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_remove_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_remove_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @remove_partition_spec)

    Pristine.Operation.new(%{
      id: "enterprise-team-memberships/remove",
      method: :delete,
      path_template: "/enterprises/{enterprise}/teams/{enterprise-team}/memberships/{username}",
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
        telemetry_event: [:github_ex, :enterprise_team_memberships, :remove],
        timeout_ms: nil
      },
      pagination: nil
    })
  end
end

defmodule GitHubEx.EnterpriseTeams do
  @moduledoc """
  Generated Github Ex operations for enterprise teams.
  """

  @create_partition_spec %{
    path: [{"enterprise", :enterprise}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create an enterprise team\n\nTo create an enterprise team, the authenticated user must be an owner of the enterprise."
  @spec create(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_create_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_create_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @create_partition_spec)

    Pristine.Operation.new(%{
      id: "enterprise-teams/create",
      method: :post,
      path_template: "/enterprises/{enterprise}/teams",
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
        telemetry_event: [:github_ex, :enterprise_teams, :create],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_partition_spec %{
    path: [{"enterprise", :enterprise}, {"team_slug", :team_slug}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete an enterprise team\n\nTo delete an enterprise team, the authenticated user must be an enterprise owner.\n\nIf you are an enterprise owner, deleting an enterprise team will delete all of its IdP mappings as well."
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
      id: "enterprise-teams/delete",
      method: :delete,
      path_template: "/enterprises/{enterprise}/teams/{team_slug}",
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
        telemetry_event: [:github_ex, :enterprise_teams, :delete],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_partition_spec %{
    path: [{"enterprise", :enterprise}, {"team_slug", :team_slug}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Get an enterprise team

       Gets a team using the team's slug. To create the slug, GitHub replaces special characters in the name string, changes all words to lowercase, and replaces spaces with a `-` separator and adds the "ent:" prefix. For example, "My TEam Näme" would become `ent:my-team-name`.
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
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
      id: "enterprise-teams/get",
      method: :get,
      path_template: "/enterprises/{enterprise}/teams/{team_slug}",
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
        telemetry_event: [:github_ex, :enterprise_teams, :get],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @list_partition_spec %{
    path: [{"enterprise", :enterprise}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List enterprise teams\n\nList all teams in the enterprise for the authenticated user"
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
      id: "enterprise-teams/list",
      method: :get,
      path_template: "/enterprises/{enterprise}/teams",
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
        telemetry_event: [:github_ex, :enterprise_teams, :list],
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

  @update_partition_spec %{
    path: [{"enterprise", :enterprise}, {"team_slug", :team_slug}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update an enterprise team\n\nTo edit a team, the authenticated user must be an enterprise owner."
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
      id: "enterprise-teams/update",
      method: :patch,
      path_template: "/enterprises/{enterprise}/teams/{team_slug}",
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
        telemetry_event: [:github_ex, :enterprise_teams, :update],
        timeout_ms: nil
      },
      pagination: nil
    })
  end
end

defmodule GitHubEx.EnterpriseTeamOrganizations do
  @moduledoc """
  Generated Github Ex operations for enterprise team organizations.
  """

  @add_partition_spec %{
    path: [
      {"enterprise", :enterprise},
      {"enterprise-team", :enterprise_team},
      {"org", :org}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add an organization assignment\n\nAssign an enterprise team to an organization."
  @spec add(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def add(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_add_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_add_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @add_partition_spec)

    Pristine.Operation.new(%{
      id: "enterprise-team-organizations/add",
      method: :put,
      path_template: "/enterprises/{enterprise}/teams/{enterprise-team}/organizations/{org}",
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
        telemetry_event: [:github_ex, :enterprise_team_organizations, :add],
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

  @doc "Add organization assignments\n\nAssign an enterprise team to multiple organizations."
  @spec bulk_add(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def bulk_add(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_bulk_add_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_bulk_add_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @bulk_add_partition_spec)

    Pristine.Operation.new(%{
      id: "enterprise-team-organizations/bulk-add",
      method: :post,
      path_template: "/enterprises/{enterprise}/teams/{enterprise-team}/organizations/add",
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
        telemetry_event: [:github_ex, :enterprise_team_organizations, :bulk_add],
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

  @doc "Remove organization assignments\n\nUnassign an enterprise team from multiple organizations."
  @spec bulk_remove(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def bulk_remove(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_bulk_remove_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_bulk_remove_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @bulk_remove_partition_spec)

    Pristine.Operation.new(%{
      id: "enterprise-team-organizations/bulk-remove",
      method: :post,
      path_template: "/enterprises/{enterprise}/teams/{enterprise-team}/organizations/remove",
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
        telemetry_event: [:github_ex, :enterprise_team_organizations, :bulk_remove],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_partition_spec %{
    path: [
      {"enterprise", :enterprise},
      {"enterprise-team", :enterprise_team},
      {"org", :org}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete an organization assignment\n\nUnassign an enterprise team from an organization."
  @spec delete(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_delete_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_delete_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_partition_spec)

    Pristine.Operation.new(%{
      id: "enterprise-team-organizations/delete",
      method: :delete,
      path_template: "/enterprises/{enterprise}/teams/{enterprise-team}/organizations/{org}",
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
        telemetry_event: [:github_ex, :enterprise_team_organizations, :delete],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_assignment_partition_spec %{
    path: [
      {"enterprise", :enterprise},
      {"enterprise-team", :enterprise_team},
      {"org", :org}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get organization assignment\n\nCheck if an enterprise team is assigned to an organization"
  @spec get_assignment(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_assignment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_assignment_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_assignment_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_assignment_partition_spec)

    Pristine.Operation.new(%{
      id: "enterprise-team-organizations/get-assignment",
      method: :get,
      path_template: "/enterprises/{enterprise}/teams/{enterprise-team}/organizations/{org}",
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
        telemetry_event: [:github_ex, :enterprise_team_organizations, :get_assignment],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_assignments_partition_spec %{
    path: [{"enterprise", :enterprise}, {"enterprise-team", :enterprise_team}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get organization assignments\n\nGet all organizations assigned to an enterprise team"
  @spec get_assignments(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_assignments(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_assignments_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_get_assignments(term(), map(), keyword()) :: Enumerable.t()
  def stream_get_assignments(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_get_assignments_operation(params) end,
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

  defp build_get_assignments_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_assignments_partition_spec)

    Pristine.Operation.new(%{
      id: "enterprise-team-organizations/get-assignments",
      method: :get,
      path_template: "/enterprises/{enterprise}/teams/{enterprise-team}/organizations",
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
        telemetry_event: [:github_ex, :enterprise_team_organizations, :get_assignments],
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

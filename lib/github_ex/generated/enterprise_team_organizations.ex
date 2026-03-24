defmodule GitHubEx.EnterpriseTeamOrganizations do
  @moduledoc """
  Generated Github Ex operations for enterprise team organizations.
  """

  alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient

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
    opts = normalize_request_opts!(opts)
    request = build_add_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @add_partition_spec)

    %{
      id: "enterprise-team-organizations/add",
      args: params,
      call: {__MODULE__, :add},
      opts: opts,
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :enterprise_team_organizations, :add],
      timeout: nil,
      pagination: nil
    }
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
    opts = normalize_request_opts!(opts)
    request = build_bulk_add_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_bulk_add_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @bulk_add_partition_spec)

    %{
      id: "enterprise-team-organizations/bulk-add",
      args: params,
      call: {__MODULE__, :bulk_add},
      opts: opts,
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :enterprise_team_organizations, :bulk_add],
      timeout: nil,
      pagination: nil
    }
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
    opts = normalize_request_opts!(opts)
    request = build_bulk_remove_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_bulk_remove_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @bulk_remove_partition_spec)

    %{
      id: "enterprise-team-organizations/bulk-remove",
      args: params,
      call: {__MODULE__, :bulk_remove},
      opts: opts,
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :enterprise_team_organizations, :bulk_remove],
      timeout: nil,
      pagination: nil
    }
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
    opts = normalize_request_opts!(opts)
    request = build_delete_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_partition_spec)

    %{
      id: "enterprise-team-organizations/delete",
      args: params,
      call: {__MODULE__, :delete},
      opts: opts,
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
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :enterprise_team_organizations, :delete],
      timeout: nil,
      pagination: nil
    }
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
    opts = normalize_request_opts!(opts)
    request = build_get_assignment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_assignment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_assignment_partition_spec)

    %{
      id: "enterprise-team-organizations/get-assignment",
      args: params,
      call: {__MODULE__, :get_assignment},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :enterprise_team_organizations, :get_assignment],
      timeout: nil,
      pagination: nil
    }
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
    opts = normalize_request_opts!(opts)
    request = build_get_assignments_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_get_assignments(term(), map(), keyword()) :: Enumerable.t()
  def stream_get_assignments(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_get_assignments_request(client, params, opts) end,
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

  defp build_get_assignments_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_assignments_partition_spec)

    %{
      id: "enterprise-team-organizations/get-assignments",
      args: params,
      call: {__MODULE__, :get_assignments},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :enterprise_team_organizations, :get_assignments],
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

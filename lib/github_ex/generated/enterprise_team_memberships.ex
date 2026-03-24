defmodule GitHubEx.EnterpriseTeamMemberships do
  @moduledoc """
  Generated Github Ex operations for enterprise team memberships.
  """

  alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient

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
    opts = normalize_request_opts!(opts)
    request = build_add_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @add_partition_spec)

    %{
      id: "enterprise-team-memberships/add",
      args: params,
      call: {__MODULE__, :add},
      opts: opts,
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :enterprise_team_memberships, :add],
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

  @doc "Bulk add team members\n\nAdd multiple team members to an enterprise team."
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
      id: "enterprise-team-memberships/bulk-add",
      args: params,
      call: {__MODULE__, :bulk_add},
      opts: opts,
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :enterprise_team_memberships, :bulk_add],
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

  @doc "Bulk remove team members\n\nRemove multiple team members from an enterprise team."
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
      id: "enterprise-team-memberships/bulk-remove",
      args: params,
      call: {__MODULE__, :bulk_remove},
      opts: opts,
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :enterprise_team_memberships, :bulk_remove],
      timeout: nil,
      pagination: nil
    }
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
    opts = normalize_request_opts!(opts)
    request = build_get_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_partition_spec)

    %{
      id: "enterprise-team-memberships/get",
      args: params,
      call: {__MODULE__, :get},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :enterprise_team_memberships, :get],
      timeout: nil,
      pagination: nil
    }
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
    opts = normalize_request_opts!(opts)
    request = build_list_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list(term(), map(), keyword()) :: Enumerable.t()
  def stream_list(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_request(client, params, opts) end,
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

  defp build_list_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_partition_spec)

    %{
      id: "enterprise-team-memberships/list",
      args: params,
      call: {__MODULE__, :list},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :enterprise_team_memberships, :list],
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
    opts = normalize_request_opts!(opts)
    request = build_remove_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_remove_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @remove_partition_spec)

    %{
      id: "enterprise-team-memberships/remove",
      args: params,
      call: {__MODULE__, :remove},
      opts: opts,
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
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :enterprise_team_memberships, :remove],
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

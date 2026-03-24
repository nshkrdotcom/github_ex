defmodule GitHubEx.EnterpriseTeams do
  @moduledoc """
  Generated Github Ex operations for enterprise teams.
  """

  alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient

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
    opts = normalize_request_opts!(opts)
    request = build_create_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_partition_spec)

    %{
      id: "enterprise-teams/create",
      args: params,
      call: {__MODULE__, :create},
      opts: opts,
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :enterprise_teams, :create],
      timeout: nil,
      pagination: nil
    }
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
    opts = normalize_request_opts!(opts)
    request = build_delete_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_partition_spec)

    %{
      id: "enterprise-teams/delete",
      args: params,
      call: {__MODULE__, :delete},
      opts: opts,
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
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :enterprise_teams, :delete],
      timeout: nil,
      pagination: nil
    }
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
    opts = normalize_request_opts!(opts)
    request = build_get_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_partition_spec)

    %{
      id: "enterprise-teams/get",
      args: params,
      call: {__MODULE__, :get},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :enterprise_teams, :get],
      timeout: nil,
      pagination: nil
    }
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
      id: "enterprise-teams/list",
      args: params,
      call: {__MODULE__, :list},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :enterprise_teams, :list],
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
    opts = normalize_request_opts!(opts)
    request = build_update_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_partition_spec)

    %{
      id: "enterprise-teams/update",
      args: params,
      call: {__MODULE__, :update},
      opts: opts,
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :enterprise_teams, :update],
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

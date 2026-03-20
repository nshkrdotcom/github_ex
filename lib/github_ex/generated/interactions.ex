defmodule GitHubEx.Interactions do
  @moduledoc """
  Generated Github Ex operations for interactions.
  """

  @get_restrictions_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get interaction restrictions for your public repositories\n\nShows which type of GitHub user can interact with your public repositories and when the restriction expires."
  @spec get_restrictions_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_restrictions_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_restrictions_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_restrictions_for_authenticated_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @get_restrictions_for_authenticated_user_partition_spec
      )

    Pristine.Operation.new(%{
      id: "interactions/get-restrictions-for-authenticated-user",
      method: :get,
      path_template: "/user/interaction-limits",
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
        telemetry_event: [:github_ex, :interactions, :get_restrictions_for_authenticated_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_restrictions_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get interaction restrictions for an organization\n\nShows which type of GitHub user can interact with this organization and when the restriction expires. If there is no restrictions, you will see an empty response."
  @spec get_restrictions_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_restrictions_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_restrictions_for_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_restrictions_for_org_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_restrictions_for_org_partition_spec)

    Pristine.Operation.new(%{
      id: "interactions/get-restrictions-for-org",
      method: :get,
      path_template: "/orgs/{org}/interaction-limits",
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
        telemetry_event: [:github_ex, :interactions, :get_restrictions_for_org],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_restrictions_for_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get interaction restrictions for a repository\n\nShows which type of GitHub user can interact with this repository and when the restriction expires. If there are no restrictions, you will see an empty response."
  @spec get_restrictions_for_repo(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_restrictions_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_restrictions_for_repo_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_restrictions_for_repo_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_restrictions_for_repo_partition_spec)

    Pristine.Operation.new(%{
      id: "interactions/get-restrictions-for-repo",
      method: :get,
      path_template: "/repos/{owner}/{repo}/interaction-limits",
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
        telemetry_event: [:github_ex, :interactions, :get_restrictions_for_repo],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @remove_restrictions_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove interaction restrictions from your public repositories\n\nRemoves any interaction restrictions from your public repositories."
  @spec remove_restrictions_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def remove_restrictions_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_remove_restrictions_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_remove_restrictions_for_authenticated_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @remove_restrictions_for_authenticated_user_partition_spec
      )

    Pristine.Operation.new(%{
      id: "interactions/remove-restrictions-for-authenticated-user",
      method: :delete,
      path_template: "/user/interaction-limits",
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
        telemetry_event: [:github_ex, :interactions, :remove_restrictions_for_authenticated_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @remove_restrictions_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove interaction restrictions for an organization\n\nRemoves all interaction restrictions from public repositories in the given organization. You must be an organization owner to remove restrictions."
  @spec remove_restrictions_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def remove_restrictions_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_remove_restrictions_for_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_remove_restrictions_for_org_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @remove_restrictions_for_org_partition_spec)

    Pristine.Operation.new(%{
      id: "interactions/remove-restrictions-for-org",
      method: :delete,
      path_template: "/orgs/{org}/interaction-limits",
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
        telemetry_event: [:github_ex, :interactions, :remove_restrictions_for_org],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @remove_restrictions_for_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove interaction restrictions for a repository\n\nRemoves all interaction restrictions from the given repository. You must have owner or admin access to remove restrictions. If the interaction limit is set for the user or organization that owns this repository, you will receive a `409 Conflict` response and will not be able to use this endpoint to change the interaction limit for a single repository."
  @spec remove_restrictions_for_repo(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def remove_restrictions_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_remove_restrictions_for_repo_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_remove_restrictions_for_repo_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @remove_restrictions_for_repo_partition_spec)

    Pristine.Operation.new(%{
      id: "interactions/remove-restrictions-for-repo",
      method: :delete,
      path_template: "/repos/{owner}/{repo}/interaction-limits",
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
        telemetry_event: [:github_ex, :interactions, :remove_restrictions_for_repo],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @set_restrictions_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set interaction restrictions for your public repositories\n\nTemporarily restricts which type of GitHub user can interact with your public repositories. Setting the interaction limit at the user level will overwrite any interaction limits that are set for individual repositories owned by the user."
  @spec set_restrictions_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_restrictions_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_set_restrictions_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_set_restrictions_for_authenticated_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @set_restrictions_for_authenticated_user_partition_spec
      )

    Pristine.Operation.new(%{
      id: "interactions/set-restrictions-for-authenticated-user",
      method: :put,
      path_template: "/user/interaction-limits",
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
        telemetry_event: [:github_ex, :interactions, :set_restrictions_for_authenticated_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @set_restrictions_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set interaction restrictions for an organization\n\nTemporarily restricts interactions to a certain type of GitHub user in any public repository in the given organization. You must be an organization owner to set these restrictions. Setting the interaction limit at the organization level will overwrite any interaction limits that are set for individual repositories owned by the organization."
  @spec set_restrictions_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def set_restrictions_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_set_restrictions_for_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_set_restrictions_for_org_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @set_restrictions_for_org_partition_spec)

    Pristine.Operation.new(%{
      id: "interactions/set-restrictions-for-org",
      method: :put,
      path_template: "/orgs/{org}/interaction-limits",
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
        telemetry_event: [:github_ex, :interactions, :set_restrictions_for_org],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @set_restrictions_for_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set interaction restrictions for a repository\n\nTemporarily restricts interactions to a certain type of GitHub user within the given repository. You must have owner or admin access to set these restrictions. If an interaction limit is set for the user or organization that owns this repository, you will receive a `409 Conflict` response and will not be able to use this endpoint to change the interaction limit for a single repository."
  @spec set_restrictions_for_repo(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def set_restrictions_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_set_restrictions_for_repo_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_set_restrictions_for_repo_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @set_restrictions_for_repo_partition_spec)

    Pristine.Operation.new(%{
      id: "interactions/set-restrictions-for-repo",
      method: :put,
      path_template: "/repos/{owner}/{repo}/interaction-limits",
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
        telemetry_event: [:github_ex, :interactions, :set_restrictions_for_repo],
        timeout_ms: nil
      },
      pagination: nil
    })
  end
end

defmodule GitHubEx.CodeSecurity do
  @moduledoc """
  Generated Github Ex operations for code security.
  """

  @attach_configuration_partition_spec %{
    path: [{"org", :org}, {"configuration_id", :configuration_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Attach a configuration to repositories\n\nAttach a code security configuration to a set of repositories. If the repositories specified are already attached to a configuration, they will be re-attached to the provided configuration.\n\nIf insufficient GHAS licenses are available to attach the configuration to a repository, only free features will be enabled.\n\nThe authenticated user must be an administrator or security manager for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `write:org` scope to use this endpoint."
  @spec attach_configuration(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def attach_configuration(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_attach_configuration_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_attach_configuration_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @attach_configuration_partition_spec)

    Pristine.Operation.new(%{
      id: "code-security/attach-configuration",
      method: :post,
      path_template: "/orgs/{org}/code-security/configurations/{configuration_id}/attach",
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
        telemetry_event: [:github_ex, :code_security, :attach_configuration],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @attach_enterprise_configuration_partition_spec %{
    path: [{"enterprise", :enterprise}, {"configuration_id", :configuration_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Attach an enterprise configuration to repositories\n\nAttaches an enterprise code security configuration to repositories. If the repositories specified are already attached to a configuration, they will be re-attached to the provided configuration.\n\nIf insufficient GHAS licenses are available to attach the configuration to a repository, only free features will be enabled.\n\nThe authenticated user must be an administrator for the enterprise to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:enterprise` scope to use this endpoint."
  @spec attach_enterprise_configuration(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def attach_enterprise_configuration(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_attach_enterprise_configuration_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_attach_enterprise_configuration_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @attach_enterprise_configuration_partition_spec)

    Pristine.Operation.new(%{
      id: "code-security/attach-enterprise-configuration",
      method: :post,
      path_template:
        "/enterprises/{enterprise}/code-security/configurations/{configuration_id}/attach",
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
        telemetry_event: [:github_ex, :code_security, :attach_enterprise_configuration],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @create_configuration_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Create a code security configuration\n\nCreates a code security configuration in an organization.\n\nThe authenticated user must be an administrator or security manager for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `write:org` scope to use this endpoint."
  @spec create_configuration(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_configuration(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_create_configuration_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_create_configuration_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @create_configuration_partition_spec)

    Pristine.Operation.new(%{
      id: "code-security/create-configuration",
      method: :post,
      path_template: "/orgs/{org}/code-security/configurations",
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
        telemetry_event: [:github_ex, :code_security, :create_configuration],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @create_configuration_for_enterprise_partition_spec %{
    path: [{"enterprise", :enterprise}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Create a code security configuration for an enterprise\n\nCreates a code security configuration in an enterprise.\n\nThe authenticated user must be an administrator of the enterprise in order to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:enterprise` scope to use this endpoint."
  @spec create_configuration_for_enterprise(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def create_configuration_for_enterprise(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_create_configuration_for_enterprise_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_create_configuration_for_enterprise_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @create_configuration_for_enterprise_partition_spec)

    Pristine.Operation.new(%{
      id: "code-security/create-configuration-for-enterprise",
      method: :post,
      path_template: "/enterprises/{enterprise}/code-security/configurations",
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
        telemetry_event: [:github_ex, :code_security, :create_configuration_for_enterprise],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_configuration_partition_spec %{
    path: [{"org", :org}, {"configuration_id", :configuration_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Delete a code security configuration\n\nDeletes the desired code security configuration from an organization.\nRepositories attached to the configuration will retain their settings but will no longer be associated with\nthe configuration.\n\nThe authenticated user must be an administrator or security manager for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `write:org` scope to use this endpoint."
  @spec delete_configuration(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_configuration(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_delete_configuration_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_delete_configuration_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_configuration_partition_spec)

    Pristine.Operation.new(%{
      id: "code-security/delete-configuration",
      method: :delete,
      path_template: "/orgs/{org}/code-security/configurations/{configuration_id}",
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
        telemetry_event: [:github_ex, :code_security, :delete_configuration],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_configuration_for_enterprise_partition_spec %{
    path: [{"enterprise", :enterprise}, {"configuration_id", :configuration_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Delete a code security configuration for an enterprise\n\nDeletes a code security configuration from an enterprise.\nRepositories attached to the configuration will retain their settings but will no longer be associated with\nthe configuration.\n\nThe authenticated user must be an administrator for the enterprise to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:enterprise` scope to use this endpoint."
  @spec delete_configuration_for_enterprise(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def delete_configuration_for_enterprise(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_delete_configuration_for_enterprise_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_delete_configuration_for_enterprise_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @delete_configuration_for_enterprise_partition_spec)

    Pristine.Operation.new(%{
      id: "code-security/delete-configuration-for-enterprise",
      method: :delete,
      path_template: "/enterprises/{enterprise}/code-security/configurations/{configuration_id}",
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
        telemetry_event: [:github_ex, :code_security, :delete_configuration_for_enterprise],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @detach_configuration_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Detach configurations from repositories\n\nDetach code security configuration(s) from a set of repositories.\nRepositories will retain their settings but will no longer be associated with the configuration.\n\nThe authenticated user must be an administrator or security manager for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `write:org` scope to use this endpoint."
  @spec detach_configuration(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def detach_configuration(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_detach_configuration_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_detach_configuration_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @detach_configuration_partition_spec)

    Pristine.Operation.new(%{
      id: "code-security/detach-configuration",
      method: :delete,
      path_template: "/orgs/{org}/code-security/configurations/detach",
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
        telemetry_event: [:github_ex, :code_security, :detach_configuration],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_configuration_partition_spec %{
    path: [{"org", :org}, {"configuration_id", :configuration_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get a code security configuration\n\nGets a code security configuration available in an organization.\n\nThe authenticated user must be an administrator or security manager for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `write:org` scope to use this endpoint."
  @spec get_configuration(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_configuration(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_configuration_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_configuration_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_configuration_partition_spec)

    Pristine.Operation.new(%{
      id: "code-security/get-configuration",
      method: :get,
      path_template: "/orgs/{org}/code-security/configurations/{configuration_id}",
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
        telemetry_event: [:github_ex, :code_security, :get_configuration],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_configuration_for_repository_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get the code security configuration associated with a repository\n\nGet the code security configuration that manages a repository's code security settings.\n\nThe authenticated user must be an administrator or security manager for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_configuration_for_repository(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_configuration_for_repository(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_configuration_for_repository_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_configuration_for_repository_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @get_configuration_for_repository_partition_spec)

    Pristine.Operation.new(%{
      id: "code-security/get-configuration-for-repository",
      method: :get,
      path_template: "/repos/{owner}/{repo}/code-security-configuration",
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
        telemetry_event: [:github_ex, :code_security, :get_configuration_for_repository],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_configurations_for_enterprise_partition_spec %{
    path: [{"enterprise", :enterprise}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"before", :before}, {"after", :after}],
    headers: []
  }

  @doc "Get code security configurations for an enterprise\n\nLists all code security configurations available in an enterprise.\n\nThe authenticated user must be an administrator of the enterprise in order to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `read:enterprise` scope to use this endpoint."
  @spec get_configurations_for_enterprise(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_configurations_for_enterprise(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_configurations_for_enterprise_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_get_configurations_for_enterprise(term(), map(), keyword()) :: Enumerable.t()
  def stream_get_configurations_for_enterprise(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_get_configurations_for_enterprise_operation(params) end,
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

  defp build_get_configurations_for_enterprise_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @get_configurations_for_enterprise_partition_spec)

    Pristine.Operation.new(%{
      id: "code-security/get-configurations-for-enterprise",
      method: :get,
      path_template: "/enterprises/{enterprise}/code-security/configurations",
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
        telemetry_event: [:github_ex, :code_security, :get_configurations_for_enterprise],
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

  @get_configurations_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [
      {"target_type", :target_type},
      {"per_page", :per_page},
      {"before", :before},
      {"after", :after}
    ],
    headers: []
  }

  @doc "Get code security configurations for an organization\n\nLists all code security configurations available in an organization.\n\nThe authenticated user must be an administrator or security manager for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `read:org` scope to use this endpoint."
  @spec get_configurations_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_configurations_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_configurations_for_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_get_configurations_for_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_get_configurations_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_get_configurations_for_org_operation(params) end,
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

  defp build_get_configurations_for_org_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_configurations_for_org_partition_spec)

    Pristine.Operation.new(%{
      id: "code-security/get-configurations-for-org",
      method: :get,
      path_template: "/orgs/{org}/code-security/configurations",
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
        telemetry_event: [:github_ex, :code_security, :get_configurations_for_org],
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

  @get_default_configurations_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get default code security configurations\n\nLists the default code security configurations for an organization.\n\nThe authenticated user must be an administrator or security manager for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `read:org` scope to use this endpoint."
  @spec get_default_configurations(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_default_configurations(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_default_configurations_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_default_configurations_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_default_configurations_partition_spec)

    Pristine.Operation.new(%{
      id: "code-security/get-default-configurations",
      method: :get,
      path_template: "/orgs/{org}/code-security/configurations/defaults",
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
        telemetry_event: [:github_ex, :code_security, :get_default_configurations],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_default_configurations_for_enterprise_partition_spec %{
    path: [{"enterprise", :enterprise}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get default code security configurations for an enterprise\n\nLists the default code security configurations for an enterprise.\n\nThe authenticated user must be an administrator of the enterprise in order to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `read:enterprise` scope to use this endpoint."
  @spec get_default_configurations_for_enterprise(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_default_configurations_for_enterprise(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_default_configurations_for_enterprise_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_default_configurations_for_enterprise_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @get_default_configurations_for_enterprise_partition_spec
      )

    Pristine.Operation.new(%{
      id: "code-security/get-default-configurations-for-enterprise",
      method: :get,
      path_template: "/enterprises/{enterprise}/code-security/configurations/defaults",
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
        telemetry_event: [:github_ex, :code_security, :get_default_configurations_for_enterprise],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_repositories_for_configuration_partition_spec %{
    path: [{"org", :org}, {"configuration_id", :configuration_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [
      {"per_page", :per_page},
      {"before", :before},
      {"after", :after},
      {"status", :status}
    ],
    headers: []
  }

  @doc "Get repositories associated with a code security configuration\n\nLists the repositories associated with a code security configuration in an organization.\n\nThe authenticated user must be an administrator or security manager for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `read:org` scope to use this endpoint."
  @spec get_repositories_for_configuration(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_repositories_for_configuration(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_repositories_for_configuration_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_get_repositories_for_configuration(term(), map(), keyword()) :: Enumerable.t()
  def stream_get_repositories_for_configuration(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_get_repositories_for_configuration_operation(params) end,
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

  defp build_get_repositories_for_configuration_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @get_repositories_for_configuration_partition_spec)

    Pristine.Operation.new(%{
      id: "code-security/get-repositories-for-configuration",
      method: :get,
      path_template: "/orgs/{org}/code-security/configurations/{configuration_id}/repositories",
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
        telemetry_event: [:github_ex, :code_security, :get_repositories_for_configuration],
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

  @get_repositories_for_enterprise_configuration_partition_spec %{
    path: [{"enterprise", :enterprise}, {"configuration_id", :configuration_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [
      {"per_page", :per_page},
      {"before", :before},
      {"after", :after},
      {"status", :status}
    ],
    headers: []
  }

  @doc "Get repositories associated with an enterprise code security configuration\n\nLists the repositories associated with an enterprise code security configuration in an organization.\n\nThe authenticated user must be an administrator of the enterprise in order to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `read:enterprise` scope to use this endpoint."
  @spec get_repositories_for_enterprise_configuration(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_repositories_for_enterprise_configuration(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_repositories_for_enterprise_configuration_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_get_repositories_for_enterprise_configuration(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_get_repositories_for_enterprise_configuration(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_get_repositories_for_enterprise_configuration_operation(params) end,
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

  defp build_get_repositories_for_enterprise_configuration_operation(params)
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @get_repositories_for_enterprise_configuration_partition_spec
      )

    Pristine.Operation.new(%{
      id: "code-security/get-repositories-for-enterprise-configuration",
      method: :get,
      path_template:
        "/enterprises/{enterprise}/code-security/configurations/{configuration_id}/repositories",
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
          :code_security,
          :get_repositories_for_enterprise_configuration
        ],
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

  @get_single_configuration_for_enterprise_partition_spec %{
    path: [{"enterprise", :enterprise}, {"configuration_id", :configuration_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Retrieve a code security configuration of an enterprise\n\nGets a code security configuration available in an enterprise.\n\nThe authenticated user must be an administrator of the enterprise in order to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `read:enterprise` scope to use this endpoint."
  @spec get_single_configuration_for_enterprise(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_single_configuration_for_enterprise(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_single_configuration_for_enterprise_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_single_configuration_for_enterprise_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @get_single_configuration_for_enterprise_partition_spec
      )

    Pristine.Operation.new(%{
      id: "code-security/get-single-configuration-for-enterprise",
      method: :get,
      path_template: "/enterprises/{enterprise}/code-security/configurations/{configuration_id}",
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
        telemetry_event: [:github_ex, :code_security, :get_single_configuration_for_enterprise],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @set_configuration_as_default_partition_spec %{
    path: [{"org", :org}, {"configuration_id", :configuration_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Set a code security configuration as a default for an organization\n\nSets a code security configuration as a default to be applied to new repositories in your organization.\n\nThis configuration will be applied to the matching repository type (all, none, public, private and internal) by default when they are created.\n\nThe authenticated user must be an administrator or security manager for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `write:org` scope to use this endpoint."
  @spec set_configuration_as_default(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def set_configuration_as_default(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_set_configuration_as_default_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_set_configuration_as_default_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @set_configuration_as_default_partition_spec)

    Pristine.Operation.new(%{
      id: "code-security/set-configuration-as-default",
      method: :put,
      path_template: "/orgs/{org}/code-security/configurations/{configuration_id}/defaults",
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
        telemetry_event: [:github_ex, :code_security, :set_configuration_as_default],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @set_configuration_as_default_for_enterprise_partition_spec %{
    path: [{"enterprise", :enterprise}, {"configuration_id", :configuration_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Set a code security configuration as a default for an enterprise\n\nSets a code security configuration as a default to be applied to new repositories in your enterprise.\n\nThis configuration will be applied by default to the matching repository type when created, but only for organizations within the enterprise that do not already have a default code security configuration set.\n\nThe authenticated user must be an administrator for the enterprise to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:enterprise` scope to use this endpoint."
  @spec set_configuration_as_default_for_enterprise(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_configuration_as_default_for_enterprise(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_set_configuration_as_default_for_enterprise_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_set_configuration_as_default_for_enterprise_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @set_configuration_as_default_for_enterprise_partition_spec
      )

    Pristine.Operation.new(%{
      id: "code-security/set-configuration-as-default-for-enterprise",
      method: :put,
      path_template:
        "/enterprises/{enterprise}/code-security/configurations/{configuration_id}/defaults",
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
          :code_security,
          :set_configuration_as_default_for_enterprise
        ],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @update_configuration_partition_spec %{
    path: [{"org", :org}, {"configuration_id", :configuration_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Update a code security configuration\n\nUpdates a code security configuration in an organization.\n\nThe authenticated user must be an administrator or security manager for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `write:org` scope to use this endpoint."
  @spec update_configuration(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_configuration(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_update_configuration_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_update_configuration_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @update_configuration_partition_spec)

    Pristine.Operation.new(%{
      id: "code-security/update-configuration",
      method: :patch,
      path_template: "/orgs/{org}/code-security/configurations/{configuration_id}",
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
        telemetry_event: [:github_ex, :code_security, :update_configuration],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @update_enterprise_configuration_partition_spec %{
    path: [{"enterprise", :enterprise}, {"configuration_id", :configuration_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Update a custom code security configuration for an enterprise\n\nUpdates a code security configuration in an enterprise.\n\nThe authenticated user must be an administrator of the enterprise in order to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:enterprise` scope to use this endpoint."
  @spec update_enterprise_configuration(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def update_enterprise_configuration(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_update_enterprise_configuration_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_update_enterprise_configuration_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @update_enterprise_configuration_partition_spec)

    Pristine.Operation.new(%{
      id: "code-security/update-enterprise-configuration",
      method: :patch,
      path_template: "/enterprises/{enterprise}/code-security/configurations/{configuration_id}",
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
        telemetry_event: [:github_ex, :code_security, :update_enterprise_configuration],
        timeout_ms: nil
      },
      pagination: nil
    })
  end
end

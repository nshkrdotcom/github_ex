defmodule GitHubEx.SecurityAdvisories do
  @moduledoc """
  Generated Github Ex operations for security advisories.
  """

  @create_fork_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"ghsa_id", :ghsa_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a temporary private fork\n\nCreate a temporary private fork to collaborate on fixing a security vulnerability in your repository.\n\n> [!NOTE]\n> Forking a repository happens asynchronously. You may have to wait up to 5 minutes before you can access the fork."
  @spec create_fork(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_fork(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_create_fork_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_create_fork_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @create_fork_partition_spec)

    Pristine.Operation.new(%{
      id: "security-advisories/create-fork",
      method: :post,
      path_template: "/repos/{owner}/{repo}/security-advisories/{ghsa_id}/forks",
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
        telemetry_event: [:github_ex, :security_advisories, :create_fork],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @create_private_vulnerability_report_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Privately report a security vulnerability\n\nReport a security vulnerability to the maintainers of the repository.\nSee \"[Privately reporting a security vulnerability](https://docs.github.com/code-security/security-advisories/guidance-on-reporting-and-writing/privately-reporting-a-security-vulnerability)\" for more information about private vulnerability reporting."
  @spec create_private_vulnerability_report(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def create_private_vulnerability_report(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_create_private_vulnerability_report_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_create_private_vulnerability_report_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @create_private_vulnerability_report_partition_spec)

    Pristine.Operation.new(%{
      id: "security-advisories/create-private-vulnerability-report",
      method: :post,
      path_template: "/repos/{owner}/{repo}/security-advisories/reports",
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
        telemetry_event: [:github_ex, :security_advisories, :create_private_vulnerability_report],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @create_repository_advisory_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a repository security advisory\n\nCreates a new repository security advisory.\n\nIn order to create a draft repository security advisory, the authenticated user must be a security manager or administrator of that repository.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` or `repository_advisories:write` scope to use this endpoint."
  @spec create_repository_advisory(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_repository_advisory(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_create_repository_advisory_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_create_repository_advisory_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @create_repository_advisory_partition_spec)

    Pristine.Operation.new(%{
      id: "security-advisories/create-repository-advisory",
      method: :post,
      path_template: "/repos/{owner}/{repo}/security-advisories",
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
        telemetry_event: [:github_ex, :security_advisories, :create_repository_advisory],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @create_repository_advisory_cve_request_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"ghsa_id", :ghsa_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Request a CVE for a repository security advisory\n\nIf you want a CVE identification number for the security vulnerability in your project, and don't already have one, you can request a CVE identification number from GitHub. For more information see \"[Requesting a CVE identification number](https://docs.github.com/code-security/security-advisories/repository-security-advisories/publishing-a-repository-security-advisory#requesting-a-cve-identification-number-optional).\"\n\nYou may request a CVE for public repositories, but cannot do so for private repositories.\n\nIn order to request a CVE for a repository security advisory, the authenticated user must be a security manager or administrator of that repository.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` or `repository_advisories:write` scope to use this endpoint."
  @spec create_repository_advisory_cve_request(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def create_repository_advisory_cve_request(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_create_repository_advisory_cve_request_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_create_repository_advisory_cve_request_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @create_repository_advisory_cve_request_partition_spec)

    Pristine.Operation.new(%{
      id: "security-advisories/create-repository-advisory-cve-request",
      method: :post,
      path_template: "/repos/{owner}/{repo}/security-advisories/{ghsa_id}/cve",
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
          :security_advisories,
          :create_repository_advisory_cve_request
        ],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_global_advisory_partition_spec %{
    path: [{"ghsa_id", :ghsa_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a global security advisory\n\nGets a global security advisory using its GitHub Security Advisory (GHSA) identifier."
  @spec get_global_advisory(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_global_advisory(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_get_global_advisory_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_get_global_advisory_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_global_advisory_partition_spec)

    Pristine.Operation.new(%{
      id: "security-advisories/get-global-advisory",
      method: :get,
      path_template: "/advisories/{ghsa_id}",
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
        telemetry_event: [:github_ex, :security_advisories, :get_global_advisory],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_repository_advisory_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"ghsa_id", :ghsa_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a repository security advisory\n\nGet a repository security advisory using its GitHub Security Advisory (GHSA) identifier.\n\nAnyone can access any published security advisory on a public repository.\n\nThe authenticated user can access an unpublished security advisory from a repository if they are a security manager or administrator of that repository, or if they are a\ncollaborator on the security advisory.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` or `repository_advisories:read` scope to to get a published security advisory in a private repository, or any unpublished security advisory that the authenticated user has access to."
  @spec get_repository_advisory(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_repository_advisory(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_get_repository_advisory_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_get_repository_advisory_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_repository_advisory_partition_spec)

    Pristine.Operation.new(%{
      id: "security-advisories/get-repository-advisory",
      method: :get,
      path_template: "/repos/{owner}/{repo}/security-advisories/{ghsa_id}",
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
        telemetry_event: [:github_ex, :security_advisories, :get_repository_advisory],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @list_global_advisories_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"ghsa_id", :ghsa_id},
      {"type", :type},
      {"cve_id", :cve_id},
      {"ecosystem", :ecosystem},
      {"severity", :severity},
      {"cwes", :cwes},
      {"is_withdrawn", :is_withdrawn},
      {"affects", :affects},
      {"published", :published},
      {"updated", :updated},
      {"modified", :modified},
      {"epss_percentage", :epss_percentage},
      {"epss_percentile", :epss_percentile},
      {"before", :before},
      {"after", :after},
      {"direction", :direction},
      {"per_page", :per_page},
      {"sort", :sort}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List global security advisories\n\nLists all global security advisories that match the specified parameters. If no other parameters are defined, the request will return only GitHub-reviewed advisories that are not malware.\n\nBy default, all responses will exclude advisories for malware, because malware are not standard vulnerabilities. To list advisories for malware, you must include the `type` parameter in your request, with the value `malware`. For more information about the different types of security advisories, see \"[About the GitHub Advisory database](https://docs.github.com/code-security/security-advisories/global-security-advisories/about-the-github-advisory-database#about-types-of-security-advisories).\""
  @spec list_global_advisories(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_global_advisories(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_global_advisories_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_global_advisories(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_global_advisories(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_global_advisories_operation(params) end,
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

  defp build_list_global_advisories_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_global_advisories_partition_spec)

    Pristine.Operation.new(%{
      id: "security-advisories/list-global-advisories",
      method: :get,
      path_template: "/advisories",
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
        telemetry_event: [:github_ex, :security_advisories, :list_global_advisories],
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

  @list_org_repository_advisories_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"direction", :direction},
      {"sort", :sort},
      {"before", :before},
      {"after", :after},
      {"per_page", :per_page},
      {"state", :state}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List repository security advisories for an organization\n\nLists repository security advisories for an organization.\n\nThe authenticated user must be an owner or security manager for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` or `repository_advisories:write` scope to use this endpoint."
  @spec list_org_repository_advisories(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_org_repository_advisories(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_org_repository_advisories_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_org_repository_advisories(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_org_repository_advisories(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_org_repository_advisories_operation(params) end,
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

  defp build_list_org_repository_advisories_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @list_org_repository_advisories_partition_spec)

    Pristine.Operation.new(%{
      id: "security-advisories/list-org-repository-advisories",
      method: :get,
      path_template: "/orgs/{org}/security-advisories",
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
        telemetry_event: [:github_ex, :security_advisories, :list_org_repository_advisories],
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

  @list_repository_advisories_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"direction", :direction},
      {"sort", :sort},
      {"before", :before},
      {"after", :after},
      {"per_page", :per_page},
      {"state", :state}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List repository security advisories\n\nLists security advisories in a repository.\n\nThe authenticated user can access unpublished security advisories from a repository if they are a security manager or administrator of that repository, or if they are a collaborator on any security advisory.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` or `repository_advisories:read` scope to to get a published security advisory in a private repository, or any unpublished security advisory that the authenticated user has access to."
  @spec list_repository_advisories(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_repository_advisories(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_repository_advisories_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_repository_advisories(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_repository_advisories(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_repository_advisories_operation(params) end,
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

  defp build_list_repository_advisories_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_repository_advisories_partition_spec)

    Pristine.Operation.new(%{
      id: "security-advisories/list-repository-advisories",
      method: :get,
      path_template: "/repos/{owner}/{repo}/security-advisories",
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
        telemetry_event: [:github_ex, :security_advisories, :list_repository_advisories],
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

  @update_repository_advisory_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"ghsa_id", :ghsa_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update a repository security advisory\n\nUpdate a repository security advisory using its GitHub Security Advisory (GHSA) identifier.\n\nIn order to update any security advisory, the authenticated user must be a security manager or administrator of that repository,\nor a collaborator on the repository security advisory.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` or `repository_advisories:write` scope to use this endpoint."
  @spec update_repository_advisory(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_repository_advisory(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_update_repository_advisory_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_update_repository_advisory_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @update_repository_advisory_partition_spec)

    Pristine.Operation.new(%{
      id: "security-advisories/update-repository-advisory",
      method: :patch,
      path_template: "/repos/{owner}/{repo}/security-advisories/{ghsa_id}",
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
        telemetry_event: [:github_ex, :security_advisories, :update_repository_advisory],
        timeout_ms: nil
      },
      pagination: nil
    })
  end
end

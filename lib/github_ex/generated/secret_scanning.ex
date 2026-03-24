defmodule GitHubEx.SecretScanning do
  @moduledoc """
  Generated Github Ex operations for secret scanning.
  """

  alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient

  @create_push_protection_bypass_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a push protection bypass\n\nCreates a bypass for a previously push protected secret.\n\nThe authenticated user must be the original author of the committed secret.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec create_push_protection_bypass(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def create_push_protection_bypass(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_push_protection_bypass_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_push_protection_bypass_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_push_protection_bypass_partition_spec)

    %{
      id: "secret-scanning/create-push-protection-bypass",
      args: params,
      call: {__MODULE__, :create_push_protection_bypass},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/secret-scanning/push-protection-bypasses",
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
      telemetry: [:github_ex, :secret_scanning, :create_push_protection_bypass],
      timeout: nil,
      pagination: nil
    }
  end

  @get_alert_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"alert_number", :alert_number}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"hide_secret", :hide_secret}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a secret scanning alert\n\nGets a single secret scanning alert detected in an eligible repository.\n\nThe authenticated user must be an administrator for the repository or for the organization that owns the repository to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` or `security_events` scope to use this endpoint. If this endpoint is only used with public repositories, the token can use the `public_repo` scope instead."
  @spec get_alert(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_alert(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_alert_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_alert_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_alert_partition_spec)

    %{
      id: "secret-scanning/get-alert",
      args: params,
      call: {__MODULE__, :get_alert},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/secret-scanning/alerts/{alert_number}",
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
      telemetry: [:github_ex, :secret_scanning, :get_alert],
      timeout: nil,
      pagination: nil
    }
  end

  @get_scan_history_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get secret scanning scan history for a repository\n\nLists the latest default incremental and backfill scans by type for a repository. Scans from Copilot Secret Scanning are not included.\n\n> [!NOTE]\n> This endpoint requires [GitHub Advanced Security](https://docs.github.com/get-started/learning-about-github/about-github-advanced-security).\"\n\nOAuth app tokens and personal access tokens (classic) need the `repo` or `security_events` scope to use this endpoint. If this endpoint is only used with public repositories, the token can use the `public_repo` scope instead."
  @spec get_scan_history(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_scan_history(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_scan_history_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_scan_history_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_scan_history_partition_spec)

    %{
      id: "secret-scanning/get-scan-history",
      args: params,
      call: {__MODULE__, :get_scan_history},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/secret-scanning/scan-history",
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
      telemetry: [:github_ex, :secret_scanning, :get_scan_history],
      timeout: nil,
      pagination: nil
    }
  end

  @list_alerts_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"state", :state},
      {"secret_type", :secret_type},
      {"resolution", :resolution},
      {"assignee", :assignee},
      {"sort", :sort},
      {"direction", :direction},
      {"page", :page},
      {"per_page", :per_page},
      {"before", :before},
      {"after", :after},
      {"validity", :validity},
      {"is_publicly_leaked", :is_publicly_leaked},
      {"is_multi_repo", :is_multi_repo},
      {"hide_secret", :hide_secret}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List secret scanning alerts for an organization\n\nLists secret scanning alerts for eligible repositories in an organization, from newest to oldest.\n\nThe authenticated user must be an administrator or security manager for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` or `security_events` scope to use this endpoint. If this endpoint is only used with public repositories, the token can use the `public_repo` scope instead."
  @spec list_alerts_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_alerts_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_alerts_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_alerts_for_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_alerts_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_alerts_for_org_request(client, params, opts) end,
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

  defp build_list_alerts_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_alerts_for_org_partition_spec)

    %{
      id: "secret-scanning/list-alerts-for-org",
      args: params,
      call: {__MODULE__, :list_alerts_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/secret-scanning/alerts",
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
      telemetry: [:github_ex, :secret_scanning, :list_alerts_for_org],
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

  @list_alerts_for_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"state", :state},
      {"secret_type", :secret_type},
      {"resolution", :resolution},
      {"assignee", :assignee},
      {"sort", :sort},
      {"direction", :direction},
      {"page", :page},
      {"per_page", :per_page},
      {"before", :before},
      {"after", :after},
      {"validity", :validity},
      {"is_publicly_leaked", :is_publicly_leaked},
      {"is_multi_repo", :is_multi_repo},
      {"hide_secret", :hide_secret}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List secret scanning alerts for a repository\n\nLists secret scanning alerts for an eligible repository, from newest to oldest.\n\nThe authenticated user must be an administrator for the repository or for the organization that owns the repository to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` or `security_events` scope to use this endpoint. If this endpoint is only used with public repositories, the token can use the `public_repo` scope instead."
  @spec list_alerts_for_repo(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_alerts_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_alerts_for_repo_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_alerts_for_repo(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_alerts_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_alerts_for_repo_request(client, params, opts) end,
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

  defp build_list_alerts_for_repo_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_alerts_for_repo_partition_spec)

    %{
      id: "secret-scanning/list-alerts-for-repo",
      args: params,
      call: {__MODULE__, :list_alerts_for_repo},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/secret-scanning/alerts",
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
      telemetry: [:github_ex, :secret_scanning, :list_alerts_for_repo],
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

  @list_locations_for_alert_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"alert_number", :alert_number}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"page", :page}, {"per_page", :per_page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List locations for a secret scanning alert\n\nLists all locations for a given secret scanning alert for an eligible repository.\n\nThe authenticated user must be an administrator for the repository or for the organization that owns the repository to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` or `security_events` scope to use this endpoint. If this endpoint is only used with public repositories, the token can use the `public_repo` scope instead."
  @spec list_locations_for_alert(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_locations_for_alert(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_locations_for_alert_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_locations_for_alert(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_locations_for_alert(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_locations_for_alert_request(client, params, opts) end,
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

  defp build_list_locations_for_alert_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_locations_for_alert_partition_spec)

    %{
      id: "secret-scanning/list-locations-for-alert",
      args: params,
      call: {__MODULE__, :list_locations_for_alert},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/secret-scanning/alerts/{alert_number}/locations",
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
      telemetry: [:github_ex, :secret_scanning, :list_locations_for_alert],
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

  @list_org_pattern_configs_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List organization pattern configurations\n\nLists the secret scanning pattern configurations for an organization.\n\nPersonal access tokens (classic) need the `read:org` scope to use this endpoint."
  @spec list_org_pattern_configs(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_org_pattern_configs(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_org_pattern_configs_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_list_org_pattern_configs_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_org_pattern_configs_partition_spec)

    %{
      id: "secret-scanning/list-org-pattern-configs",
      args: params,
      call: {__MODULE__, :list_org_pattern_configs},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/secret-scanning/pattern-configurations",
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
      telemetry: [:github_ex, :secret_scanning, :list_org_pattern_configs],
      timeout: nil,
      pagination: nil
    }
  end

  @update_alert_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"alert_number", :alert_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update a secret scanning alert\n\nUpdates the status of a secret scanning alert in an eligible repository.\n\nYou can also use this endpoint to assign or unassign an alert to a user who has write access to the repository.\n\nThe authenticated user must be an administrator for the repository or for the organization that owns the repository to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` or `security_events` scope to use this endpoint. If this endpoint is only used with public repositories, the token can use the `public_repo` scope instead."
  @spec update_alert(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_alert(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_alert_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_alert_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_alert_partition_spec)

    %{
      id: "secret-scanning/update-alert",
      args: params,
      call: {__MODULE__, :update_alert},
      opts: opts,
      method: :patch,
      path_template: "/repos/{owner}/{repo}/secret-scanning/alerts/{alert_number}",
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
      telemetry: [:github_ex, :secret_scanning, :update_alert],
      timeout: nil,
      pagination: nil
    }
  end

  @update_org_pattern_configs_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update organization pattern configurations\n\nUpdates the secret scanning pattern configurations for an organization.\n\nPersonal access tokens (classic) need the `write:org` scope to use this endpoint."
  @spec update_org_pattern_configs(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_org_pattern_configs(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_org_pattern_configs_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_org_pattern_configs_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_org_pattern_configs_partition_spec)

    %{
      id: "secret-scanning/update-org-pattern-configs",
      args: params,
      call: {__MODULE__, :update_org_pattern_configs},
      opts: opts,
      method: :patch,
      path_template: "/orgs/{org}/secret-scanning/pattern-configurations",
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
      telemetry: [:github_ex, :secret_scanning, :update_org_pattern_configs],
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

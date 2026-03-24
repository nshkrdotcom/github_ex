defmodule GitHubEx.Dependabot do
  @moduledoc """
  Generated Github Ex operations for dependabot.
  """

  alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient

  @add_selected_repo_to_org_secret_partition_spec %{
    path: [
      {"org", :org},
      {"secret_name", :secret_name},
      {"repository_id", :repository_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add selected repository to an organization secret\n\nAdds a repository to an organization secret when the `visibility` for\nrepository access is set to `selected`. The visibility is set when you [Create or\nupdate an organization secret](https://docs.github.com/rest/dependabot/secrets#create-or-update-an-organization-secret).\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec add_selected_repo_to_org_secret(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def add_selected_repo_to_org_secret(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_add_selected_repo_to_org_secret_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_selected_repo_to_org_secret_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @add_selected_repo_to_org_secret_partition_spec)

    %{
      id: "dependabot/add-selected-repo-to-org-secret",
      args: params,
      call: {__MODULE__, :add_selected_repo_to_org_secret},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/dependabot/secrets/{secret_name}/repositories/{repository_id}",
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
      telemetry: [:github_ex, :dependabot, :add_selected_repo_to_org_secret],
      timeout: nil,
      pagination: nil
    }
  end

  @create_or_update_org_secret_partition_spec %{
    path: [{"org", :org}, {"secret_name", :secret_name}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create or update an organization secret\n\nCreates or updates an organization secret with an encrypted value. Encrypt your secret using\n[LibSodium](https://libsodium.gitbook.io/doc/bindings_for_other_languages). For more information, see \"[Encrypting secrets for the REST API](https://docs.github.com/rest/guides/encrypting-secrets-for-the-rest-api).\"\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec create_or_update_org_secret(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_or_update_org_secret(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_or_update_org_secret_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_or_update_org_secret_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_or_update_org_secret_partition_spec)

    %{
      id: "dependabot/create-or-update-org-secret",
      args: params,
      call: {__MODULE__, :create_or_update_org_secret},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/dependabot/secrets/{secret_name}",
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
      telemetry: [:github_ex, :dependabot, :create_or_update_org_secret],
      timeout: nil,
      pagination: nil
    }
  end

  @create_or_update_repo_secret_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"secret_name", :secret_name}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create or update a repository secret\n\nCreates or updates a repository secret with an encrypted value. Encrypt your secret using\n[LibSodium](https://libsodium.gitbook.io/doc/bindings_for_other_languages). For more information, see \"[Encrypting secrets for the REST API](https://docs.github.com/rest/guides/encrypting-secrets-for-the-rest-api).\"\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec create_or_update_repo_secret(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_or_update_repo_secret(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_or_update_repo_secret_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_or_update_repo_secret_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_or_update_repo_secret_partition_spec)

    %{
      id: "dependabot/create-or-update-repo-secret",
      args: params,
      call: {__MODULE__, :create_or_update_repo_secret},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/dependabot/secrets/{secret_name}",
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
      telemetry: [:github_ex, :dependabot, :create_or_update_repo_secret],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_org_secret_partition_spec %{
    path: [{"org", :org}, {"secret_name", :secret_name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete an organization secret\n\nDeletes a secret in an organization using the secret name.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec delete_org_secret(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_org_secret(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_org_secret_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_org_secret_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_org_secret_partition_spec)

    %{
      id: "dependabot/delete-org-secret",
      args: params,
      call: {__MODULE__, :delete_org_secret},
      opts: opts,
      method: :delete,
      path_template: "/orgs/{org}/dependabot/secrets/{secret_name}",
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
      telemetry: [:github_ex, :dependabot, :delete_org_secret],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_repo_secret_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"secret_name", :secret_name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a repository secret\n\nDeletes a secret in a repository using the secret name.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec delete_repo_secret(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_repo_secret(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_repo_secret_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_repo_secret_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_repo_secret_partition_spec)

    %{
      id: "dependabot/delete-repo-secret",
      args: params,
      call: {__MODULE__, :delete_repo_secret},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/dependabot/secrets/{secret_name}",
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
      telemetry: [:github_ex, :dependabot, :delete_repo_secret],
      timeout: nil,
      pagination: nil
    }
  end

  @get_alert_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"alert_number", :alert_number}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a Dependabot alert\n\nOAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint. If this endpoint is only used with public repositories, the token can use the `public_repo` scope instead."
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
      id: "dependabot/get-alert",
      args: params,
      call: {__MODULE__, :get_alert},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/dependabot/alerts/{alert_number}",
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
      telemetry: [:github_ex, :dependabot, :get_alert],
      timeout: nil,
      pagination: nil
    }
  end

  @get_org_public_key_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get an organization public key\n\nGets your public key, which you need to encrypt secrets. You need to\nencrypt a secret before you can create or update secrets.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec get_org_public_key(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_org_public_key(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_org_public_key_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_org_public_key_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_org_public_key_partition_spec)

    %{
      id: "dependabot/get-org-public-key",
      args: params,
      call: {__MODULE__, :get_org_public_key},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/dependabot/secrets/public-key",
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
      telemetry: [:github_ex, :dependabot, :get_org_public_key],
      timeout: nil,
      pagination: nil
    }
  end

  @get_org_secret_partition_spec %{
    path: [{"org", :org}, {"secret_name", :secret_name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get an organization secret\n\nGets a single organization secret without revealing its encrypted value.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec get_org_secret(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_org_secret(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_org_secret_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_org_secret_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_org_secret_partition_spec)

    %{
      id: "dependabot/get-org-secret",
      args: params,
      call: {__MODULE__, :get_org_secret},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/dependabot/secrets/{secret_name}",
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
      telemetry: [:github_ex, :dependabot, :get_org_secret],
      timeout: nil,
      pagination: nil
    }
  end

  @get_repo_public_key_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a repository public key\n\nGets your public key, which you need to encrypt secrets. You need to\nencrypt a secret before you can create or update secrets. Anyone with read access\nto the repository can use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint if the repository is private."
  @spec get_repo_public_key(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_repo_public_key(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_repo_public_key_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_repo_public_key_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_repo_public_key_partition_spec)

    %{
      id: "dependabot/get-repo-public-key",
      args: params,
      call: {__MODULE__, :get_repo_public_key},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/dependabot/secrets/public-key",
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
      telemetry: [:github_ex, :dependabot, :get_repo_public_key],
      timeout: nil,
      pagination: nil
    }
  end

  @get_repo_secret_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"secret_name", :secret_name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a repository secret\n\nGets a single repository secret without revealing its encrypted value.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_repo_secret(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_repo_secret(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_repo_secret_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_repo_secret_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_repo_secret_partition_spec)

    %{
      id: "dependabot/get-repo-secret",
      args: params,
      call: {__MODULE__, :get_repo_secret},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/dependabot/secrets/{secret_name}",
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
      telemetry: [:github_ex, :dependabot, :get_repo_secret],
      timeout: nil,
      pagination: nil
    }
  end

  @list_alerts_for_enterprise_partition_spec %{
    path: [{"enterprise", :enterprise}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"state", :state},
      {"severity", :severity},
      {"ecosystem", :ecosystem},
      {"package", :package},
      {"epss_percentage", :epss_percentage},
      {"has", :has},
      {"assignee", :assignee},
      {"scope", :scope},
      {"sort", :sort},
      {"direction", :direction},
      {"before", :before},
      {"after", :after},
      {"per_page", :per_page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List Dependabot alerts for an enterprise\n\nLists Dependabot alerts for repositories that are owned by the specified enterprise.\n\nThe authenticated user must be a member of the enterprise to use this endpoint.\n\nAlerts are only returned for organizations in the enterprise for which you are an organization owner or a security manager. For more information about security managers, see \"[Managing security managers in your organization](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/managing-security-managers-in-your-organization).\"\n\nOAuth app tokens and personal access tokens (classic) need the `repo` or `security_events` scope to use this endpoint."
  @spec list_alerts_for_enterprise(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_alerts_for_enterprise(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_alerts_for_enterprise_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_alerts_for_enterprise(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_alerts_for_enterprise(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_alerts_for_enterprise_request(client, params, opts) end,
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

  defp build_list_alerts_for_enterprise_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_alerts_for_enterprise_partition_spec)

    %{
      id: "dependabot/list-alerts-for-enterprise",
      args: params,
      call: {__MODULE__, :list_alerts_for_enterprise},
      opts: opts,
      method: :get,
      path_template: "/enterprises/{enterprise}/dependabot/alerts",
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
      telemetry: [:github_ex, :dependabot, :list_alerts_for_enterprise],
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

  @list_alerts_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"state", :state},
      {"severity", :severity},
      {"ecosystem", :ecosystem},
      {"package", :package},
      {"epss_percentage", :epss_percentage},
      {"artifact_registry_url", :artifact_registry_url},
      {"artifact_registry", :artifact_registry},
      {"has", :has},
      {"assignee", :assignee},
      {"runtime_risk", :runtime_risk},
      {"scope", :scope},
      {"sort", :sort},
      {"direction", :direction},
      {"before", :before},
      {"after", :after},
      {"per_page", :per_page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List Dependabot alerts for an organization\n\nLists Dependabot alerts for an organization.\n\nThe authenticated user must be an owner or security manager for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint. If this endpoint is only used with public repositories, the token can use the `public_repo` scope instead."
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
      id: "dependabot/list-alerts-for-org",
      args: params,
      call: {__MODULE__, :list_alerts_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/dependabot/alerts",
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
      telemetry: [:github_ex, :dependabot, :list_alerts_for_org],
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
      {"severity", :severity},
      {"ecosystem", :ecosystem},
      {"package", :package},
      {"manifest", :manifest},
      {"epss_percentage", :epss_percentage},
      {"has", :has},
      {"assignee", :assignee},
      {"scope", :scope},
      {"sort", :sort},
      {"direction", :direction},
      {"before", :before},
      {"after", :after},
      {"per_page", :per_page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List Dependabot alerts for a repository\n\nOAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint. If this endpoint is only used with public repositories, the token can use the `public_repo` scope instead."
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
      id: "dependabot/list-alerts-for-repo",
      args: params,
      call: {__MODULE__, :list_alerts_for_repo},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/dependabot/alerts",
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
      telemetry: [:github_ex, :dependabot, :list_alerts_for_repo],
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

  @list_org_secrets_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List organization secrets\n\nLists all secrets available in an organization without revealing their\nencrypted values.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec list_org_secrets(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_org_secrets(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_org_secrets_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_org_secrets(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_org_secrets(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_org_secrets_request(client, params, opts) end,
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

  defp build_list_org_secrets_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_org_secrets_partition_spec)

    %{
      id: "dependabot/list-org-secrets",
      args: params,
      call: {__MODULE__, :list_org_secrets},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/dependabot/secrets",
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
      telemetry: [:github_ex, :dependabot, :list_org_secrets],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["secrets"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_repo_secrets_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List repository secrets\n\nLists all secrets available in a repository without revealing their encrypted\nvalues.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec list_repo_secrets(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_repo_secrets(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_repo_secrets_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_repo_secrets(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_repo_secrets(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_repo_secrets_request(client, params, opts) end,
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

  defp build_list_repo_secrets_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_repo_secrets_partition_spec)

    %{
      id: "dependabot/list-repo-secrets",
      args: params,
      call: {__MODULE__, :list_repo_secrets},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/dependabot/secrets",
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
      telemetry: [:github_ex, :dependabot, :list_repo_secrets],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["secrets"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_selected_repos_for_org_secret_partition_spec %{
    path: [{"org", :org}, {"secret_name", :secret_name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"page", :page}, {"per_page", :per_page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List selected repositories for an organization secret\n\nLists all repositories that have been selected when the `visibility`\nfor repository access to a secret is set to `selected`.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec list_selected_repos_for_org_secret(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_selected_repos_for_org_secret(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_selected_repos_for_org_secret_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_selected_repos_for_org_secret(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_selected_repos_for_org_secret(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_selected_repos_for_org_secret_request(client, params, opts) end,
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

  defp build_list_selected_repos_for_org_secret_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @list_selected_repos_for_org_secret_partition_spec)

    %{
      id: "dependabot/list-selected-repos-for-org-secret",
      args: params,
      call: {__MODULE__, :list_selected_repos_for_org_secret},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/dependabot/secrets/{secret_name}/repositories",
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
      telemetry: [:github_ex, :dependabot, :list_selected_repos_for_org_secret],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["repositories"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @remove_selected_repo_from_org_secret_partition_spec %{
    path: [
      {"org", :org},
      {"secret_name", :secret_name},
      {"repository_id", :repository_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove selected repository from an organization secret\n\nRemoves a repository from an organization secret when the `visibility`\nfor repository access is set to `selected`. The visibility is set when you [Create\nor update an organization secret](https://docs.github.com/rest/dependabot/secrets#create-or-update-an-organization-secret).\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec remove_selected_repo_from_org_secret(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def remove_selected_repo_from_org_secret(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_remove_selected_repo_from_org_secret_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_remove_selected_repo_from_org_secret_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @remove_selected_repo_from_org_secret_partition_spec)

    %{
      id: "dependabot/remove-selected-repo-from-org-secret",
      args: params,
      call: {__MODULE__, :remove_selected_repo_from_org_secret},
      opts: opts,
      method: :delete,
      path_template: "/orgs/{org}/dependabot/secrets/{secret_name}/repositories/{repository_id}",
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
      telemetry: [:github_ex, :dependabot, :remove_selected_repo_from_org_secret],
      timeout: nil,
      pagination: nil
    }
  end

  @repository_access_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"page", :page}, {"per_page", :per_page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Lists the repositories Dependabot can access in an organization\n\nLists repositories that organization admins have allowed Dependabot to access when updating dependencies.\n> [!NOTE]\n>    This operation supports both server-to-server and user-to-server access.\nUnauthorized users will not see the existence of this endpoint."
  @spec repository_access_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def repository_access_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_repository_access_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_repository_access_for_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_repository_access_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_repository_access_for_org_request(client, params, opts) end,
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

  defp build_repository_access_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @repository_access_for_org_partition_spec)

    %{
      id: "dependabot/repository-access-for-org",
      args: params,
      call: {__MODULE__, :repository_access_for_org},
      opts: opts,
      method: :get,
      path_template: "/organizations/{org}/dependabot/repository-access",
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
      telemetry: [:github_ex, :dependabot, :repository_access_for_org],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["accessible_repositories"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @set_repository_access_default_level_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set the default repository access level for Dependabot\n\nSets the default level of repository access Dependabot will have while performing an update.  Available values are:\n- 'public' - Dependabot will only have access to public repositories, unless access is explicitly granted to non-public repositories.\n- 'internal' - Dependabot will only have access to public and internal repositories, unless access is explicitly granted to private repositories.\n\nUnauthorized users will not see the existence of this endpoint.\n\nThis operation supports both server-to-server and user-to-server access."
  @spec set_repository_access_default_level(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_repository_access_default_level(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_set_repository_access_default_level_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_repository_access_default_level_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @set_repository_access_default_level_partition_spec)

    %{
      id: "dependabot/set-repository-access-default-level",
      args: params,
      call: {__MODULE__, :set_repository_access_default_level},
      opts: opts,
      method: :put,
      path_template: "/organizations/{org}/dependabot/repository-access/default-level",
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
      telemetry: [:github_ex, :dependabot, :set_repository_access_default_level],
      timeout: nil,
      pagination: nil
    }
  end

  @set_selected_repos_for_org_secret_partition_spec %{
    path: [{"org", :org}, {"secret_name", :secret_name}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set selected repositories for an organization secret\n\nReplaces all repositories for an organization secret when the `visibility`\nfor repository access is set to `selected`. The visibility is set when you [Create\nor update an organization secret](https://docs.github.com/rest/dependabot/secrets#create-or-update-an-organization-secret).\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec set_selected_repos_for_org_secret(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_selected_repos_for_org_secret(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_set_selected_repos_for_org_secret_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_selected_repos_for_org_secret_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @set_selected_repos_for_org_secret_partition_spec)

    %{
      id: "dependabot/set-selected-repos-for-org-secret",
      args: params,
      call: {__MODULE__, :set_selected_repos_for_org_secret},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/dependabot/secrets/{secret_name}/repositories",
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
      telemetry: [:github_ex, :dependabot, :set_selected_repos_for_org_secret],
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

  @doc "Update a Dependabot alert\n\nThe authenticated user must have access to security alerts for the repository to use this endpoint. For more information, see \"[Granting access to security alerts](https://docs.github.com/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-security-and-analysis-settings-for-your-repository#granting-access-to-security-alerts).\"\n\nOAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint. If this endpoint is only used with public repositories, the token can use the `public_repo` scope instead."
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
      id: "dependabot/update-alert",
      args: params,
      call: {__MODULE__, :update_alert},
      opts: opts,
      method: :patch,
      path_template: "/repos/{owner}/{repo}/dependabot/alerts/{alert_number}",
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
      telemetry: [:github_ex, :dependabot, :update_alert],
      timeout: nil,
      pagination: nil
    }
  end

  @update_repository_access_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Updates Dependabot's repository access list for an organization

       Updates repositories according to the list of repositories that organization admins have given Dependabot access to when they've updated dependencies.

       > [!NOTE]
       >    This operation supports both server-to-server and user-to-server access.
       Unauthorized users will not see the existence of this endpoint.

       **Example request body:**
       ```json
       {
       "repository_ids_to_add": [123, 456],
       "repository_ids_to_remove": [789]
       }
       ```
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec update_repository_access_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def update_repository_access_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_repository_access_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_repository_access_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_repository_access_for_org_partition_spec)

    %{
      id: "dependabot/update-repository-access-for-org",
      args: params,
      call: {__MODULE__, :update_repository_access_for_org},
      opts: opts,
      method: :patch,
      path_template: "/organizations/{org}/dependabot/repository-access",
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
      telemetry: [:github_ex, :dependabot, :update_repository_access_for_org],
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

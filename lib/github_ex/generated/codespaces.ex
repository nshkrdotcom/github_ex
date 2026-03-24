defmodule GitHubEx.Codespaces do
  @moduledoc """
  Generated Github Ex operations for codespaces.
  """

  alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient

  @add_repository_for_secret_for_authenticated_user_partition_spec %{
    path: [{"secret_name", :secret_name}, {"repository_id", :repository_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add a selected repository to a user secret\n\nAdds a repository to the selected repositories for a user's development environment secret.\n\nThe authenticated user must have Codespaces access to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `codespace` or `codespace:secrets` scope to use this endpoint."
  @spec add_repository_for_secret_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def add_repository_for_secret_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_add_repository_for_secret_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_repository_for_secret_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @add_repository_for_secret_for_authenticated_user_partition_spec
      )

    %{
      id: "codespaces/add-repository-for-secret-for-authenticated-user",
      args: params,
      call: {__MODULE__, :add_repository_for_secret_for_authenticated_user},
      opts: opts,
      method: :put,
      path_template: "/user/codespaces/secrets/{secret_name}/repositories/{repository_id}",
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
      telemetry: [:github_ex, :codespaces, :add_repository_for_secret_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

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

  @doc "Add selected repository to an organization secret\n\nAdds a repository to an organization development environment secret when the `visibility` for repository access is set to `selected`. The visibility is set when you [Create or update an organization secret](https://docs.github.com/rest/codespaces/organization-secrets#create-or-update-an-organization-secret).\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
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
      id: "codespaces/add-selected-repo-to-org-secret",
      args: params,
      call: {__MODULE__, :add_selected_repo_to_org_secret},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/codespaces/secrets/{secret_name}/repositories/{repository_id}",
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
      telemetry: [:github_ex, :codespaces, :add_selected_repo_to_org_secret],
      timeout: nil,
      pagination: nil
    }
  end

  @check_permissions_for_devcontainer_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"ref", :ref}, {"devcontainer_path", :devcontainer_path}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Check if permissions defined by a devcontainer have been accepted by the authenticated user\n\nChecks whether the permissions defined by a given devcontainer configuration have been accepted by the authenticated user.\n\nOAuth app tokens and personal access tokens (classic) need the `codespace` scope to use this endpoint."
  @spec check_permissions_for_devcontainer(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def check_permissions_for_devcontainer(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_check_permissions_for_devcontainer_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_check_permissions_for_devcontainer_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @check_permissions_for_devcontainer_partition_spec)

    %{
      id: "codespaces/check-permissions-for-devcontainer",
      args: params,
      call: {__MODULE__, :check_permissions_for_devcontainer},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/codespaces/permissions_check",
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
      telemetry: [:github_ex, :codespaces, :check_permissions_for_devcontainer],
      timeout: nil,
      pagination: nil
    }
  end

  @codespace_machines_for_authenticated_user_partition_spec %{
    path: [{"codespace_name", :codespace_name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List machine types for a codespace\n\nList the machine types a codespace can transition to use.\n\nOAuth app tokens and personal access tokens (classic) need the `codespace` scope to use this endpoint."
  @spec codespace_machines_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def codespace_machines_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_codespace_machines_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_codespace_machines_for_authenticated_user(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_codespace_machines_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_codespace_machines_for_authenticated_user_request(client, params, opts) end,
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

  defp build_codespace_machines_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @codespace_machines_for_authenticated_user_partition_spec)

    %{
      id: "codespaces/codespace-machines-for-authenticated-user",
      args: params,
      call: {__MODULE__, :codespace_machines_for_authenticated_user},
      opts: opts,
      method: :get,
      path_template: "/user/codespaces/{codespace_name}/machines",
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
      telemetry: [:github_ex, :codespaces, :codespace_machines_for_authenticated_user],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["machines"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @create_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a codespace for the authenticated user\n\nCreates a new codespace, owned by the authenticated user.\n\nThis endpoint requires either a `repository_id` OR a `pull_request` but not both.\n\nOAuth app tokens and personal access tokens (classic) need the `codespace` scope to use this endpoint."
  @spec create_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def create_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_for_authenticated_user_partition_spec)

    %{
      id: "codespaces/create-for-authenticated-user",
      args: params,
      call: {__MODULE__, :create_for_authenticated_user},
      opts: opts,
      method: :post,
      path_template: "/user/codespaces",
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
      telemetry: [:github_ex, :codespaces, :create_for_authenticated_user],
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

  @doc "Create or update an organization secret\n\nCreates or updates an organization development environment secret with an encrypted value. Encrypt your secret using\n[LibSodium](https://libsodium.gitbook.io/doc/bindings_for_other_languages). For more information, see \"[Encrypting secrets for the REST API](https://docs.github.com/rest/guides/encrypting-secrets-for-the-rest-api).\"\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
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
      id: "codespaces/create-or-update-org-secret",
      args: params,
      call: {__MODULE__, :create_or_update_org_secret},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/codespaces/secrets/{secret_name}",
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
      telemetry: [:github_ex, :codespaces, :create_or_update_org_secret],
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

  @doc "Create or update a repository secret\n\nCreates or updates a repository development environment secret with an encrypted value. Encrypt your secret using\n[LibSodium](https://libsodium.gitbook.io/doc/bindings_for_other_languages). For more information, see \"[Encrypting secrets for the REST API](https://docs.github.com/rest/guides/encrypting-secrets-for-the-rest-api).\"\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint. The associated user must be a repository admin."
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
      id: "codespaces/create-or-update-repo-secret",
      args: params,
      call: {__MODULE__, :create_or_update_repo_secret},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/codespaces/secrets/{secret_name}",
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
      telemetry: [:github_ex, :codespaces, :create_or_update_repo_secret],
      timeout: nil,
      pagination: nil
    }
  end

  @create_or_update_secret_for_authenticated_user_partition_spec %{
    path: [{"secret_name", :secret_name}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create or update a secret for the authenticated user\n\nCreates or updates a development environment secret for a user's codespace with an encrypted value. Encrypt your secret using\n[LibSodium](https://libsodium.gitbook.io/doc/bindings_for_other_languages). For more information, see \"[Encrypting secrets for the REST API](https://docs.github.com/rest/guides/encrypting-secrets-for-the-rest-api).\"\n\nThe authenticated user must have Codespaces access to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `codespace` or `codespace:secrets` scope to use this endpoint."
  @spec create_or_update_secret_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def create_or_update_secret_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_or_update_secret_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_or_update_secret_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @create_or_update_secret_for_authenticated_user_partition_spec
      )

    %{
      id: "codespaces/create-or-update-secret-for-authenticated-user",
      args: params,
      call: {__MODULE__, :create_or_update_secret_for_authenticated_user},
      opts: opts,
      method: :put,
      path_template: "/user/codespaces/secrets/{secret_name}",
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
      telemetry: [:github_ex, :codespaces, :create_or_update_secret_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @create_with_pr_for_authenticated_user_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"pull_number", :pull_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a codespace from a pull request\n\nCreates a codespace owned by the authenticated user for the specified pull request.\n\nOAuth app tokens and personal access tokens (classic) need the `codespace` scope to use this endpoint."
  @spec create_with_pr_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def create_with_pr_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_with_pr_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_with_pr_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @create_with_pr_for_authenticated_user_partition_spec)

    %{
      id: "codespaces/create-with-pr-for-authenticated-user",
      args: params,
      call: {__MODULE__, :create_with_pr_for_authenticated_user},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/pulls/{pull_number}/codespaces",
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
      telemetry: [:github_ex, :codespaces, :create_with_pr_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @create_with_repo_for_authenticated_user_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a codespace in a repository\n\nCreates a codespace owned by the authenticated user in the specified repository.\n\nOAuth app tokens and personal access tokens (classic) need the `codespace` scope to use this endpoint."
  @spec create_with_repo_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def create_with_repo_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_with_repo_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_with_repo_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @create_with_repo_for_authenticated_user_partition_spec)

    %{
      id: "codespaces/create-with-repo-for-authenticated-user",
      args: params,
      call: {__MODULE__, :create_with_repo_for_authenticated_user},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/codespaces",
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
      telemetry: [:github_ex, :codespaces, :create_with_repo_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_codespaces_access_users_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove users from Codespaces access for an organization\n\nCodespaces for the specified users will no longer be billed to the organization.\n\nTo use this endpoint, the access settings for the organization must be set to `selected_members`.\nFor information on how to change this setting, see \"[Manage access control for organization codespaces](https://docs.github.com/rest/codespaces/organizations#manage-access-control-for-organization-codespaces).\"\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec delete_codespaces_access_users(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def delete_codespaces_access_users(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_codespaces_access_users_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_codespaces_access_users_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_codespaces_access_users_partition_spec)

    %{
      id: "codespaces/delete-codespaces-access-users",
      args: params,
      call: {__MODULE__, :delete_codespaces_access_users},
      opts: opts,
      method: :delete,
      path_template: "/orgs/{org}/codespaces/access/selected_users",
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
      telemetry: [:github_ex, :codespaces, :delete_codespaces_access_users],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_for_authenticated_user_partition_spec %{
    path: [{"codespace_name", :codespace_name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a codespace for the authenticated user\n\nDeletes a user's codespace.\n\nOAuth app tokens and personal access tokens (classic) need the `codespace` scope to use this endpoint."
  @spec delete_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def delete_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_for_authenticated_user_partition_spec)

    %{
      id: "codespaces/delete-for-authenticated-user",
      args: params,
      call: {__MODULE__, :delete_for_authenticated_user},
      opts: opts,
      method: :delete,
      path_template: "/user/codespaces/{codespace_name}",
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
      telemetry: [:github_ex, :codespaces, :delete_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_from_organization_partition_spec %{
    path: [
      {"org", :org},
      {"username", :username},
      {"codespace_name", :codespace_name}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a codespace from the organization\n\nDeletes a user's codespace.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec delete_from_organization(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_from_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_from_organization_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_from_organization_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_from_organization_partition_spec)

    %{
      id: "codespaces/delete-from-organization",
      args: params,
      call: {__MODULE__, :delete_from_organization},
      opts: opts,
      method: :delete,
      path_template: "/orgs/{org}/members/{username}/codespaces/{codespace_name}",
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
      telemetry: [:github_ex, :codespaces, :delete_from_organization],
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

  @doc "Delete an organization secret\n\nDeletes an organization development environment secret using the secret name.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
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
      id: "codespaces/delete-org-secret",
      args: params,
      call: {__MODULE__, :delete_org_secret},
      opts: opts,
      method: :delete,
      path_template: "/orgs/{org}/codespaces/secrets/{secret_name}",
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
      telemetry: [:github_ex, :codespaces, :delete_org_secret],
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

  @doc "Delete a repository secret\n\nDeletes a development environment secret in a repository using the secret name.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint. The associated user must be a repository admin."
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
      id: "codespaces/delete-repo-secret",
      args: params,
      call: {__MODULE__, :delete_repo_secret},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/codespaces/secrets/{secret_name}",
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
      telemetry: [:github_ex, :codespaces, :delete_repo_secret],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_secret_for_authenticated_user_partition_spec %{
    path: [{"secret_name", :secret_name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a secret for the authenticated user\n\nDeletes a development environment secret from a user's codespaces using the secret name. Deleting the secret will remove access from all codespaces that were allowed to access the secret.\n\nThe authenticated user must have Codespaces access to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `codespace` or `codespace:secrets` scope to use this endpoint."
  @spec delete_secret_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def delete_secret_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_secret_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_secret_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @delete_secret_for_authenticated_user_partition_spec)

    %{
      id: "codespaces/delete-secret-for-authenticated-user",
      args: params,
      call: {__MODULE__, :delete_secret_for_authenticated_user},
      opts: opts,
      method: :delete,
      path_template: "/user/codespaces/secrets/{secret_name}",
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
      telemetry: [:github_ex, :codespaces, :delete_secret_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @export_for_authenticated_user_partition_spec %{
    path: [{"codespace_name", :codespace_name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Export a codespace for the authenticated user\n\nTriggers an export of the specified codespace and returns a URL and ID where the status of the export can be monitored.\n\nIf changes cannot be pushed to the codespace's repository, they will be pushed to a new or previously-existing fork instead.\n\nOAuth app tokens and personal access tokens (classic) need the `codespace` scope to use this endpoint."
  @spec export_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def export_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_export_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_export_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @export_for_authenticated_user_partition_spec)

    %{
      id: "codespaces/export-for-authenticated-user",
      args: params,
      call: {__MODULE__, :export_for_authenticated_user},
      opts: opts,
      method: :post,
      path_template: "/user/codespaces/{codespace_name}/exports",
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
      telemetry: [:github_ex, :codespaces, :export_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @get_codespaces_for_user_in_org_partition_spec %{
    path: [{"org", :org}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List codespaces for a user in organization\n\nLists the codespaces that a member of an organization has for repositories in that organization.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec get_codespaces_for_user_in_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_codespaces_for_user_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_codespaces_for_user_in_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_get_codespaces_for_user_in_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_get_codespaces_for_user_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_get_codespaces_for_user_in_org_request(client, params, opts) end,
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

  defp build_get_codespaces_for_user_in_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_codespaces_for_user_in_org_partition_spec)

    %{
      id: "codespaces/get-codespaces-for-user-in-org",
      args: params,
      call: {__MODULE__, :get_codespaces_for_user_in_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/members/{username}/codespaces",
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
      telemetry: [:github_ex, :codespaces, :get_codespaces_for_user_in_org],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["codespaces"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @get_export_details_for_authenticated_user_partition_spec %{
    path: [{"codespace_name", :codespace_name}, {"export_id", :export_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get details about a codespace export\n\nGets information about an export of a codespace.\n\nOAuth app tokens and personal access tokens (classic) need the `codespace` scope to use this endpoint."
  @spec get_export_details_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_export_details_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_export_details_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_export_details_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @get_export_details_for_authenticated_user_partition_spec)

    %{
      id: "codespaces/get-export-details-for-authenticated-user",
      args: params,
      call: {__MODULE__, :get_export_details_for_authenticated_user},
      opts: opts,
      method: :get,
      path_template: "/user/codespaces/{codespace_name}/exports/{export_id}",
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
      telemetry: [:github_ex, :codespaces, :get_export_details_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @get_for_authenticated_user_partition_spec %{
    path: [{"codespace_name", :codespace_name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a codespace for the authenticated user\n\nGets information about a user's codespace.\n\nOAuth app tokens and personal access tokens (classic) need the `codespace` scope to use this endpoint."
  @spec get_for_authenticated_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_for_authenticated_user_partition_spec)

    %{
      id: "codespaces/get-for-authenticated-user",
      args: params,
      call: {__MODULE__, :get_for_authenticated_user},
      opts: opts,
      method: :get,
      path_template: "/user/codespaces/{codespace_name}",
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
      telemetry: [:github_ex, :codespaces, :get_for_authenticated_user],
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

  @doc "Get an organization public key\n\nGets a public key for an organization, which is required in order to encrypt secrets. You need to encrypt the value of a secret before you can create or update secrets.\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
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
      id: "codespaces/get-org-public-key",
      args: params,
      call: {__MODULE__, :get_org_public_key},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/codespaces/secrets/public-key",
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
      telemetry: [:github_ex, :codespaces, :get_org_public_key],
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

  @doc "Get an organization secret\n\nGets an organization development environment secret without revealing its encrypted value.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
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
      id: "codespaces/get-org-secret",
      args: params,
      call: {__MODULE__, :get_org_secret},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/codespaces/secrets/{secret_name}",
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
      telemetry: [:github_ex, :codespaces, :get_org_secret],
      timeout: nil,
      pagination: nil
    }
  end

  @get_public_key_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get public key for the authenticated user\n\nGets your public key, which you need to encrypt secrets. You need to encrypt a secret before you can create or update secrets.\n\nThe authenticated user must have Codespaces access to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `codespace` or `codespace:secrets` scope to use this endpoint."
  @spec get_public_key_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_public_key_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_public_key_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_public_key_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @get_public_key_for_authenticated_user_partition_spec)

    %{
      id: "codespaces/get-public-key-for-authenticated-user",
      args: params,
      call: {__MODULE__, :get_public_key_for_authenticated_user},
      opts: opts,
      method: :get,
      path_template: "/user/codespaces/secrets/public-key",
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
      telemetry: [:github_ex, :codespaces, :get_public_key_for_authenticated_user],
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

  @doc "Get a repository public key\n\nGets your public key, which you need to encrypt secrets. You need to\nencrypt a secret before you can create or update secrets.\n\nIf the repository is private, OAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
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
      id: "codespaces/get-repo-public-key",
      args: params,
      call: {__MODULE__, :get_repo_public_key},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/codespaces/secrets/public-key",
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
      telemetry: [:github_ex, :codespaces, :get_repo_public_key],
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

  @doc "Get a repository secret\n\nGets a single repository development environment secret without revealing its encrypted value.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
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
      id: "codespaces/get-repo-secret",
      args: params,
      call: {__MODULE__, :get_repo_secret},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/codespaces/secrets/{secret_name}",
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
      telemetry: [:github_ex, :codespaces, :get_repo_secret],
      timeout: nil,
      pagination: nil
    }
  end

  @get_secret_for_authenticated_user_partition_spec %{
    path: [{"secret_name", :secret_name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a secret for the authenticated user\n\nGets a development environment secret available to a user's codespaces without revealing its encrypted value.\n\nThe authenticated user must have Codespaces access to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `codespace` or `codespace:secrets` scope to use this endpoint."
  @spec get_secret_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_secret_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_secret_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_secret_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_secret_for_authenticated_user_partition_spec)

    %{
      id: "codespaces/get-secret-for-authenticated-user",
      args: params,
      call: {__MODULE__, :get_secret_for_authenticated_user},
      opts: opts,
      method: :get,
      path_template: "/user/codespaces/secrets/{secret_name}",
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
      telemetry: [:github_ex, :codespaces, :get_secret_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @list_devcontainers_in_repository_for_authenticated_user_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List devcontainer configurations in a repository for the authenticated user\n\nLists the devcontainer.json files associated with a specified repository and the authenticated user. These files\nspecify launchpoint configurations for codespaces created within the repository.\n\nOAuth app tokens and personal access tokens (classic) need the `codespace` scope to use this endpoint."
  @spec list_devcontainers_in_repository_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_devcontainers_in_repository_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_list_devcontainers_in_repository_for_authenticated_user_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_devcontainers_in_repository_for_authenticated_user(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_list_devcontainers_in_repository_for_authenticated_user(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn ->
        build_list_devcontainers_in_repository_for_authenticated_user_request(
          client,
          params,
          opts
        )
      end,
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

  defp build_list_devcontainers_in_repository_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @list_devcontainers_in_repository_for_authenticated_user_partition_spec
      )

    %{
      id: "codespaces/list-devcontainers-in-repository-for-authenticated-user",
      args: params,
      call: {__MODULE__, :list_devcontainers_in_repository_for_authenticated_user},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/codespaces/devcontainers",
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
      telemetry: [
        :github_ex,
        :codespaces,
        :list_devcontainers_in_repository_for_authenticated_user
      ],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["devcontainers"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"per_page", :per_page},
      {"page", :page},
      {"repository_id", :repository_id}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List codespaces for the authenticated user\n\nLists the authenticated user's codespaces.\n\nOAuth app tokens and personal access tokens (classic) need the `codespace` scope to use this endpoint."
  @spec list_for_authenticated_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_for_authenticated_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_for_authenticated_user_request(client, params, opts) end,
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

  defp build_list_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_for_authenticated_user_partition_spec)

    %{
      id: "codespaces/list-for-authenticated-user",
      args: params,
      call: {__MODULE__, :list_for_authenticated_user},
      opts: opts,
      method: :get,
      path_template: "/user/codespaces",
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
      telemetry: [:github_ex, :codespaces, :list_for_authenticated_user],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["codespaces"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_in_organization_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List codespaces for the organization\n\nLists the codespaces associated to a specified organization.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec list_in_organization(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_in_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_in_organization_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_in_organization(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_in_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_in_organization_request(client, params, opts) end,
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

  defp build_list_in_organization_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_in_organization_partition_spec)

    %{
      id: "codespaces/list-in-organization",
      args: params,
      call: {__MODULE__, :list_in_organization},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/codespaces",
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
      telemetry: [:github_ex, :codespaces, :list_in_organization],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["codespaces"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_in_repository_for_authenticated_user_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List codespaces in a repository for the authenticated user\n\nLists the codespaces associated to a specified repository and the authenticated user.\n\nOAuth app tokens and personal access tokens (classic) need the `codespace` scope to use this endpoint."
  @spec list_in_repository_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_in_repository_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_in_repository_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_in_repository_for_authenticated_user(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_list_in_repository_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_in_repository_for_authenticated_user_request(client, params, opts) end,
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

  defp build_list_in_repository_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @list_in_repository_for_authenticated_user_partition_spec)

    %{
      id: "codespaces/list-in-repository-for-authenticated-user",
      args: params,
      call: {__MODULE__, :list_in_repository_for_authenticated_user},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/codespaces",
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
      telemetry: [:github_ex, :codespaces, :list_in_repository_for_authenticated_user],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["codespaces"],
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

  @doc "List organization secrets\n\nLists all Codespaces development environment secrets available at the organization-level without revealing their encrypted\nvalues.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
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
      id: "codespaces/list-org-secrets",
      args: params,
      call: {__MODULE__, :list_org_secrets},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/codespaces/secrets",
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
      telemetry: [:github_ex, :codespaces, :list_org_secrets],
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

  @doc "List repository secrets\n\nLists all development environment secrets available in a repository without revealing their encrypted\nvalues.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
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
      id: "codespaces/list-repo-secrets",
      args: params,
      call: {__MODULE__, :list_repo_secrets},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/codespaces/secrets",
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
      telemetry: [:github_ex, :codespaces, :list_repo_secrets],
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

  @list_repositories_for_secret_for_authenticated_user_partition_spec %{
    path: [{"secret_name", :secret_name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List selected repositories for a user secret\n\nList the repositories that have been granted the ability to use a user's development environment secret.\n\nThe authenticated user must have Codespaces access to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `codespace` or `codespace:secrets` scope to use this endpoint."
  @spec list_repositories_for_secret_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_repositories_for_secret_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_list_repositories_for_secret_for_authenticated_user_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_repositories_for_secret_for_authenticated_user(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_list_repositories_for_secret_for_authenticated_user(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn ->
        build_list_repositories_for_secret_for_authenticated_user_request(client, params, opts)
      end,
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

  defp build_list_repositories_for_secret_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @list_repositories_for_secret_for_authenticated_user_partition_spec
      )

    %{
      id: "codespaces/list-repositories-for-secret-for-authenticated-user",
      args: params,
      call: {__MODULE__, :list_repositories_for_secret_for_authenticated_user},
      opts: opts,
      method: :get,
      path_template: "/user/codespaces/secrets/{secret_name}/repositories",
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
      telemetry: [:github_ex, :codespaces, :list_repositories_for_secret_for_authenticated_user],
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

  @list_secrets_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List secrets for the authenticated user\n\nLists all development environment secrets available for a user's codespaces without revealing their\nencrypted values.\n\nThe authenticated user must have Codespaces access to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `codespace` or `codespace:secrets` scope to use this endpoint."
  @spec list_secrets_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_secrets_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_secrets_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_secrets_for_authenticated_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_secrets_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_secrets_for_authenticated_user_request(client, params, opts) end,
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

  defp build_list_secrets_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @list_secrets_for_authenticated_user_partition_spec)

    %{
      id: "codespaces/list-secrets-for-authenticated-user",
      args: params,
      call: {__MODULE__, :list_secrets_for_authenticated_user},
      opts: opts,
      method: :get,
      path_template: "/user/codespaces/secrets",
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
      telemetry: [:github_ex, :codespaces, :list_secrets_for_authenticated_user],
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
      id: "codespaces/list-selected-repos-for-org-secret",
      args: params,
      call: {__MODULE__, :list_selected_repos_for_org_secret},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/codespaces/secrets/{secret_name}/repositories",
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
      telemetry: [:github_ex, :codespaces, :list_selected_repos_for_org_secret],
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

  @pre_flight_with_repo_for_authenticated_user_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"ref", :ref}, {"client_ip", :client_ip}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get default attributes for a codespace\n\nGets the default attributes for codespaces created by the user with the repository.\n\nOAuth app tokens and personal access tokens (classic) need the `codespace` scope to use this endpoint."
  @spec pre_flight_with_repo_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def pre_flight_with_repo_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_pre_flight_with_repo_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_pre_flight_with_repo_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @pre_flight_with_repo_for_authenticated_user_partition_spec)

    %{
      id: "codespaces/pre-flight-with-repo-for-authenticated-user",
      args: params,
      call: {__MODULE__, :pre_flight_with_repo_for_authenticated_user},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/codespaces/new",
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
      telemetry: [:github_ex, :codespaces, :pre_flight_with_repo_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @publish_for_authenticated_user_partition_spec %{
    path: [{"codespace_name", :codespace_name}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a repository from an unpublished codespace\n\nPublishes an unpublished codespace, creating a new repository and assigning it to the codespace.\n\nThe codespace's token is granted write permissions to the repository, allowing the user to push their changes.\n\nThis will fail for a codespace that is already published, meaning it has an associated repository.\n\nOAuth app tokens and personal access tokens (classic) need the `codespace` scope to use this endpoint."
  @spec publish_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def publish_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_publish_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_publish_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @publish_for_authenticated_user_partition_spec)

    %{
      id: "codespaces/publish-for-authenticated-user",
      args: params,
      call: {__MODULE__, :publish_for_authenticated_user},
      opts: opts,
      method: :post,
      path_template: "/user/codespaces/{codespace_name}/publish",
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
      telemetry: [:github_ex, :codespaces, :publish_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @remove_repository_for_secret_for_authenticated_user_partition_spec %{
    path: [{"secret_name", :secret_name}, {"repository_id", :repository_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove a selected repository from a user secret\n\nRemoves a repository from the selected repositories for a user's development environment secret.\n\nThe authenticated user must have Codespaces access to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `codespace` or `codespace:secrets` scope to use this endpoint."
  @spec remove_repository_for_secret_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def remove_repository_for_secret_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_remove_repository_for_secret_for_authenticated_user_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_remove_repository_for_secret_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @remove_repository_for_secret_for_authenticated_user_partition_spec
      )

    %{
      id: "codespaces/remove-repository-for-secret-for-authenticated-user",
      args: params,
      call: {__MODULE__, :remove_repository_for_secret_for_authenticated_user},
      opts: opts,
      method: :delete,
      path_template: "/user/codespaces/secrets/{secret_name}/repositories/{repository_id}",
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
      telemetry: [:github_ex, :codespaces, :remove_repository_for_secret_for_authenticated_user],
      timeout: nil,
      pagination: nil
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

  @doc "Remove selected repository from an organization secret\n\nRemoves a repository from an organization development environment secret when the `visibility`\nfor repository access is set to `selected`. The visibility is set when you [Create\nor update an organization secret](https://docs.github.com/rest/codespaces/organization-secrets#create-or-update-an-organization-secret).\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
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
      id: "codespaces/remove-selected-repo-from-org-secret",
      args: params,
      call: {__MODULE__, :remove_selected_repo_from_org_secret},
      opts: opts,
      method: :delete,
      path_template: "/orgs/{org}/codespaces/secrets/{secret_name}/repositories/{repository_id}",
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
      telemetry: [:github_ex, :codespaces, :remove_selected_repo_from_org_secret],
      timeout: nil,
      pagination: nil
    }
  end

  @repo_machines_for_authenticated_user_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"location", :location}, {"client_ip", :client_ip}, {"ref", :ref}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List available machine types for a repository\n\nList the machine types available for a given repository based on its configuration.\n\nOAuth app tokens and personal access tokens (classic) need the `codespace` scope to use this endpoint."
  @spec repo_machines_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def repo_machines_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_repo_machines_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_repo_machines_for_authenticated_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_repo_machines_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_repo_machines_for_authenticated_user_request(client, params, opts) end,
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

  defp build_repo_machines_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @repo_machines_for_authenticated_user_partition_spec)

    %{
      id: "codespaces/repo-machines-for-authenticated-user",
      args: params,
      call: {__MODULE__, :repo_machines_for_authenticated_user},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/codespaces/machines",
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
      telemetry: [:github_ex, :codespaces, :repo_machines_for_authenticated_user],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["machines"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @set_codespaces_access_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Manage access control for organization codespaces\n\nSets which users can access codespaces in an organization. This is synonymous with granting or revoking codespaces access permissions for users according to the visibility.\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec set_codespaces_access(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def set_codespaces_access(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_set_codespaces_access_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_codespaces_access_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @set_codespaces_access_partition_spec)

    %{
      id: "codespaces/set-codespaces-access",
      args: params,
      call: {__MODULE__, :set_codespaces_access},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/codespaces/access",
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
      telemetry: [:github_ex, :codespaces, :set_codespaces_access],
      timeout: nil,
      pagination: nil
    }
  end

  @set_codespaces_access_users_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add users to Codespaces access for an organization\n\nCodespaces for the specified users will be billed to the organization.\n\nTo use this endpoint, the access settings for the organization must be set to `selected_members`.\nFor information on how to change this setting, see \"[Manage access control for organization codespaces](https://docs.github.com/rest/codespaces/organizations#manage-access-control-for-organization-codespaces).\"\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec set_codespaces_access_users(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def set_codespaces_access_users(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_set_codespaces_access_users_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_codespaces_access_users_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @set_codespaces_access_users_partition_spec)

    %{
      id: "codespaces/set-codespaces-access-users",
      args: params,
      call: {__MODULE__, :set_codespaces_access_users},
      opts: opts,
      method: :post,
      path_template: "/orgs/{org}/codespaces/access/selected_users",
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
      telemetry: [:github_ex, :codespaces, :set_codespaces_access_users],
      timeout: nil,
      pagination: nil
    }
  end

  @set_repositories_for_secret_for_authenticated_user_partition_spec %{
    path: [{"secret_name", :secret_name}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set selected repositories for a user secret\n\nSelect the repositories that will use a user's development environment secret.\n\nThe authenticated user must have Codespaces access to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `codespace` or `codespace:secrets` scope to use this endpoint."
  @spec set_repositories_for_secret_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_repositories_for_secret_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_set_repositories_for_secret_for_authenticated_user_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_repositories_for_secret_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @set_repositories_for_secret_for_authenticated_user_partition_spec
      )

    %{
      id: "codespaces/set-repositories-for-secret-for-authenticated-user",
      args: params,
      call: {__MODULE__, :set_repositories_for_secret_for_authenticated_user},
      opts: opts,
      method: :put,
      path_template: "/user/codespaces/secrets/{secret_name}/repositories",
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
      telemetry: [:github_ex, :codespaces, :set_repositories_for_secret_for_authenticated_user],
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

  @doc "Set selected repositories for an organization secret\n\nReplaces all repositories for an organization development environment secret when the `visibility`\nfor repository access is set to `selected`. The visibility is set when you [Create\nor update an organization secret](https://docs.github.com/rest/codespaces/organization-secrets#create-or-update-an-organization-secret).\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
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
      id: "codespaces/set-selected-repos-for-org-secret",
      args: params,
      call: {__MODULE__, :set_selected_repos_for_org_secret},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/codespaces/secrets/{secret_name}/repositories",
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
      telemetry: [:github_ex, :codespaces, :set_selected_repos_for_org_secret],
      timeout: nil,
      pagination: nil
    }
  end

  @start_for_authenticated_user_partition_spec %{
    path: [{"codespace_name", :codespace_name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Start a codespace for the authenticated user\n\nStarts a user's codespace.\n\nOAuth app tokens and personal access tokens (classic) need the `codespace` scope to use this endpoint."
  @spec start_for_authenticated_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def start_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_start_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_start_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @start_for_authenticated_user_partition_spec)

    %{
      id: "codespaces/start-for-authenticated-user",
      args: params,
      call: {__MODULE__, :start_for_authenticated_user},
      opts: opts,
      method: :post,
      path_template: "/user/codespaces/{codespace_name}/start",
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
      telemetry: [:github_ex, :codespaces, :start_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @stop_for_authenticated_user_partition_spec %{
    path: [{"codespace_name", :codespace_name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Stop a codespace for the authenticated user\n\nStops a user's codespace.\n\nOAuth app tokens and personal access tokens (classic) need the `codespace` scope to use this endpoint."
  @spec stop_for_authenticated_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def stop_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_stop_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_stop_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @stop_for_authenticated_user_partition_spec)

    %{
      id: "codespaces/stop-for-authenticated-user",
      args: params,
      call: {__MODULE__, :stop_for_authenticated_user},
      opts: opts,
      method: :post,
      path_template: "/user/codespaces/{codespace_name}/stop",
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
      telemetry: [:github_ex, :codespaces, :stop_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @stop_in_organization_partition_spec %{
    path: [
      {"org", :org},
      {"username", :username},
      {"codespace_name", :codespace_name}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Stop a codespace for an organization user\n\nStops a user's codespace.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec stop_in_organization(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def stop_in_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_stop_in_organization_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_stop_in_organization_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @stop_in_organization_partition_spec)

    %{
      id: "codespaces/stop-in-organization",
      args: params,
      call: {__MODULE__, :stop_in_organization},
      opts: opts,
      method: :post,
      path_template: "/orgs/{org}/members/{username}/codespaces/{codespace_name}/stop",
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
      telemetry: [:github_ex, :codespaces, :stop_in_organization],
      timeout: nil,
      pagination: nil
    }
  end

  @update_for_authenticated_user_partition_spec %{
    path: [{"codespace_name", :codespace_name}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update a codespace for the authenticated user\n\nUpdates a codespace owned by the authenticated user. Currently only the codespace's machine type and recent folders can be modified using this endpoint.\n\nIf you specify a new machine type it will be applied the next time your codespace is started.\n\nOAuth app tokens and personal access tokens (classic) need the `codespace` scope to use this endpoint."
  @spec update_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def update_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_for_authenticated_user_partition_spec)

    %{
      id: "codespaces/update-for-authenticated-user",
      args: params,
      call: {__MODULE__, :update_for_authenticated_user},
      opts: opts,
      method: :patch,
      path_template: "/user/codespaces/{codespace_name}",
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
      telemetry: [:github_ex, :codespaces, :update_for_authenticated_user],
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

defmodule GitHubEx.Apps do
  @moduledoc """
  Generated Github Ex operations for apps.
  """

  @add_repo_to_installation_for_authenticated_user_partition_spec %{
    path: [
      {"installation_id", :installation_id},
      {"repository_id", :repository_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Add a repository to an app installation\n\nAdd a single repository to an installation. The authenticated user must have admin access to the repository.    \n\nThis endpoint only works for PATs (classic) with the `repo` scope."
  @spec add_repo_to_installation_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def add_repo_to_installation_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_add_repo_to_installation_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_add_repo_to_installation_for_authenticated_user_operation(params)
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @add_repo_to_installation_for_authenticated_user_partition_spec
      )

    Pristine.Operation.new(%{
      id: "apps/add-repo-to-installation-for-authenticated-user",
      method: :put,
      path_template: "/user/installations/{installation_id}/repositories/{repository_id}",
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
        telemetry_event: [:github_ex, :apps, :add_repo_to_installation_for_authenticated_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @check_token_partition_spec %{
    path: [{"client_id", :client_id}],
    auth: %{
      keys: [{"client_id", :client_id}, {"client_secret", :client_secret}],
      mode: :keys
    },
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Check a token\n\nOAuth applications and GitHub applications with OAuth authorizations can use this API method for checking OAuth token validity without exceeding the normal rate limits for failed login attempts. Authentication works differently with this particular endpoint. Invalid tokens will return `404 NOT FOUND`."
  @spec check_token(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def check_token(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_check_token_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_check_token_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @check_token_partition_spec)

    Pristine.Operation.new(%{
      id: "apps/check-token",
      method: :post,
      path_template: "/applications/{client_id}/token",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: false,
        override: partition.auth,
        security_schemes: ["basicAuth"]
      },
      runtime: %{
        circuit_breaker: "oauth",
        rate_limit_group: "github.integration",
        resource: "oauth_application",
        retry_group: "github.oauth",
        telemetry_event: [:github_ex, :apps, :check_token],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @create_from_manifest_partition_spec %{
    path: [{"code", :code}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Create a GitHub App from a manifest\n\nUse this endpoint to complete the handshake necessary when implementing the [GitHub App Manifest flow](https://docs.github.com/apps/building-github-apps/creating-github-apps-from-a-manifest/). When you create a GitHub App with the manifest flow, you receive a temporary `code` used to retrieve the GitHub App's `id`, `pem` (private key), and `webhook_secret`."
  @spec create_from_manifest(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_from_manifest(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_create_from_manifest_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_create_from_manifest_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @create_from_manifest_partition_spec)

    Pristine.Operation.new(%{
      id: "apps/create-from-manifest",
      method: :post,
      path_template: "/app-manifests/{code}/conversions",
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
        resource: "app_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :apps, :create_from_manifest],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @create_installation_access_token_partition_spec %{
    path: [{"installation_id", :installation_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Create an installation access token for an app\n\nCreates an installation access token that enables a GitHub App to make authenticated API requests for the app's installation on an organization or individual account. Installation tokens expire one hour from the time you create them. Using an expired token produces a status code of `401 - Unauthorized`, and requires creating a new installation token. By default the installation token has access to all repositories that the installation can access.\n\nOptionally, you can use the `repositories` or `repository_ids` body parameters to specify individual repositories that the installation access token can access. If you don't use `repositories` or `repository_ids` to grant access to specific repositories, the installation access token will have access to all repositories that the installation was granted access to. The installation access token cannot be granted access to repositories that the installation was not granted access to. Up to 500 repositories can be listed in this manner.\n\nOptionally, use the `permissions` body parameter to specify the permissions that the installation access token should have. If `permissions` is not specified, the installation access token will have all of the permissions that were granted to the app. The installation access token cannot be granted permissions that the app was not granted.\n\nYou must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint."
  @spec create_installation_access_token(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def create_installation_access_token(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_create_installation_access_token_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_create_installation_access_token_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @create_installation_access_token_partition_spec)

    Pristine.Operation.new(%{
      id: "apps/create-installation-access-token",
      method: :post,
      path_template: "/app/installations/{installation_id}/access_tokens",
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
        circuit_breaker: "app_auth",
        rate_limit_group: "github.integration",
        resource: "app_auth",
        retry_group: "github.app_auth",
        telemetry_event: [:github_ex, :apps, :create_installation_access_token],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_authorization_partition_spec %{
    path: [{"client_id", :client_id}],
    auth: %{
      keys: [{"client_id", :client_id}, {"client_secret", :client_secret}],
      mode: :keys
    },
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Delete an app authorization\n\nOAuth and GitHub application owners can revoke a grant for their application and a specific user. You must provide a valid OAuth `access_token` as an input parameter and the grant for the token's owner will be deleted.\nDeleting an application's grant will also delete all OAuth tokens associated with the application for the user. Once deleted, the application will have no access to the user's account and will no longer be listed on [the application authorizations settings screen within GitHub](https://github.com/settings/applications#authorized)."
  @spec delete_authorization(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_authorization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_delete_authorization_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_delete_authorization_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_authorization_partition_spec)

    Pristine.Operation.new(%{
      id: "apps/delete-authorization",
      method: :delete,
      path_template: "/applications/{client_id}/grant",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: false,
        override: partition.auth,
        security_schemes: ["basicAuth"]
      },
      runtime: %{
        circuit_breaker: "oauth",
        rate_limit_group: "github.integration",
        resource: "oauth_application",
        retry_group: "github.oauth",
        telemetry_event: [:github_ex, :apps, :delete_authorization],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_installation_partition_spec %{
    path: [{"installation_id", :installation_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Delete an installation for the authenticated app\n\nUninstalls a GitHub App on a user, organization, or enterprise account. If you prefer to temporarily suspend an app's access to your account's resources, then we recommend the \"[Suspend an app installation](https://docs.github.com/rest/apps/apps#suspend-an-app-installation)\" endpoint.\n\nYou must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint."
  @spec delete_installation(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_installation(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_delete_installation_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_delete_installation_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_installation_partition_spec)

    Pristine.Operation.new(%{
      id: "apps/delete-installation",
      method: :delete,
      path_template: "/app/installations/{installation_id}",
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
        resource: "app_api",
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :apps, :delete_installation],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_token_partition_spec %{
    path: [{"client_id", :client_id}],
    auth: %{
      keys: [{"client_id", :client_id}, {"client_secret", :client_secret}],
      mode: :keys
    },
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Delete an app token\n\nOAuth  or GitHub application owners can revoke a single token for an OAuth application or a GitHub application with an OAuth authorization."
  @spec delete_token(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_token(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_delete_token_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_delete_token_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_token_partition_spec)

    Pristine.Operation.new(%{
      id: "apps/delete-token",
      method: :delete,
      path_template: "/applications/{client_id}/token",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: false,
        override: partition.auth,
        security_schemes: ["basicAuth"]
      },
      runtime: %{
        circuit_breaker: "oauth",
        rate_limit_group: "github.integration",
        resource: "oauth_application",
        retry_group: "github.oauth",
        telemetry_event: [:github_ex, :apps, :delete_token],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_authenticated_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get the authenticated app\n\nReturns the GitHub App associated with the authentication credentials used. To see how many app installations are associated with this GitHub App, see the `installations_count` in the response. For more details about your app's installations, see the \"[List installations for the authenticated app](https://docs.github.com/rest/apps/apps#list-installations-for-the-authenticated-app)\" endpoint.\n\nYou must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint."
  @spec get_authenticated(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_authenticated(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_authenticated_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_authenticated_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_authenticated_partition_spec)

    Pristine.Operation.new(%{
      id: "apps/get-authenticated",
      method: :get,
      path_template: "/app",
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
        resource: "app_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :apps, :get_authenticated],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_by_slug_partition_spec %{
    path: [{"app_slug", :app_slug}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get an app\n\n> [!NOTE]\n> The `:app_slug` is just the URL-friendly name of your GitHub App. You can find this on the settings page for your GitHub App (e.g., `https://github.com/settings/apps/:app_slug`)."
  @spec get_by_slug(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_by_slug(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_by_slug_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_by_slug_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_by_slug_partition_spec)

    Pristine.Operation.new(%{
      id: "apps/get-by-slug",
      method: :get,
      path_template: "/apps/{app_slug}",
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
        resource: "app_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :apps, :get_by_slug],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_installation_partition_spec %{
    path: [{"installation_id", :installation_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get an installation for the authenticated app\n\nEnables an authenticated GitHub App to find an installation's information using the installation id.\n\nYou must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint."
  @spec get_installation(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_installation(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_installation_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_installation_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_installation_partition_spec)

    Pristine.Operation.new(%{
      id: "apps/get-installation",
      method: :get,
      path_template: "/app/installations/{installation_id}",
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
        resource: "app_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :apps, :get_installation],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_org_installation_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get an organization installation for the authenticated app\n\nEnables an authenticated GitHub App to find the organization's installation information.\n\nYou must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint."
  @spec get_org_installation(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_org_installation(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_org_installation_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_org_installation_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_org_installation_partition_spec)

    Pristine.Operation.new(%{
      id: "apps/get-org-installation",
      method: :get,
      path_template: "/orgs/{org}/installation",
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
        telemetry_event: [:github_ex, :apps, :get_org_installation],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_repo_installation_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get a repository installation for the authenticated app\n\nEnables an authenticated GitHub App to find the repository's installation information. The installation's account type will be either an organization or a user account, depending which account the repository belongs to.\n\nYou must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint."
  @spec get_repo_installation(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_repo_installation(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_repo_installation_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_repo_installation_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_repo_installation_partition_spec)

    Pristine.Operation.new(%{
      id: "apps/get-repo-installation",
      method: :get,
      path_template: "/repos/{owner}/{repo}/installation",
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
        telemetry_event: [:github_ex, :apps, :get_repo_installation],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_subscription_plan_for_account_partition_spec %{
    path: [{"account_id", :account_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get a subscription plan for an account\n\nShows whether the user or organization account actively subscribes to a plan listed by the authenticated GitHub App. When someone submits a plan change that won't be processed until the end of their billing cycle, you will also see the upcoming pending change.\n\nGitHub Apps must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint. OAuth apps must use [basic authentication](https://docs.github.com/rest/authentication/authenticating-to-the-rest-api#using-basic-authentication) with their client ID and client secret to access this endpoint."
  @spec get_subscription_plan_for_account(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_subscription_plan_for_account(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_subscription_plan_for_account_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_subscription_plan_for_account_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @get_subscription_plan_for_account_partition_spec)

    Pristine.Operation.new(%{
      id: "apps/get-subscription-plan-for-account",
      method: :get,
      path_template: "/marketplace_listing/accounts/{account_id}",
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
        telemetry_event: [:github_ex, :apps, :get_subscription_plan_for_account],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_subscription_plan_for_account_stubbed_partition_spec %{
    path: [{"account_id", :account_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get a subscription plan for an account (stubbed)\n\nShows whether the user or organization account actively subscribes to a plan listed by the authenticated GitHub App. When someone submits a plan change that won't be processed until the end of their billing cycle, you will also see the upcoming pending change.\n\nGitHub Apps must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint. OAuth apps must use [basic authentication](https://docs.github.com/rest/authentication/authenticating-to-the-rest-api#using-basic-authentication) with their client ID and client secret to access this endpoint."
  @spec get_subscription_plan_for_account_stubbed(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_subscription_plan_for_account_stubbed(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_subscription_plan_for_account_stubbed_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_subscription_plan_for_account_stubbed_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @get_subscription_plan_for_account_stubbed_partition_spec
      )

    Pristine.Operation.new(%{
      id: "apps/get-subscription-plan-for-account-stubbed",
      method: :get,
      path_template: "/marketplace_listing/stubbed/accounts/{account_id}",
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
        telemetry_event: [:github_ex, :apps, :get_subscription_plan_for_account_stubbed],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_user_installation_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get a user installation for the authenticated app\n\nEnables an authenticated GitHub App to find the user’s installation information.\n\nYou must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint."
  @spec get_user_installation(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_user_installation(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_user_installation_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_user_installation_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_user_installation_partition_spec)

    Pristine.Operation.new(%{
      id: "apps/get-user-installation",
      method: :get,
      path_template: "/users/{username}/installation",
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
        telemetry_event: [:github_ex, :apps, :get_user_installation],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_webhook_config_for_app_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get a webhook configuration for an app\n\nReturns the webhook configuration for a GitHub App. For more information about configuring a webhook for your app, see \"[Creating a GitHub App](/developers/apps/creating-a-github-app).\"\n\nYou must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint."
  @spec get_webhook_config_for_app(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_webhook_config_for_app(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_webhook_config_for_app_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_webhook_config_for_app_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_webhook_config_for_app_partition_spec)

    Pristine.Operation.new(%{
      id: "apps/get-webhook-config-for-app",
      method: :get,
      path_template: "/app/hook/config",
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
        resource: "app_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :apps, :get_webhook_config_for_app],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_webhook_delivery_partition_spec %{
    path: [{"delivery_id", :delivery_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get a delivery for an app webhook\n\nReturns a delivery for the webhook configured for a GitHub App.\n\nYou must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint."
  @spec get_webhook_delivery(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_webhook_delivery(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_webhook_delivery_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_webhook_delivery_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_webhook_delivery_partition_spec)

    Pristine.Operation.new(%{
      id: "apps/get-webhook-delivery",
      method: :get,
      path_template: "/app/hook/deliveries/{delivery_id}",
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
        resource: "app_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :apps, :get_webhook_delivery],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @list_accounts_for_plan_partition_spec %{
    path: [{"plan_id", :plan_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [
      {"sort", :sort},
      {"direction", :direction},
      {"per_page", :per_page},
      {"page", :page}
    ],
    headers: []
  }

  @doc "List accounts for a plan\n\nReturns user and organization accounts associated with the specified plan, including free plans. For per-seat pricing, you see the list of accounts that have purchased the plan, including the number of seats purchased. When someone submits a plan change that won't be processed until the end of their billing cycle, you will also see the upcoming pending change.\n\nGitHub Apps must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint. OAuth apps must use [basic authentication](https://docs.github.com/rest/authentication/authenticating-to-the-rest-api#using-basic-authentication) with their client ID and client secret to access this endpoint."
  @spec list_accounts_for_plan(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_accounts_for_plan(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_accounts_for_plan_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_accounts_for_plan(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_accounts_for_plan(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_accounts_for_plan_operation(params) end,
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

  defp build_list_accounts_for_plan_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_accounts_for_plan_partition_spec)

    Pristine.Operation.new(%{
      id: "apps/list-accounts-for-plan",
      method: :get,
      path_template: "/marketplace_listing/plans/{plan_id}/accounts",
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
        telemetry_event: [:github_ex, :apps, :list_accounts_for_plan],
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

  @list_accounts_for_plan_stubbed_partition_spec %{
    path: [{"plan_id", :plan_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [
      {"sort", :sort},
      {"direction", :direction},
      {"per_page", :per_page},
      {"page", :page}
    ],
    headers: []
  }

  @doc "List accounts for a plan (stubbed)\n\nReturns repository and organization accounts associated with the specified plan, including free plans. For per-seat pricing, you see the list of accounts that have purchased the plan, including the number of seats purchased. When someone submits a plan change that won't be processed until the end of their billing cycle, you will also see the upcoming pending change.\n\nGitHub Apps must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint. OAuth apps must use [basic authentication](https://docs.github.com/rest/authentication/authenticating-to-the-rest-api#using-basic-authentication) with their client ID and client secret to access this endpoint."
  @spec list_accounts_for_plan_stubbed(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_accounts_for_plan_stubbed(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_accounts_for_plan_stubbed_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_accounts_for_plan_stubbed(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_accounts_for_plan_stubbed(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_accounts_for_plan_stubbed_operation(params) end,
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

  defp build_list_accounts_for_plan_stubbed_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @list_accounts_for_plan_stubbed_partition_spec)

    Pristine.Operation.new(%{
      id: "apps/list-accounts-for-plan-stubbed",
      method: :get,
      path_template: "/marketplace_listing/stubbed/plans/{plan_id}/accounts",
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
        telemetry_event: [:github_ex, :apps, :list_accounts_for_plan_stubbed],
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

  @list_installation_repos_for_authenticated_user_partition_spec %{
    path: [{"installation_id", :installation_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List repositories accessible to the user access token\n\nList repositories that the authenticated user has explicit permission (`:read`, `:write`, or `:admin`) to access for an installation.\n\nThe authenticated user has explicit permission to access repositories they own, repositories where they are a collaborator, and repositories that they can access through an organization membership.\n\nThe access the user has to each repository is included in the hash under the `permissions` key."
  @spec list_installation_repos_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_installation_repos_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_installation_repos_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_installation_repos_for_authenticated_user(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_list_installation_repos_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_installation_repos_for_authenticated_user_operation(params) end,
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

  defp build_list_installation_repos_for_authenticated_user_operation(params)
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @list_installation_repos_for_authenticated_user_partition_spec
      )

    Pristine.Operation.new(%{
      id: "apps/list-installation-repos-for-authenticated-user",
      method: :get,
      path_template: "/user/installations/{installation_id}/repositories",
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
        telemetry_event: [:github_ex, :apps, :list_installation_repos_for_authenticated_user],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: ["repositories"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
  end

  @list_installation_requests_for_authenticated_app_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List installation requests for the authenticated app\n\nLists all the pending installation requests for the authenticated GitHub App."
  @spec list_installation_requests_for_authenticated_app(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_installation_requests_for_authenticated_app(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_installation_requests_for_authenticated_app_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_installation_requests_for_authenticated_app(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_list_installation_requests_for_authenticated_app(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_installation_requests_for_authenticated_app_operation(params) end,
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

  defp build_list_installation_requests_for_authenticated_app_operation(params)
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @list_installation_requests_for_authenticated_app_partition_spec
      )

    Pristine.Operation.new(%{
      id: "apps/list-installation-requests-for-authenticated-app",
      method: :get,
      path_template: "/app/installation-requests",
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
        resource: "app_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :apps, :list_installation_requests_for_authenticated_app],
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

  @list_installations_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [
      {"per_page", :per_page},
      {"page", :page},
      {"since", :since},
      {"outdated", :outdated}
    ],
    headers: []
  }

  @doc "List installations for the authenticated app\n\nThe permissions the installation has are included under the `permissions` key.\n\nYou must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint."
  @spec list_installations(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_installations(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_installations_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_installations(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_installations(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_installations_operation(params) end,
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

  defp build_list_installations_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_installations_partition_spec)

    Pristine.Operation.new(%{
      id: "apps/list-installations",
      method: :get,
      path_template: "/app/installations",
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
        resource: "app_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :apps, :list_installations],
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

  @list_installations_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List app installations accessible to the user access token\n\nLists installations of your GitHub App that the authenticated user has explicit permission (`:read`, `:write`, or `:admin`) to access.\n\nThe authenticated user has explicit permission to access repositories they own, repositories where they are a collaborator, and repositories that they can access through an organization membership.\n\nYou can find the permissions for the installation under the `permissions` key."
  @spec list_installations_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_installations_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_installations_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_installations_for_authenticated_user(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_list_installations_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_installations_for_authenticated_user_operation(params) end,
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

  defp build_list_installations_for_authenticated_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @list_installations_for_authenticated_user_partition_spec
      )

    Pristine.Operation.new(%{
      id: "apps/list-installations-for-authenticated-user",
      method: :get,
      path_template: "/user/installations",
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
        telemetry_event: [:github_ex, :apps, :list_installations_for_authenticated_user],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: ["installations"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
  end

  @list_plans_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List plans\n\nLists all plans that are part of your GitHub Marketplace listing.\n\nGitHub Apps must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint. OAuth apps must use [basic authentication](https://docs.github.com/rest/authentication/authenticating-to-the-rest-api#using-basic-authentication) with their client ID and client secret to access this endpoint."
  @spec list_plans(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_plans(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_plans_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_plans(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_plans(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_plans_operation(params) end,
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

  defp build_list_plans_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_plans_partition_spec)

    Pristine.Operation.new(%{
      id: "apps/list-plans",
      method: :get,
      path_template: "/marketplace_listing/plans",
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
        telemetry_event: [:github_ex, :apps, :list_plans],
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

  @list_plans_stubbed_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List plans (stubbed)\n\nLists all plans that are part of your GitHub Marketplace listing.\n\nGitHub Apps must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint. OAuth apps must use [basic authentication](https://docs.github.com/rest/authentication/authenticating-to-the-rest-api#using-basic-authentication) with their client ID and client secret to access this endpoint."
  @spec list_plans_stubbed(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_plans_stubbed(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_plans_stubbed_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_plans_stubbed(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_plans_stubbed(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_plans_stubbed_operation(params) end,
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

  defp build_list_plans_stubbed_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_plans_stubbed_partition_spec)

    Pristine.Operation.new(%{
      id: "apps/list-plans-stubbed",
      method: :get,
      path_template: "/marketplace_listing/stubbed/plans",
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
        telemetry_event: [:github_ex, :apps, :list_plans_stubbed],
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

  @list_repos_accessible_to_installation_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List repositories accessible to the app installation\n\nList repositories that an app installation can access."
  @spec list_repos_accessible_to_installation(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_repos_accessible_to_installation(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_repos_accessible_to_installation_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_repos_accessible_to_installation(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_repos_accessible_to_installation(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_repos_accessible_to_installation_operation(params) end,
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

  defp build_list_repos_accessible_to_installation_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @list_repos_accessible_to_installation_partition_spec)

    Pristine.Operation.new(%{
      id: "apps/list-repos-accessible-to-installation",
      method: :get,
      path_template: "/installation/repositories",
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
        telemetry_event: [:github_ex, :apps, :list_repos_accessible_to_installation],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: ["repositories"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
  end

  @list_subscriptions_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List subscriptions for the authenticated user\n\nLists the active subscriptions for the authenticated user."
  @spec list_subscriptions_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_subscriptions_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_subscriptions_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_subscriptions_for_authenticated_user(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_list_subscriptions_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_subscriptions_for_authenticated_user_operation(params) end,
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

  defp build_list_subscriptions_for_authenticated_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @list_subscriptions_for_authenticated_user_partition_spec
      )

    Pristine.Operation.new(%{
      id: "apps/list-subscriptions-for-authenticated-user",
      method: :get,
      path_template: "/user/marketplace_purchases",
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
        telemetry_event: [:github_ex, :apps, :list_subscriptions_for_authenticated_user],
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

  @list_subscriptions_for_authenticated_user_stubbed_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List subscriptions for the authenticated user (stubbed)\n\nLists the active subscriptions for the authenticated user."
  @spec list_subscriptions_for_authenticated_user_stubbed(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_subscriptions_for_authenticated_user_stubbed(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_subscriptions_for_authenticated_user_stubbed_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_subscriptions_for_authenticated_user_stubbed(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_list_subscriptions_for_authenticated_user_stubbed(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_subscriptions_for_authenticated_user_stubbed_operation(params) end,
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

  defp build_list_subscriptions_for_authenticated_user_stubbed_operation(params)
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @list_subscriptions_for_authenticated_user_stubbed_partition_spec
      )

    Pristine.Operation.new(%{
      id: "apps/list-subscriptions-for-authenticated-user-stubbed",
      method: :get,
      path_template: "/user/marketplace_purchases/stubbed",
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
        telemetry_event: [:github_ex, :apps, :list_subscriptions_for_authenticated_user_stubbed],
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

  @list_webhook_deliveries_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"cursor", :cursor}],
    headers: []
  }

  @doc "List deliveries for an app webhook\n\nReturns a list of webhook deliveries for the webhook configured for a GitHub App.\n\nYou must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint."
  @spec list_webhook_deliveries(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_webhook_deliveries(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_webhook_deliveries_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_webhook_deliveries(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_webhook_deliveries(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_webhook_deliveries_operation(params) end,
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

  defp build_list_webhook_deliveries_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_webhook_deliveries_partition_spec)

    Pristine.Operation.new(%{
      id: "apps/list-webhook-deliveries",
      method: :get,
      path_template: "/app/hook/deliveries",
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
        resource: "app_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :apps, :list_webhook_deliveries],
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

  @redeliver_webhook_delivery_partition_spec %{
    path: [{"delivery_id", :delivery_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Redeliver a delivery for an app webhook\n\nRedeliver a delivery for the webhook configured for a GitHub App.\n\nYou must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint."
  @spec redeliver_webhook_delivery(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def redeliver_webhook_delivery(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_redeliver_webhook_delivery_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_redeliver_webhook_delivery_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @redeliver_webhook_delivery_partition_spec)

    Pristine.Operation.new(%{
      id: "apps/redeliver-webhook-delivery",
      method: :post,
      path_template: "/app/hook/deliveries/{delivery_id}/attempts",
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
        resource: "app_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :apps, :redeliver_webhook_delivery],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @remove_repo_from_installation_for_authenticated_user_partition_spec %{
    path: [
      {"installation_id", :installation_id},
      {"repository_id", :repository_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Remove a repository from an app installation\n\nRemove a single repository from an installation. The authenticated user must have admin access to the repository. The installation must have the `repository_selection` of `selected`. \n\nThis endpoint only works for PATs (classic) with the `repo` scope."
  @spec remove_repo_from_installation_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def remove_repo_from_installation_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_remove_repo_from_installation_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_remove_repo_from_installation_for_authenticated_user_operation(params)
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @remove_repo_from_installation_for_authenticated_user_partition_spec
      )

    Pristine.Operation.new(%{
      id: "apps/remove-repo-from-installation-for-authenticated-user",
      method: :delete,
      path_template: "/user/installations/{installation_id}/repositories/{repository_id}",
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
        telemetry_event: [
          :github_ex,
          :apps,
          :remove_repo_from_installation_for_authenticated_user
        ],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @reset_token_partition_spec %{
    path: [{"client_id", :client_id}],
    auth: %{
      keys: [{"client_id", :client_id}, {"client_secret", :client_secret}],
      mode: :keys
    },
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Reset a token\n\nOAuth applications and GitHub applications with OAuth authorizations can use this API method to reset a valid OAuth token without end-user involvement. Applications must save the \"token\" property in the response because changes take effect immediately. Invalid tokens will return `404 NOT FOUND`."
  @spec reset_token(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def reset_token(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_reset_token_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_reset_token_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @reset_token_partition_spec)

    Pristine.Operation.new(%{
      id: "apps/reset-token",
      method: :patch,
      path_template: "/applications/{client_id}/token",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: false,
        override: partition.auth,
        security_schemes: ["basicAuth"]
      },
      runtime: %{
        circuit_breaker: "oauth",
        rate_limit_group: "github.integration",
        resource: "oauth_application",
        retry_group: "github.oauth",
        telemetry_event: [:github_ex, :apps, :reset_token],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @revoke_installation_access_token_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Revoke an installation access token\n\nRevokes the installation token you're using to authenticate as an installation and access this endpoint.\n\nOnce an installation token is revoked, the token is invalidated and cannot be used. Other endpoints that require the revoked installation token must have a new installation token to work. You can create a new token using the \"[Create an installation access token for an app](https://docs.github.com/rest/apps/apps#create-an-installation-access-token-for-an-app)\" endpoint."
  @spec revoke_installation_access_token(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def revoke_installation_access_token(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_revoke_installation_access_token_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_revoke_installation_access_token_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @revoke_installation_access_token_partition_spec)

    Pristine.Operation.new(%{
      id: "apps/revoke-installation-access-token",
      method: :delete,
      path_template: "/installation/token",
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
        telemetry_event: [:github_ex, :apps, :revoke_installation_access_token],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @scope_token_partition_spec %{
    path: [{"client_id", :client_id}],
    auth: %{
      keys: [{"client_id", :client_id}, {"client_secret", :client_secret}],
      mode: :keys
    },
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Create a scoped access token\n\nUse a non-scoped user access token to create a repository-scoped and/or permission-scoped user access token. You can specify\nwhich repositories the token can access and which permissions are granted to the\ntoken.\n\nInvalid tokens will return `404 NOT FOUND`."
  @spec scope_token(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def scope_token(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_scope_token_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_scope_token_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @scope_token_partition_spec)

    Pristine.Operation.new(%{
      id: "apps/scope-token",
      method: :post,
      path_template: "/applications/{client_id}/token/scoped",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: false,
        override: partition.auth,
        security_schemes: ["basicAuth"]
      },
      runtime: %{
        circuit_breaker: "oauth",
        rate_limit_group: "github.integration",
        resource: "oauth_application",
        retry_group: "github.oauth",
        telemetry_event: [:github_ex, :apps, :scope_token],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @suspend_installation_partition_spec %{
    path: [{"installation_id", :installation_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Suspend an app installation\n\nSuspends a GitHub App on a user, organization, or enterprise account, which blocks the app from accessing the account's resources. When a GitHub App is suspended, the app's access to the GitHub API or webhook events is blocked for that account.\n\nYou must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint."
  @spec suspend_installation(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def suspend_installation(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_suspend_installation_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_suspend_installation_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @suspend_installation_partition_spec)

    Pristine.Operation.new(%{
      id: "apps/suspend-installation",
      method: :put,
      path_template: "/app/installations/{installation_id}/suspended",
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
        resource: "app_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :apps, :suspend_installation],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @unsuspend_installation_partition_spec %{
    path: [{"installation_id", :installation_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Unsuspend an app installation\n\nRemoves a GitHub App installation suspension.\n\nYou must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint."
  @spec unsuspend_installation(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def unsuspend_installation(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_unsuspend_installation_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_unsuspend_installation_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @unsuspend_installation_partition_spec)

    Pristine.Operation.new(%{
      id: "apps/unsuspend-installation",
      method: :delete,
      path_template: "/app/installations/{installation_id}/suspended",
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
        resource: "app_api",
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :apps, :unsuspend_installation],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @update_webhook_config_for_app_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Update a webhook configuration for an app\n\nUpdates the webhook configuration for a GitHub App. For more information about configuring a webhook for your app, see \"[Creating a GitHub App](/developers/apps/creating-a-github-app).\"\n\nYou must use a [JWT](https://docs.github.com/apps/building-github-apps/authenticating-with-github-apps/#authenticating-as-a-github-app) to access this endpoint."
  @spec update_webhook_config_for_app(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def update_webhook_config_for_app(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_update_webhook_config_for_app_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_update_webhook_config_for_app_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @update_webhook_config_for_app_partition_spec)

    Pristine.Operation.new(%{
      id: "apps/update-webhook-config-for-app",
      method: :patch,
      path_template: "/app/hook/config",
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
        resource: "app_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :apps, :update_webhook_config_for_app],
        timeout_ms: nil
      },
      pagination: nil
    })
  end
end

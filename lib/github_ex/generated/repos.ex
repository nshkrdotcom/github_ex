defmodule GitHubEx.Repos do
  @moduledoc """
  Generated Github Ex operations for repos.
  """

  alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient

  @accept_invitation_for_authenticated_user_partition_spec %{
    path: [{"invitation_id", :invitation_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Accept a repository invitation"
  @spec accept_invitation_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def accept_invitation_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_accept_invitation_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_accept_invitation_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @accept_invitation_for_authenticated_user_partition_spec)

    %{
      id: "repos/accept-invitation-for-authenticated-user",
      args: params,
      call: {__MODULE__, :accept_invitation_for_authenticated_user},
      opts: opts,
      method: :patch,
      path_template: "/user/repository_invitations/{invitation_id}",
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
      telemetry: [:github_ex, :repos, :accept_invitation_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @add_app_access_restrictions_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add app access restrictions\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\nGrants the specified apps push access for this branch. Only GitHub Apps that are installed on the repository and that have been granted write access to the repository contents can be added as authorized actors on a protected branch."
  @spec add_app_access_restrictions(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def add_app_access_restrictions(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_add_app_access_restrictions_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_app_access_restrictions_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @add_app_access_restrictions_partition_spec)

    %{
      id: "repos/add-app-access-restrictions",
      args: params,
      call: {__MODULE__, :add_app_access_restrictions},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/apps",
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
      telemetry: [:github_ex, :repos, :add_app_access_restrictions],
      timeout: nil,
      pagination: nil
    }
  end

  @add_collaborator_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Add a repository collaborator

       Add a user to a repository with a specified level of access. If the repository is owned by an organization, this API does not add the user to the organization - a user that has repository access without being an organization member is called an "outside collaborator" (if they are not an Enterprise Managed User) or a "repository collaborator" if they are an Enterprise Managed User. These users are exempt from some organization policies - see "[Adding outside collaborators to repositories](https://docs.github.com/organizations/managing-user-access-to-your-organizations-repositories/managing-outside-collaborators/adding-outside-collaborators-to-repositories-in-your-organization)" to learn more about these collaborator types.

       This endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications).

       Adding an outside collaborator may be restricted by enterprise and organization administrators. For more information, see "[Enforcing repository management policies in your enterprise](https://docs.github.com/admin/policies/enforcing-policies-for-your-enterprise/enforcing-repository-management-policies-in-your-enterprise#enforcing-a-policy-for-inviting-outside-collaborators-to-repositories)" and "[Setting permissions for adding outside collaborators](https://docs.github.com/organizations/managing-organization-settings/setting-permissions-for-adding-outside-collaborators)" for organization settings.

       For more information on permission levels, see "[Repository permission levels for an organization](https://docs.github.com/github/setting-up-and-managing-organizations-and-teams/repository-permission-levels-for-an-organization#permission-levels-for-repositories-owned-by-an-organization)". There are restrictions on which permissions can be granted to organization members when an organization base role is in place. In this case, the role being given must be equal to or higher than the org base permission. Otherwise, the request will fail with:

       ```
       Cannot assign {member} permission of {role name}
       ```

       Note that, if you choose not to pass any parameters, you'll need to set `Content-Length` to zero when calling out to this endpoint. For more information, see "[HTTP method](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method)."

       The invitee will receive a notification that they have been invited to the repository, which they must accept or decline. They may do this via the notifications page, the email they receive, or by using the [API](https://docs.github.com/rest/collaborators/invitations).

       For Enterprise Managed Users, this endpoint does not send invitations - these users are automatically added to organizations and repositories. Enterprise Managed Users can only be added to organizations and repositories within their enterprise.

       **Updating an existing collaborator's permission level**

       The endpoint can also be used to change the permissions of an existing collaborator without first removing and re-adding the collaborator. To change the permissions, use the same endpoint and pass a different `permission` parameter. The response will be a `204`, with no other indication that the permission level changed.

       **Rate limits**

       You are limited to sending 50 invitations to a repository per 24 hour period. Note there is no limit if you are inviting organization members to an organization repository.
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec add_collaborator(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def add_collaborator(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_add_collaborator_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_collaborator_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @add_collaborator_partition_spec)

    %{
      id: "repos/add-collaborator",
      args: params,
      call: {__MODULE__, :add_collaborator},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/collaborators/{username}",
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
      telemetry: [:github_ex, :repos, :add_collaborator],
      timeout: nil,
      pagination: nil
    }
  end

  @add_status_check_contexts_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add status check contexts\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation."
  @spec add_status_check_contexts(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def add_status_check_contexts(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_add_status_check_contexts_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_status_check_contexts_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @add_status_check_contexts_partition_spec)

    %{
      id: "repos/add-status-check-contexts",
      args: params,
      call: {__MODULE__, :add_status_check_contexts},
      opts: opts,
      method: :post,
      path_template:
        "/repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks/contexts",
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
      telemetry: [:github_ex, :repos, :add_status_check_contexts],
      timeout: nil,
      pagination: nil
    }
  end

  @add_team_access_restrictions_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add team access restrictions\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\nGrants the specified teams push access for this branch. You can also give push access to child teams."
  @spec add_team_access_restrictions(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def add_team_access_restrictions(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_add_team_access_restrictions_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_team_access_restrictions_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @add_team_access_restrictions_partition_spec)

    %{
      id: "repos/add-team-access-restrictions",
      args: params,
      call: {__MODULE__, :add_team_access_restrictions},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/teams",
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
      telemetry: [:github_ex, :repos, :add_team_access_restrictions],
      timeout: nil,
      pagination: nil
    }
  end

  @add_user_access_restrictions_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add user access restrictions\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\nGrants the specified people push access for this branch.\n\n| Type    | Description                                                                                                                   |\n| ------- | ----------------------------------------------------------------------------------------------------------------------------- |\n| `array` | Usernames for people who can have push access. **Note**: The list of users, apps, and teams in total is limited to 100 items. |"
  @spec add_user_access_restrictions(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def add_user_access_restrictions(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_add_user_access_restrictions_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_user_access_restrictions_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @add_user_access_restrictions_partition_spec)

    %{
      id: "repos/add-user-access-restrictions",
      args: params,
      call: {__MODULE__, :add_user_access_restrictions},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/users",
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
      telemetry: [:github_ex, :repos, :add_user_access_restrictions],
      timeout: nil,
      pagination: nil
    }
  end

  @cancel_pages_deployment_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"pages_deployment_id", :pages_deployment_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Cancel a GitHub Pages deployment\n\nCancels a GitHub Pages deployment.\n\nThe authenticated user must have write permissions for the GitHub Pages site."
  @spec cancel_pages_deployment(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def cancel_pages_deployment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_cancel_pages_deployment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_cancel_pages_deployment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @cancel_pages_deployment_partition_spec)

    %{
      id: "repos/cancel-pages-deployment",
      args: params,
      call: {__MODULE__, :cancel_pages_deployment},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/pages/deployments/{pages_deployment_id}/cancel",
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
      telemetry: [:github_ex, :repos, :cancel_pages_deployment],
      timeout: nil,
      pagination: nil
    }
  end

  @check_automated_security_fixes_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Check if Dependabot security updates are enabled for a repository\n\nShows whether Dependabot security updates are enabled, disabled or paused for a repository. The authenticated user must have admin read access to the repository. For more information, see \"[Configuring Dependabot security updates](https://docs.github.com/articles/configuring-automated-security-fixes)\"."
  @spec check_automated_security_fixes(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def check_automated_security_fixes(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_check_automated_security_fixes_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_check_automated_security_fixes_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @check_automated_security_fixes_partition_spec)

    %{
      id: "repos/check-automated-security-fixes",
      args: params,
      call: {__MODULE__, :check_automated_security_fixes},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/automated-security-fixes",
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
      telemetry: [:github_ex, :repos, :check_automated_security_fixes],
      timeout: nil,
      pagination: nil
    }
  end

  @check_collaborator_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Check if a user is a repository collaborator\n\nFor organization-owned repositories, the list of collaborators includes outside collaborators, organization members that are direct collaborators, organization members with access through team memberships, organization members with access through default organization permissions, and organization owners.\n\nTeam members will include the members of child teams.\n\nThe authenticated user must have push access to the repository to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `read:org` and `repo` scopes to use this endpoint."
  @spec check_collaborator(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def check_collaborator(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_check_collaborator_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_check_collaborator_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @check_collaborator_partition_spec)

    %{
      id: "repos/check-collaborator",
      args: params,
      call: {__MODULE__, :check_collaborator},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/collaborators/{username}",
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
      telemetry: [:github_ex, :repos, :check_collaborator],
      timeout: nil,
      pagination: nil
    }
  end

  @check_immutable_releases_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Check if immutable releases are enabled for a repository\n\nShows whether immutable releases are enabled or disabled. Also identifies whether immutability is being\nenforced by the repository owner.  The authenticated user must have admin read access to the repository."
  @spec check_immutable_releases(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def check_immutable_releases(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_check_immutable_releases_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_check_immutable_releases_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @check_immutable_releases_partition_spec)

    %{
      id: "repos/check-immutable-releases",
      args: params,
      call: {__MODULE__, :check_immutable_releases},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/immutable-releases",
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
      telemetry: [:github_ex, :repos, :check_immutable_releases],
      timeout: nil,
      pagination: nil
    }
  end

  @check_private_vulnerability_reporting_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Check if private vulnerability reporting is enabled for a repository\n\nReturns a boolean indicating whether or not private vulnerability reporting is enabled for the repository. For more information, see \"[Evaluating the security settings of a repository](https://docs.github.com/code-security/security-advisories/working-with-repository-security-advisories/evaluating-the-security-settings-of-a-repository)\"."
  @spec check_private_vulnerability_reporting(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def check_private_vulnerability_reporting(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_check_private_vulnerability_reporting_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_check_private_vulnerability_reporting_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @check_private_vulnerability_reporting_partition_spec)

    %{
      id: "repos/check-private-vulnerability-reporting",
      args: params,
      call: {__MODULE__, :check_private_vulnerability_reporting},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/private-vulnerability-reporting",
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
      telemetry: [:github_ex, :repos, :check_private_vulnerability_reporting],
      timeout: nil,
      pagination: nil
    }
  end

  @check_vulnerability_alerts_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Check if vulnerability alerts are enabled for a repository\n\nShows whether dependency alerts are enabled or disabled for a repository. The authenticated user must have admin read access to the repository. For more information, see \"[About security alerts for vulnerable dependencies](https://docs.github.com/articles/about-security-alerts-for-vulnerable-dependencies)\"."
  @spec check_vulnerability_alerts(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def check_vulnerability_alerts(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_check_vulnerability_alerts_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_check_vulnerability_alerts_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @check_vulnerability_alerts_partition_spec)

    %{
      id: "repos/check-vulnerability-alerts",
      args: params,
      call: {__MODULE__, :check_vulnerability_alerts},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/vulnerability-alerts",
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
      telemetry: [:github_ex, :repos, :check_vulnerability_alerts],
      timeout: nil,
      pagination: nil
    }
  end

  @codeowners_errors_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"ref", :ref}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List CODEOWNERS errors\n\nList any syntax errors that are detected in the CODEOWNERS\nfile.\n\nFor more information about the correct CODEOWNERS syntax,\nsee \"[About code owners](https://docs.github.com/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners).\""
  @spec codeowners_errors(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def codeowners_errors(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_codeowners_errors_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_codeowners_errors(term(), map(), keyword()) :: Enumerable.t()
  def stream_codeowners_errors(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_codeowners_errors_request(client, params, opts) end,
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

  defp build_codeowners_errors_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @codeowners_errors_partition_spec)

    %{
      id: "repos/codeowners-errors",
      args: params,
      call: {__MODULE__, :codeowners_errors},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/codeowners/errors",
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
      telemetry: [:github_ex, :repos, :codeowners_errors],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["errors"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @compare_commits_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"basehead", :basehead}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"page", :page}, {"per_page", :per_page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Compare two commits

       Compares two commits against one another. You can compare refs (branches or tags) and commit SHAs in the same repository, or you can compare refs and commit SHAs that exist in different repositories within the same repository network, including fork branches. For more information about how to view a repository's network, see "[Understanding connections between repositories](https://docs.github.com/repositories/viewing-activity-and-data-for-your-repository/understanding-connections-between-repositories)."

       This endpoint is equivalent to running the `git log BASE..HEAD` command, but it returns commits in a different order. The `git log BASE..HEAD` command returns commits in reverse chronological order, whereas the API returns commits in chronological order.

       This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

       - **`application/vnd.github.diff`**: Returns the diff of the commit.
       - **`application/vnd.github.patch`**: Returns the patch of the commit. Diffs with binary data will have no `patch` property.

       The API response includes details about the files that were changed between the two commits. This includes the status of the change (if a file was added, removed, modified, or renamed), and details of the change itself. For example, files with a `renamed` status have a `previous_filename` field showing the previous filename of the file, and files with a `modified` status have a `patch` field showing the changes made to the file.

       When calling this endpoint without any paging parameter (`per_page` or `page`), the returned list is limited to 250 commits, and the last commit in the list is the most recent of the entire comparison.

       **Working with large comparisons**

       To process a response with a large number of commits, use a query parameter (`per_page` or `page`) to paginate the results. When using pagination:

       - The list of changed files is only shown on the first page of results, and it includes up to 300 changed files for the entire comparison.
       - The results are returned in chronological order, but the last commit in the returned list may not be the most recent one in the entire set if there are more pages of results.

       For more information on working with pagination, see "[Using pagination in the REST API](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api)."

       **Signature verification object**

       The response will include a `verification` object that describes the result of verifying the commit's signature. The `verification` object includes the following fields:

       | Name | Type | Description |
       | ---- | ---- | ----------- |
       | `verified` | `boolean` | Indicates whether GitHub considers the signature in this commit to be verified. |
       | `reason` | `string` | The reason for verified value. Possible values and their meanings are enumerated in table below. |
       | `signature` | `string` | The signature that was extracted from the commit. |
       | `payload` | `string` | The value that was signed. |
       | `verified_at` | `string` | The date the signature was verified by GitHub. |

       These are the possible values for `reason` in the `verification` object:

       | Value | Description |
       | ----- | ----------- |
       | `expired_key` | The key that made the signature is expired. |
       | `not_signing_key` | The "signing" flag is not among the usage flags in the GPG key that made the signature. |
       | `gpgverify_error` | There was an error communicating with the signature verification service. |
       | `gpgverify_unavailable` | The signature verification service is currently unavailable. |
       | `unsigned` | The object does not include a signature. |
       | `unknown_signature_type` | A non-PGP signature was found in the commit. |
       | `no_user` | No user was associated with the `committer` email address in the commit. |
       | `unverified_email` | The `committer` email address in the commit was associated with a user, but the email address is not verified on their account. |
       | `bad_email` | The `committer` email address in the commit is not included in the identities of the PGP key that made the signature. |
       | `unknown_key` | The key that made the signature has not been registered with any user's account. |
       | `malformed_signature` | There was an error parsing the signature. |
       | `invalid` | The signature could not be cryptographically verified using the key whose key-id was found in the signature. |
       | `valid` | None of the above errors applied, so the signature is considered to be verified. |
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec compare_commits(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def compare_commits(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_compare_commits_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_compare_commits_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @compare_commits_partition_spec)

    %{
      id: "repos/compare-commits",
      args: params,
      call: {__MODULE__, :compare_commits},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/compare/{basehead}",
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
      telemetry: [:github_ex, :repos, :compare_commits],
      timeout: nil,
      pagination: nil
    }
  end

  @create_attestation_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create an attestation\n\nStore an artifact attestation and associate it with a repository.\n\nThe authenticated user must have write permission to the repository and, if using a fine-grained access token, the `attestations:write` permission is required.\n\nArtifact attestations are meant to be created using the [attest action](https://github.com/actions/attest). For more information, see our guide on [using artifact attestations to establish a build's provenance](https://docs.github.com/actions/security-guides/using-artifact-attestations-to-establish-provenance-for-builds)."
  @spec create_attestation(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_attestation(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_attestation_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_attestation_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_attestation_partition_spec)

    %{
      id: "repos/create-attestation",
      args: params,
      call: {__MODULE__, :create_attestation},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/attestations",
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
      telemetry: [:github_ex, :repos, :create_attestation],
      timeout: nil,
      pagination: nil
    }
  end

  @create_autolink_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create an autolink reference for a repository\n\nUsers with admin access to the repository can create an autolink."
  @spec create_autolink(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_autolink(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_autolink_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_autolink_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_autolink_partition_spec)

    %{
      id: "repos/create-autolink",
      args: params,
      call: {__MODULE__, :create_autolink},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/autolinks",
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
      telemetry: [:github_ex, :repos, :create_autolink],
      timeout: nil,
      pagination: nil
    }
  end

  @create_commit_comment_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"commit_sha", :commit_sha}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Create a commit comment

       Create a comment for a commit using its `:commit_sha`.

       This endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications). Creating content too quickly using this endpoint may result in secondary rate limiting. For more information, see "[Rate limits for the API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)" and "[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."

       This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

       - **`application/vnd.github-commitcomment.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
       - **`application/vnd.github-commitcomment.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
       - **`application/vnd.github-commitcomment.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
       - **`application/vnd.github-commitcomment.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec create_commit_comment(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_commit_comment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_commit_comment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_commit_comment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_commit_comment_partition_spec)

    %{
      id: "repos/create-commit-comment",
      args: params,
      call: {__MODULE__, :create_commit_comment},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/commits/{commit_sha}/comments",
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
      telemetry: [:github_ex, :repos, :create_commit_comment],
      timeout: nil,
      pagination: nil
    }
  end

  @create_commit_signature_protection_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create commit signature protection\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\nWhen authenticated with admin or owner permissions to the repository, you can use this endpoint to require signed commits on a branch. You must enable branch protection to require signed commits."
  @spec create_commit_signature_protection(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def create_commit_signature_protection(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_commit_signature_protection_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_commit_signature_protection_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @create_commit_signature_protection_partition_spec)

    %{
      id: "repos/create-commit-signature-protection",
      args: params,
      call: {__MODULE__, :create_commit_signature_protection},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/required_signatures",
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
      telemetry: [:github_ex, :repos, :create_commit_signature_protection],
      timeout: nil,
      pagination: nil
    }
  end

  @create_commit_status_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"sha", :sha}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a commit status\n\nUsers with push access in a repository can create commit statuses for a given SHA.\n\nNote: there is a limit of 1000 statuses per `sha` and `context` within a repository. Attempts to create more than 1000 statuses will result in a validation error."
  @spec create_commit_status(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_commit_status(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_commit_status_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_commit_status_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_commit_status_partition_spec)

    %{
      id: "repos/create-commit-status",
      args: params,
      call: {__MODULE__, :create_commit_status},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/statuses/{sha}",
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
      telemetry: [:github_ex, :repos, :create_commit_status],
      timeout: nil,
      pagination: nil
    }
  end

  @create_deploy_key_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a deploy key\n\nYou can create a read-only deploy key."
  @spec create_deploy_key(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_deploy_key(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_deploy_key_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_deploy_key_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_deploy_key_partition_spec)

    %{
      id: "repos/create-deploy-key",
      args: params,
      call: {__MODULE__, :create_deploy_key},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/keys",
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
      telemetry: [:github_ex, :repos, :create_deploy_key],
      timeout: nil,
      pagination: nil
    }
  end

  @create_deployment_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a deployment\n\nDeployments offer a few configurable parameters with certain defaults.\n\nThe `ref` parameter can be any named branch, tag, or SHA. At GitHub we often deploy branches and verify them\nbefore we merge a pull request.\n\nThe `environment` parameter allows deployments to be issued to different runtime environments. Teams often have\nmultiple environments for verifying their applications, such as `production`, `staging`, and `qa`. This parameter\nmakes it easier to track which environments have requested deployments. The default environment is `production`.\n\nThe `auto_merge` parameter is used to ensure that the requested ref is not behind the repository's default branch. If\nthe ref _is_ behind the default branch for the repository, we will attempt to merge it for you. If the merge succeeds,\nthe API will return a successful merge commit. If merge conflicts prevent the merge from succeeding, the API will\nreturn a failure response.\n\nBy default, [commit statuses](https://docs.github.com/rest/commits/statuses) for every submitted context must be in a `success`\nstate. The `required_contexts` parameter allows you to specify a subset of contexts that must be `success`, or to\nspecify contexts that have not yet been submitted. You are not required to use commit statuses to deploy. If you do\nnot require any contexts or create any commit statuses, the deployment will always succeed.\n\nThe `payload` parameter is available for any extra information that a deployment system might need. It is a JSON text\nfield that will be passed on when a deployment event is dispatched.\n\nThe `task` parameter is used by the deployment system to allow different execution paths. In the web world this might\nbe `deploy:migrations` to run schema changes on the system. In the compiled world this could be a flag to compile an\napplication with debugging enabled.\n\nMerged branch response:\n\nYou will see this response when GitHub automatically merges the base branch into the topic branch instead of creating\na deployment. This auto-merge happens when:\n*   Auto-merge option is enabled in the repository\n*   Topic branch does not include the latest changes on the base branch, which is `master` in the response example\n*   There are no merge conflicts\n\nIf there are no new commits in the base branch, a new request to create a deployment should give a successful\nresponse.\n\nMerge conflict response:\n\nThis error happens when the `auto_merge` option is enabled and when the default branch (in this case `master`), can't\nbe merged into the branch that's being deployed (in this case `topic-branch`), due to merge conflicts.\n\nFailed commit status checks:\n\nThis error happens when the `required_contexts` parameter indicates that one or more contexts need to have a `success`\nstatus for the commit to be deployed, but one or more of the required contexts do not have a state of `success`.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` or `repo_deployment` scope to use this endpoint."
  @spec create_deployment(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_deployment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_deployment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_deployment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_deployment_partition_spec)

    %{
      id: "repos/create-deployment",
      args: params,
      call: {__MODULE__, :create_deployment},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/deployments",
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
      telemetry: [:github_ex, :repos, :create_deployment],
      timeout: nil,
      pagination: nil
    }
  end

  @create_deployment_branch_policy_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"environment_name", :environment_name}
    ],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a deployment branch policy\n\nCreates a deployment branch or tag policy for an environment.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec create_deployment_branch_policy(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def create_deployment_branch_policy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_deployment_branch_policy_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_deployment_branch_policy_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_deployment_branch_policy_partition_spec)

    %{
      id: "repos/create-deployment-branch-policy",
      args: params,
      call: {__MODULE__, :create_deployment_branch_policy},
      opts: opts,
      method: :post,
      path_template:
        "/repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies",
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
      telemetry: [:github_ex, :repos, :create_deployment_branch_policy],
      timeout: nil,
      pagination: nil
    }
  end

  @create_deployment_protection_rule_partition_spec %{
    path: [
      {"environment_name", :environment_name},
      {"repo", :repo},
      {"owner", :owner}
    ],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a custom deployment protection rule on an environment\n\nEnable a custom deployment protection rule for an environment.\n\nThe authenticated user must have admin or owner permissions to the repository to use this endpoint.\n\nFor more information about the app that is providing this custom deployment rule, see the [documentation for the `GET /apps/{app_slug}` endpoint](https://docs.github.com/rest/apps/apps#get-an-app), as well as the [guide to creating custom deployment protection rules](https://docs.github.com/actions/managing-workflow-runs-and-deployments/managing-deployments/creating-custom-deployment-protection-rules).\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec create_deployment_protection_rule(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def create_deployment_protection_rule(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_deployment_protection_rule_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_deployment_protection_rule_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_deployment_protection_rule_partition_spec)

    %{
      id: "repos/create-deployment-protection-rule",
      args: params,
      call: {__MODULE__, :create_deployment_protection_rule},
      opts: opts,
      method: :post,
      path_template:
        "/repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules",
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
      telemetry: [:github_ex, :repos, :create_deployment_protection_rule],
      timeout: nil,
      pagination: nil
    }
  end

  @create_deployment_status_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"deployment_id", :deployment_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a deployment status\n\nUsers with `push` access can create deployment statuses for a given deployment.\n\nOAuth app tokens and personal access tokens (classic) need the `repo_deployment` scope to use this endpoint."
  @spec create_deployment_status(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_deployment_status(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_deployment_status_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_deployment_status_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_deployment_status_partition_spec)

    %{
      id: "repos/create-deployment-status",
      args: params,
      call: {__MODULE__, :create_deployment_status},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/deployments/{deployment_id}/statuses",
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
      telemetry: [:github_ex, :repos, :create_deployment_status],
      timeout: nil,
      pagination: nil
    }
  end

  @create_dispatch_event_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a repository dispatch event\n\nYou can use this endpoint to trigger a webhook event called `repository_dispatch` when you want activity that happens outside of GitHub to trigger a GitHub Actions workflow or GitHub App webhook. You must configure your GitHub Actions workflow or GitHub App to run when the `repository_dispatch` event occurs. For an example `repository_dispatch` webhook payload, see \"[RepositoryDispatchEvent](https://docs.github.com/webhooks/event-payloads/#repository_dispatch).\"\n\nThe `client_payload` parameter is available for any extra information that your workflow might need. This parameter is a JSON payload that will be passed on when the webhook event is dispatched. For example, the `client_payload` can include a message that a user would like to send using a GitHub Actions workflow. Or the `client_payload` can be used as a test to debug your workflow.\n\nThis input example shows how you can use the `client_payload` as a test to debug your workflow.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec create_dispatch_event(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_dispatch_event(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_dispatch_event_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_dispatch_event_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_dispatch_event_partition_spec)

    %{
      id: "repos/create-dispatch-event",
      args: params,
      call: {__MODULE__, :create_dispatch_event},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/dispatches",
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
      telemetry: [:github_ex, :repos, :create_dispatch_event],
      timeout: nil,
      pagination: nil
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

  @doc "Create a repository for the authenticated user\n\nCreates a new repository for the authenticated user.\n\nOAuth app tokens and personal access tokens (classic) need the `public_repo` or `repo` scope to create a public repository, and `repo` scope to create a private repository."
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
      id: "repos/create-for-authenticated-user",
      args: params,
      call: {__MODULE__, :create_for_authenticated_user},
      opts: opts,
      method: :post,
      path_template: "/user/repos",
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
      telemetry: [:github_ex, :repos, :create_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @create_fork_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a fork\n\nCreate a fork for the authenticated user.\n\n> [!NOTE]\n> Forking a Repository happens asynchronously. You may have to wait a short period of time before you can access the git objects. If this takes longer than 5 minutes, be sure to contact [GitHub Support](https://support.github.com/contact?tags=dotcom-rest-api).\n\n> [!NOTE]\n> Although this endpoint works with GitHub Apps, the GitHub App must be installed on the destination account with access to all repositories and on the source account with access to the source repository."
  @spec create_fork(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_fork(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_fork_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_fork_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_fork_partition_spec)

    %{
      id: "repos/create-fork",
      args: params,
      call: {__MODULE__, :create_fork},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/forks",
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
      telemetry: [:github_ex, :repos, :create_fork],
      timeout: nil,
      pagination: nil
    }
  end

  @create_in_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create an organization repository\n\nCreates a new repository in the specified organization. The authenticated user must be a member of the organization.\n\nOAuth app tokens and personal access tokens (classic) need the `public_repo` or `repo` scope to create a public repository, and `repo` scope to create a private repository."
  @spec create_in_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_in_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_in_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_in_org_partition_spec)

    %{
      id: "repos/create-in-org",
      args: params,
      call: {__MODULE__, :create_in_org},
      opts: opts,
      method: :post,
      path_template: "/orgs/{org}/repos",
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
      telemetry: [:github_ex, :repos, :create_in_org],
      timeout: nil,
      pagination: nil
    }
  end

  @create_or_update_environment_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"environment_name", :environment_name}
    ],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Create or update an environment

       Create or update an environment with protection rules, such as required reviewers. For more information about environment protection rules, see "[Environments](https://docs.github.com/actions/reference/environments#environment-protection-rules)."

       > [!NOTE]
       > To create or update name patterns that branches must match in order to deploy to this environment, see "[Deployment branch policies](https://docs.github.com/rest/deployments/branch-policies)."

       > [!NOTE]
       > To create or update secrets for an environment, see "[GitHub Actions secrets](https://docs.github.com/rest/actions/secrets)."

       OAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint.
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec create_or_update_environment(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_or_update_environment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_or_update_environment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_or_update_environment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_or_update_environment_partition_spec)

    %{
      id: "repos/create-or-update-environment",
      args: params,
      call: {__MODULE__, :create_or_update_environment},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/environments/{environment_name}",
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
      telemetry: [:github_ex, :repos, :create_or_update_environment],
      timeout: nil,
      pagination: nil
    }
  end

  @create_or_update_file_contents_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"path", :path}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create or update file contents\n\nCreates a new file or replaces an existing file in a repository.\n\n> [!NOTE]\n> If you use this endpoint and the \"[Delete a file](https://docs.github.com/rest/repos/contents/#delete-a-file)\" endpoint in parallel, the concurrent requests will conflict and you will receive errors. You must use these endpoints serially instead.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint. The `workflow` scope is also required in order to modify files in the `.github/workflows` directory."
  @spec create_or_update_file_contents(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def create_or_update_file_contents(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_or_update_file_contents_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_or_update_file_contents_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_or_update_file_contents_partition_spec)

    %{
      id: "repos/create-or-update-file-contents",
      args: params,
      call: {__MODULE__, :create_or_update_file_contents},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/contents/{path}",
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
      telemetry: [:github_ex, :repos, :create_or_update_file_contents],
      timeout: nil,
      pagination: nil
    }
  end

  @create_org_ruleset_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create an organization repository ruleset\n\nCreate a repository ruleset for an organization."
  @spec create_org_ruleset(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_org_ruleset(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_org_ruleset_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_org_ruleset_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_org_ruleset_partition_spec)

    %{
      id: "repos/create-org-ruleset",
      args: params,
      call: {__MODULE__, :create_org_ruleset},
      opts: opts,
      method: :post,
      path_template: "/orgs/{org}/rulesets",
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
      telemetry: [:github_ex, :repos, :create_org_ruleset],
      timeout: nil,
      pagination: nil
    }
  end

  @create_pages_deployment_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a GitHub Pages deployment\n\nCreate a GitHub Pages deployment for a repository.\n\nThe authenticated user must have write permission to the repository."
  @spec create_pages_deployment(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_pages_deployment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_pages_deployment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_pages_deployment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_pages_deployment_partition_spec)

    %{
      id: "repos/create-pages-deployment",
      args: params,
      call: {__MODULE__, :create_pages_deployment},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/pages/deployments",
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
      telemetry: [:github_ex, :repos, :create_pages_deployment],
      timeout: nil,
      pagination: nil
    }
  end

  @create_pages_site_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a GitHub Pages site\n\nConfigures a GitHub Pages site. For more information, see \"[About GitHub Pages](https://docs.github.com/github/working-with-github-pages/about-github-pages).\"\n\nThe authenticated user must be a repository administrator, maintainer, or have the 'manage GitHub Pages settings' permission.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec create_pages_site(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_pages_site(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_pages_site_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_pages_site_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_pages_site_partition_spec)

    %{
      id: "repos/create-pages-site",
      args: params,
      call: {__MODULE__, :create_pages_site},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/pages",
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
      telemetry: [:github_ex, :repos, :create_pages_site],
      timeout: nil,
      pagination: nil
    }
  end

  @create_release_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Create a release

       Users with push access to the repository can create a release.

       This endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications). Creating content too quickly using this endpoint may result in secondary rate limiting. For more information, see "[Rate limits for the API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)" and "[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec create_release(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_release(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_release_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_release_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_release_partition_spec)

    %{
      id: "repos/create-release",
      args: params,
      call: {__MODULE__, :create_release},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/releases",
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
      telemetry: [:github_ex, :repos, :create_release],
      timeout: nil,
      pagination: nil
    }
  end

  @create_repo_ruleset_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a repository ruleset\n\nCreate a ruleset for a repository."
  @spec create_repo_ruleset(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_repo_ruleset(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_repo_ruleset_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_repo_ruleset_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_repo_ruleset_partition_spec)

    %{
      id: "repos/create-repo-ruleset",
      args: params,
      call: {__MODULE__, :create_repo_ruleset},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/rulesets",
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
      telemetry: [:github_ex, :repos, :create_repo_ruleset],
      timeout: nil,
      pagination: nil
    }
  end

  @create_using_template_partition_spec %{
    path: [{"template_owner", :template_owner}, {"template_repo", :template_repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a repository using a template\n\nCreates a new repository using a repository template. Use the `template_owner` and `template_repo` route parameters to specify the repository to use as the template. If the repository is not public, the authenticated user must own or be a member of an organization that owns the repository. To check if a repository is available to use as a template, get the repository's information using the [Get a repository](https://docs.github.com/rest/repos/repos#get-a-repository) endpoint and check that the `is_template` key is `true`.\n\nOAuth app tokens and personal access tokens (classic) need the `public_repo` or `repo` scope to create a public repository, and `repo` scope to create a private repository."
  @spec create_using_template(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_using_template(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_using_template_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_using_template_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_using_template_partition_spec)

    %{
      id: "repos/create-using-template",
      args: params,
      call: {__MODULE__, :create_using_template},
      opts: opts,
      method: :post,
      path_template: "/repos/{template_owner}/{template_repo}/generate",
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
      telemetry: [:github_ex, :repos, :create_using_template],
      timeout: nil,
      pagination: nil
    }
  end

  @create_webhook_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a repository webhook\n\nRepositories can have multiple webhooks installed. Each webhook should have a unique `config`. Multiple webhooks can\nshare the same `config` as long as those webhooks do not have any `events` that overlap."
  @spec create_webhook(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_webhook(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_webhook_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_webhook_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_webhook_partition_spec)

    %{
      id: "repos/create-webhook",
      args: params,
      call: {__MODULE__, :create_webhook},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/hooks",
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
      telemetry: [:github_ex, :repos, :create_webhook],
      timeout: nil,
      pagination: nil
    }
  end

  @custom_properties_for_repos_create_or_update_repository_values_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create or update custom property values for a repository\n\nCreate new or update existing custom property values for a repository.\nUsing a value of `null` for a custom property will remove or 'unset' the property value from the repository.\n\nRepository admins and other users with the repository-level \"edit custom property values\" fine-grained permission can use this endpoint."
  @spec custom_properties_for_repos_create_or_update_repository_values(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def custom_properties_for_repos_create_or_update_repository_values(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_custom_properties_for_repos_create_or_update_repository_values_request(
        client,
        params,
        opts
      )

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_custom_properties_for_repos_create_or_update_repository_values_request(
         client,
         params,
         opts
       )
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @custom_properties_for_repos_create_or_update_repository_values_partition_spec
      )

    %{
      id: "repos/custom-properties-for-repos-create-or-update-repository-values",
      args: params,
      call: {__MODULE__, :custom_properties_for_repos_create_or_update_repository_values},
      opts: opts,
      method: :patch,
      path_template: "/repos/{owner}/{repo}/properties/values",
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
      telemetry: [
        :github_ex,
        :repos,
        :custom_properties_for_repos_create_or_update_repository_values
      ],
      timeout: nil,
      pagination: nil
    }
  end

  @custom_properties_for_repos_get_repository_values_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get all custom property values for a repository\n\nGets all custom property values that are set for a repository.\nUsers with read access to the repository can use this endpoint."
  @spec custom_properties_for_repos_get_repository_values(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def custom_properties_for_repos_get_repository_values(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_custom_properties_for_repos_get_repository_values_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_custom_properties_for_repos_get_repository_values_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @custom_properties_for_repos_get_repository_values_partition_spec
      )

    %{
      id: "repos/custom-properties-for-repos-get-repository-values",
      args: params,
      call: {__MODULE__, :custom_properties_for_repos_get_repository_values},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/properties/values",
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
      telemetry: [:github_ex, :repos, :custom_properties_for_repos_get_repository_values],
      timeout: nil,
      pagination: nil
    }
  end

  @decline_invitation_for_authenticated_user_partition_spec %{
    path: [{"invitation_id", :invitation_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Decline a repository invitation"
  @spec decline_invitation_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def decline_invitation_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_decline_invitation_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_decline_invitation_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @decline_invitation_for_authenticated_user_partition_spec)

    %{
      id: "repos/decline-invitation-for-authenticated-user",
      args: params,
      call: {__MODULE__, :decline_invitation_for_authenticated_user},
      opts: opts,
      method: :delete,
      path_template: "/user/repository_invitations/{invitation_id}",
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
      telemetry: [:github_ex, :repos, :decline_invitation_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a repository\n\nDeleting a repository requires admin access.\n\nIf an organization owner has configured the organization to prevent members from deleting organization-owned\nrepositories, you will get a `403 Forbidden` response.\n\nOAuth app tokens and personal access tokens (classic) need the `delete_repo` scope to use this endpoint."
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
      id: "repos/delete",
      args: params,
      call: {__MODULE__, :delete},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}",
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
      telemetry: [:github_ex, :repos, :delete],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_access_restrictions_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete access restrictions\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\nDisables the ability to restrict who can push to this branch."
  @spec delete_access_restrictions(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_access_restrictions(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_access_restrictions_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_access_restrictions_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_access_restrictions_partition_spec)

    %{
      id: "repos/delete-access-restrictions",
      args: params,
      call: {__MODULE__, :delete_access_restrictions},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/restrictions",
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
      telemetry: [:github_ex, :repos, :delete_access_restrictions],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_admin_branch_protection_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete admin branch protection\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\nRemoving admin enforcement requires admin or owner permissions to the repository and branch protection to be enabled."
  @spec delete_admin_branch_protection(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def delete_admin_branch_protection(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_admin_branch_protection_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_admin_branch_protection_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_admin_branch_protection_partition_spec)

    %{
      id: "repos/delete-admin-branch-protection",
      args: params,
      call: {__MODULE__, :delete_admin_branch_protection},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/enforce_admins",
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
      telemetry: [:github_ex, :repos, :delete_admin_branch_protection],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_an_environment_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"environment_name", :environment_name}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete an environment\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec delete_an_environment(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_an_environment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_an_environment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_an_environment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_an_environment_partition_spec)

    %{
      id: "repos/delete-an-environment",
      args: params,
      call: {__MODULE__, :delete_an_environment},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/environments/{environment_name}",
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
      telemetry: [:github_ex, :repos, :delete_an_environment],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_autolink_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"autolink_id", :autolink_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete an autolink reference from a repository\n\nThis deletes a single autolink reference by ID that was configured for the given repository.\n\nInformation about autolinks are only available to repository administrators."
  @spec delete_autolink(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_autolink(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_autolink_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_autolink_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_autolink_partition_spec)

    %{
      id: "repos/delete-autolink",
      args: params,
      call: {__MODULE__, :delete_autolink},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/autolinks/{autolink_id}",
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
      telemetry: [:github_ex, :repos, :delete_autolink],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_branch_protection_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete branch protection\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation."
  @spec delete_branch_protection(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_branch_protection(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_branch_protection_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_branch_protection_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_branch_protection_partition_spec)

    %{
      id: "repos/delete-branch-protection",
      args: params,
      call: {__MODULE__, :delete_branch_protection},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection",
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
      telemetry: [:github_ex, :repos, :delete_branch_protection],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_commit_comment_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a commit comment"
  @spec delete_commit_comment(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_commit_comment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_commit_comment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_commit_comment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_commit_comment_partition_spec)

    %{
      id: "repos/delete-commit-comment",
      args: params,
      call: {__MODULE__, :delete_commit_comment},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/comments/{comment_id}",
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
      telemetry: [:github_ex, :repos, :delete_commit_comment],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_commit_signature_protection_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete commit signature protection\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\nWhen authenticated with admin or owner permissions to the repository, you can use this endpoint to disable required signed commits on a branch. You must enable branch protection to require signed commits."
  @spec delete_commit_signature_protection(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def delete_commit_signature_protection(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_commit_signature_protection_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_commit_signature_protection_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @delete_commit_signature_protection_partition_spec)

    %{
      id: "repos/delete-commit-signature-protection",
      args: params,
      call: {__MODULE__, :delete_commit_signature_protection},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/required_signatures",
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
      telemetry: [:github_ex, :repos, :delete_commit_signature_protection],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_deploy_key_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"key_id", :key_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a deploy key\n\nDeploy keys are immutable. If you need to update a key, remove the key and create a new one instead."
  @spec delete_deploy_key(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_deploy_key(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_deploy_key_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_deploy_key_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_deploy_key_partition_spec)

    %{
      id: "repos/delete-deploy-key",
      args: params,
      call: {__MODULE__, :delete_deploy_key},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/keys/{key_id}",
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
      telemetry: [:github_ex, :repos, :delete_deploy_key],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_deployment_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"deployment_id", :deployment_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Delete a deployment

       If the repository only has one deployment, you can delete the deployment regardless of its status. If the repository has more than one deployment, you can only delete inactive deployments. This ensures that repositories with multiple deployments will always have an active deployment.

       To set a deployment as inactive, you must:

       *   Create a new deployment that is active so that the system has a record of the current state, then delete the previously active deployment.
       *   Mark the active deployment as inactive by adding any non-successful deployment status.

       For more information, see "[Create a deployment](https://docs.github.com/rest/deployments/deployments/#create-a-deployment)" and "[Create a deployment status](https://docs.github.com/rest/deployments/statuses#create-a-deployment-status)."

       OAuth app tokens and personal access tokens (classic) need the `repo` or `repo_deployment` scope to use this endpoint.
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec delete_deployment(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_deployment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_deployment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_deployment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_deployment_partition_spec)

    %{
      id: "repos/delete-deployment",
      args: params,
      call: {__MODULE__, :delete_deployment},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/deployments/{deployment_id}",
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
      telemetry: [:github_ex, :repos, :delete_deployment],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_deployment_branch_policy_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"environment_name", :environment_name},
      {"branch_policy_id", :branch_policy_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a deployment branch policy\n\nDeletes a deployment branch or tag policy for an environment.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec delete_deployment_branch_policy(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def delete_deployment_branch_policy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_deployment_branch_policy_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_deployment_branch_policy_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_deployment_branch_policy_partition_spec)

    %{
      id: "repos/delete-deployment-branch-policy",
      args: params,
      call: {__MODULE__, :delete_deployment_branch_policy},
      opts: opts,
      method: :delete,
      path_template:
        "/repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies/{branch_policy_id}",
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
      telemetry: [:github_ex, :repos, :delete_deployment_branch_policy],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_file_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"path", :path}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a file\n\nDeletes a file in a repository.\n\nYou can provide an additional `committer` parameter, which is an object containing information about the committer. Or, you can provide an `author` parameter, which is an object containing information about the author.\n\nThe `author` section is optional and is filled in with the `committer` information if omitted. If the `committer` information is omitted, the authenticated user's information is used.\n\nYou must provide values for both `name` and `email`, whether you choose to use `author` or `committer`. Otherwise, you'll receive a `422` status code.\n\n> [!NOTE]\n> If you use this endpoint and the \"[Create or update file contents](https://docs.github.com/rest/repos/contents/#create-or-update-file-contents)\" endpoint in parallel, the concurrent requests will conflict and you will receive errors. You must use these endpoints serially instead."
  @spec delete_file(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_file(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_file_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_file_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_file_partition_spec)

    %{
      id: "repos/delete-file",
      args: params,
      call: {__MODULE__, :delete_file},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/contents/{path}",
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
      telemetry: [:github_ex, :repos, :delete_file],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_invitation_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"invitation_id", :invitation_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a repository invitation"
  @spec delete_invitation(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_invitation(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_invitation_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_invitation_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_invitation_partition_spec)

    %{
      id: "repos/delete-invitation",
      args: params,
      call: {__MODULE__, :delete_invitation},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/invitations/{invitation_id}",
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
      telemetry: [:github_ex, :repos, :delete_invitation],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_org_ruleset_partition_spec %{
    path: [{"org", :org}, {"ruleset_id", :ruleset_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete an organization repository ruleset\n\nDelete a ruleset for an organization."
  @spec delete_org_ruleset(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_org_ruleset(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_org_ruleset_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_org_ruleset_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_org_ruleset_partition_spec)

    %{
      id: "repos/delete-org-ruleset",
      args: params,
      call: {__MODULE__, :delete_org_ruleset},
      opts: opts,
      method: :delete,
      path_template: "/orgs/{org}/rulesets/{ruleset_id}",
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
      telemetry: [:github_ex, :repos, :delete_org_ruleset],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_pages_site_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a GitHub Pages site\n\nDeletes a GitHub Pages site. For more information, see \"[About GitHub Pages](https://docs.github.com/github/working-with-github-pages/about-github-pages).\n\nThe authenticated user must be a repository administrator, maintainer, or have the 'manage GitHub Pages settings' permission.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec delete_pages_site(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_pages_site(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_pages_site_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_pages_site_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_pages_site_partition_spec)

    %{
      id: "repos/delete-pages-site",
      args: params,
      call: {__MODULE__, :delete_pages_site},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/pages",
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
      telemetry: [:github_ex, :repos, :delete_pages_site],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_pull_request_review_protection_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete pull request review protection\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation."
  @spec delete_pull_request_review_protection(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def delete_pull_request_review_protection(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_pull_request_review_protection_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_pull_request_review_protection_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @delete_pull_request_review_protection_partition_spec)

    %{
      id: "repos/delete-pull-request-review-protection",
      args: params,
      call: {__MODULE__, :delete_pull_request_review_protection},
      opts: opts,
      method: :delete,
      path_template:
        "/repos/{owner}/{repo}/branches/{branch}/protection/required_pull_request_reviews",
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
      telemetry: [:github_ex, :repos, :delete_pull_request_review_protection],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_release_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"release_id", :release_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a release\n\nUsers with push access to the repository can delete a release."
  @spec delete_release(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_release(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_release_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_release_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_release_partition_spec)

    %{
      id: "repos/delete-release",
      args: params,
      call: {__MODULE__, :delete_release},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/releases/{release_id}",
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
      telemetry: [:github_ex, :repos, :delete_release],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_release_asset_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"asset_id", :asset_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a release asset"
  @spec delete_release_asset(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_release_asset(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_release_asset_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_release_asset_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_release_asset_partition_spec)

    %{
      id: "repos/delete-release-asset",
      args: params,
      call: {__MODULE__, :delete_release_asset},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/releases/assets/{asset_id}",
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
      telemetry: [:github_ex, :repos, :delete_release_asset],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_repo_ruleset_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"ruleset_id", :ruleset_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a repository ruleset\n\nDelete a ruleset for a repository."
  @spec delete_repo_ruleset(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_repo_ruleset(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_repo_ruleset_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_repo_ruleset_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_repo_ruleset_partition_spec)

    %{
      id: "repos/delete-repo-ruleset",
      args: params,
      call: {__MODULE__, :delete_repo_ruleset},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/rulesets/{ruleset_id}",
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
      telemetry: [:github_ex, :repos, :delete_repo_ruleset],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_webhook_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"hook_id", :hook_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a repository webhook\n\nDelete a webhook for an organization.\n\nThe authenticated user must be a repository owner, or have admin access in the repository, to delete the webhook."
  @spec delete_webhook(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_webhook(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_webhook_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_webhook_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_webhook_partition_spec)

    %{
      id: "repos/delete-webhook",
      args: params,
      call: {__MODULE__, :delete_webhook},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/hooks/{hook_id}",
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
      telemetry: [:github_ex, :repos, :delete_webhook],
      timeout: nil,
      pagination: nil
    }
  end

  @disable_automated_security_fixes_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Disable Dependabot security updates\n\nDisables Dependabot security updates for a repository. The authenticated user must have admin access to the repository. For more information, see \"[Configuring Dependabot security updates](https://docs.github.com/articles/configuring-automated-security-fixes)\"."
  @spec disable_automated_security_fixes(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def disable_automated_security_fixes(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_disable_automated_security_fixes_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_disable_automated_security_fixes_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @disable_automated_security_fixes_partition_spec)

    %{
      id: "repos/disable-automated-security-fixes",
      args: params,
      call: {__MODULE__, :disable_automated_security_fixes},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/automated-security-fixes",
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
      telemetry: [:github_ex, :repos, :disable_automated_security_fixes],
      timeout: nil,
      pagination: nil
    }
  end

  @disable_deployment_protection_rule_partition_spec %{
    path: [
      {"environment_name", :environment_name},
      {"repo", :repo},
      {"owner", :owner},
      {"protection_rule_id", :protection_rule_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Disable a custom protection rule for an environment\n\nDisables a custom deployment protection rule for an environment.\n\nThe authenticated user must have admin or owner permissions to the repository to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec disable_deployment_protection_rule(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def disable_deployment_protection_rule(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_disable_deployment_protection_rule_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_disable_deployment_protection_rule_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @disable_deployment_protection_rule_partition_spec)

    %{
      id: "repos/disable-deployment-protection-rule",
      args: params,
      call: {__MODULE__, :disable_deployment_protection_rule},
      opts: opts,
      method: :delete,
      path_template:
        "/repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules/{protection_rule_id}",
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
      telemetry: [:github_ex, :repos, :disable_deployment_protection_rule],
      timeout: nil,
      pagination: nil
    }
  end

  @disable_immutable_releases_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Disable immutable releases\n\nDisables immutable releases for a repository. The authenticated user must have admin access to the repository."
  @spec disable_immutable_releases(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def disable_immutable_releases(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_disable_immutable_releases_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_disable_immutable_releases_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @disable_immutable_releases_partition_spec)

    %{
      id: "repos/disable-immutable-releases",
      args: params,
      call: {__MODULE__, :disable_immutable_releases},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/immutable-releases",
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
      telemetry: [:github_ex, :repos, :disable_immutable_releases],
      timeout: nil,
      pagination: nil
    }
  end

  @disable_private_vulnerability_reporting_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Disable private vulnerability reporting for a repository\n\nDisables private vulnerability reporting for a repository. The authenticated user must have admin access to the repository. For more information, see \"[Privately reporting a security vulnerability](https://docs.github.com/code-security/security-advisories/guidance-on-reporting-and-writing/privately-reporting-a-security-vulnerability)\"."
  @spec disable_private_vulnerability_reporting(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def disable_private_vulnerability_reporting(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_disable_private_vulnerability_reporting_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_disable_private_vulnerability_reporting_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @disable_private_vulnerability_reporting_partition_spec)

    %{
      id: "repos/disable-private-vulnerability-reporting",
      args: params,
      call: {__MODULE__, :disable_private_vulnerability_reporting},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/private-vulnerability-reporting",
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
      telemetry: [:github_ex, :repos, :disable_private_vulnerability_reporting],
      timeout: nil,
      pagination: nil
    }
  end

  @disable_vulnerability_alerts_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Disable vulnerability alerts\n\nDisables dependency alerts and the dependency graph for a repository.\nThe authenticated user must have admin access to the repository. For more information,\nsee \"[About security alerts for vulnerable dependencies](https://docs.github.com/articles/about-security-alerts-for-vulnerable-dependencies)\"."
  @spec disable_vulnerability_alerts(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def disable_vulnerability_alerts(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_disable_vulnerability_alerts_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_disable_vulnerability_alerts_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @disable_vulnerability_alerts_partition_spec)

    %{
      id: "repos/disable-vulnerability-alerts",
      args: params,
      call: {__MODULE__, :disable_vulnerability_alerts},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/vulnerability-alerts",
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
      telemetry: [:github_ex, :repos, :disable_vulnerability_alerts],
      timeout: nil,
      pagination: nil
    }
  end

  @download_tarball_archive_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"ref", :ref}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Download a repository archive (tar)\n\nGets a redirect URL to download a tar archive for a repository. If you omit `:ref`, the repository’s default branch (usually\n`main`) will be used. Please make sure your HTTP framework is configured to follow redirects or you will need to use\nthe `Location` header to make a second `GET` request.\n\n> [!NOTE]\n> For private repositories, these links are temporary and expire after five minutes."
  @spec download_tarball_archive(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def download_tarball_archive(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_download_tarball_archive_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_download_tarball_archive_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @download_tarball_archive_partition_spec)

    %{
      id: "repos/download-tarball-archive",
      args: params,
      call: {__MODULE__, :download_tarball_archive},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/tarball/{ref}",
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
      telemetry: [:github_ex, :repos, :download_tarball_archive],
      timeout: nil,
      pagination: nil
    }
  end

  @download_zipball_archive_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"ref", :ref}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Download a repository archive (zip)\n\nGets a redirect URL to download a zip archive for a repository. If you omit `:ref`, the repository’s default branch (usually\n`main`) will be used. Please make sure your HTTP framework is configured to follow redirects or you will need to use\nthe `Location` header to make a second `GET` request.\n\n> [!NOTE]\n> For private repositories, these links are temporary and expire after five minutes. If the repository is empty, you will receive a 404 when you follow the redirect."
  @spec download_zipball_archive(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def download_zipball_archive(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_download_zipball_archive_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_download_zipball_archive_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @download_zipball_archive_partition_spec)

    %{
      id: "repos/download-zipball-archive",
      args: params,
      call: {__MODULE__, :download_zipball_archive},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/zipball/{ref}",
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
      telemetry: [:github_ex, :repos, :download_zipball_archive],
      timeout: nil,
      pagination: nil
    }
  end

  @enable_automated_security_fixes_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Enable Dependabot security updates\n\nEnables Dependabot security updates for a repository. The authenticated user must have admin access to the repository. For more information, see \"[Configuring Dependabot security updates](https://docs.github.com/articles/configuring-automated-security-fixes)\"."
  @spec enable_automated_security_fixes(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def enable_automated_security_fixes(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_enable_automated_security_fixes_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_enable_automated_security_fixes_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @enable_automated_security_fixes_partition_spec)

    %{
      id: "repos/enable-automated-security-fixes",
      args: params,
      call: {__MODULE__, :enable_automated_security_fixes},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/automated-security-fixes",
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
      telemetry: [:github_ex, :repos, :enable_automated_security_fixes],
      timeout: nil,
      pagination: nil
    }
  end

  @enable_immutable_releases_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Enable immutable releases\n\nEnables immutable releases for a repository. The authenticated user must have admin access to the repository."
  @spec enable_immutable_releases(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def enable_immutable_releases(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_enable_immutable_releases_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_enable_immutable_releases_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @enable_immutable_releases_partition_spec)

    %{
      id: "repos/enable-immutable-releases",
      args: params,
      call: {__MODULE__, :enable_immutable_releases},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/immutable-releases",
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
      telemetry: [:github_ex, :repos, :enable_immutable_releases],
      timeout: nil,
      pagination: nil
    }
  end

  @enable_private_vulnerability_reporting_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Enable private vulnerability reporting for a repository\n\nEnables private vulnerability reporting for a repository. The authenticated user must have admin access to the repository. For more information, see \"[Privately reporting a security vulnerability](https://docs.github.com/code-security/security-advisories/guidance-on-reporting-and-writing/privately-reporting-a-security-vulnerability).\""
  @spec enable_private_vulnerability_reporting(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def enable_private_vulnerability_reporting(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_enable_private_vulnerability_reporting_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_enable_private_vulnerability_reporting_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @enable_private_vulnerability_reporting_partition_spec)

    %{
      id: "repos/enable-private-vulnerability-reporting",
      args: params,
      call: {__MODULE__, :enable_private_vulnerability_reporting},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/private-vulnerability-reporting",
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
      telemetry: [:github_ex, :repos, :enable_private_vulnerability_reporting],
      timeout: nil,
      pagination: nil
    }
  end

  @enable_vulnerability_alerts_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Enable vulnerability alerts\n\nEnables dependency alerts and the dependency graph for a repository. The authenticated user must have admin access to the repository. For more information, see \"[About security alerts for vulnerable dependencies](https://docs.github.com/articles/about-security-alerts-for-vulnerable-dependencies)\"."
  @spec enable_vulnerability_alerts(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def enable_vulnerability_alerts(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_enable_vulnerability_alerts_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_enable_vulnerability_alerts_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @enable_vulnerability_alerts_partition_spec)

    %{
      id: "repos/enable-vulnerability-alerts",
      args: params,
      call: {__MODULE__, :enable_vulnerability_alerts},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/vulnerability-alerts",
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
      telemetry: [:github_ex, :repos, :enable_vulnerability_alerts],
      timeout: nil,
      pagination: nil
    }
  end

  @generate_release_notes_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Generate release notes content for a release\n\nGenerate a name and body describing a [release](https://docs.github.com/rest/releases/releases#get-a-release). The body content will be markdown formatted and contain information like the changes since last release and users who contributed. The generated release notes are not saved anywhere. They are intended to be generated and used when creating a new release."
  @spec generate_release_notes(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def generate_release_notes(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_generate_release_notes_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_generate_release_notes_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @generate_release_notes_partition_spec)

    %{
      id: "repos/generate-release-notes",
      args: params,
      call: {__MODULE__, :generate_release_notes},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/releases/generate-notes",
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
      telemetry: [:github_ex, :repos, :generate_release_notes],
      timeout: nil,
      pagination: nil
    }
  end

  @get_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a repository\n\nThe `parent` and `source` objects are present when the repository is a fork. `parent` is the repository this repository was forked from, `source` is the ultimate source for the network.\n\n> [!NOTE]\n> - In order to see the `security_and_analysis` block for a repository you must have admin permissions for the repository or be an owner or security manager for the organization that owns the repository. For more information, see \"[Managing security managers in your organization](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/managing-security-managers-in-your-organization).\"\n> - To view merge-related settings, you must have the `contents:read` and `contents:write` permissions."
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
      id: "repos/get",
      args: params,
      call: {__MODULE__, :get},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}",
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
      telemetry: [:github_ex, :repos, :get],
      timeout: nil,
      pagination: nil
    }
  end

  @get_access_restrictions_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get access restrictions\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\nLists who has access to this protected branch.\n\n> [!NOTE]\n> Users, apps, and teams `restrictions` are only available for organization-owned repositories."
  @spec get_access_restrictions(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_access_restrictions(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_access_restrictions_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_access_restrictions_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_access_restrictions_partition_spec)

    %{
      id: "repos/get-access-restrictions",
      args: params,
      call: {__MODULE__, :get_access_restrictions},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/restrictions",
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
      telemetry: [:github_ex, :repos, :get_access_restrictions],
      timeout: nil,
      pagination: nil
    }
  end

  @get_admin_branch_protection_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get admin branch protection\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation."
  @spec get_admin_branch_protection(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_admin_branch_protection(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_admin_branch_protection_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_admin_branch_protection_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_admin_branch_protection_partition_spec)

    %{
      id: "repos/get-admin-branch-protection",
      args: params,
      call: {__MODULE__, :get_admin_branch_protection},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/enforce_admins",
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
      telemetry: [:github_ex, :repos, :get_admin_branch_protection],
      timeout: nil,
      pagination: nil
    }
  end

  @get_all_deployment_protection_rules_partition_spec %{
    path: [
      {"environment_name", :environment_name},
      {"repo", :repo},
      {"owner", :owner}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get all deployment protection rules for an environment\n\nGets all custom deployment protection rules that are enabled for an environment. Anyone with read access to the repository can use this endpoint. For more information about environments, see \"[Using environments for deployment](https://docs.github.com/actions/deployment/targeting-different-environments/using-environments-for-deployment).\"\n\nFor more information about the app that is providing this custom deployment rule, see the [documentation for the `GET /apps/{app_slug}` endpoint](https://docs.github.com/rest/apps/apps#get-an-app).\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with a private repository."
  @spec get_all_deployment_protection_rules(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_all_deployment_protection_rules(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_all_deployment_protection_rules_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_all_deployment_protection_rules_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @get_all_deployment_protection_rules_partition_spec)

    %{
      id: "repos/get-all-deployment-protection-rules",
      args: params,
      call: {__MODULE__, :get_all_deployment_protection_rules},
      opts: opts,
      method: :get,
      path_template:
        "/repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules",
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
      telemetry: [:github_ex, :repos, :get_all_deployment_protection_rules],
      timeout: nil,
      pagination: nil
    }
  end

  @get_all_environments_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List environments\n\nLists the environments for a repository.\n\nAnyone with read access to the repository can use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with a private repository."
  @spec get_all_environments(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_all_environments(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_all_environments_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_get_all_environments(term(), map(), keyword()) :: Enumerable.t()
  def stream_get_all_environments(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_get_all_environments_request(client, params, opts) end,
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

  defp build_get_all_environments_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_all_environments_partition_spec)

    %{
      id: "repos/get-all-environments",
      args: params,
      call: {__MODULE__, :get_all_environments},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/environments",
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
      telemetry: [:github_ex, :repos, :get_all_environments],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["environments"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @get_all_status_check_contexts_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get all status check contexts\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation."
  @spec get_all_status_check_contexts(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_all_status_check_contexts(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_all_status_check_contexts_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_all_status_check_contexts_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_all_status_check_contexts_partition_spec)

    %{
      id: "repos/get-all-status-check-contexts",
      args: params,
      call: {__MODULE__, :get_all_status_check_contexts},
      opts: opts,
      method: :get,
      path_template:
        "/repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks/contexts",
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
      telemetry: [:github_ex, :repos, :get_all_status_check_contexts],
      timeout: nil,
      pagination: nil
    }
  end

  @get_all_topics_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"page", :page}, {"per_page", :per_page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get all repository topics"
  @spec get_all_topics(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_all_topics(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_all_topics_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_get_all_topics(term(), map(), keyword()) :: Enumerable.t()
  def stream_get_all_topics(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_get_all_topics_request(client, params, opts) end,
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

  defp build_get_all_topics_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_all_topics_partition_spec)

    %{
      id: "repos/get-all-topics",
      args: params,
      call: {__MODULE__, :get_all_topics},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/topics",
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
      telemetry: [:github_ex, :repos, :get_all_topics],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["names"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @get_apps_with_access_to_protected_branch_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get apps with access to the protected branch\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\nLists the GitHub Apps that have push access to this branch. Only GitHub Apps that are installed on the repository and that have been granted write access to the repository contents can be added as authorized actors on a protected branch."
  @spec get_apps_with_access_to_protected_branch(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_apps_with_access_to_protected_branch(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_apps_with_access_to_protected_branch_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_apps_with_access_to_protected_branch_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @get_apps_with_access_to_protected_branch_partition_spec)

    %{
      id: "repos/get-apps-with-access-to-protected-branch",
      args: params,
      call: {__MODULE__, :get_apps_with_access_to_protected_branch},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/apps",
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
      telemetry: [:github_ex, :repos, :get_apps_with_access_to_protected_branch],
      timeout: nil,
      pagination: nil
    }
  end

  @get_autolink_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"autolink_id", :autolink_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get an autolink reference of a repository\n\nThis returns a single autolink reference by ID that was configured for the given repository.\n\nInformation about autolinks are only available to repository administrators."
  @spec get_autolink(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_autolink(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_autolink_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_autolink_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_autolink_partition_spec)

    %{
      id: "repos/get-autolink",
      args: params,
      call: {__MODULE__, :get_autolink},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/autolinks/{autolink_id}",
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
      telemetry: [:github_ex, :repos, :get_autolink],
      timeout: nil,
      pagination: nil
    }
  end

  @get_branch_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a branch"
  @spec get_branch(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_branch(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_branch_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_branch_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_branch_partition_spec)

    %{
      id: "repos/get-branch",
      args: params,
      call: {__MODULE__, :get_branch},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/branches/{branch}",
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
      telemetry: [:github_ex, :repos, :get_branch],
      timeout: nil,
      pagination: nil
    }
  end

  @get_branch_protection_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get branch protection\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation."
  @spec get_branch_protection(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_branch_protection(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_branch_protection_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_branch_protection_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_branch_protection_partition_spec)

    %{
      id: "repos/get-branch-protection",
      args: params,
      call: {__MODULE__, :get_branch_protection},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection",
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
      telemetry: [:github_ex, :repos, :get_branch_protection],
      timeout: nil,
      pagination: nil
    }
  end

  @get_branch_rules_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Get rules for a branch

       Returns all active rules that apply to the specified branch. The branch does not need to exist; rules that would apply
       to a branch with that name will be returned. All active rules that apply will be returned, regardless of the level
       at which they are configured (e.g. repository or organization). Rules in rulesets with "evaluate" or "disabled"
       enforcement statuses are not returned.
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec get_branch_rules(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_branch_rules(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_branch_rules_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_get_branch_rules(term(), map(), keyword()) :: Enumerable.t()
  def stream_get_branch_rules(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_get_branch_rules_request(client, params, opts) end,
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

  defp build_get_branch_rules_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_branch_rules_partition_spec)

    %{
      id: "repos/get-branch-rules",
      args: params,
      call: {__MODULE__, :get_branch_rules},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/rules/branches/{branch}",
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
      telemetry: [:github_ex, :repos, :get_branch_rules],
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

  @get_clones_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per", :per}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get repository clones\n\nGet the total number of clones and breakdown per day or week for the last 14 days. Timestamps are aligned to UTC midnight of the beginning of the day or week. Week begins on Monday."
  @spec get_clones(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_clones(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_clones_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_clones_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_clones_partition_spec)

    %{
      id: "repos/get-clones",
      args: params,
      call: {__MODULE__, :get_clones},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/traffic/clones",
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
      telemetry: [:github_ex, :repos, :get_clones],
      timeout: nil,
      pagination: nil
    }
  end

  @get_code_frequency_stats_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get the weekly commit activity\n\nReturns a weekly aggregate of the number of additions and deletions pushed to a repository.\n\n> [!NOTE]\n> This endpoint can only be used for repositories with fewer than 10,000 commits. If the repository contains 10,000 or more commits, a 422 status code will be returned."
  @spec get_code_frequency_stats(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_code_frequency_stats(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_code_frequency_stats_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_code_frequency_stats_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_code_frequency_stats_partition_spec)

    %{
      id: "repos/get-code-frequency-stats",
      args: params,
      call: {__MODULE__, :get_code_frequency_stats},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/stats/code_frequency",
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
      telemetry: [:github_ex, :repos, :get_code_frequency_stats],
      timeout: nil,
      pagination: nil
    }
  end

  @get_collaborator_permission_level_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get repository permissions for a user\n\nChecks the repository permission and role of a collaborator.\n\nThe `permission` attribute provides the legacy base roles of `admin`, `write`, `read`, and `none`, where the\n`maintain` role is mapped to `write` and the `triage` role is mapped to `read`.\nThe `role_name` attribute provides the name of the assigned role, including custom roles. The\n`permission` can also be used to determine which base level of access the collaborator has to the repository.\n\nThe calculated permissions are the highest role assigned to the collaborator after considering all sources of grants, including: repo, teams, organization, and enterprise.\nThere is presently not a way to differentiate between an organization level grant and a repository level grant from this endpoint response."
  @spec get_collaborator_permission_level(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_collaborator_permission_level(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_collaborator_permission_level_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_collaborator_permission_level_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_collaborator_permission_level_partition_spec)

    %{
      id: "repos/get-collaborator-permission-level",
      args: params,
      call: {__MODULE__, :get_collaborator_permission_level},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/collaborators/{username}/permission",
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
      telemetry: [:github_ex, :repos, :get_collaborator_permission_level],
      timeout: nil,
      pagination: nil
    }
  end

  @get_combined_status_for_ref_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"ref", :ref}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get the combined status for a specific reference\n\nUsers with pull access in a repository can access a combined view of commit statuses for a given ref. The ref can be a SHA, a branch name, or a tag name.\n\n\nAdditionally, a combined `state` is returned. The `state` is one of:\n\n*   **failure** if any of the contexts report as `error` or `failure`\n*   **pending** if there are no statuses or a context is `pending`\n*   **success** if the latest status for all contexts is `success`"
  @spec get_combined_status_for_ref(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_combined_status_for_ref(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_combined_status_for_ref_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_get_combined_status_for_ref(term(), map(), keyword()) :: Enumerable.t()
  def stream_get_combined_status_for_ref(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_get_combined_status_for_ref_request(client, params, opts) end,
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

  defp build_get_combined_status_for_ref_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_combined_status_for_ref_partition_spec)

    %{
      id: "repos/get-combined-status-for-ref",
      args: params,
      call: {__MODULE__, :get_combined_status_for_ref},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/commits/{ref}/status",
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
      telemetry: [:github_ex, :repos, :get_combined_status_for_ref],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["statuses"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @get_commit_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"ref", :ref}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"page", :page}, {"per_page", :per_page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Get a commit

       Returns the contents of a single commit reference. You must have `read` access for the repository to use this endpoint.

       > [!NOTE]
       > If there are more than 300 files in the commit diff and the default JSON media type is requested, the response will include pagination link headers for the remaining files, up to a limit of 3000 files. Each page contains the static commit information, and the only changes are to the file listing.

       This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)." Pagination query parameters are not supported for these media types.

       - **`application/vnd.github.diff`**: Returns the diff of the commit. Larger diffs may time out and return a 5xx status code.
       - **`application/vnd.github.patch`**: Returns the patch of the commit. Diffs with binary data will have no `patch` property. Larger diffs may time out and return a 5xx status code.
       - **`application/vnd.github.sha`**: Returns the commit's SHA-1 hash. You can use this endpoint to check if a remote reference's SHA-1 hash is the same as your local reference's SHA-1 hash by providing the local SHA-1 reference as the ETag.

       **Signature verification object**

       The response will include a `verification` object that describes the result of verifying the commit's signature. The following fields are included in the `verification` object:

       | Name | Type | Description |
       | ---- | ---- | ----------- |
       | `verified` | `boolean` | Indicates whether GitHub considers the signature in this commit to be verified. |
       | `reason` | `string` | The reason for verified value. Possible values and their meanings are enumerated in table below. |
       | `signature` | `string` | The signature that was extracted from the commit. |
       | `payload` | `string` | The value that was signed. |
       | `verified_at` | `string` | The date the signature was verified by GitHub. |

       These are the possible values for `reason` in the `verification` object:

       | Value | Description |
       | ----- | ----------- |
       | `expired_key` | The key that made the signature is expired. |
       | `not_signing_key` | The "signing" flag is not among the usage flags in the GPG key that made the signature. |
       | `gpgverify_error` | There was an error communicating with the signature verification service. |
       | `gpgverify_unavailable` | The signature verification service is currently unavailable. |
       | `unsigned` | The object does not include a signature. |
       | `unknown_signature_type` | A non-PGP signature was found in the commit. |
       | `no_user` | No user was associated with the `committer` email address in the commit. |
       | `unverified_email` | The `committer` email address in the commit was associated with a user, but the email address is not verified on their account. |
       | `bad_email` | The `committer` email address in the commit is not included in the identities of the PGP key that made the signature. |
       | `unknown_key` | The key that made the signature has not been registered with any user's account. |
       | `malformed_signature` | There was an error parsing the signature. |
       | `invalid` | The signature could not be cryptographically verified using the key whose key-id was found in the signature. |
       | `valid` | None of the above errors applied, so the signature is considered to be verified. |
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec get_commit(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_commit(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_commit_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_commit_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_commit_partition_spec)

    %{
      id: "repos/get-commit",
      args: params,
      call: {__MODULE__, :get_commit},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/commits/{ref}",
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
      telemetry: [:github_ex, :repos, :get_commit],
      timeout: nil,
      pagination: nil
    }
  end

  @get_commit_activity_stats_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get the last year of commit activity\n\nReturns the last year of commit activity grouped by week. The `days` array is a group of commits per day, starting on `Sunday`."
  @spec get_commit_activity_stats(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_commit_activity_stats(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_commit_activity_stats_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_commit_activity_stats_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_commit_activity_stats_partition_spec)

    %{
      id: "repos/get-commit-activity-stats",
      args: params,
      call: {__MODULE__, :get_commit_activity_stats},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/stats/commit_activity",
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
      telemetry: [:github_ex, :repos, :get_commit_activity_stats],
      timeout: nil,
      pagination: nil
    }
  end

  @get_commit_comment_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a commit comment\n\nGets a specified commit comment.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github-commitcomment.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.\n- **`application/vnd.github-commitcomment.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.\n- **`application/vnd.github-commitcomment.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.\n- **`application/vnd.github-commitcomment.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`."
  @spec get_commit_comment(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_commit_comment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_commit_comment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_commit_comment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_commit_comment_partition_spec)

    %{
      id: "repos/get-commit-comment",
      args: params,
      call: {__MODULE__, :get_commit_comment},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/comments/{comment_id}",
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
      telemetry: [:github_ex, :repos, :get_commit_comment],
      timeout: nil,
      pagination: nil
    }
  end

  @get_commit_signature_protection_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get commit signature protection\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\nWhen authenticated with admin or owner permissions to the repository, you can use this endpoint to check whether a branch requires signed commits. An enabled status of `true` indicates you must sign commits on this branch. For more information, see [Signing commits with GPG](https://docs.github.com/articles/signing-commits-with-gpg) in GitHub Help.\n\n> [!NOTE]\n> You must enable branch protection to require signed commits."
  @spec get_commit_signature_protection(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_commit_signature_protection(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_commit_signature_protection_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_commit_signature_protection_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_commit_signature_protection_partition_spec)

    %{
      id: "repos/get-commit-signature-protection",
      args: params,
      call: {__MODULE__, :get_commit_signature_protection},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/required_signatures",
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
      telemetry: [:github_ex, :repos, :get_commit_signature_protection],
      timeout: nil,
      pagination: nil
    }
  end

  @get_community_profile_metrics_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get community profile metrics\n\nReturns all community profile metrics for a repository. The repository cannot be a fork.\n\nThe returned metrics include an overall health score, the repository description, the presence of documentation, the\ndetected code of conduct, the detected license, and the presence of ISSUE\\_TEMPLATE, PULL\\_REQUEST\\_TEMPLATE,\nREADME, and CONTRIBUTING files.\n\nThe `health_percentage` score is defined as a percentage of how many of\nthe recommended community health files are present. For more information, see\n\"[About community profiles for public repositories](https://docs.github.com/communities/setting-up-your-project-for-healthy-contributions/about-community-profiles-for-public-repositories).\"\n\n`content_reports_enabled` is only returned for organization-owned repositories."
  @spec get_community_profile_metrics(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_community_profile_metrics(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_community_profile_metrics_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_community_profile_metrics_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_community_profile_metrics_partition_spec)

    %{
      id: "repos/get-community-profile-metrics",
      args: params,
      call: {__MODULE__, :get_community_profile_metrics},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/community/profile",
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
      telemetry: [:github_ex, :repos, :get_community_profile_metrics],
      timeout: nil,
      pagination: nil
    }
  end

  @get_content_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"path", :path}],
    auth: {"auth", :auth},
    body: %{mode: :key, key: {"body", :body}},
    query: [{"ref", :ref}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Get repository content

       Gets the contents of a file or directory in a repository. Specify the file path or directory with the `path` parameter. If you omit the `path` parameter, you will receive the contents of the repository's root directory.

       This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

       - **`application/vnd.github.raw+json`**: Returns the raw file contents for files and symlinks.
       - **`application/vnd.github.html+json`**: Returns the file contents in HTML. Markup languages are rendered to HTML using GitHub's open-source [Markup library](https://github.com/github/markup).
       - **`application/vnd.github.object+json`**: Returns the contents in a consistent object format regardless of the content type. For example, instead of an array of objects for a directory, the response will be an object with an `entries` attribute containing the array of objects.

       If the content is a directory: The response will be an array of objects, one object for each item in the directory.

       If the content is a symlink and the symlink's target is a normal file in the repository, then the API responds with the content of the file. Otherwise, the API responds with an object describing the symlink itself.

       If the content is a submodule, the `submodule_git_url` field identifies the location of the submodule repository, and the `sha` identifies a specific commit within the submodule repository. Git uses the given URL when cloning the submodule repository, and checks out the submodule at that specific commit. If the submodule repository is not hosted on github.com, the Git URLs (`git_url` and `_links["git"]`) and the github.com URLs (`html_url` and `_links["html"]`) will have null values.

       **Notes**:

       - To get a repository's contents recursively, you can [recursively get the tree](https://docs.github.com/rest/git/trees#get-a-tree).
       - This API has an upper limit of 1,000 files for a directory. If you need to retrieve
       more files, use the [Git Trees API](https://docs.github.com/rest/git/trees#get-a-tree).
       - Download URLs expire and are meant to be used just once. To ensure the download URL does not expire, please use the contents API to obtain a fresh download URL for each download.
       - If the requested file's size is:
       - 1 MB or smaller: All features of this endpoint are supported.
       - Between 1-100 MB: Only the `raw` or `object` custom media types are supported. Both will work as normal, except that when using the `object` media type, the `content` field will be an empty
       string and the `encoding` field will be `"none"`. To get the contents of these larger files, use the `raw` media type.
       - Greater than 100 MB: This endpoint is not supported.
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec get_content(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_content(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_content_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_content_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_content_partition_spec)

    %{
      id: "repos/get-content",
      args: params,
      call: {__MODULE__, :get_content},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/contents/{path}",
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
      telemetry: [:github_ex, :repos, :get_content],
      timeout: nil,
      pagination: nil
    }
  end

  @get_contributors_stats_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get all contributor commit activity\n\nReturns the `total` number of commits authored by the contributor. In addition, the response includes a Weekly Hash (`weeks` array) with the following information:\n\n*   `w` - Start of the week, given as a [Unix timestamp](https://en.wikipedia.org/wiki/Unix_time).\n*   `a` - Number of additions\n*   `d` - Number of deletions\n*   `c` - Number of commits\n\n> [!NOTE]\n> This endpoint will return `0` values for all addition and deletion counts in repositories with 10,000 or more commits."
  @spec get_contributors_stats(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_contributors_stats(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_contributors_stats_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_contributors_stats_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_contributors_stats_partition_spec)

    %{
      id: "repos/get-contributors-stats",
      args: params,
      call: {__MODULE__, :get_contributors_stats},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/stats/contributors",
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
      telemetry: [:github_ex, :repos, :get_contributors_stats],
      timeout: nil,
      pagination: nil
    }
  end

  @get_custom_deployment_protection_rule_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"environment_name", :environment_name},
      {"protection_rule_id", :protection_rule_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a custom deployment protection rule\n\nGets an enabled custom deployment protection rule for an environment. Anyone with read access to the repository can use this endpoint. For more information about environments, see \"[Using environments for deployment](https://docs.github.com/actions/deployment/targeting-different-environments/using-environments-for-deployment).\"\n\nFor more information about the app that is providing this custom deployment rule, see [`GET /apps/{app_slug}`](https://docs.github.com/rest/apps/apps#get-an-app).\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with a private repository."
  @spec get_custom_deployment_protection_rule(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_custom_deployment_protection_rule(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_custom_deployment_protection_rule_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_custom_deployment_protection_rule_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @get_custom_deployment_protection_rule_partition_spec)

    %{
      id: "repos/get-custom-deployment-protection-rule",
      args: params,
      call: {__MODULE__, :get_custom_deployment_protection_rule},
      opts: opts,
      method: :get,
      path_template:
        "/repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules/{protection_rule_id}",
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
      telemetry: [:github_ex, :repos, :get_custom_deployment_protection_rule],
      timeout: nil,
      pagination: nil
    }
  end

  @get_deploy_key_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"key_id", :key_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a deploy key"
  @spec get_deploy_key(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_deploy_key(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_deploy_key_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_deploy_key_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_deploy_key_partition_spec)

    %{
      id: "repos/get-deploy-key",
      args: params,
      call: {__MODULE__, :get_deploy_key},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/keys/{key_id}",
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
      telemetry: [:github_ex, :repos, :get_deploy_key],
      timeout: nil,
      pagination: nil
    }
  end

  @get_deployment_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"deployment_id", :deployment_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a deployment"
  @spec get_deployment(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_deployment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_deployment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_deployment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_deployment_partition_spec)

    %{
      id: "repos/get-deployment",
      args: params,
      call: {__MODULE__, :get_deployment},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/deployments/{deployment_id}",
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
      telemetry: [:github_ex, :repos, :get_deployment],
      timeout: nil,
      pagination: nil
    }
  end

  @get_deployment_branch_policy_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"environment_name", :environment_name},
      {"branch_policy_id", :branch_policy_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a deployment branch policy\n\nGets a deployment branch or tag policy for an environment.\n\nAnyone with read access to the repository can use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with a private repository."
  @spec get_deployment_branch_policy(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_deployment_branch_policy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_deployment_branch_policy_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_deployment_branch_policy_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_deployment_branch_policy_partition_spec)

    %{
      id: "repos/get-deployment-branch-policy",
      args: params,
      call: {__MODULE__, :get_deployment_branch_policy},
      opts: opts,
      method: :get,
      path_template:
        "/repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies/{branch_policy_id}",
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
      telemetry: [:github_ex, :repos, :get_deployment_branch_policy],
      timeout: nil,
      pagination: nil
    }
  end

  @get_deployment_status_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"deployment_id", :deployment_id},
      {"status_id", :status_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a deployment status\n\nUsers with pull access can view a deployment status for a deployment:"
  @spec get_deployment_status(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_deployment_status(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_deployment_status_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_deployment_status_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_deployment_status_partition_spec)

    %{
      id: "repos/get-deployment-status",
      args: params,
      call: {__MODULE__, :get_deployment_status},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/deployments/{deployment_id}/statuses/{status_id}",
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
      telemetry: [:github_ex, :repos, :get_deployment_status],
      timeout: nil,
      pagination: nil
    }
  end

  @get_environment_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"environment_name", :environment_name}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get an environment\n\n> [!NOTE]\n> To get information about name patterns that branches must match in order to deploy to this environment, see \"[Get a deployment branch policy](https://docs.github.com/rest/deployments/branch-policies#get-a-deployment-branch-policy).\"\n\nAnyone with read access to the repository can use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with a private repository."
  @spec get_environment(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_environment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_environment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_environment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_environment_partition_spec)

    %{
      id: "repos/get-environment",
      args: params,
      call: {__MODULE__, :get_environment},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/environments/{environment_name}",
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
      telemetry: [:github_ex, :repos, :get_environment],
      timeout: nil,
      pagination: nil
    }
  end

  @get_latest_pages_build_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get latest Pages build\n\nGets information about the single most recent build of a GitHub Pages site.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_latest_pages_build(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_latest_pages_build(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_latest_pages_build_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_latest_pages_build_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_latest_pages_build_partition_spec)

    %{
      id: "repos/get-latest-pages-build",
      args: params,
      call: {__MODULE__, :get_latest_pages_build},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/pages/builds/latest",
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
      telemetry: [:github_ex, :repos, :get_latest_pages_build],
      timeout: nil,
      pagination: nil
    }
  end

  @get_latest_release_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get the latest release\n\nView the latest published full release for the repository.\n\nThe latest release is the most recent non-prerelease, non-draft release, sorted by the `created_at` attribute. The `created_at` attribute is the date of the commit used for the release, and not the date when the release was drafted or published."
  @spec get_latest_release(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_latest_release(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_latest_release_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_latest_release_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_latest_release_partition_spec)

    %{
      id: "repos/get-latest-release",
      args: params,
      call: {__MODULE__, :get_latest_release},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/releases/latest",
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
      telemetry: [:github_ex, :repos, :get_latest_release],
      timeout: nil,
      pagination: nil
    }
  end

  @get_org_rule_suite_partition_spec %{
    path: [{"org", :org}, {"rule_suite_id", :rule_suite_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get an organization rule suite\n\nGets information about a suite of rule evaluations from within an organization.\nFor more information, see \"[Managing rulesets for repositories in your organization](https://docs.github.com/organizations/managing-organization-settings/managing-rulesets-for-repositories-in-your-organization#viewing-insights-for-rulesets).\""
  @spec get_org_rule_suite(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_org_rule_suite(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_org_rule_suite_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_org_rule_suite_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_org_rule_suite_partition_spec)

    %{
      id: "repos/get-org-rule-suite",
      args: params,
      call: {__MODULE__, :get_org_rule_suite},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/rulesets/rule-suites/{rule_suite_id}",
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
      telemetry: [:github_ex, :repos, :get_org_rule_suite],
      timeout: nil,
      pagination: nil
    }
  end

  @get_org_rule_suites_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"ref", :ref},
      {"repository_name", :repository_name},
      {"time_period", :time_period},
      {"actor_name", :actor_name},
      {"rule_suite_result", :rule_suite_result},
      {"per_page", :per_page},
      {"page", :page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List organization rule suites\n\nLists suites of rule evaluations at the organization level.\nFor more information, see \"[Managing rulesets for repositories in your organization](https://docs.github.com/organizations/managing-organization-settings/managing-rulesets-for-repositories-in-your-organization#viewing-insights-for-rulesets).\""
  @spec get_org_rule_suites(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_org_rule_suites(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_org_rule_suites_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_get_org_rule_suites(term(), map(), keyword()) :: Enumerable.t()
  def stream_get_org_rule_suites(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_get_org_rule_suites_request(client, params, opts) end,
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

  defp build_get_org_rule_suites_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_org_rule_suites_partition_spec)

    %{
      id: "repos/get-org-rule-suites",
      args: params,
      call: {__MODULE__, :get_org_rule_suites},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/rulesets/rule-suites",
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
      telemetry: [:github_ex, :repos, :get_org_rule_suites],
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

  @get_org_ruleset_partition_spec %{
    path: [{"org", :org}, {"ruleset_id", :ruleset_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get an organization repository ruleset\n\nGet a repository ruleset for an organization.\n\n**Note:** To prevent leaking sensitive information, the `bypass_actors` property is only returned if the user\nmaking the API request has write access to the ruleset."
  @spec get_org_ruleset(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_org_ruleset(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_org_ruleset_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_org_ruleset_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_org_ruleset_partition_spec)

    %{
      id: "repos/get-org-ruleset",
      args: params,
      call: {__MODULE__, :get_org_ruleset},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/rulesets/{ruleset_id}",
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
      telemetry: [:github_ex, :repos, :get_org_ruleset],
      timeout: nil,
      pagination: nil
    }
  end

  @get_org_rulesets_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}, {"targets", :targets}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get all organization repository rulesets\n\nGet all the repository rulesets for an organization."
  @spec get_org_rulesets(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_org_rulesets(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_org_rulesets_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_get_org_rulesets(term(), map(), keyword()) :: Enumerable.t()
  def stream_get_org_rulesets(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_get_org_rulesets_request(client, params, opts) end,
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

  defp build_get_org_rulesets_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_org_rulesets_partition_spec)

    %{
      id: "repos/get-org-rulesets",
      args: params,
      call: {__MODULE__, :get_org_rulesets},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/rulesets",
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
      telemetry: [:github_ex, :repos, :get_org_rulesets],
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

  @get_pages_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a GitHub Pages site\n\nGets information about a GitHub Pages site.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_pages(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_pages(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_pages_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_pages_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_pages_partition_spec)

    %{
      id: "repos/get-pages",
      args: params,
      call: {__MODULE__, :get_pages},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/pages",
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
      telemetry: [:github_ex, :repos, :get_pages],
      timeout: nil,
      pagination: nil
    }
  end

  @get_pages_build_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"build_id", :build_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get GitHub Pages build\n\nGets information about a GitHub Pages build.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_pages_build(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_pages_build(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_pages_build_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_pages_build_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_pages_build_partition_spec)

    %{
      id: "repos/get-pages-build",
      args: params,
      call: {__MODULE__, :get_pages_build},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/pages/builds/{build_id}",
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
      telemetry: [:github_ex, :repos, :get_pages_build],
      timeout: nil,
      pagination: nil
    }
  end

  @get_pages_deployment_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"pages_deployment_id", :pages_deployment_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get the status of a GitHub Pages deployment\n\nGets the current status of a GitHub Pages deployment.\n\nThe authenticated user must have read permission for the GitHub Pages site."
  @spec get_pages_deployment(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_pages_deployment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_pages_deployment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_pages_deployment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_pages_deployment_partition_spec)

    %{
      id: "repos/get-pages-deployment",
      args: params,
      call: {__MODULE__, :get_pages_deployment},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/pages/deployments/{pages_deployment_id}",
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
      telemetry: [:github_ex, :repos, :get_pages_deployment],
      timeout: nil,
      pagination: nil
    }
  end

  @get_pages_health_check_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a DNS health check for GitHub Pages\n\nGets a health check of the DNS settings for the `CNAME` record configured for a repository's GitHub Pages.\n\nThe first request to this endpoint returns a `202 Accepted` status and starts an asynchronous background task to get the results for the domain. After the background task completes, subsequent requests to this endpoint return a `200 OK` status with the health check results in the response.\n\nThe authenticated user must be a repository administrator, maintainer, or have the 'manage GitHub Pages settings' permission to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_pages_health_check(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_pages_health_check(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_pages_health_check_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_pages_health_check_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_pages_health_check_partition_spec)

    %{
      id: "repos/get-pages-health-check",
      args: params,
      call: {__MODULE__, :get_pages_health_check},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/pages/health",
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
      telemetry: [:github_ex, :repos, :get_pages_health_check],
      timeout: nil,
      pagination: nil
    }
  end

  @get_participation_stats_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get the weekly commit count\n\nReturns the total commit counts for the `owner` and total commit counts in `all`. `all` is everyone combined, including the `owner` in the last 52 weeks. If you'd like to get the commit counts for non-owners, you can subtract `owner` from `all`.\n\nThe array order is oldest week (index 0) to most recent week.\n\nThe most recent week is seven days ago at UTC midnight to today at UTC midnight."
  @spec get_participation_stats(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_participation_stats(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_participation_stats_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_participation_stats_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_participation_stats_partition_spec)

    %{
      id: "repos/get-participation-stats",
      args: params,
      call: {__MODULE__, :get_participation_stats},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/stats/participation",
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
      telemetry: [:github_ex, :repos, :get_participation_stats],
      timeout: nil,
      pagination: nil
    }
  end

  @get_pull_request_review_protection_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get pull request review protection\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation."
  @spec get_pull_request_review_protection(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_pull_request_review_protection(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_pull_request_review_protection_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_pull_request_review_protection_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @get_pull_request_review_protection_partition_spec)

    %{
      id: "repos/get-pull-request-review-protection",
      args: params,
      call: {__MODULE__, :get_pull_request_review_protection},
      opts: opts,
      method: :get,
      path_template:
        "/repos/{owner}/{repo}/branches/{branch}/protection/required_pull_request_reviews",
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
      telemetry: [:github_ex, :repos, :get_pull_request_review_protection],
      timeout: nil,
      pagination: nil
    }
  end

  @get_punch_card_stats_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get the hourly commit count for each day\n\nEach array contains the day number, hour number, and number of commits:\n\n*   `0-6`: Sunday - Saturday\n*   `0-23`: Hour of day\n*   Number of commits\n\nFor example, `[2, 14, 25]` indicates that there were 25 total commits, during the 2:00pm hour on Tuesdays. All times are based on the time zone of individual commits."
  @spec get_punch_card_stats(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_punch_card_stats(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_punch_card_stats_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_punch_card_stats_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_punch_card_stats_partition_spec)

    %{
      id: "repos/get-punch-card-stats",
      args: params,
      call: {__MODULE__, :get_punch_card_stats},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/stats/punch_card",
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
      telemetry: [:github_ex, :repos, :get_punch_card_stats],
      timeout: nil,
      pagination: nil
    }
  end

  @get_readme_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"ref", :ref}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a repository README\n\nGets the preferred README for a repository.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.raw+json`**: Returns the raw file contents. This is the default if you do not specify a media type.\n- **`application/vnd.github.html+json`**: Returns the README in HTML. Markup languages are rendered to HTML using GitHub's open-source [Markup library](https://github.com/github/markup)."
  @spec get_readme(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_readme(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_readme_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_readme_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_readme_partition_spec)

    %{
      id: "repos/get-readme",
      args: params,
      call: {__MODULE__, :get_readme},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/readme",
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
      telemetry: [:github_ex, :repos, :get_readme],
      timeout: nil,
      pagination: nil
    }
  end

  @get_readme_in_directory_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"dir", :dir}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"ref", :ref}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a repository README for a directory\n\nGets the README from a repository directory.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.raw+json`**: Returns the raw file contents. This is the default if you do not specify a media type.\n- **`application/vnd.github.html+json`**: Returns the README in HTML. Markup languages are rendered to HTML using GitHub's open-source [Markup library](https://github.com/github/markup)."
  @spec get_readme_in_directory(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_readme_in_directory(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_readme_in_directory_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_readme_in_directory_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_readme_in_directory_partition_spec)

    %{
      id: "repos/get-readme-in-directory",
      args: params,
      call: {__MODULE__, :get_readme_in_directory},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/readme/{dir}",
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
      telemetry: [:github_ex, :repos, :get_readme_in_directory],
      timeout: nil,
      pagination: nil
    }
  end

  @get_release_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"release_id", :release_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a release\n\nGets a public release with the specified release ID.\n\n> [!NOTE]\n> This returns an `upload_url` key corresponding to the endpoint for uploading release assets. This key is a hypermedia resource. For more information, see \"[Getting started with the REST API](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#hypermedia).\""
  @spec get_release(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_release(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_release_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_release_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_release_partition_spec)

    %{
      id: "repos/get-release",
      args: params,
      call: {__MODULE__, :get_release},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/releases/{release_id}",
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
      telemetry: [:github_ex, :repos, :get_release],
      timeout: nil,
      pagination: nil
    }
  end

  @get_release_asset_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"asset_id", :asset_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a release asset\n\nTo download the asset's binary content:\n\n- If within a browser, fetch the location specified in the `browser_download_url` key provided in the response.\n- Alternatively, set the `Accept` header of the request to \n  [`application/octet-stream`](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types). \n  The API will either redirect the client to the location, or stream it directly if possible.\n  API clients should handle both a `200` or `302` response."
  @spec get_release_asset(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_release_asset(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_release_asset_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_release_asset_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_release_asset_partition_spec)

    %{
      id: "repos/get-release-asset",
      args: params,
      call: {__MODULE__, :get_release_asset},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/releases/assets/{asset_id}",
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
      telemetry: [:github_ex, :repos, :get_release_asset],
      timeout: nil,
      pagination: nil
    }
  end

  @get_release_by_tag_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"tag", :tag}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a release by tag name\n\nGet a published release with the specified tag."
  @spec get_release_by_tag(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_release_by_tag(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_release_by_tag_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_release_by_tag_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_release_by_tag_partition_spec)

    %{
      id: "repos/get-release-by-tag",
      args: params,
      call: {__MODULE__, :get_release_by_tag},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/releases/tags/{tag}",
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
      telemetry: [:github_ex, :repos, :get_release_by_tag],
      timeout: nil,
      pagination: nil
    }
  end

  @get_repo_rule_suite_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"rule_suite_id", :rule_suite_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a repository rule suite\n\nGets information about a suite of rule evaluations from within a repository.\nFor more information, see \"[Managing rulesets for a repository](https://docs.github.com/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/managing-rulesets-for-a-repository#viewing-insights-for-rulesets).\""
  @spec get_repo_rule_suite(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_repo_rule_suite(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_repo_rule_suite_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_repo_rule_suite_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_repo_rule_suite_partition_spec)

    %{
      id: "repos/get-repo-rule-suite",
      args: params,
      call: {__MODULE__, :get_repo_rule_suite},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/rulesets/rule-suites/{rule_suite_id}",
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
      telemetry: [:github_ex, :repos, :get_repo_rule_suite],
      timeout: nil,
      pagination: nil
    }
  end

  @get_repo_rule_suites_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"ref", :ref},
      {"time_period", :time_period},
      {"actor_name", :actor_name},
      {"rule_suite_result", :rule_suite_result},
      {"per_page", :per_page},
      {"page", :page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List repository rule suites\n\nLists suites of rule evaluations at the repository level.\nFor more information, see \"[Managing rulesets for a repository](https://docs.github.com/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/managing-rulesets-for-a-repository#viewing-insights-for-rulesets).\""
  @spec get_repo_rule_suites(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_repo_rule_suites(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_repo_rule_suites_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_get_repo_rule_suites(term(), map(), keyword()) :: Enumerable.t()
  def stream_get_repo_rule_suites(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_get_repo_rule_suites_request(client, params, opts) end,
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

  defp build_get_repo_rule_suites_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_repo_rule_suites_partition_spec)

    %{
      id: "repos/get-repo-rule-suites",
      args: params,
      call: {__MODULE__, :get_repo_rule_suites},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/rulesets/rule-suites",
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
      telemetry: [:github_ex, :repos, :get_repo_rule_suites],
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

  @get_repo_ruleset_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"ruleset_id", :ruleset_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"includes_parents", :includes_parents}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a repository ruleset\n\nGet a ruleset for a repository.\n\n**Note:** To prevent leaking sensitive information, the `bypass_actors` property is only returned if the user\nmaking the API request has write access to the ruleset."
  @spec get_repo_ruleset(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_repo_ruleset(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_repo_ruleset_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_repo_ruleset_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_repo_ruleset_partition_spec)

    %{
      id: "repos/get-repo-ruleset",
      args: params,
      call: {__MODULE__, :get_repo_ruleset},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/rulesets/{ruleset_id}",
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
      telemetry: [:github_ex, :repos, :get_repo_ruleset],
      timeout: nil,
      pagination: nil
    }
  end

  @get_repo_ruleset_history_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"ruleset_id", :ruleset_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get repository ruleset history\n\nGet the history of a repository ruleset."
  @spec get_repo_ruleset_history(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_repo_ruleset_history(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_repo_ruleset_history_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_get_repo_ruleset_history(term(), map(), keyword()) :: Enumerable.t()
  def stream_get_repo_ruleset_history(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_get_repo_ruleset_history_request(client, params, opts) end,
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

  defp build_get_repo_ruleset_history_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_repo_ruleset_history_partition_spec)

    %{
      id: "repos/get-repo-ruleset-history",
      args: params,
      call: {__MODULE__, :get_repo_ruleset_history},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/rulesets/{ruleset_id}/history",
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
      telemetry: [:github_ex, :repos, :get_repo_ruleset_history],
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

  @get_repo_ruleset_version_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"ruleset_id", :ruleset_id},
      {"version_id", :version_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get repository ruleset version\n\nGet a version of a repository ruleset."
  @spec get_repo_ruleset_version(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_repo_ruleset_version(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_repo_ruleset_version_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_repo_ruleset_version_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_repo_ruleset_version_partition_spec)

    %{
      id: "repos/get-repo-ruleset-version",
      args: params,
      call: {__MODULE__, :get_repo_ruleset_version},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/rulesets/{ruleset_id}/history/{version_id}",
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
      telemetry: [:github_ex, :repos, :get_repo_ruleset_version],
      timeout: nil,
      pagination: nil
    }
  end

  @get_repo_rulesets_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"per_page", :per_page},
      {"page", :page},
      {"includes_parents", :includes_parents},
      {"targets", :targets}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get all repository rulesets\n\nGet all the rulesets for a repository."
  @spec get_repo_rulesets(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_repo_rulesets(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_repo_rulesets_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_get_repo_rulesets(term(), map(), keyword()) :: Enumerable.t()
  def stream_get_repo_rulesets(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_get_repo_rulesets_request(client, params, opts) end,
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

  defp build_get_repo_rulesets_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_repo_rulesets_partition_spec)

    %{
      id: "repos/get-repo-rulesets",
      args: params,
      call: {__MODULE__, :get_repo_rulesets},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/rulesets",
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
      telemetry: [:github_ex, :repos, :get_repo_rulesets],
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

  @get_status_checks_protection_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get status checks protection\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation."
  @spec get_status_checks_protection(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_status_checks_protection(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_status_checks_protection_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_status_checks_protection_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_status_checks_protection_partition_spec)

    %{
      id: "repos/get-status-checks-protection",
      args: params,
      call: {__MODULE__, :get_status_checks_protection},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks",
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
      telemetry: [:github_ex, :repos, :get_status_checks_protection],
      timeout: nil,
      pagination: nil
    }
  end

  @get_teams_with_access_to_protected_branch_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get teams with access to the protected branch\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\nLists the teams who have push access to this branch. The list includes child teams."
  @spec get_teams_with_access_to_protected_branch(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_teams_with_access_to_protected_branch(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_teams_with_access_to_protected_branch_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_teams_with_access_to_protected_branch_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @get_teams_with_access_to_protected_branch_partition_spec)

    %{
      id: "repos/get-teams-with-access-to-protected-branch",
      args: params,
      call: {__MODULE__, :get_teams_with_access_to_protected_branch},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/teams",
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
      telemetry: [:github_ex, :repos, :get_teams_with_access_to_protected_branch],
      timeout: nil,
      pagination: nil
    }
  end

  @get_top_paths_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get top referral paths\n\nGet the top 10 popular contents over the last 14 days."
  @spec get_top_paths(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_top_paths(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_top_paths_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_top_paths_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_top_paths_partition_spec)

    %{
      id: "repos/get-top-paths",
      args: params,
      call: {__MODULE__, :get_top_paths},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/traffic/popular/paths",
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
      telemetry: [:github_ex, :repos, :get_top_paths],
      timeout: nil,
      pagination: nil
    }
  end

  @get_top_referrers_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get top referral sources\n\nGet the top 10 referrers over the last 14 days."
  @spec get_top_referrers(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_top_referrers(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_top_referrers_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_top_referrers_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_top_referrers_partition_spec)

    %{
      id: "repos/get-top-referrers",
      args: params,
      call: {__MODULE__, :get_top_referrers},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/traffic/popular/referrers",
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
      telemetry: [:github_ex, :repos, :get_top_referrers],
      timeout: nil,
      pagination: nil
    }
  end

  @get_users_with_access_to_protected_branch_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get users with access to the protected branch\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\nLists the people who have push access to this branch."
  @spec get_users_with_access_to_protected_branch(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_users_with_access_to_protected_branch(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_users_with_access_to_protected_branch_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_users_with_access_to_protected_branch_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @get_users_with_access_to_protected_branch_partition_spec)

    %{
      id: "repos/get-users-with-access-to-protected-branch",
      args: params,
      call: {__MODULE__, :get_users_with_access_to_protected_branch},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/users",
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
      telemetry: [:github_ex, :repos, :get_users_with_access_to_protected_branch],
      timeout: nil,
      pagination: nil
    }
  end

  @get_views_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per", :per}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get page views\n\nGet the total number of views and breakdown per day or week for the last 14 days. Timestamps are aligned to UTC midnight of the beginning of the day or week. Week begins on Monday."
  @spec get_views(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_views(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_views_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_views_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_views_partition_spec)

    %{
      id: "repos/get-views",
      args: params,
      call: {__MODULE__, :get_views},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/traffic/views",
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
      telemetry: [:github_ex, :repos, :get_views],
      timeout: nil,
      pagination: nil
    }
  end

  @get_webhook_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"hook_id", :hook_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a repository webhook\n\nReturns a webhook configured in a repository. To get only the webhook `config` properties, see \"[Get a webhook configuration for a repository](https://docs.github.com/rest/webhooks/repo-config#get-a-webhook-configuration-for-a-repository).\""
  @spec get_webhook(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_webhook(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_webhook_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_webhook_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_webhook_partition_spec)

    %{
      id: "repos/get-webhook",
      args: params,
      call: {__MODULE__, :get_webhook},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/hooks/{hook_id}",
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
      telemetry: [:github_ex, :repos, :get_webhook],
      timeout: nil,
      pagination: nil
    }
  end

  @get_webhook_config_for_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"hook_id", :hook_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a webhook configuration for a repository\n\nReturns the webhook configuration for a repository. To get more information about the webhook, including the `active` state and `events`, use \"[Get a repository webhook](https://docs.github.com/rest/webhooks/repos#get-a-repository-webhook).\"\n\nOAuth app tokens and personal access tokens (classic) need the `read:repo_hook` or `repo` scope to use this endpoint."
  @spec get_webhook_config_for_repo(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_webhook_config_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_webhook_config_for_repo_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_webhook_config_for_repo_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_webhook_config_for_repo_partition_spec)

    %{
      id: "repos/get-webhook-config-for-repo",
      args: params,
      call: {__MODULE__, :get_webhook_config_for_repo},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/hooks/{hook_id}/config",
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
      telemetry: [:github_ex, :repos, :get_webhook_config_for_repo],
      timeout: nil,
      pagination: nil
    }
  end

  @get_webhook_delivery_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"hook_id", :hook_id},
      {"delivery_id", :delivery_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a delivery for a repository webhook\n\nReturns a delivery for a webhook configured in a repository."
  @spec get_webhook_delivery(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_webhook_delivery(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_webhook_delivery_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_webhook_delivery_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_webhook_delivery_partition_spec)

    %{
      id: "repos/get-webhook-delivery",
      args: params,
      call: {__MODULE__, :get_webhook_delivery},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/hooks/{hook_id}/deliveries/{delivery_id}",
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
      telemetry: [:github_ex, :repos, :get_webhook_delivery],
      timeout: nil,
      pagination: nil
    }
  end

  @list_activities_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"direction", :direction},
      {"per_page", :per_page},
      {"before", :before},
      {"after", :after},
      {"ref", :ref},
      {"actor", :actor},
      {"time_period", :time_period},
      {"activity_type", :activity_type}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List repository activities\n\nLists a detailed history of changes to a repository, such as pushes, merges, force pushes, and branch changes, and associates these changes with commits and users.\n\nFor more information about viewing repository activity,\nsee \"[Viewing activity and data for your repository](https://docs.github.com/repositories/viewing-activity-and-data-for-your-repository).\""
  @spec list_activities(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_activities(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_activities_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_activities(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_activities(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_activities_request(client, params, opts) end,
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

  defp build_list_activities_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_activities_partition_spec)

    %{
      id: "repos/list-activities",
      args: params,
      call: {__MODULE__, :list_activities},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/activity",
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
      telemetry: [:github_ex, :repos, :list_activities],
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

  @list_attestations_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"subject_digest", :subject_digest}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"per_page", :per_page},
      {"before", :before},
      {"after", :after},
      {"predicate_type", :predicate_type}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List attestations\n\nList a collection of artifact attestations with a given subject digest that are associated with a repository.\n\nThe authenticated user making the request must have read access to the repository. In addition, when using a fine-grained access token the `attestations:read` permission is required.\n\n**Please note:** in order to offer meaningful security benefits, an attestation's signature and timestamps **must** be cryptographically verified, and the identity of the attestation signer **must** be validated. Attestations can be verified using the [GitHub CLI `attestation verify` command](https://cli.github.com/manual/gh_attestation_verify). For more information, see [our guide on how to use artifact attestations to establish a build's provenance](https://docs.github.com/actions/security-guides/using-artifact-attestations-to-establish-provenance-for-builds)."
  @spec list_attestations(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_attestations(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_attestations_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_attestations(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_attestations(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_attestations_request(client, params, opts) end,
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

  defp build_list_attestations_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_attestations_partition_spec)

    %{
      id: "repos/list-attestations",
      args: params,
      call: {__MODULE__, :list_attestations},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/attestations/{subject_digest}",
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
      telemetry: [:github_ex, :repos, :list_attestations],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["attestations"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_autolinks_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get all autolinks of a repository\n\nGets all autolinks that are configured for a repository.\n\nInformation about autolinks are only available to repository administrators."
  @spec list_autolinks(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_autolinks(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_autolinks_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_autolinks(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_autolinks(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_autolinks_request(client, params, opts) end,
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

  defp build_list_autolinks_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_autolinks_partition_spec)

    %{
      id: "repos/list-autolinks",
      args: params,
      call: {__MODULE__, :list_autolinks},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/autolinks",
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
      telemetry: [:github_ex, :repos, :list_autolinks],
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

  @list_branches_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"protected", :protected}, {"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List branches"
  @spec list_branches(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_branches(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_branches_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_branches(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_branches(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_branches_request(client, params, opts) end,
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

  defp build_list_branches_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_branches_partition_spec)

    %{
      id: "repos/list-branches",
      args: params,
      call: {__MODULE__, :list_branches},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/branches",
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
      telemetry: [:github_ex, :repos, :list_branches],
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

  @list_branches_for_head_commit_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"commit_sha", :commit_sha}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List branches for HEAD commit\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\nReturns all branches where the given commit SHA is the HEAD, or latest commit for the branch."
  @spec list_branches_for_head_commit(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_branches_for_head_commit(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_branches_for_head_commit_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_branches_for_head_commit(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_branches_for_head_commit(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_branches_for_head_commit_request(client, params, opts) end,
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

  defp build_list_branches_for_head_commit_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_branches_for_head_commit_partition_spec)

    %{
      id: "repos/list-branches-for-head-commit",
      args: params,
      call: {__MODULE__, :list_branches_for_head_commit},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/commits/{commit_sha}/branches-where-head",
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
      telemetry: [:github_ex, :repos, :list_branches_for_head_commit],
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

  @list_collaborators_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"affiliation", :affiliation},
      {"permission", :permission},
      {"per_page", :per_page},
      {"page", :page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List repository collaborators\n\nFor organization-owned repositories, the list of collaborators includes outside collaborators, organization members that are direct collaborators, organization members with access through team memberships, organization members with access through default organization permissions, and organization owners.\nThe `permissions` hash returned in the response contains the base role permissions of the collaborator. The `role_name` is the highest role assigned to the collaborator after considering all sources of grants, including: repo, teams, organization, and enterprise.\nThere is presently not a way to differentiate between an organization level grant and a repository level grant from this endpoint response.\n\nTeam members will include the members of child teams.\n\nThe authenticated user must have write, maintain, or admin privileges on the repository to use this endpoint. For organization-owned repositories, the authenticated user needs to be a member of the organization.\nOAuth app tokens and personal access tokens (classic) need the `read:org` and `repo` scopes to use this endpoint."
  @spec list_collaborators(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_collaborators(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_collaborators_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_collaborators(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_collaborators(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_collaborators_request(client, params, opts) end,
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

  defp build_list_collaborators_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_collaborators_partition_spec)

    %{
      id: "repos/list-collaborators",
      args: params,
      call: {__MODULE__, :list_collaborators},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/collaborators",
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
      telemetry: [:github_ex, :repos, :list_collaborators],
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

  @list_comments_for_commit_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"commit_sha", :commit_sha}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List commit comments\n\nLists the comments for a specified commit.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github-commitcomment.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.\n- **`application/vnd.github-commitcomment.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.\n- **`application/vnd.github-commitcomment.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.\n- **`application/vnd.github-commitcomment.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`."
  @spec list_comments_for_commit(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_comments_for_commit(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_comments_for_commit_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_comments_for_commit(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_comments_for_commit(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_comments_for_commit_request(client, params, opts) end,
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

  defp build_list_comments_for_commit_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_comments_for_commit_partition_spec)

    %{
      id: "repos/list-comments-for-commit",
      args: params,
      call: {__MODULE__, :list_comments_for_commit},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/commits/{commit_sha}/comments",
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
      telemetry: [:github_ex, :repos, :list_comments_for_commit],
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

  @list_commit_comments_for_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List commit comments for a repository\n\nLists the commit comments for a specified repository. Comments are ordered by ascending ID.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github-commitcomment.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.\n- **`application/vnd.github-commitcomment.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.\n- **`application/vnd.github-commitcomment.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.\n- **`application/vnd.github-commitcomment.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`."
  @spec list_commit_comments_for_repo(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_commit_comments_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_commit_comments_for_repo_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_commit_comments_for_repo(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_commit_comments_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_commit_comments_for_repo_request(client, params, opts) end,
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

  defp build_list_commit_comments_for_repo_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_commit_comments_for_repo_partition_spec)

    %{
      id: "repos/list-commit-comments-for-repo",
      args: params,
      call: {__MODULE__, :list_commit_comments_for_repo},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/comments",
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
      telemetry: [:github_ex, :repos, :list_commit_comments_for_repo],
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

  @list_commit_statuses_for_ref_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"ref", :ref}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List commit statuses for a reference\n\nUsers with pull access in a repository can view commit statuses for a given ref. The ref can be a SHA, a branch name, or a tag name. Statuses are returned in reverse chronological order. The first status in the list will be the latest one.\n\nThis resource is also available via a legacy route: `GET /repos/:owner/:repo/statuses/:ref`."
  @spec list_commit_statuses_for_ref(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_commit_statuses_for_ref(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_commit_statuses_for_ref_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_commit_statuses_for_ref(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_commit_statuses_for_ref(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_commit_statuses_for_ref_request(client, params, opts) end,
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

  defp build_list_commit_statuses_for_ref_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_commit_statuses_for_ref_partition_spec)

    %{
      id: "repos/list-commit-statuses-for-ref",
      args: params,
      call: {__MODULE__, :list_commit_statuses_for_ref},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/commits/{ref}/statuses",
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
      telemetry: [:github_ex, :repos, :list_commit_statuses_for_ref],
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

  @list_commits_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"sha", :sha},
      {"path", :path},
      {"author", :author},
      {"committer", :committer},
      {"since", :since},
      {"until", :until},
      {"per_page", :per_page},
      {"page", :page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List commits\n\n**Signature verification object**\n\nThe response will include a `verification` object that describes the result of verifying the commit's signature. The following fields are included in the `verification` object:\n\n| Name | Type | Description |\n| ---- | ---- | ----------- |\n| `verified` | `boolean` | Indicates whether GitHub considers the signature in this commit to be verified. |\n| `reason` | `string` | The reason for verified value. Possible values and their meanings are enumerated in table below. |\n| `signature` | `string` | The signature that was extracted from the commit. |\n| `payload` | `string` | The value that was signed. |\n| `verified_at` | `string` | The date the signature was verified by GitHub. |\n\nThese are the possible values for `reason` in the `verification` object:\n\n| Value | Description |\n| ----- | ----------- |\n| `expired_key` | The key that made the signature is expired. |\n| `not_signing_key` | The \"signing\" flag is not among the usage flags in the GPG key that made the signature. |\n| `gpgverify_error` | There was an error communicating with the signature verification service. |\n| `gpgverify_unavailable` | The signature verification service is currently unavailable. |\n| `unsigned` | The object does not include a signature. |\n| `unknown_signature_type` | A non-PGP signature was found in the commit. |\n| `no_user` | No user was associated with the `committer` email address in the commit. |\n| `unverified_email` | The `committer` email address in the commit was associated with a user, but the email address is not verified on their account. |\n| `bad_email` | The `committer` email address in the commit is not included in the identities of the PGP key that made the signature. |\n| `unknown_key` | The key that made the signature has not been registered with any user's account. |\n| `malformed_signature` | There was an error parsing the signature. |\n| `invalid` | The signature could not be cryptographically verified using the key whose key-id was found in the signature. |\n| `valid` | None of the above errors applied, so the signature is considered to be verified. |"
  @spec list_commits(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_commits(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_commits_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_commits(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_commits(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_commits_request(client, params, opts) end,
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

  defp build_list_commits_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_commits_partition_spec)

    %{
      id: "repos/list-commits",
      args: params,
      call: {__MODULE__, :list_commits},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/commits",
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
      telemetry: [:github_ex, :repos, :list_commits],
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

  @list_contributors_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"anon", :anon}, {"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List repository contributors\n\nLists contributors to the specified repository and sorts them by the number of commits per contributor in descending order. This endpoint may return information that is a few hours old because the GitHub REST API caches contributor data to improve performance.\n\nGitHub identifies contributors by author email address. This endpoint groups contribution counts by GitHub user, which includes all associated email addresses. To improve performance, only the first 500 author email addresses in the repository link to GitHub users. The rest will appear as anonymous contributors without associated GitHub user information."
  @spec list_contributors(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_contributors(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_contributors_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_contributors(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_contributors(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_contributors_request(client, params, opts) end,
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

  defp build_list_contributors_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_contributors_partition_spec)

    %{
      id: "repos/list-contributors",
      args: params,
      call: {__MODULE__, :list_contributors},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/contributors",
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
      telemetry: [:github_ex, :repos, :list_contributors],
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

  @list_custom_deployment_rule_integrations_partition_spec %{
    path: [
      {"environment_name", :environment_name},
      {"repo", :repo},
      {"owner", :owner}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"page", :page}, {"per_page", :per_page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       List custom deployment rule integrations available for an environment

       Gets all custom deployment protection rule integrations that are available for an environment.

       The authenticated user must have admin or owner permissions to the repository to use this endpoint.

       For more information about environments, see "[Using environments for deployment](https://docs.github.com/actions/deployment/targeting-different-environments/using-environments-for-deployment)."

       For more information about the app that is providing this custom deployment rule, see "[GET an app](https://docs.github.com/rest/apps/apps#get-an-app)".

       OAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with a private repository.
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec list_custom_deployment_rule_integrations(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_custom_deployment_rule_integrations(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_custom_deployment_rule_integrations_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_custom_deployment_rule_integrations(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_list_custom_deployment_rule_integrations(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_custom_deployment_rule_integrations_request(client, params, opts) end,
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

  defp build_list_custom_deployment_rule_integrations_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @list_custom_deployment_rule_integrations_partition_spec)

    %{
      id: "repos/list-custom-deployment-rule-integrations",
      args: params,
      call: {__MODULE__, :list_custom_deployment_rule_integrations},
      opts: opts,
      method: :get,
      path_template:
        "/repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules/apps",
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
      telemetry: [:github_ex, :repos, :list_custom_deployment_rule_integrations],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["available_custom_deployment_protection_rule_integrations"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_deploy_keys_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List deploy keys"
  @spec list_deploy_keys(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_deploy_keys(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_deploy_keys_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_deploy_keys(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_deploy_keys(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_deploy_keys_request(client, params, opts) end,
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

  defp build_list_deploy_keys_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_deploy_keys_partition_spec)

    %{
      id: "repos/list-deploy-keys",
      args: params,
      call: {__MODULE__, :list_deploy_keys},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/keys",
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
      telemetry: [:github_ex, :repos, :list_deploy_keys],
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

  @list_deployment_branch_policies_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"environment_name", :environment_name}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List deployment branch policies\n\nLists the deployment branch policies for an environment.\n\nAnyone with read access to the repository can use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with a private repository."
  @spec list_deployment_branch_policies(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_deployment_branch_policies(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_deployment_branch_policies_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_deployment_branch_policies(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_deployment_branch_policies(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_deployment_branch_policies_request(client, params, opts) end,
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

  defp build_list_deployment_branch_policies_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_deployment_branch_policies_partition_spec)

    %{
      id: "repos/list-deployment-branch-policies",
      args: params,
      call: {__MODULE__, :list_deployment_branch_policies},
      opts: opts,
      method: :get,
      path_template:
        "/repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies",
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
      telemetry: [:github_ex, :repos, :list_deployment_branch_policies],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["branch_policies"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_deployment_statuses_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"deployment_id", :deployment_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List deployment statuses\n\nUsers with pull access can view deployment statuses for a deployment:"
  @spec list_deployment_statuses(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_deployment_statuses(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_deployment_statuses_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_deployment_statuses(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_deployment_statuses(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_deployment_statuses_request(client, params, opts) end,
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

  defp build_list_deployment_statuses_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_deployment_statuses_partition_spec)

    %{
      id: "repos/list-deployment-statuses",
      args: params,
      call: {__MODULE__, :list_deployment_statuses},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/deployments/{deployment_id}/statuses",
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
      telemetry: [:github_ex, :repos, :list_deployment_statuses],
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

  @list_deployments_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"sha", :sha},
      {"ref", :ref},
      {"task", :task},
      {"environment", :environment},
      {"per_page", :per_page},
      {"page", :page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List deployments\n\nSimple filtering of deployments is available via query parameters:"
  @spec list_deployments(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_deployments(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_deployments_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_deployments(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_deployments(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_deployments_request(client, params, opts) end,
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

  defp build_list_deployments_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_deployments_partition_spec)

    %{
      id: "repos/list-deployments",
      args: params,
      call: {__MODULE__, :list_deployments},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/deployments",
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
      telemetry: [:github_ex, :repos, :list_deployments],
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

  @list_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"visibility", :visibility},
      {"affiliation", :affiliation},
      {"type", :type},
      {"sort", :sort},
      {"direction", :direction},
      {"per_page", :per_page},
      {"page", :page},
      {"since", :since},
      {"before", :before}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List repositories for the authenticated user\n\nLists repositories that the authenticated user has explicit permission (`:read`, `:write`, or `:admin`) to access.\n\nThe authenticated user has explicit permission to access repositories they own, repositories where they are a collaborator, and repositories that they can access through an organization membership."
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
      id: "repos/list-for-authenticated-user",
      args: params,
      call: {__MODULE__, :list_for_authenticated_user},
      opts: opts,
      method: :get,
      path_template: "/user/repos",
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
      telemetry: [:github_ex, :repos, :list_for_authenticated_user],
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

  @list_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"type", :type},
      {"sort", :sort},
      {"direction", :direction},
      {"per_page", :per_page},
      {"page", :page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List organization repositories\n\nLists repositories for the specified organization.\n\n> [!NOTE]\n> In order to see the `security_and_analysis` block for a repository you must have admin permissions for the repository or be an owner or security manager for the organization that owns the repository. For more information, see \"[Managing security managers in your organization](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/managing-security-managers-in-your-organization).\""
  @spec list_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_for_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_for_org_request(client, params, opts) end,
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

  defp build_list_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_for_org_partition_spec)

    %{
      id: "repos/list-for-org",
      args: params,
      call: {__MODULE__, :list_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/repos",
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
      telemetry: [:github_ex, :repos, :list_for_org],
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

  @list_for_user_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"type", :type},
      {"sort", :sort},
      {"direction", :direction},
      {"per_page", :per_page},
      {"page", :page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List repositories for a user\n\nLists public repositories for the specified user."
  @spec list_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_for_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_for_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_for_user_request(client, params, opts) end,
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

  defp build_list_for_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_for_user_partition_spec)

    %{
      id: "repos/list-for-user",
      args: params,
      call: {__MODULE__, :list_for_user},
      opts: opts,
      method: :get,
      path_template: "/users/{username}/repos",
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
      telemetry: [:github_ex, :repos, :list_for_user],
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

  @list_forks_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"sort", :sort}, {"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List forks"
  @spec list_forks(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_forks(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_forks_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_forks(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_forks(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_forks_request(client, params, opts) end,
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

  defp build_list_forks_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_forks_partition_spec)

    %{
      id: "repos/list-forks",
      args: params,
      call: {__MODULE__, :list_forks},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/forks",
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
      telemetry: [:github_ex, :repos, :list_forks],
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

  @list_invitations_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List repository invitations\n\nWhen authenticating as a user with admin rights to a repository, this endpoint will list all currently open repository invitations."
  @spec list_invitations(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_invitations(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_invitations_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_invitations(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_invitations(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_invitations_request(client, params, opts) end,
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

  defp build_list_invitations_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_invitations_partition_spec)

    %{
      id: "repos/list-invitations",
      args: params,
      call: {__MODULE__, :list_invitations},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/invitations",
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
      telemetry: [:github_ex, :repos, :list_invitations],
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

  @list_invitations_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List repository invitations for the authenticated user\n\nWhen authenticating as a user, this endpoint will list all currently open repository invitations for that user."
  @spec list_invitations_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_invitations_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_invitations_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_invitations_for_authenticated_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_invitations_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_invitations_for_authenticated_user_request(client, params, opts) end,
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

  defp build_list_invitations_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @list_invitations_for_authenticated_user_partition_spec)

    %{
      id: "repos/list-invitations-for-authenticated-user",
      args: params,
      call: {__MODULE__, :list_invitations_for_authenticated_user},
      opts: opts,
      method: :get,
      path_template: "/user/repository_invitations",
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
      telemetry: [:github_ex, :repos, :list_invitations_for_authenticated_user],
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

  @list_languages_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List repository languages\n\nLists languages for the specified repository. The value shown for each language is the number of bytes of code written in that language."
  @spec list_languages(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_languages(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_languages_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_list_languages_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_languages_partition_spec)

    %{
      id: "repos/list-languages",
      args: params,
      call: {__MODULE__, :list_languages},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/languages",
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
      telemetry: [:github_ex, :repos, :list_languages],
      timeout: nil,
      pagination: nil
    }
  end

  @list_pages_builds_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List GitHub Pages builds\n\nLists builts of a GitHub Pages site.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec list_pages_builds(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_pages_builds(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_pages_builds_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_pages_builds(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_pages_builds(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_pages_builds_request(client, params, opts) end,
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

  defp build_list_pages_builds_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_pages_builds_partition_spec)

    %{
      id: "repos/list-pages-builds",
      args: params,
      call: {__MODULE__, :list_pages_builds},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/pages/builds",
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
      telemetry: [:github_ex, :repos, :list_pages_builds],
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

  @list_public_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"since", :since}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List public repositories\n\nLists all public repositories in the order that they were created.\n\nNote:\n- For GitHub Enterprise Server, this endpoint will only list repositories available to all users on the enterprise.\n- Pagination is powered exclusively by the `since` parameter. Use the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers) to get the URL for the next page of repositories."
  @spec list_public(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_public(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_public_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_public(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_public(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_public_request(client, params, opts) end,
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

  defp build_list_public_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_public_partition_spec)

    %{
      id: "repos/list-public",
      args: params,
      call: {__MODULE__, :list_public},
      opts: opts,
      method: :get,
      path_template: "/repositories",
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
      telemetry: [:github_ex, :repos, :list_public],
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

  @list_pull_requests_associated_with_commit_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"commit_sha", :commit_sha}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List pull requests associated with a commit\n\nLists the merged pull request that introduced the commit to the repository. If the commit is not present in the default branch, it will return merged and open pull requests associated with the commit.\n\nTo list the open or merged pull requests associated with a branch, you can set the `commit_sha` parameter to the branch name."
  @spec list_pull_requests_associated_with_commit(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_pull_requests_associated_with_commit(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_pull_requests_associated_with_commit_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_pull_requests_associated_with_commit(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_list_pull_requests_associated_with_commit(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_pull_requests_associated_with_commit_request(client, params, opts) end,
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

  defp build_list_pull_requests_associated_with_commit_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @list_pull_requests_associated_with_commit_partition_spec)

    %{
      id: "repos/list-pull-requests-associated-with-commit",
      args: params,
      call: {__MODULE__, :list_pull_requests_associated_with_commit},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/commits/{commit_sha}/pulls",
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
      telemetry: [:github_ex, :repos, :list_pull_requests_associated_with_commit],
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

  @list_release_assets_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"release_id", :release_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List release assets"
  @spec list_release_assets(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_release_assets(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_release_assets_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_release_assets(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_release_assets(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_release_assets_request(client, params, opts) end,
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

  defp build_list_release_assets_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_release_assets_partition_spec)

    %{
      id: "repos/list-release-assets",
      args: params,
      call: {__MODULE__, :list_release_assets},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/releases/{release_id}/assets",
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
      telemetry: [:github_ex, :repos, :list_release_assets],
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

  @list_releases_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List releases\n\nThis returns a list of releases, which does not include regular Git tags that have not been associated with a release. To get a list of Git tags, use the [Repository Tags API](https://docs.github.com/rest/repos/repos#list-repository-tags).\n\nInformation about published releases are available to everyone. Only users with push access will receive listings for draft releases."
  @spec list_releases(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_releases(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_releases_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_releases(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_releases(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_releases_request(client, params, opts) end,
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

  defp build_list_releases_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_releases_partition_spec)

    %{
      id: "repos/list-releases",
      args: params,
      call: {__MODULE__, :list_releases},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/releases",
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
      telemetry: [:github_ex, :repos, :list_releases],
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

  @list_tags_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List repository tags"
  @spec list_tags(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_tags(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_tags_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_tags(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_tags(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_tags_request(client, params, opts) end,
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

  defp build_list_tags_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_tags_partition_spec)

    %{
      id: "repos/list-tags",
      args: params,
      call: {__MODULE__, :list_tags},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/tags",
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
      telemetry: [:github_ex, :repos, :list_tags],
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

  @list_teams_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List repository teams\n\nLists the teams that have access to the specified repository and that are also visible to the authenticated user.\n\nFor a public repository, a team is listed only if that team added the public repository explicitly.\n\nOAuth app tokens and personal access tokens (classic) need the `public_repo` or `repo` scope to use this endpoint with a public repository, and `repo` scope to use this endpoint with a private repository."
  @spec list_teams(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_teams(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_teams_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_teams(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_teams(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_teams_request(client, params, opts) end,
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

  defp build_list_teams_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_teams_partition_spec)

    %{
      id: "repos/list-teams",
      args: params,
      call: {__MODULE__, :list_teams},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/teams",
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
      telemetry: [:github_ex, :repos, :list_teams],
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

  @list_webhook_deliveries_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"hook_id", :hook_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"cursor", :cursor}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List deliveries for a repository webhook\n\nReturns a list of webhook deliveries for a webhook configured in a repository."
  @spec list_webhook_deliveries(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_webhook_deliveries(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_webhook_deliveries_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_webhook_deliveries(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_webhook_deliveries(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_webhook_deliveries_request(client, params, opts) end,
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

  defp build_list_webhook_deliveries_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_webhook_deliveries_partition_spec)

    %{
      id: "repos/list-webhook-deliveries",
      args: params,
      call: {__MODULE__, :list_webhook_deliveries},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/hooks/{hook_id}/deliveries",
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
      telemetry: [:github_ex, :repos, :list_webhook_deliveries],
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

  @list_webhooks_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List repository webhooks\n\nLists webhooks for a repository. `last response` may return null if there have not been any deliveries within 30 days."
  @spec list_webhooks(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_webhooks(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_webhooks_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_webhooks(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_webhooks(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_webhooks_request(client, params, opts) end,
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

  defp build_list_webhooks_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_webhooks_partition_spec)

    %{
      id: "repos/list-webhooks",
      args: params,
      call: {__MODULE__, :list_webhooks},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/hooks",
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
      telemetry: [:github_ex, :repos, :list_webhooks],
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

  @merge_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Merge a branch"
  @spec merge(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def merge(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_merge_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_merge_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @merge_partition_spec)

    %{
      id: "repos/merge",
      args: params,
      call: {__MODULE__, :merge},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/merges",
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
      telemetry: [:github_ex, :repos, :merge],
      timeout: nil,
      pagination: nil
    }
  end

  @merge_upstream_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Sync a fork branch with the upstream repository\n\nSync a branch of a forked repository to keep it up-to-date with the upstream repository."
  @spec merge_upstream(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def merge_upstream(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_merge_upstream_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_merge_upstream_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @merge_upstream_partition_spec)

    %{
      id: "repos/merge-upstream",
      args: params,
      call: {__MODULE__, :merge_upstream},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/merge-upstream",
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
      telemetry: [:github_ex, :repos, :merge_upstream],
      timeout: nil,
      pagination: nil
    }
  end

  @ping_webhook_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"hook_id", :hook_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Ping a repository webhook\n\nThis will trigger a [ping event](https://docs.github.com/webhooks/#ping-event) to be sent to the hook."
  @spec ping_webhook(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def ping_webhook(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_ping_webhook_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_ping_webhook_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @ping_webhook_partition_spec)

    %{
      id: "repos/ping-webhook",
      args: params,
      call: {__MODULE__, :ping_webhook},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/hooks/{hook_id}/pings",
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
      telemetry: [:github_ex, :repos, :ping_webhook],
      timeout: nil,
      pagination: nil
    }
  end

  @redeliver_webhook_delivery_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"hook_id", :hook_id},
      {"delivery_id", :delivery_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Redeliver a delivery for a repository webhook\n\nRedeliver a webhook delivery for a webhook configured in a repository."
  @spec redeliver_webhook_delivery(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def redeliver_webhook_delivery(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_redeliver_webhook_delivery_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_redeliver_webhook_delivery_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @redeliver_webhook_delivery_partition_spec)

    %{
      id: "repos/redeliver-webhook-delivery",
      args: params,
      call: {__MODULE__, :redeliver_webhook_delivery},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/hooks/{hook_id}/deliveries/{delivery_id}/attempts",
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
      telemetry: [:github_ex, :repos, :redeliver_webhook_delivery],
      timeout: nil,
      pagination: nil
    }
  end

  @remove_app_access_restrictions_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove app access restrictions\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\nRemoves the ability of an app to push to this branch. Only GitHub Apps that are installed on the repository and that have been granted write access to the repository contents can be added as authorized actors on a protected branch."
  @spec remove_app_access_restrictions(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def remove_app_access_restrictions(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_remove_app_access_restrictions_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_remove_app_access_restrictions_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @remove_app_access_restrictions_partition_spec)

    %{
      id: "repos/remove-app-access-restrictions",
      args: params,
      call: {__MODULE__, :remove_app_access_restrictions},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/apps",
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
      telemetry: [:github_ex, :repos, :remove_app_access_restrictions],
      timeout: nil,
      pagination: nil
    }
  end

  @remove_collaborator_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove a repository collaborator\n\nRemoves a collaborator from a repository.\n\nTo use this endpoint, the authenticated user must either be an administrator of the repository or target themselves for removal.\n\nThis endpoint also:\n- Cancels any outstanding invitations sent by the collaborator\n- Unassigns the user from any issues\n- Removes access to organization projects if the user is not an organization member and is not a collaborator on any other organization repositories.\n- Unstars the repository\n- Updates access permissions to packages\n\nRemoving a user as a collaborator has the following effects on forks:\n - If the user had access to a fork through their membership to this repository, the user will also be removed from the fork.\n - If the user had their own fork of the repository, the fork will be deleted.\n - If the user still has read access to the repository, open pull requests by this user from a fork will be denied.\n\n> [!NOTE]\n> A user can still have access to the repository through organization permissions like base repository permissions.\n\nAlthough the API responds immediately, the additional permission updates might take some extra time to complete in the background.\n\nFor more information on fork permissions, see \"[About permissions and visibility of forks](https://docs.github.com/pull-requests/collaborating-with-pull-requests/working-with-forks/about-permissions-and-visibility-of-forks)\"."
  @spec remove_collaborator(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def remove_collaborator(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_remove_collaborator_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_remove_collaborator_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @remove_collaborator_partition_spec)

    %{
      id: "repos/remove-collaborator",
      args: params,
      call: {__MODULE__, :remove_collaborator},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/collaborators/{username}",
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
      telemetry: [:github_ex, :repos, :remove_collaborator],
      timeout: nil,
      pagination: nil
    }
  end

  @remove_status_check_contexts_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove status check contexts\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation."
  @spec remove_status_check_contexts(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def remove_status_check_contexts(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_remove_status_check_contexts_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_remove_status_check_contexts_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @remove_status_check_contexts_partition_spec)

    %{
      id: "repos/remove-status-check-contexts",
      args: params,
      call: {__MODULE__, :remove_status_check_contexts},
      opts: opts,
      method: :delete,
      path_template:
        "/repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks/contexts",
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
      telemetry: [:github_ex, :repos, :remove_status_check_contexts],
      timeout: nil,
      pagination: nil
    }
  end

  @remove_status_check_protection_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove status check protection\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation."
  @spec remove_status_check_protection(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def remove_status_check_protection(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_remove_status_check_protection_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_remove_status_check_protection_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @remove_status_check_protection_partition_spec)

    %{
      id: "repos/remove-status-check-protection",
      args: params,
      call: {__MODULE__, :remove_status_check_protection},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks",
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
      telemetry: [:github_ex, :repos, :remove_status_check_protection],
      timeout: nil,
      pagination: nil
    }
  end

  @remove_team_access_restrictions_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove team access restrictions\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\nRemoves the ability of a team to push to this branch. You can also remove push access for child teams."
  @spec remove_team_access_restrictions(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def remove_team_access_restrictions(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_remove_team_access_restrictions_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_remove_team_access_restrictions_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @remove_team_access_restrictions_partition_spec)

    %{
      id: "repos/remove-team-access-restrictions",
      args: params,
      call: {__MODULE__, :remove_team_access_restrictions},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/teams",
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
      telemetry: [:github_ex, :repos, :remove_team_access_restrictions],
      timeout: nil,
      pagination: nil
    }
  end

  @remove_user_access_restrictions_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove user access restrictions\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\nRemoves the ability of a user to push to this branch.\n\n| Type    | Description                                                                                                                                   |\n| ------- | --------------------------------------------------------------------------------------------------------------------------------------------- |\n| `array` | Usernames of the people who should no longer have push access. **Note**: The list of users, apps, and teams in total is limited to 100 items. |"
  @spec remove_user_access_restrictions(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def remove_user_access_restrictions(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_remove_user_access_restrictions_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_remove_user_access_restrictions_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @remove_user_access_restrictions_partition_spec)

    %{
      id: "repos/remove-user-access-restrictions",
      args: params,
      call: {__MODULE__, :remove_user_access_restrictions},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/users",
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
      telemetry: [:github_ex, :repos, :remove_user_access_restrictions],
      timeout: nil,
      pagination: nil
    }
  end

  @rename_branch_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Rename a branch\n\nRenames a branch in a repository.\n\n> [!NOTE]\n> Although the API responds immediately, the branch rename process might take some extra time to complete in the background. You won't be able to push to the old branch name while the rename process is in progress. For more information, see \"[Renaming a branch](https://docs.github.com/github/administering-a-repository/renaming-a-branch)\".\n\nThe authenticated user must have push access to the branch. If the branch is the default branch, the authenticated user must also have admin or owner permissions.\n\nIn order to rename the default branch, fine-grained access tokens also need the `administration:write` repository permission."
  @spec rename_branch(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def rename_branch(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_rename_branch_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_rename_branch_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @rename_branch_partition_spec)

    %{
      id: "repos/rename-branch",
      args: params,
      call: {__MODULE__, :rename_branch},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/branches/{branch}/rename",
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
      telemetry: [:github_ex, :repos, :rename_branch],
      timeout: nil,
      pagination: nil
    }
  end

  @replace_all_topics_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Replace all repository topics"
  @spec replace_all_topics(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def replace_all_topics(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_replace_all_topics_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_replace_all_topics_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @replace_all_topics_partition_spec)

    %{
      id: "repos/replace-all-topics",
      args: params,
      call: {__MODULE__, :replace_all_topics},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/topics",
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
      telemetry: [:github_ex, :repos, :replace_all_topics],
      timeout: nil,
      pagination: nil
    }
  end

  @request_pages_build_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Request a GitHub Pages build\n\nYou can request that your site be built from the latest revision on the default branch. This has the same effect as pushing a commit to your default branch, but does not require an additional commit. Manually triggering page builds can be helpful when diagnosing build warnings and failures.\n\nBuild requests are limited to one concurrent build per repository and one concurrent build per requester. If you request a build while another is still in progress, the second request will be queued until the first completes."
  @spec request_pages_build(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def request_pages_build(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_request_pages_build_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_request_pages_build_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @request_pages_build_partition_spec)

    %{
      id: "repos/request-pages-build",
      args: params,
      call: {__MODULE__, :request_pages_build},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/pages/builds",
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
      telemetry: [:github_ex, :repos, :request_pages_build],
      timeout: nil,
      pagination: nil
    }
  end

  @set_admin_branch_protection_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set admin branch protection\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\nAdding admin enforcement requires admin or owner permissions to the repository and branch protection to be enabled."
  @spec set_admin_branch_protection(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def set_admin_branch_protection(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_set_admin_branch_protection_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_admin_branch_protection_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @set_admin_branch_protection_partition_spec)

    %{
      id: "repos/set-admin-branch-protection",
      args: params,
      call: {__MODULE__, :set_admin_branch_protection},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/enforce_admins",
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
      telemetry: [:github_ex, :repos, :set_admin_branch_protection],
      timeout: nil,
      pagination: nil
    }
  end

  @set_app_access_restrictions_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set app access restrictions\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\nReplaces the list of apps that have push access to this branch. This removes all apps that previously had push access and grants push access to the new list of apps. Only GitHub Apps that are installed on the repository and that have been granted write access to the repository contents can be added as authorized actors on a protected branch."
  @spec set_app_access_restrictions(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def set_app_access_restrictions(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_set_app_access_restrictions_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_app_access_restrictions_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @set_app_access_restrictions_partition_spec)

    %{
      id: "repos/set-app-access-restrictions",
      args: params,
      call: {__MODULE__, :set_app_access_restrictions},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/apps",
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
      telemetry: [:github_ex, :repos, :set_app_access_restrictions],
      timeout: nil,
      pagination: nil
    }
  end

  @set_status_check_contexts_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set status check contexts\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation."
  @spec set_status_check_contexts(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def set_status_check_contexts(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_set_status_check_contexts_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_status_check_contexts_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @set_status_check_contexts_partition_spec)

    %{
      id: "repos/set-status-check-contexts",
      args: params,
      call: {__MODULE__, :set_status_check_contexts},
      opts: opts,
      method: :put,
      path_template:
        "/repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks/contexts",
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
      telemetry: [:github_ex, :repos, :set_status_check_contexts],
      timeout: nil,
      pagination: nil
    }
  end

  @set_team_access_restrictions_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set team access restrictions\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\nReplaces the list of teams that have push access to this branch. This removes all teams that previously had push access and grants push access to the new list of teams. Team restrictions include child teams."
  @spec set_team_access_restrictions(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def set_team_access_restrictions(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_set_team_access_restrictions_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_team_access_restrictions_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @set_team_access_restrictions_partition_spec)

    %{
      id: "repos/set-team-access-restrictions",
      args: params,
      call: {__MODULE__, :set_team_access_restrictions},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/teams",
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
      telemetry: [:github_ex, :repos, :set_team_access_restrictions],
      timeout: nil,
      pagination: nil
    }
  end

  @set_user_access_restrictions_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set user access restrictions\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\nReplaces the list of people that have push access to this branch. This removes all people that previously had push access and grants push access to the new list of people.\n\n| Type    | Description                                                                                                                   |\n| ------- | ----------------------------------------------------------------------------------------------------------------------------- |\n| `array` | Usernames for people who can have push access. **Note**: The list of users, apps, and teams in total is limited to 100 items. |"
  @spec set_user_access_restrictions(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def set_user_access_restrictions(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_set_user_access_restrictions_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_user_access_restrictions_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @set_user_access_restrictions_partition_spec)

    %{
      id: "repos/set-user-access-restrictions",
      args: params,
      call: {__MODULE__, :set_user_access_restrictions},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/users",
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
      telemetry: [:github_ex, :repos, :set_user_access_restrictions],
      timeout: nil,
      pagination: nil
    }
  end

  @test_push_webhook_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"hook_id", :hook_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Test the push repository webhook\n\nThis will trigger the hook with the latest push to the current repository if the hook is subscribed to `push` events. If the hook is not subscribed to `push` events, the server will respond with 204 but no test POST will be generated.\n\n> [!NOTE]\n> Previously `/repos/:owner/:repo/hooks/:hook_id/test`"
  @spec test_push_webhook(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def test_push_webhook(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_test_push_webhook_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_test_push_webhook_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @test_push_webhook_partition_spec)

    %{
      id: "repos/test-push-webhook",
      args: params,
      call: {__MODULE__, :test_push_webhook},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/hooks/{hook_id}/tests",
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
      telemetry: [:github_ex, :repos, :test_push_webhook],
      timeout: nil,
      pagination: nil
    }
  end

  @transfer_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Transfer a repository\n\nA transfer request will need to be accepted by the new owner when transferring a personal repository to another user. The response will contain the original `owner`, and the transfer will continue asynchronously. For more details on the requirements to transfer personal and organization-owned repositories, see [about repository transfers](https://docs.github.com/articles/about-repository-transfers/)."
  @spec transfer(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def transfer(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_transfer_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_transfer_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @transfer_partition_spec)

    %{
      id: "repos/transfer",
      args: params,
      call: {__MODULE__, :transfer},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/transfer",
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
      telemetry: [:github_ex, :repos, :transfer],
      timeout: nil,
      pagination: nil
    }
  end

  @update_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update a repository\n\n**Note**: To edit a repository's topics, use the [Replace all repository topics](https://docs.github.com/rest/repos/repos#replace-all-repository-topics) endpoint."
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
      id: "repos/update",
      args: params,
      call: {__MODULE__, :update},
      opts: opts,
      method: :patch,
      path_template: "/repos/{owner}/{repo}",
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
      telemetry: [:github_ex, :repos, :update],
      timeout: nil,
      pagination: nil
    }
  end

  @update_branch_protection_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update branch protection\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\nProtecting a branch requires admin or owner permissions to the repository.\n\n> [!NOTE]\n> Passing new arrays of `users` and `teams` replaces their previous values.\n\n> [!NOTE]\n> The list of users, apps, and teams in total is limited to 100 items."
  @spec update_branch_protection(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_branch_protection(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_branch_protection_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_branch_protection_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_branch_protection_partition_spec)

    %{
      id: "repos/update-branch-protection",
      args: params,
      call: {__MODULE__, :update_branch_protection},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection",
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
      telemetry: [:github_ex, :repos, :update_branch_protection],
      timeout: nil,
      pagination: nil
    }
  end

  @update_commit_comment_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update a commit comment\n\nUpdates the contents of a specified commit comment.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github-commitcomment.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.\n- **`application/vnd.github-commitcomment.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.\n- **`application/vnd.github-commitcomment.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.\n- **`application/vnd.github-commitcomment.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`."
  @spec update_commit_comment(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_commit_comment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_commit_comment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_commit_comment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_commit_comment_partition_spec)

    %{
      id: "repos/update-commit-comment",
      args: params,
      call: {__MODULE__, :update_commit_comment},
      opts: opts,
      method: :patch,
      path_template: "/repos/{owner}/{repo}/comments/{comment_id}",
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
      telemetry: [:github_ex, :repos, :update_commit_comment],
      timeout: nil,
      pagination: nil
    }
  end

  @update_deployment_branch_policy_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"environment_name", :environment_name},
      {"branch_policy_id", :branch_policy_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update a deployment branch policy\n\nUpdates a deployment branch or tag policy for an environment.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec update_deployment_branch_policy(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def update_deployment_branch_policy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_deployment_branch_policy_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_deployment_branch_policy_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_deployment_branch_policy_partition_spec)

    %{
      id: "repos/update-deployment-branch-policy",
      args: params,
      call: {__MODULE__, :update_deployment_branch_policy},
      opts: opts,
      method: :put,
      path_template:
        "/repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies/{branch_policy_id}",
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
      telemetry: [:github_ex, :repos, :update_deployment_branch_policy],
      timeout: nil,
      pagination: nil
    }
  end

  @update_information_about_pages_site_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update information about a GitHub Pages site\n\nUpdates information for a GitHub Pages site. For more information, see \"[About GitHub Pages](https://docs.github.com/github/working-with-github-pages/about-github-pages).\n\nThe authenticated user must be a repository administrator, maintainer, or have the 'manage GitHub Pages settings' permission.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec update_information_about_pages_site(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def update_information_about_pages_site(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_information_about_pages_site_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_information_about_pages_site_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @update_information_about_pages_site_partition_spec)

    %{
      id: "repos/update-information-about-pages-site",
      args: params,
      call: {__MODULE__, :update_information_about_pages_site},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/pages",
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
      telemetry: [:github_ex, :repos, :update_information_about_pages_site],
      timeout: nil,
      pagination: nil
    }
  end

  @update_invitation_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"invitation_id", :invitation_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update a repository invitation"
  @spec update_invitation(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_invitation(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_invitation_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_invitation_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_invitation_partition_spec)

    %{
      id: "repos/update-invitation",
      args: params,
      call: {__MODULE__, :update_invitation},
      opts: opts,
      method: :patch,
      path_template: "/repos/{owner}/{repo}/invitations/{invitation_id}",
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
      telemetry: [:github_ex, :repos, :update_invitation],
      timeout: nil,
      pagination: nil
    }
  end

  @update_org_ruleset_partition_spec %{
    path: [{"org", :org}, {"ruleset_id", :ruleset_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update an organization repository ruleset\n\nUpdate a ruleset for an organization."
  @spec update_org_ruleset(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_org_ruleset(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_org_ruleset_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_org_ruleset_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_org_ruleset_partition_spec)

    %{
      id: "repos/update-org-ruleset",
      args: params,
      call: {__MODULE__, :update_org_ruleset},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/rulesets/{ruleset_id}",
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
      telemetry: [:github_ex, :repos, :update_org_ruleset],
      timeout: nil,
      pagination: nil
    }
  end

  @update_pull_request_review_protection_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update pull request review protection\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\nUpdating pull request review enforcement requires admin or owner permissions to the repository and branch protection to be enabled.\n\n> [!NOTE]\n> Passing new arrays of `users` and `teams` replaces their previous values."
  @spec update_pull_request_review_protection(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def update_pull_request_review_protection(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_pull_request_review_protection_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_pull_request_review_protection_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @update_pull_request_review_protection_partition_spec)

    %{
      id: "repos/update-pull-request-review-protection",
      args: params,
      call: {__MODULE__, :update_pull_request_review_protection},
      opts: opts,
      method: :patch,
      path_template:
        "/repos/{owner}/{repo}/branches/{branch}/protection/required_pull_request_reviews",
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
      telemetry: [:github_ex, :repos, :update_pull_request_review_protection],
      timeout: nil,
      pagination: nil
    }
  end

  @update_release_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"release_id", :release_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update a release\n\nUsers with push access to the repository can edit a release."
  @spec update_release(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_release(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_release_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_release_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_release_partition_spec)

    %{
      id: "repos/update-release",
      args: params,
      call: {__MODULE__, :update_release},
      opts: opts,
      method: :patch,
      path_template: "/repos/{owner}/{repo}/releases/{release_id}",
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
      telemetry: [:github_ex, :repos, :update_release],
      timeout: nil,
      pagination: nil
    }
  end

  @update_release_asset_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"asset_id", :asset_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update a release asset\n\nUsers with push access to the repository can edit a release asset."
  @spec update_release_asset(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_release_asset(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_release_asset_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_release_asset_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_release_asset_partition_spec)

    %{
      id: "repos/update-release-asset",
      args: params,
      call: {__MODULE__, :update_release_asset},
      opts: opts,
      method: :patch,
      path_template: "/repos/{owner}/{repo}/releases/assets/{asset_id}",
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
      telemetry: [:github_ex, :repos, :update_release_asset],
      timeout: nil,
      pagination: nil
    }
  end

  @update_repo_ruleset_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"ruleset_id", :ruleset_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update a repository ruleset\n\nUpdate a ruleset for a repository."
  @spec update_repo_ruleset(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_repo_ruleset(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_repo_ruleset_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_repo_ruleset_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_repo_ruleset_partition_spec)

    %{
      id: "repos/update-repo-ruleset",
      args: params,
      call: {__MODULE__, :update_repo_ruleset},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/rulesets/{ruleset_id}",
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
      telemetry: [:github_ex, :repos, :update_repo_ruleset],
      timeout: nil,
      pagination: nil
    }
  end

  @update_status_check_protection_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update status check protection\n\nProtected branches are available in public repositories with GitHub Free and GitHub Free for organizations, and in public and private repositories with GitHub Pro, GitHub Team, GitHub Enterprise Cloud, and GitHub Enterprise Server. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\nUpdating required status checks requires admin or owner permissions to the repository and branch protection to be enabled."
  @spec update_status_check_protection(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def update_status_check_protection(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_status_check_protection_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_status_check_protection_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_status_check_protection_partition_spec)

    %{
      id: "repos/update-status-check-protection",
      args: params,
      call: {__MODULE__, :update_status_check_protection},
      opts: opts,
      method: :patch,
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks",
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
      telemetry: [:github_ex, :repos, :update_status_check_protection],
      timeout: nil,
      pagination: nil
    }
  end

  @update_webhook_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"hook_id", :hook_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update a repository webhook\n\nUpdates a webhook configured in a repository. If you previously had a `secret` set, you must provide the same `secret` or set a new `secret` or the secret will be removed. If you are only updating individual webhook `config` properties, use \"[Update a webhook configuration for a repository](https://docs.github.com/rest/webhooks/repo-config#update-a-webhook-configuration-for-a-repository).\""
  @spec update_webhook(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_webhook(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_webhook_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_webhook_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_webhook_partition_spec)

    %{
      id: "repos/update-webhook",
      args: params,
      call: {__MODULE__, :update_webhook},
      opts: opts,
      method: :patch,
      path_template: "/repos/{owner}/{repo}/hooks/{hook_id}",
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
      telemetry: [:github_ex, :repos, :update_webhook],
      timeout: nil,
      pagination: nil
    }
  end

  @update_webhook_config_for_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"hook_id", :hook_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update a webhook configuration for a repository\n\nUpdates the webhook configuration for a repository. To update more information about the webhook, including the `active` state and `events`, use \"[Update a repository webhook](https://docs.github.com/rest/webhooks/repos#update-a-repository-webhook).\"\n\nOAuth app tokens and personal access tokens (classic) need the `write:repo_hook` or `repo` scope to use this endpoint."
  @spec update_webhook_config_for_repo(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def update_webhook_config_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_webhook_config_for_repo_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_webhook_config_for_repo_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_webhook_config_for_repo_partition_spec)

    %{
      id: "repos/update-webhook-config-for-repo",
      args: params,
      call: {__MODULE__, :update_webhook_config_for_repo},
      opts: opts,
      method: :patch,
      path_template: "/repos/{owner}/{repo}/hooks/{hook_id}/config",
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
      telemetry: [:github_ex, :repos, :update_webhook_config_for_repo],
      timeout: nil,
      pagination: nil
    }
  end

  @upload_release_asset_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"release_id", :release_id}],
    auth: {"auth", :auth},
    body: %{mode: :key, key: {"body", :body}},
    query: [{"name", :name}, {"label", :label}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Upload a release asset\n\nThis endpoint makes use of a [Hypermedia relation](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#hypermedia) to determine which URL to access. The endpoint you call to upload release assets is specific to your release. Use the `upload_url` returned in\nthe response of the [Create a release endpoint](https://docs.github.com/rest/releases/releases#create-a-release) to upload a release asset.\n\nYou need to use an HTTP client which supports [SNI](http://en.wikipedia.org/wiki/Server_Name_Indication) to make calls to this endpoint.\n\nMost libraries will set the required `Content-Length` header automatically. Use the required `Content-Type` header to provide the media type of the asset. For a list of media types, see [Media Types](https://www.iana.org/assignments/media-types/media-types.xhtml). For example: \n\n`application/zip`\n\nGitHub expects the asset data in its raw binary form, rather than JSON. You will send the raw binary content of the asset as the request body. Everything else about the endpoint is the same as the rest of the API. For example,\nyou'll still need to pass your authentication to be able to upload an asset.\n\nWhen an upstream failure occurs, you will receive a `502 Bad Gateway` status. This may leave an empty asset with a state of `starter`. It can be safely deleted.\n\n**Notes:**\n*   GitHub renames asset filenames that have special characters, non-alphanumeric characters, and leading or trailing periods. The \"[List release assets](https://docs.github.com/rest/releases/assets#list-release-assets)\"\nendpoint lists the renamed filenames. For more information and help, contact [GitHub Support](https://support.github.com/contact?tags=dotcom-rest-api).\n*   To find the `release_id` query the [`GET /repos/{owner}/{repo}/releases/latest` endpoint](https://docs.github.com/rest/releases/releases#get-the-latest-release). \n*   If you upload an asset with the same filename as another uploaded asset, you'll receive an error and must delete the old file before you can re-upload the new asset."
  @spec upload_release_asset(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def upload_release_asset(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_upload_release_asset_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_upload_release_asset_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @upload_release_asset_partition_spec)

    %{
      id: "repos/upload-release-asset",
      args: params,
      call: {__MODULE__, :upload_release_asset},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/releases/{release_id}/assets",
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
      telemetry: [:github_ex, :repos, :upload_release_asset],
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

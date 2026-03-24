defmodule GitHubEx.Teams do
  @moduledoc """
  Generated Github Ex operations for teams.
  """

  alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient

  @add_member_legacy_partition_spec %{
    path: [{"team_id", :team_id}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Add team member (Legacy)

       The "Add team member" endpoint (described below) is closing down.

       We recommend using the [Add or update team membership for a user](https://docs.github.com/rest/teams/members#add-or-update-team-membership-for-a-user) endpoint instead. It allows you to invite new organization members to your teams.

       Team synchronization is available for organizations using GitHub Enterprise Cloud. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.

       To add someone to a team, the authenticated user must be an organization owner or a team maintainer in the team they're changing. The person being added to the team must be a member of the team's organization.

       > [!NOTE]
       > When you have team synchronization set up for a team with your organization's identity provider (IdP), you will see an error if you attempt to use the API for making changes to the team's membership. If you have access to manage group membership in your IdP, you can manage GitHub team membership through your identity provider, which automatically adds and removes team members in an organization. For more information, see "[Synchronizing teams between your identity provider and GitHub](https://docs.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/)."

       Note that you'll need to set `Content-Length` to zero when calling out to this endpoint. For more information, see "[HTTP method](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method)."
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec add_member_legacy(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def add_member_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_add_member_legacy_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_member_legacy_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @add_member_legacy_partition_spec)

    %{
      id: "teams/add-member-legacy",
      args: params,
      call: {__MODULE__, :add_member_legacy},
      opts: opts,
      method: :put,
      path_template: "/teams/{team_id}/members/{username}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :add_member_legacy],
      timeout: nil,
      pagination: nil
    }
  end

  @add_or_update_membership_for_user_in_org_partition_spec %{
    path: [{"org", :org}, {"team_slug", :team_slug}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Add or update team membership for a user

       Adds an organization member to a team. An authenticated organization owner or team maintainer can add organization members to a team.

       Team synchronization is available for organizations using GitHub Enterprise Cloud. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.

       > [!NOTE]
       > When you have team synchronization set up for a team with your organization's identity provider (IdP), you will see an error if you attempt to use the API for making changes to the team's membership. If you have access to manage group membership in your IdP, you can manage GitHub team membership through your identity provider, which automatically adds and removes team members in an organization. For more information, see "[Synchronizing teams between your identity provider and GitHub](https://docs.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/)."

       An organization owner can add someone who is not part of the team's organization to a team. When an organization owner adds someone to a team who is not an organization member, this endpoint will send an invitation to the person via email. This newly-created membership will be in the "pending" state until the person accepts the invitation, at which point the membership will transition to the "active" state and the user will be added as a member of the team.

       If the user is already a member of the team, this endpoint will update the role of the team member's role. To update the membership of a team member, the authenticated user must be an organization owner or a team maintainer.

       > [!NOTE]
       > You can also specify a team by `org_id` and `team_id` using the route `PUT /organizations/{org_id}/team/{team_id}/memberships/{username}`.
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec add_or_update_membership_for_user_in_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def add_or_update_membership_for_user_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_add_or_update_membership_for_user_in_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_or_update_membership_for_user_in_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @add_or_update_membership_for_user_in_org_partition_spec)

    %{
      id: "teams/add-or-update-membership-for-user-in-org",
      args: params,
      call: {__MODULE__, :add_or_update_membership_for_user_in_org},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/teams/{team_slug}/memberships/{username}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :add_or_update_membership_for_user_in_org],
      timeout: nil,
      pagination: nil
    }
  end

  @add_or_update_membership_for_user_legacy_partition_spec %{
    path: [{"team_id", :team_id}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Add or update team membership for a user (Legacy)

       > [!WARNING]
       > **Endpoint closing down notice:** This endpoint route is closing down and will be removed from the Teams API. We recommend migrating your existing code to use the new [Add or update team membership for a user](https://docs.github.com/rest/teams/members#add-or-update-team-membership-for-a-user) endpoint.

       Team synchronization is available for organizations using GitHub Enterprise Cloud. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.

       If the user is already a member of the team's organization, this endpoint will add the user to the team. To add a membership between an organization member and a team, the authenticated user must be an organization owner or a team maintainer.

       > [!NOTE]
       > When you have team synchronization set up for a team with your organization's identity provider (IdP), you will see an error if you attempt to use the API for making changes to the team's membership. If you have access to manage group membership in your IdP, you can manage GitHub team membership through your identity provider, which automatically adds and removes team members in an organization. For more information, see "[Synchronizing teams between your identity provider and GitHub](https://docs.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/)."

       If the user is unaffiliated with the team's organization, this endpoint will send an invitation to the user via email. This newly-created membership will be in the "pending" state until the user accepts the invitation, at which point the membership will transition to the "active" state and the user will be added as a member of the team. To add a membership between an unaffiliated user and a team, the authenticated user must be an organization owner.

       If the user is already a member of the team, this endpoint will update the role of the team member's role. To update the membership of a team member, the authenticated user must be an organization owner or a team maintainer.
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec add_or_update_membership_for_user_legacy(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def add_or_update_membership_for_user_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_add_or_update_membership_for_user_legacy_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_or_update_membership_for_user_legacy_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @add_or_update_membership_for_user_legacy_partition_spec)

    %{
      id: "teams/add-or-update-membership-for-user-legacy",
      args: params,
      call: {__MODULE__, :add_or_update_membership_for_user_legacy},
      opts: opts,
      method: :put,
      path_template: "/teams/{team_id}/memberships/{username}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :add_or_update_membership_for_user_legacy],
      timeout: nil,
      pagination: nil
    }
  end

  @add_or_update_repo_permissions_in_org_partition_spec %{
    path: [
      {"org", :org},
      {"team_slug", :team_slug},
      {"owner", :owner},
      {"repo", :repo}
    ],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Add or update team repository permissions

       To add a repository to a team or update the team's permission on a repository, the authenticated user must have admin access to the repository, and must be able to see the team. The repository must be owned by the organization, or a direct fork of a repository owned by the organization. You will get a `422 Unprocessable Entity` status if you attempt to add a repository to a team that is not owned by the organization. Note that, if you choose not to pass any parameters, you'll need to set `Content-Length` to zero when calling out to this endpoint. For more information, see "[HTTP method](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method)."

       > [!NOTE]
       > You can also specify a team by `org_id` and `team_id` using the route `PUT /organizations/{org_id}/team/{team_id}/repos/{owner}/{repo}`.

       For more information about the permission levels, see "[Repository permission levels for an organization](https://docs.github.com/github/setting-up-and-managing-organizations-and-teams/repository-permission-levels-for-an-organization#permission-levels-for-repositories-owned-by-an-organization)".
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec add_or_update_repo_permissions_in_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def add_or_update_repo_permissions_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_add_or_update_repo_permissions_in_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_or_update_repo_permissions_in_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @add_or_update_repo_permissions_in_org_partition_spec)

    %{
      id: "teams/add-or-update-repo-permissions-in-org",
      args: params,
      call: {__MODULE__, :add_or_update_repo_permissions_in_org},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/teams/{team_slug}/repos/{owner}/{repo}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :add_or_update_repo_permissions_in_org],
      timeout: nil,
      pagination: nil
    }
  end

  @add_or_update_repo_permissions_legacy_partition_spec %{
    path: [{"team_id", :team_id}, {"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Add or update team repository permissions (Legacy)

       > [!WARNING]
       > **Endpoint closing down notice:** This endpoint route is closing down and will be removed from the Teams API. We recommend migrating your existing code to use the new "[Add or update team repository permissions](https://docs.github.com/rest/teams/teams#add-or-update-team-repository-permissions)" endpoint.

       To add a repository to a team or update the team's permission on a repository, the authenticated user must have admin access to the repository, and must be able to see the team. The repository must be owned by the organization, or a direct fork of a repository owned by the organization. You will get a `422 Unprocessable Entity` status if you attempt to add a repository to a team that is not owned by the organization.

       Note that, if you choose not to pass any parameters, you'll need to set `Content-Length` to zero when calling out to this endpoint. For more information, see "[HTTP method](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method)."
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec add_or_update_repo_permissions_legacy(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def add_or_update_repo_permissions_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_add_or_update_repo_permissions_legacy_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_or_update_repo_permissions_legacy_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @add_or_update_repo_permissions_legacy_partition_spec)

    %{
      id: "teams/add-or-update-repo-permissions-legacy",
      args: params,
      call: {__MODULE__, :add_or_update_repo_permissions_legacy},
      opts: opts,
      method: :put,
      path_template: "/teams/{team_id}/repos/{owner}/{repo}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :add_or_update_repo_permissions_legacy],
      timeout: nil,
      pagination: nil
    }
  end

  @check_permissions_for_repo_in_org_partition_spec %{
    path: [
      {"org", :org},
      {"team_slug", :team_slug},
      {"owner", :owner},
      {"repo", :repo}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Check team permissions for a repository\n\nChecks whether a team has `admin`, `push`, `maintain`, `triage`, or `pull` permission for a repository. Repositories inherited through a parent team will also be checked.\n\nYou can also get information about the specified repository, including what permissions the team grants on it, by passing the following custom [media type](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types/) via the `application/vnd.github.v3.repository+json` accept header.\n\nIf a team doesn't have permission for the repository, you will receive a `404 Not Found` response status.\n\nIf the repository is private, you must have at least `read` permission for that repository, and your token must have the `repo` or `admin:org` scope. Otherwise, you will receive a `404 Not Found` response status.\n\n> [!NOTE]\n> You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/{org_id}/team/{team_id}/repos/{owner}/{repo}`."
  @spec check_permissions_for_repo_in_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def check_permissions_for_repo_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_check_permissions_for_repo_in_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_check_permissions_for_repo_in_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @check_permissions_for_repo_in_org_partition_spec)

    %{
      id: "teams/check-permissions-for-repo-in-org",
      args: params,
      call: {__MODULE__, :check_permissions_for_repo_in_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/teams/{team_slug}/repos/{owner}/{repo}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :check_permissions_for_repo_in_org],
      timeout: nil,
      pagination: nil
    }
  end

  @check_permissions_for_repo_legacy_partition_spec %{
    path: [{"team_id", :team_id}, {"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Check team permissions for a repository (Legacy)\n\n> [!WARNING]\n> **Endpoint closing down notice:** This endpoint route is closing down and will be removed from the Teams API. We recommend migrating your existing code to use the new [Check team permissions for a repository](https://docs.github.com/rest/teams/teams#check-team-permissions-for-a-repository) endpoint.\n\n> [!NOTE]\n> Repositories inherited through a parent team will also be checked.\n\nYou can also get information about the specified repository, including what permissions the team grants on it, by passing the following custom [media type](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types/) via the `Accept` header:"
  @spec check_permissions_for_repo_legacy(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def check_permissions_for_repo_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_check_permissions_for_repo_legacy_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_check_permissions_for_repo_legacy_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @check_permissions_for_repo_legacy_partition_spec)

    %{
      id: "teams/check-permissions-for-repo-legacy",
      args: params,
      call: {__MODULE__, :check_permissions_for_repo_legacy},
      opts: opts,
      method: :get,
      path_template: "/teams/{team_id}/repos/{owner}/{repo}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :check_permissions_for_repo_legacy],
      timeout: nil,
      pagination: nil
    }
  end

  @create_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Create a team

       To create a team, the authenticated user must be a member or owner of `{org}`. By default, organization members can create teams. Organization owners can limit team creation to organization owners. For more information, see "[Setting team creation permissions](https://docs.github.com/articles/setting-team-creation-permissions-in-your-organization)."

       When you create a new team, you automatically become a team maintainer without explicitly adding yourself to the optional array of `maintainers`. For more information, see "[About teams](https://docs.github.com/github/setting-up-and-managing-organizations-and-teams/about-teams)".
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
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
      id: "teams/create",
      args: params,
      call: {__MODULE__, :create},
      opts: opts,
      method: :post,
      path_template: "/orgs/{org}/teams",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :create],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_in_org_partition_spec %{
    path: [{"org", :org}, {"team_slug", :team_slug}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a team\n\nTo delete a team, the authenticated user must be an organization owner or team maintainer.\n\nIf you are an organization owner, deleting a parent team will delete all of its child teams as well.\n\n> [!NOTE]\n> You can also specify a team by `org_id` and `team_id` using the route `DELETE /organizations/{org_id}/team/{team_id}`."
  @spec delete_in_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_in_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_in_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_in_org_partition_spec)

    %{
      id: "teams/delete-in-org",
      args: params,
      call: {__MODULE__, :delete_in_org},
      opts: opts,
      method: :delete,
      path_template: "/orgs/{org}/teams/{team_slug}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :delete_in_org],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_legacy_partition_spec %{
    path: [{"team_id", :team_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a team (Legacy)\n\n> [!WARNING]\n> **Endpoint closing down notice:** This endpoint route is closing down and will be removed from the Teams API. We recommend migrating your existing code to use the new [Delete a team](https://docs.github.com/rest/teams/teams#delete-a-team) endpoint.\n\nTo delete a team, the authenticated user must be an organization owner or team maintainer.\n\nIf you are an organization owner, deleting a parent team will delete all of its child teams as well."
  @spec delete_legacy(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_legacy_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_legacy_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_legacy_partition_spec)

    %{
      id: "teams/delete-legacy",
      args: params,
      call: {__MODULE__, :delete_legacy},
      opts: opts,
      method: :delete,
      path_template: "/teams/{team_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :delete_legacy],
      timeout: nil,
      pagination: nil
    }
  end

  @get_by_name_partition_spec %{
    path: [{"org", :org}, {"team_slug", :team_slug}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a team by name\n\nGets a team using the team's `slug`. To create the `slug`, GitHub replaces special characters in the `name` string, changes all words to lowercase, and replaces spaces with a `-` separator. For example, `\"My TEam Näme\"` would become `my-team-name`.\n\n> [!NOTE]\n> You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/{org_id}/team/{team_id}`."
  @spec get_by_name(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_by_name(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_by_name_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_by_name_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_by_name_partition_spec)

    %{
      id: "teams/get-by-name",
      args: params,
      call: {__MODULE__, :get_by_name},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/teams/{team_slug}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :get_by_name],
      timeout: nil,
      pagination: nil
    }
  end

  @get_legacy_partition_spec %{
    path: [{"team_id", :team_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a team (Legacy)\n\n> [!WARNING]\n> **Endpoint closing down notice:** This endpoint route is closing down and will be removed from the Teams API. We recommend migrating your existing code to use the [Get a team by name](https://docs.github.com/rest/teams/teams#get-a-team-by-name) endpoint."
  @spec get_legacy(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_legacy_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_legacy_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_legacy_partition_spec)

    %{
      id: "teams/get-legacy",
      args: params,
      call: {__MODULE__, :get_legacy},
      opts: opts,
      method: :get,
      path_template: "/teams/{team_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :get_legacy],
      timeout: nil,
      pagination: nil
    }
  end

  @get_member_legacy_partition_spec %{
    path: [{"team_id", :team_id}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get team member (Legacy)\n\nThe \"Get team member\" endpoint (described below) is closing down.\n\nWe recommend using the [Get team membership for a user](https://docs.github.com/rest/teams/members#get-team-membership-for-a-user) endpoint instead. It allows you to get both active and pending memberships.\n\nTo list members in a team, the team must be visible to the authenticated user."
  @spec get_member_legacy(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_member_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_member_legacy_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_member_legacy_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_member_legacy_partition_spec)

    %{
      id: "teams/get-member-legacy",
      args: params,
      call: {__MODULE__, :get_member_legacy},
      opts: opts,
      method: :get,
      path_template: "/teams/{team_id}/members/{username}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :get_member_legacy],
      timeout: nil,
      pagination: nil
    }
  end

  @get_membership_for_user_in_org_partition_spec %{
    path: [{"org", :org}, {"team_slug", :team_slug}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get team membership for a user\n\nTeam members will include the members of child teams.\n\nTo get a user's membership with a team, the team must be visible to the authenticated user.\n\n> [!NOTE]\n> You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/{org_id}/team/{team_id}/memberships/{username}`.\n\n> [!NOTE]\n> The response contains the `state` of the membership and the member's `role`.\n\nThe `role` for organization owners is set to `maintainer`. For more information about `maintainer` roles, see [Create a team](https://docs.github.com/rest/teams/teams#create-a-team)."
  @spec get_membership_for_user_in_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_membership_for_user_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_membership_for_user_in_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_membership_for_user_in_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_membership_for_user_in_org_partition_spec)

    %{
      id: "teams/get-membership-for-user-in-org",
      args: params,
      call: {__MODULE__, :get_membership_for_user_in_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/teams/{team_slug}/memberships/{username}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :get_membership_for_user_in_org],
      timeout: nil,
      pagination: nil
    }
  end

  @get_membership_for_user_legacy_partition_spec %{
    path: [{"team_id", :team_id}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get team membership for a user (Legacy)\n\n> [!WARNING]\n> **Endpoint closing down notice:** This endpoint route is closing down and will be removed from the Teams API. We recommend migrating your existing code to use the new [Get team membership for a user](https://docs.github.com/rest/teams/members#get-team-membership-for-a-user) endpoint.\n\nTeam members will include the members of child teams.\n\nTo get a user's membership with a team, the team must be visible to the authenticated user.\n\n**Note:**\nThe response contains the `state` of the membership and the member's `role`.\n\nThe `role` for organization owners is set to `maintainer`. For more information about `maintainer` roles, see [Create a team](https://docs.github.com/rest/teams/teams#create-a-team)."
  @spec get_membership_for_user_legacy(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_membership_for_user_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_membership_for_user_legacy_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_membership_for_user_legacy_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_membership_for_user_legacy_partition_spec)

    %{
      id: "teams/get-membership-for-user-legacy",
      args: params,
      call: {__MODULE__, :get_membership_for_user_legacy},
      opts: opts,
      method: :get,
      path_template: "/teams/{team_id}/memberships/{username}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :get_membership_for_user_legacy],
      timeout: nil,
      pagination: nil
    }
  end

  @list_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}, {"team_type", :team_type}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List teams\n\nLists all teams in an organization that are visible to the authenticated user."
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
      id: "teams/list",
      args: params,
      call: {__MODULE__, :list},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/teams",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :list],
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

  @list_child_in_org_partition_spec %{
    path: [{"org", :org}, {"team_slug", :team_slug}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List child teams\n\nLists the child teams of the team specified by `{team_slug}`.\n\n> [!NOTE]\n> You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/{org_id}/team/{team_id}/teams`."
  @spec list_child_in_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_child_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_child_in_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_child_in_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_child_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_child_in_org_request(client, params, opts) end,
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

  defp build_list_child_in_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_child_in_org_partition_spec)

    %{
      id: "teams/list-child-in-org",
      args: params,
      call: {__MODULE__, :list_child_in_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/teams/{team_slug}/teams",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :list_child_in_org],
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

  @list_child_legacy_partition_spec %{
    path: [{"team_id", :team_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List child teams (Legacy)\n\n> [!WARNING]\n> **Endpoint closing down notice:** This endpoint route is closing down and will be removed from the Teams API. We recommend migrating your existing code to use the new [`List child teams`](https://docs.github.com/rest/teams/teams#list-child-teams) endpoint."
  @spec list_child_legacy(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_child_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_child_legacy_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_child_legacy(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_child_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_child_legacy_request(client, params, opts) end,
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

  defp build_list_child_legacy_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_child_legacy_partition_spec)

    %{
      id: "teams/list-child-legacy",
      args: params,
      call: {__MODULE__, :list_child_legacy},
      opts: opts,
      method: :get,
      path_template: "/teams/{team_id}/teams",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :list_child_legacy],
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
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List teams for the authenticated user\n\nList all of the teams across all of the organizations to which the authenticated\nuser belongs.\n\nOAuth app tokens and personal access tokens (classic) need the `user`, `repo`, or `read:org` scope to use this endpoint.\n\nWhen using a fine-grained personal access token, the resource owner of the token must be a single organization, and the response will only include the teams from that organization."
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
      id: "teams/list-for-authenticated-user",
      args: params,
      call: {__MODULE__, :list_for_authenticated_user},
      opts: opts,
      method: :get,
      path_template: "/user/teams",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :list_for_authenticated_user],
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

  @list_members_in_org_partition_spec %{
    path: [{"org", :org}, {"team_slug", :team_slug}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"role", :role}, {"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List team members\n\nTeam members will include the members of child teams.\n\nTo list members in a team, the team must be visible to the authenticated user."
  @spec list_members_in_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_members_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_members_in_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_members_in_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_members_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_members_in_org_request(client, params, opts) end,
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

  defp build_list_members_in_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_members_in_org_partition_spec)

    %{
      id: "teams/list-members-in-org",
      args: params,
      call: {__MODULE__, :list_members_in_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/teams/{team_slug}/members",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :list_members_in_org],
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

  @list_members_legacy_partition_spec %{
    path: [{"team_id", :team_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"role", :role}, {"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List team members (Legacy)\n\n> [!WARNING]\n> **Endpoint closing down notice:** This endpoint route is closing down and will be removed from the Teams API. We recommend migrating your existing code to use the new [`List team members`](https://docs.github.com/rest/teams/members#list-team-members) endpoint.\n\nTeam members will include the members of child teams."
  @spec list_members_legacy(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_members_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_members_legacy_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_members_legacy(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_members_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_members_legacy_request(client, params, opts) end,
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

  defp build_list_members_legacy_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_members_legacy_partition_spec)

    %{
      id: "teams/list-members-legacy",
      args: params,
      call: {__MODULE__, :list_members_legacy},
      opts: opts,
      method: :get,
      path_template: "/teams/{team_id}/members",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :list_members_legacy],
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

  @list_pending_invitations_in_org_partition_spec %{
    path: [{"org", :org}, {"team_slug", :team_slug}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List pending team invitations\n\nThe return hash contains a `role` field which refers to the Organization Invitation role and will be one of the following values: `direct_member`, `admin`, `billing_manager`, `hiring_manager`, or `reinstate`. If the invitee is not a GitHub member, the `login` field in the return hash will be `null`.\n\n> [!NOTE]\n> You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/{org_id}/team/{team_id}/invitations`."
  @spec list_pending_invitations_in_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_pending_invitations_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_pending_invitations_in_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_pending_invitations_in_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_pending_invitations_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_pending_invitations_in_org_request(client, params, opts) end,
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

  defp build_list_pending_invitations_in_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_pending_invitations_in_org_partition_spec)

    %{
      id: "teams/list-pending-invitations-in-org",
      args: params,
      call: {__MODULE__, :list_pending_invitations_in_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/teams/{team_slug}/invitations",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :list_pending_invitations_in_org],
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

  @list_pending_invitations_legacy_partition_spec %{
    path: [{"team_id", :team_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List pending team invitations (Legacy)\n\n> [!WARNING]\n> **Endpoint closing down notice:** This endpoint route is closing down and will be removed from the Teams API. We recommend migrating your existing code to use the new [`List pending team invitations`](https://docs.github.com/rest/teams/members#list-pending-team-invitations) endpoint.\n\nThe return hash contains a `role` field which refers to the Organization Invitation role and will be one of the following values: `direct_member`, `admin`, `billing_manager`, `hiring_manager`, or `reinstate`. If the invitee is not a GitHub member, the `login` field in the return hash will be `null`."
  @spec list_pending_invitations_legacy(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_pending_invitations_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_pending_invitations_legacy_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_pending_invitations_legacy(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_pending_invitations_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_pending_invitations_legacy_request(client, params, opts) end,
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

  defp build_list_pending_invitations_legacy_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_pending_invitations_legacy_partition_spec)

    %{
      id: "teams/list-pending-invitations-legacy",
      args: params,
      call: {__MODULE__, :list_pending_invitations_legacy},
      opts: opts,
      method: :get,
      path_template: "/teams/{team_id}/invitations",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :list_pending_invitations_legacy],
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

  @list_repos_in_org_partition_spec %{
    path: [{"org", :org}, {"team_slug", :team_slug}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List team repositories\n\nLists a team's repositories visible to the authenticated user.\n\n> [!NOTE]\n> You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/{org_id}/team/{team_id}/repos`."
  @spec list_repos_in_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_repos_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_repos_in_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_repos_in_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_repos_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_repos_in_org_request(client, params, opts) end,
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

  defp build_list_repos_in_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_repos_in_org_partition_spec)

    %{
      id: "teams/list-repos-in-org",
      args: params,
      call: {__MODULE__, :list_repos_in_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/teams/{team_slug}/repos",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :list_repos_in_org],
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

  @list_repos_legacy_partition_spec %{
    path: [{"team_id", :team_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List team repositories (Legacy)\n\n> [!WARNING]\n> **Endpoint closing down notice:** This endpoint route is closing down and will be removed from the Teams API. We recommend migrating your existing code to use the new [List team repositories](https://docs.github.com/rest/teams/teams#list-team-repositories) endpoint."
  @spec list_repos_legacy(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_repos_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_repos_legacy_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_repos_legacy(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_repos_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_repos_legacy_request(client, params, opts) end,
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

  defp build_list_repos_legacy_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_repos_legacy_partition_spec)

    %{
      id: "teams/list-repos-legacy",
      args: params,
      call: {__MODULE__, :list_repos_legacy},
      opts: opts,
      method: :get,
      path_template: "/teams/{team_id}/repos",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :list_repos_legacy],
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

  @remove_member_legacy_partition_spec %{
    path: [{"team_id", :team_id}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Remove team member (Legacy)

       The "Remove team member" endpoint (described below) is closing down.

       We recommend using the [Remove team membership for a user](https://docs.github.com/rest/teams/members#remove-team-membership-for-a-user) endpoint instead. It allows you to remove both active and pending memberships.

       Team synchronization is available for organizations using GitHub Enterprise Cloud. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.

       To remove a team member, the authenticated user must have 'admin' permissions to the team or be an owner of the org that the team is associated with. Removing a team member does not delete the user, it just removes them from the team.

       > [!NOTE]
       > When you have team synchronization set up for a team with your organization's identity provider (IdP), you will see an error if you attempt to use the API for making changes to the team's membership. If you have access to manage group membership in your IdP, you can manage GitHub team membership through your identity provider, which automatically adds and removes team members in an organization. For more information, see "[Synchronizing teams between your identity provider and GitHub](https://docs.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/)."
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec remove_member_legacy(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def remove_member_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_remove_member_legacy_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_remove_member_legacy_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @remove_member_legacy_partition_spec)

    %{
      id: "teams/remove-member-legacy",
      args: params,
      call: {__MODULE__, :remove_member_legacy},
      opts: opts,
      method: :delete,
      path_template: "/teams/{team_id}/members/{username}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :remove_member_legacy],
      timeout: nil,
      pagination: nil
    }
  end

  @remove_membership_for_user_in_org_partition_spec %{
    path: [{"org", :org}, {"team_slug", :team_slug}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove team membership for a user\n\nTo remove a membership between a user and a team, the authenticated user must have 'admin' permissions to the team or be an owner of the organization that the team is associated with. Removing team membership does not delete the user, it just removes their membership from the team.\n\nTeam synchronization is available for organizations using GitHub Enterprise Cloud. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\n> [!NOTE]\n> When you have team synchronization set up for a team with your organization's identity provider (IdP), you will see an error if you attempt to use the API for making changes to the team's membership. If you have access to manage group membership in your IdP, you can manage GitHub team membership through your identity provider, which automatically adds and removes team members in an organization. For more information, see \"[Synchronizing teams between your identity provider and GitHub](https://docs.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/).\"\n\n> [!NOTE]\n> You can also specify a team by `org_id` and `team_id` using the route `DELETE /organizations/{org_id}/team/{team_id}/memberships/{username}`."
  @spec remove_membership_for_user_in_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def remove_membership_for_user_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_remove_membership_for_user_in_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_remove_membership_for_user_in_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @remove_membership_for_user_in_org_partition_spec)

    %{
      id: "teams/remove-membership-for-user-in-org",
      args: params,
      call: {__MODULE__, :remove_membership_for_user_in_org},
      opts: opts,
      method: :delete,
      path_template: "/orgs/{org}/teams/{team_slug}/memberships/{username}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :remove_membership_for_user_in_org],
      timeout: nil,
      pagination: nil
    }
  end

  @remove_membership_for_user_legacy_partition_spec %{
    path: [{"team_id", :team_id}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove team membership for a user (Legacy)\n\n> [!WARNING]\n> **Endpoint closing down notice:** This endpoint route is closing down and will be removed from the Teams API. We recommend migrating your existing code to use the new [Remove team membership for a user](https://docs.github.com/rest/teams/members#remove-team-membership-for-a-user) endpoint.\n\nTeam synchronization is available for organizations using GitHub Enterprise Cloud. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\nTo remove a membership between a user and a team, the authenticated user must have 'admin' permissions to the team or be an owner of the organization that the team is associated with. Removing team membership does not delete the user, it just removes their membership from the team.\n\n> [!NOTE]\n> When you have team synchronization set up for a team with your organization's identity provider (IdP), you will see an error if you attempt to use the API for making changes to the team's membership. If you have access to manage group membership in your IdP, you can manage GitHub team membership through your identity provider, which automatically adds and removes team members in an organization. For more information, see \"[Synchronizing teams between your identity provider and GitHub](https://docs.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/).\""
  @spec remove_membership_for_user_legacy(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def remove_membership_for_user_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_remove_membership_for_user_legacy_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_remove_membership_for_user_legacy_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @remove_membership_for_user_legacy_partition_spec)

    %{
      id: "teams/remove-membership-for-user-legacy",
      args: params,
      call: {__MODULE__, :remove_membership_for_user_legacy},
      opts: opts,
      method: :delete,
      path_template: "/teams/{team_id}/memberships/{username}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :remove_membership_for_user_legacy],
      timeout: nil,
      pagination: nil
    }
  end

  @remove_repo_in_org_partition_spec %{
    path: [
      {"org", :org},
      {"team_slug", :team_slug},
      {"owner", :owner},
      {"repo", :repo}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove a repository from a team\n\nIf the authenticated user is an organization owner or a team maintainer, they can remove any repositories from the team. To remove a repository from a team as an organization member, the authenticated user must have admin access to the repository and must be able to see the team. This does not delete the repository, it just removes it from the team.\n\n> [!NOTE]\n> You can also specify a team by `org_id` and `team_id` using the route `DELETE /organizations/{org_id}/team/{team_id}/repos/{owner}/{repo}`."
  @spec remove_repo_in_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def remove_repo_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_remove_repo_in_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_remove_repo_in_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @remove_repo_in_org_partition_spec)

    %{
      id: "teams/remove-repo-in-org",
      args: params,
      call: {__MODULE__, :remove_repo_in_org},
      opts: opts,
      method: :delete,
      path_template: "/orgs/{org}/teams/{team_slug}/repos/{owner}/{repo}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :remove_repo_in_org],
      timeout: nil,
      pagination: nil
    }
  end

  @remove_repo_legacy_partition_spec %{
    path: [{"team_id", :team_id}, {"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove a repository from a team (Legacy)\n\n> [!WARNING]\n> **Endpoint closing down notice:** This endpoint route is closing down and will be removed from the Teams API. We recommend migrating your existing code to use the new [Remove a repository from a team](https://docs.github.com/rest/teams/teams#remove-a-repository-from-a-team) endpoint.\n\nIf the authenticated user is an organization owner or a team maintainer, they can remove any repositories from the team. To remove a repository from a team as an organization member, the authenticated user must have admin access to the repository and must be able to see the team. NOTE: This does not delete the repository, it just removes it from the team."
  @spec remove_repo_legacy(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def remove_repo_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_remove_repo_legacy_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_remove_repo_legacy_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @remove_repo_legacy_partition_spec)

    %{
      id: "teams/remove-repo-legacy",
      args: params,
      call: {__MODULE__, :remove_repo_legacy},
      opts: opts,
      method: :delete,
      path_template: "/teams/{team_id}/repos/{owner}/{repo}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :remove_repo_legacy],
      timeout: nil,
      pagination: nil
    }
  end

  @update_in_org_partition_spec %{
    path: [{"org", :org}, {"team_slug", :team_slug}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update a team\n\nTo edit a team, the authenticated user must either be an organization owner or a team maintainer.\n\n> [!NOTE]\n> You can also specify a team by `org_id` and `team_id` using the route `PATCH /organizations/{org_id}/team/{team_id}`."
  @spec update_in_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_in_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_in_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_in_org_partition_spec)

    %{
      id: "teams/update-in-org",
      args: params,
      call: {__MODULE__, :update_in_org},
      opts: opts,
      method: :patch,
      path_template: "/orgs/{org}/teams/{team_slug}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :update_in_org],
      timeout: nil,
      pagination: nil
    }
  end

  @update_legacy_partition_spec %{
    path: [{"team_id", :team_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update a team (Legacy)\n\n> [!WARNING]\n> **Endpoint closing down notice:** This endpoint route is closing down and will be removed from the Teams API. We recommend migrating your existing code to use the new [Update a team](https://docs.github.com/rest/teams/teams#update-a-team) endpoint.\n\nTo edit a team, the authenticated user must either be an organization owner or a team maintainer.\n\n> [!NOTE]\n> With nested teams, the `privacy` for parent teams cannot be `secret`."
  @spec update_legacy(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_legacy_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_legacy_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_legacy_partition_spec)

    %{
      id: "teams/update-legacy",
      args: params,
      call: {__MODULE__, :update_legacy},
      opts: opts,
      method: :patch,
      path_template: "/teams/{team_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
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
      telemetry: [:github_ex, :teams, :update_legacy],
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

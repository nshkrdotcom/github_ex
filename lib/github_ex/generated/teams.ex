defmodule GitHubEx.Teams do
  @moduledoc """
  Generated Github Ex operations for teams.
  """

  @add_member_legacy_partition_spec %{
    path: [{"team_id", :team_id}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Add team member (Legacy)\n\nThe \"Add team member\" endpoint (described below) is closing down.\n\nWe recommend using the [Add or update team membership for a user](https://docs.github.com/rest/teams/members#add-or-update-team-membership-for-a-user) endpoint instead. It allows you to invite new organization members to your teams.\n\nTeam synchronization is available for organizations using GitHub Enterprise Cloud. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\nTo add someone to a team, the authenticated user must be an organization owner or a team maintainer in the team they're changing. The person being added to the team must be a member of the team's organization.\n\n> [!NOTE]\n> When you have team synchronization set up for a team with your organization's identity provider (IdP), you will see an error if you attempt to use the API for making changes to the team's membership. If you have access to manage group membership in your IdP, you can manage GitHub team membership through your identity provider, which automatically adds and removes team members in an organization. For more information, see \"[Synchronizing teams between your identity provider and GitHub](https://docs.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/).\"\n\nNote that you'll need to set `Content-Length` to zero when calling out to this endpoint. For more information, see \"[HTTP method](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method).\""
  @spec add_member_legacy(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def add_member_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_add_member_legacy_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_add_member_legacy_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @add_member_legacy_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/add-member-legacy",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :teams, :add_member_legacy],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @add_or_update_membership_for_user_in_org_partition_spec %{
    path: [{"org", :org}, {"team_slug", :team_slug}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Add or update team membership for a user\n\nAdds an organization member to a team. An authenticated organization owner or team maintainer can add organization members to a team.\n\nTeam synchronization is available for organizations using GitHub Enterprise Cloud. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\n> [!NOTE]\n> When you have team synchronization set up for a team with your organization's identity provider (IdP), you will see an error if you attempt to use the API for making changes to the team's membership. If you have access to manage group membership in your IdP, you can manage GitHub team membership through your identity provider, which automatically adds and removes team members in an organization. For more information, see \"[Synchronizing teams between your identity provider and GitHub](https://docs.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/).\"\n\nAn organization owner can add someone who is not part of the team's organization to a team. When an organization owner adds someone to a team who is not an organization member, this endpoint will send an invitation to the person via email. This newly-created membership will be in the \"pending\" state until the person accepts the invitation, at which point the membership will transition to the \"active\" state and the user will be added as a member of the team.\n\nIf the user is already a member of the team, this endpoint will update the role of the team member's role. To update the membership of a team member, the authenticated user must be an organization owner or a team maintainer.\n\n> [!NOTE]\n> You can also specify a team by `org_id` and `team_id` using the route `PUT /organizations/{org_id}/team/{team_id}/memberships/{username}`."
  @spec add_or_update_membership_for_user_in_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def add_or_update_membership_for_user_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_add_or_update_membership_for_user_in_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_add_or_update_membership_for_user_in_org_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @add_or_update_membership_for_user_in_org_partition_spec
      )

    Pristine.Operation.new(%{
      id: "teams/add-or-update-membership-for-user-in-org",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :teams, :add_or_update_membership_for_user_in_org],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @add_or_update_membership_for_user_legacy_partition_spec %{
    path: [{"team_id", :team_id}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Add or update team membership for a user (Legacy)\n\n> [!WARNING]\n> **Endpoint closing down notice:** This endpoint route is closing down and will be removed from the Teams API. We recommend migrating your existing code to use the new [Add or update team membership for a user](https://docs.github.com/rest/teams/members#add-or-update-team-membership-for-a-user) endpoint.\n\nTeam synchronization is available for organizations using GitHub Enterprise Cloud. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\nIf the user is already a member of the team's organization, this endpoint will add the user to the team. To add a membership between an organization member and a team, the authenticated user must be an organization owner or a team maintainer.\n\n> [!NOTE]\n> When you have team synchronization set up for a team with your organization's identity provider (IdP), you will see an error if you attempt to use the API for making changes to the team's membership. If you have access to manage group membership in your IdP, you can manage GitHub team membership through your identity provider, which automatically adds and removes team members in an organization. For more information, see \"[Synchronizing teams between your identity provider and GitHub](https://docs.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/).\"\n\nIf the user is unaffiliated with the team's organization, this endpoint will send an invitation to the user via email. This newly-created membership will be in the \"pending\" state until the user accepts the invitation, at which point the membership will transition to the \"active\" state and the user will be added as a member of the team. To add a membership between an unaffiliated user and a team, the authenticated user must be an organization owner.\n\nIf the user is already a member of the team, this endpoint will update the role of the team member's role. To update the membership of a team member, the authenticated user must be an organization owner or a team maintainer."
  @spec add_or_update_membership_for_user_legacy(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def add_or_update_membership_for_user_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_add_or_update_membership_for_user_legacy_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_add_or_update_membership_for_user_legacy_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @add_or_update_membership_for_user_legacy_partition_spec
      )

    Pristine.Operation.new(%{
      id: "teams/add-or-update-membership-for-user-legacy",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :teams, :add_or_update_membership_for_user_legacy],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Add or update team repository permissions\n\nTo add a repository to a team or update the team's permission on a repository, the authenticated user must have admin access to the repository, and must be able to see the team. The repository must be owned by the organization, or a direct fork of a repository owned by the organization. You will get a `422 Unprocessable Entity` status if you attempt to add a repository to a team that is not owned by the organization. Note that, if you choose not to pass any parameters, you'll need to set `Content-Length` to zero when calling out to this endpoint. For more information, see \"[HTTP method](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method).\"\n\n> [!NOTE]\n> You can also specify a team by `org_id` and `team_id` using the route `PUT /organizations/{org_id}/team/{team_id}/repos/{owner}/{repo}`.\n\nFor more information about the permission levels, see \"[Repository permission levels for an organization](https://docs.github.com/github/setting-up-and-managing-organizations-and-teams/repository-permission-levels-for-an-organization#permission-levels-for-repositories-owned-by-an-organization)\"."
  @spec add_or_update_repo_permissions_in_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def add_or_update_repo_permissions_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_add_or_update_repo_permissions_in_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_add_or_update_repo_permissions_in_org_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @add_or_update_repo_permissions_in_org_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/add-or-update-repo-permissions-in-org",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :teams, :add_or_update_repo_permissions_in_org],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @add_or_update_repo_permissions_legacy_partition_spec %{
    path: [{"team_id", :team_id}, {"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Add or update team repository permissions (Legacy)\n\n> [!WARNING]\n> **Endpoint closing down notice:** This endpoint route is closing down and will be removed from the Teams API. We recommend migrating your existing code to use the new \"[Add or update team repository permissions](https://docs.github.com/rest/teams/teams#add-or-update-team-repository-permissions)\" endpoint.\n\nTo add a repository to a team or update the team's permission on a repository, the authenticated user must have admin access to the repository, and must be able to see the team. The repository must be owned by the organization, or a direct fork of a repository owned by the organization. You will get a `422 Unprocessable Entity` status if you attempt to add a repository to a team that is not owned by the organization.\n\nNote that, if you choose not to pass any parameters, you'll need to set `Content-Length` to zero when calling out to this endpoint. For more information, see \"[HTTP method](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method).\""
  @spec add_or_update_repo_permissions_legacy(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def add_or_update_repo_permissions_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_add_or_update_repo_permissions_legacy_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_add_or_update_repo_permissions_legacy_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @add_or_update_repo_permissions_legacy_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/add-or-update-repo-permissions-legacy",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :teams, :add_or_update_repo_permissions_legacy],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Check team permissions for a repository\n\nChecks whether a team has `admin`, `push`, `maintain`, `triage`, or `pull` permission for a repository. Repositories inherited through a parent team will also be checked.\n\nYou can also get information about the specified repository, including what permissions the team grants on it, by passing the following custom [media type](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types/) via the `application/vnd.github.v3.repository+json` accept header.\n\nIf a team doesn't have permission for the repository, you will receive a `404 Not Found` response status.\n\nIf the repository is private, you must have at least `read` permission for that repository, and your token must have the `repo` or `admin:org` scope. Otherwise, you will receive a `404 Not Found` response status.\n\n> [!NOTE]\n> You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/{org_id}/team/{team_id}/repos/{owner}/{repo}`."
  @spec check_permissions_for_repo_in_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def check_permissions_for_repo_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_check_permissions_for_repo_in_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_check_permissions_for_repo_in_org_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @check_permissions_for_repo_in_org_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/check-permissions-for-repo-in-org",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :teams, :check_permissions_for_repo_in_org],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @check_permissions_for_repo_legacy_partition_spec %{
    path: [{"team_id", :team_id}, {"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Check team permissions for a repository (Legacy)\n\n> [!WARNING]\n> **Endpoint closing down notice:** This endpoint route is closing down and will be removed from the Teams API. We recommend migrating your existing code to use the new [Check team permissions for a repository](https://docs.github.com/rest/teams/teams#check-team-permissions-for-a-repository) endpoint.\n\n> [!NOTE]\n> Repositories inherited through a parent team will also be checked.\n\nYou can also get information about the specified repository, including what permissions the team grants on it, by passing the following custom [media type](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types/) via the `Accept` header:"
  @spec check_permissions_for_repo_legacy(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def check_permissions_for_repo_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_check_permissions_for_repo_legacy_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_check_permissions_for_repo_legacy_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @check_permissions_for_repo_legacy_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/check-permissions-for-repo-legacy",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :teams, :check_permissions_for_repo_legacy],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @create_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Create a team\n\nTo create a team, the authenticated user must be a member or owner of `{org}`. By default, organization members can create teams. Organization owners can limit team creation to organization owners. For more information, see \"[Setting team creation permissions](https://docs.github.com/articles/setting-team-creation-permissions-in-your-organization).\"\n\nWhen you create a new team, you automatically become a team maintainer without explicitly adding yourself to the optional array of `maintainers`. For more information, see \"[About teams](https://docs.github.com/github/setting-up-and-managing-organizations-and-teams/about-teams)\"."
  @spec create(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_create_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_create_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @create_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/create",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :teams, :create],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_in_org_partition_spec %{
    path: [{"org", :org}, {"team_slug", :team_slug}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Delete a team\n\nTo delete a team, the authenticated user must be an organization owner or team maintainer.\n\nIf you are an organization owner, deleting a parent team will delete all of its child teams as well.\n\n> [!NOTE]\n> You can also specify a team by `org_id` and `team_id` using the route `DELETE /organizations/{org_id}/team/{team_id}`."
  @spec delete_in_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_delete_in_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_delete_in_org_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_in_org_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/delete-in-org",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :teams, :delete_in_org],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_legacy_partition_spec %{
    path: [{"team_id", :team_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Delete a team (Legacy)\n\n> [!WARNING]\n> **Endpoint closing down notice:** This endpoint route is closing down and will be removed from the Teams API. We recommend migrating your existing code to use the new [Delete a team](https://docs.github.com/rest/teams/teams#delete-a-team) endpoint.\n\nTo delete a team, the authenticated user must be an organization owner or team maintainer.\n\nIf you are an organization owner, deleting a parent team will delete all of its child teams as well."
  @spec delete_legacy(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_delete_legacy_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_delete_legacy_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_legacy_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/delete-legacy",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :teams, :delete_legacy],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_by_name_partition_spec %{
    path: [{"org", :org}, {"team_slug", :team_slug}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get a team by name\n\nGets a team using the team's `slug`. To create the `slug`, GitHub replaces special characters in the `name` string, changes all words to lowercase, and replaces spaces with a `-` separator. For example, `\"My TEam Näme\"` would become `my-team-name`.\n\n> [!NOTE]\n> You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/{org_id}/team/{team_id}`."
  @spec get_by_name(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_by_name(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_by_name_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_by_name_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_by_name_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/get-by-name",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :teams, :get_by_name],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_legacy_partition_spec %{
    path: [{"team_id", :team_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get a team (Legacy)\n\n> [!WARNING]\n> **Endpoint closing down notice:** This endpoint route is closing down and will be removed from the Teams API. We recommend migrating your existing code to use the [Get a team by name](https://docs.github.com/rest/teams/teams#get-a-team-by-name) endpoint."
  @spec get_legacy(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_legacy_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_legacy_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_legacy_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/get-legacy",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :teams, :get_legacy],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_member_legacy_partition_spec %{
    path: [{"team_id", :team_id}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get team member (Legacy)\n\nThe \"Get team member\" endpoint (described below) is closing down.\n\nWe recommend using the [Get team membership for a user](https://docs.github.com/rest/teams/members#get-team-membership-for-a-user) endpoint instead. It allows you to get both active and pending memberships.\n\nTo list members in a team, the team must be visible to the authenticated user."
  @spec get_member_legacy(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_member_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_member_legacy_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_member_legacy_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_member_legacy_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/get-member-legacy",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :teams, :get_member_legacy],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_membership_for_user_in_org_partition_spec %{
    path: [{"org", :org}, {"team_slug", :team_slug}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get team membership for a user\n\nTeam members will include the members of child teams.\n\nTo get a user's membership with a team, the team must be visible to the authenticated user.\n\n> [!NOTE]\n> You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/{org_id}/team/{team_id}/memberships/{username}`.\n\n> [!NOTE]\n> The response contains the `state` of the membership and the member's `role`.\n\nThe `role` for organization owners is set to `maintainer`. For more information about `maintainer` roles, see [Create a team](https://docs.github.com/rest/teams/teams#create-a-team)."
  @spec get_membership_for_user_in_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_membership_for_user_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_membership_for_user_in_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_membership_for_user_in_org_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @get_membership_for_user_in_org_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/get-membership-for-user-in-org",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :teams, :get_membership_for_user_in_org],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_membership_for_user_legacy_partition_spec %{
    path: [{"team_id", :team_id}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get team membership for a user (Legacy)\n\n> [!WARNING]\n> **Endpoint closing down notice:** This endpoint route is closing down and will be removed from the Teams API. We recommend migrating your existing code to use the new [Get team membership for a user](https://docs.github.com/rest/teams/members#get-team-membership-for-a-user) endpoint.\n\nTeam members will include the members of child teams.\n\nTo get a user's membership with a team, the team must be visible to the authenticated user.\n\n**Note:**\nThe response contains the `state` of the membership and the member's `role`.\n\nThe `role` for organization owners is set to `maintainer`. For more information about `maintainer` roles, see [Create a team](https://docs.github.com/rest/teams/teams#create-a-team)."
  @spec get_membership_for_user_legacy(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_membership_for_user_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_membership_for_user_legacy_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_membership_for_user_legacy_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @get_membership_for_user_legacy_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/get-membership-for-user-legacy",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :teams, :get_membership_for_user_legacy],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @list_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}, {"team_type", :team_type}],
    headers: []
  }

  @doc "List teams\n\nLists all teams in an organization that are visible to the authenticated user."
  @spec list(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list(term(), map(), keyword()) :: Enumerable.t()
  def stream_list(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_operation(params) end,
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

  defp build_list_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/list",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :teams, :list],
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

  @list_child_in_org_partition_spec %{
    path: [{"org", :org}, {"team_slug", :team_slug}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List child teams\n\nLists the child teams of the team specified by `{team_slug}`.\n\n> [!NOTE]\n> You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/{org_id}/team/{team_id}/teams`."
  @spec list_child_in_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_child_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_child_in_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_child_in_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_child_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_child_in_org_operation(params) end,
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

  defp build_list_child_in_org_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_child_in_org_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/list-child-in-org",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :teams, :list_child_in_org],
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

  @list_child_legacy_partition_spec %{
    path: [{"team_id", :team_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List child teams (Legacy)\n\n> [!WARNING]\n> **Endpoint closing down notice:** This endpoint route is closing down and will be removed from the Teams API. We recommend migrating your existing code to use the new [`List child teams`](https://docs.github.com/rest/teams/teams#list-child-teams) endpoint."
  @spec list_child_legacy(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_child_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_child_legacy_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_child_legacy(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_child_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_child_legacy_operation(params) end,
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

  defp build_list_child_legacy_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_child_legacy_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/list-child-legacy",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :teams, :list_child_legacy],
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

  @list_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List teams for the authenticated user\n\nList all of the teams across all of the organizations to which the authenticated\nuser belongs.\n\nOAuth app tokens and personal access tokens (classic) need the `user`, `repo`, or `read:org` scope to use this endpoint.\n\nWhen using a fine-grained personal access token, the resource owner of the token must be a single organization, and the response will only include the teams from that organization."
  @spec list_for_authenticated_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_for_authenticated_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_for_authenticated_user_operation(params) end,
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

  defp build_list_for_authenticated_user_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_for_authenticated_user_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/list-for-authenticated-user",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :teams, :list_for_authenticated_user],
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

  @list_members_in_org_partition_spec %{
    path: [{"org", :org}, {"team_slug", :team_slug}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"role", :role}, {"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List team members\n\nTeam members will include the members of child teams.\n\nTo list members in a team, the team must be visible to the authenticated user."
  @spec list_members_in_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_members_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_members_in_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_members_in_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_members_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_members_in_org_operation(params) end,
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

  defp build_list_members_in_org_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_members_in_org_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/list-members-in-org",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :teams, :list_members_in_org],
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

  @list_members_legacy_partition_spec %{
    path: [{"team_id", :team_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"role", :role}, {"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List team members (Legacy)\n\n> [!WARNING]\n> **Endpoint closing down notice:** This endpoint route is closing down and will be removed from the Teams API. We recommend migrating your existing code to use the new [`List team members`](https://docs.github.com/rest/teams/members#list-team-members) endpoint.\n\nTeam members will include the members of child teams."
  @spec list_members_legacy(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_members_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_members_legacy_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_members_legacy(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_members_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_members_legacy_operation(params) end,
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

  defp build_list_members_legacy_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_members_legacy_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/list-members-legacy",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :teams, :list_members_legacy],
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

  @list_pending_invitations_in_org_partition_spec %{
    path: [{"org", :org}, {"team_slug", :team_slug}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List pending team invitations\n\nThe return hash contains a `role` field which refers to the Organization Invitation role and will be one of the following values: `direct_member`, `admin`, `billing_manager`, `hiring_manager`, or `reinstate`. If the invitee is not a GitHub member, the `login` field in the return hash will be `null`.\n\n> [!NOTE]\n> You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/{org_id}/team/{team_id}/invitations`."
  @spec list_pending_invitations_in_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_pending_invitations_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_pending_invitations_in_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_pending_invitations_in_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_pending_invitations_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_pending_invitations_in_org_operation(params) end,
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

  defp build_list_pending_invitations_in_org_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @list_pending_invitations_in_org_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/list-pending-invitations-in-org",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :teams, :list_pending_invitations_in_org],
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

  @list_pending_invitations_legacy_partition_spec %{
    path: [{"team_id", :team_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List pending team invitations (Legacy)\n\n> [!WARNING]\n> **Endpoint closing down notice:** This endpoint route is closing down and will be removed from the Teams API. We recommend migrating your existing code to use the new [`List pending team invitations`](https://docs.github.com/rest/teams/members#list-pending-team-invitations) endpoint.\n\nThe return hash contains a `role` field which refers to the Organization Invitation role and will be one of the following values: `direct_member`, `admin`, `billing_manager`, `hiring_manager`, or `reinstate`. If the invitee is not a GitHub member, the `login` field in the return hash will be `null`."
  @spec list_pending_invitations_legacy(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_pending_invitations_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_pending_invitations_legacy_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_pending_invitations_legacy(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_pending_invitations_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_pending_invitations_legacy_operation(params) end,
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

  defp build_list_pending_invitations_legacy_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @list_pending_invitations_legacy_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/list-pending-invitations-legacy",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :teams, :list_pending_invitations_legacy],
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

  @list_repos_in_org_partition_spec %{
    path: [{"org", :org}, {"team_slug", :team_slug}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List team repositories\n\nLists a team's repositories visible to the authenticated user.\n\n> [!NOTE]\n> You can also specify a team by `org_id` and `team_id` using the route `GET /organizations/{org_id}/team/{team_id}/repos`."
  @spec list_repos_in_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_repos_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_repos_in_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_repos_in_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_repos_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_repos_in_org_operation(params) end,
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

  defp build_list_repos_in_org_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_repos_in_org_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/list-repos-in-org",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :teams, :list_repos_in_org],
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

  @list_repos_legacy_partition_spec %{
    path: [{"team_id", :team_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List team repositories (Legacy)\n\n> [!WARNING]\n> **Endpoint closing down notice:** This endpoint route is closing down and will be removed from the Teams API. We recommend migrating your existing code to use the new [List team repositories](https://docs.github.com/rest/teams/teams#list-team-repositories) endpoint."
  @spec list_repos_legacy(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_repos_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_repos_legacy_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_repos_legacy(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_repos_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_repos_legacy_operation(params) end,
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

  defp build_list_repos_legacy_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_repos_legacy_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/list-repos-legacy",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :teams, :list_repos_legacy],
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

  @remove_member_legacy_partition_spec %{
    path: [{"team_id", :team_id}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Remove team member (Legacy)\n\nThe \"Remove team member\" endpoint (described below) is closing down.\n\nWe recommend using the [Remove team membership for a user](https://docs.github.com/rest/teams/members#remove-team-membership-for-a-user) endpoint instead. It allows you to remove both active and pending memberships.\n\nTeam synchronization is available for organizations using GitHub Enterprise Cloud. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\nTo remove a team member, the authenticated user must have 'admin' permissions to the team or be an owner of the org that the team is associated with. Removing a team member does not delete the user, it just removes them from the team.\n\n> [!NOTE]\n> When you have team synchronization set up for a team with your organization's identity provider (IdP), you will see an error if you attempt to use the API for making changes to the team's membership. If you have access to manage group membership in your IdP, you can manage GitHub team membership through your identity provider, which automatically adds and removes team members in an organization. For more information, see \"[Synchronizing teams between your identity provider and GitHub](https://docs.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/).\""
  @spec remove_member_legacy(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def remove_member_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_remove_member_legacy_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_remove_member_legacy_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @remove_member_legacy_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/remove-member-legacy",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :teams, :remove_member_legacy],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @remove_membership_for_user_in_org_partition_spec %{
    path: [{"org", :org}, {"team_slug", :team_slug}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Remove team membership for a user\n\nTo remove a membership between a user and a team, the authenticated user must have 'admin' permissions to the team or be an owner of the organization that the team is associated with. Removing team membership does not delete the user, it just removes their membership from the team.\n\nTeam synchronization is available for organizations using GitHub Enterprise Cloud. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\n> [!NOTE]\n> When you have team synchronization set up for a team with your organization's identity provider (IdP), you will see an error if you attempt to use the API for making changes to the team's membership. If you have access to manage group membership in your IdP, you can manage GitHub team membership through your identity provider, which automatically adds and removes team members in an organization. For more information, see \"[Synchronizing teams between your identity provider and GitHub](https://docs.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/).\"\n\n> [!NOTE]\n> You can also specify a team by `org_id` and `team_id` using the route `DELETE /organizations/{org_id}/team/{team_id}/memberships/{username}`."
  @spec remove_membership_for_user_in_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def remove_membership_for_user_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_remove_membership_for_user_in_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_remove_membership_for_user_in_org_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @remove_membership_for_user_in_org_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/remove-membership-for-user-in-org",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :teams, :remove_membership_for_user_in_org],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @remove_membership_for_user_legacy_partition_spec %{
    path: [{"team_id", :team_id}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Remove team membership for a user (Legacy)\n\n> [!WARNING]\n> **Endpoint closing down notice:** This endpoint route is closing down and will be removed from the Teams API. We recommend migrating your existing code to use the new [Remove team membership for a user](https://docs.github.com/rest/teams/members#remove-team-membership-for-a-user) endpoint.\n\nTeam synchronization is available for organizations using GitHub Enterprise Cloud. For more information, see [GitHub's products](https://docs.github.com/github/getting-started-with-github/githubs-products) in the GitHub Help documentation.\n\nTo remove a membership between a user and a team, the authenticated user must have 'admin' permissions to the team or be an owner of the organization that the team is associated with. Removing team membership does not delete the user, it just removes their membership from the team.\n\n> [!NOTE]\n> When you have team synchronization set up for a team with your organization's identity provider (IdP), you will see an error if you attempt to use the API for making changes to the team's membership. If you have access to manage group membership in your IdP, you can manage GitHub team membership through your identity provider, which automatically adds and removes team members in an organization. For more information, see \"[Synchronizing teams between your identity provider and GitHub](https://docs.github.com/articles/synchronizing-teams-between-your-identity-provider-and-github/).\""
  @spec remove_membership_for_user_legacy(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def remove_membership_for_user_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_remove_membership_for_user_legacy_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_remove_membership_for_user_legacy_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @remove_membership_for_user_legacy_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/remove-membership-for-user-legacy",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :teams, :remove_membership_for_user_legacy],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Remove a repository from a team\n\nIf the authenticated user is an organization owner or a team maintainer, they can remove any repositories from the team. To remove a repository from a team as an organization member, the authenticated user must have admin access to the repository and must be able to see the team. This does not delete the repository, it just removes it from the team.\n\n> [!NOTE]\n> You can also specify a team by `org_id` and `team_id` using the route `DELETE /organizations/{org_id}/team/{team_id}/repos/{owner}/{repo}`."
  @spec remove_repo_in_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def remove_repo_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_remove_repo_in_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_remove_repo_in_org_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @remove_repo_in_org_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/remove-repo-in-org",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :teams, :remove_repo_in_org],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @remove_repo_legacy_partition_spec %{
    path: [{"team_id", :team_id}, {"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Remove a repository from a team (Legacy)\n\n> [!WARNING]\n> **Endpoint closing down notice:** This endpoint route is closing down and will be removed from the Teams API. We recommend migrating your existing code to use the new [Remove a repository from a team](https://docs.github.com/rest/teams/teams#remove-a-repository-from-a-team) endpoint.\n\nIf the authenticated user is an organization owner or a team maintainer, they can remove any repositories from the team. To remove a repository from a team as an organization member, the authenticated user must have admin access to the repository and must be able to see the team. NOTE: This does not delete the repository, it just removes it from the team."
  @spec remove_repo_legacy(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def remove_repo_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_remove_repo_legacy_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_remove_repo_legacy_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @remove_repo_legacy_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/remove-repo-legacy",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :teams, :remove_repo_legacy],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @update_in_org_partition_spec %{
    path: [{"org", :org}, {"team_slug", :team_slug}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Update a team\n\nTo edit a team, the authenticated user must either be an organization owner or a team maintainer.\n\n> [!NOTE]\n> You can also specify a team by `org_id` and `team_id` using the route `PATCH /organizations/{org_id}/team/{team_id}`."
  @spec update_in_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_update_in_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_update_in_org_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @update_in_org_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/update-in-org",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :teams, :update_in_org],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @update_legacy_partition_spec %{
    path: [{"team_id", :team_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Update a team (Legacy)\n\n> [!WARNING]\n> **Endpoint closing down notice:** This endpoint route is closing down and will be removed from the Teams API. We recommend migrating your existing code to use the new [Update a team](https://docs.github.com/rest/teams/teams#update-a-team) endpoint.\n\nTo edit a team, the authenticated user must either be an organization owner or a team maintainer.\n\n> [!NOTE]\n> With nested teams, the `privacy` for parent teams cannot be `secret`."
  @spec update_legacy(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_legacy(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_update_legacy_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_update_legacy_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @update_legacy_partition_spec)

    Pristine.Operation.new(%{
      id: "teams/update-legacy",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :teams, :update_legacy],
        timeout_ms: nil
      },
      pagination: nil
    })
  end
end

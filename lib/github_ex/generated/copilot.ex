defmodule GitHubEx.Copilot do
  @moduledoc """
  Generated Github Ex operations for copilot.
  """

  @add_copilot_seats_for_teams_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add teams to the Copilot subscription for an organization\n\n> [!NOTE]\n> This endpoint is in public preview and is subject to change.\n\nPurchases a GitHub Copilot seat for all users within each specified team.\nThe organization will be billed for each seat based on the organization's Copilot plan. For more information about Copilot pricing, see \"[About billing for GitHub Copilot in your organization](https://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/managing-the-copilot-subscription-for-your-organization/about-billing-for-github-copilot-in-your-organization).\"\n\nOnly organization owners can purchase Copilot seats for their organization members. The organization must have a Copilot Business or Copilot Enterprise subscription and a configured suggestion matching policy.\nFor more information about setting up a Copilot subscription, see \"[Subscribing to Copilot for your organization](https://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/managing-the-copilot-subscription-for-your-organization/subscribing-to-copilot-for-your-organization).\"\nFor more information about setting a suggestion matching policy, see \"[Managing policies for Copilot in your organization](https://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/setting-policies-for-copilot-in-your-organization/managing-policies-for-copilot-in-your-organization#policies-for-suggestion-matching).\"\n\nThe response contains the total number of new seats that were created and existing seats that were refreshed.\n\nOAuth app tokens and personal access tokens (classic) need either the `manage_billing:copilot` or `admin:org` scopes to use this endpoint."
  @spec add_copilot_seats_for_teams(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def add_copilot_seats_for_teams(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_add_copilot_seats_for_teams_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_add_copilot_seats_for_teams_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @add_copilot_seats_for_teams_partition_spec)

    Pristine.Operation.new(%{
      id: "copilot/add-copilot-seats-for-teams",
      method: :post,
      path_template: "/orgs/{org}/copilot/billing/selected_teams",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :copilot, :add_copilot_seats_for_teams],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @add_copilot_seats_for_users_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add users to the Copilot subscription for an organization\n\n> [!NOTE]\n> This endpoint is in public preview and is subject to change.\n\nPurchases a GitHub Copilot seat for each user specified.\nThe organization will be billed for each seat based on the organization's Copilot plan. For more information about Copilot pricing, see \"[About billing for GitHub Copilot in your organization](https://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/managing-the-copilot-subscription-for-your-organization/about-billing-for-github-copilot-in-your-organization).\"\n\nOnly organization owners can purchase Copilot seats for their organization members. The organization must have a Copilot Business or Copilot Enterprise subscription and a configured suggestion matching policy.\nFor more information about setting up a Copilot subscription, see \"[Subscribing to Copilot for your organization](https://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/managing-the-copilot-subscription-for-your-organization/subscribing-to-copilot-for-your-organization).\"\nFor more information about setting a suggestion matching policy, see \"[Managing policies for Copilot in your organization](https://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/setting-policies-for-copilot-in-your-organization/managing-policies-for-copilot-in-your-organization#policies-for-suggestion-matching).\"\n\nThe response contains the total number of new seats that were created and existing seats that were refreshed.\n\nOAuth app tokens and personal access tokens (classic) need either the `manage_billing:copilot` or `admin:org` scopes to use this endpoint."
  @spec add_copilot_seats_for_users(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def add_copilot_seats_for_users(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_add_copilot_seats_for_users_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_add_copilot_seats_for_users_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @add_copilot_seats_for_users_partition_spec)

    Pristine.Operation.new(%{
      id: "copilot/add-copilot-seats-for-users",
      method: :post,
      path_template: "/orgs/{org}/copilot/billing/selected_users",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :copilot, :add_copilot_seats_for_users],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @cancel_copilot_seat_assignment_for_teams_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove teams from the Copilot subscription for an organization\n\n> [!NOTE]\n> This endpoint is in public preview and is subject to change.\n\nSets seats for all members of each team specified to \"pending cancellation\".\nThis will cause the members of the specified team(s) to lose access to GitHub Copilot at the end of the current billing cycle unless they retain access through another team.\nFor more information about disabling access to Copilot, see \"[Revoking access to Copilot for members of your organization](https://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/managing-access-to-github-copilot-in-your-organization/revoking-access-to-copilot-for-members-of-your-organization).\"\n\nOnly organization owners can cancel Copilot seats for their organization members.\n\nThe response contains the total number of seats set to \"pending cancellation\".\n\nOAuth app tokens and personal access tokens (classic) need either the `manage_billing:copilot` or `admin:org` scopes to use this endpoint."
  @spec cancel_copilot_seat_assignment_for_teams(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def cancel_copilot_seat_assignment_for_teams(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_cancel_copilot_seat_assignment_for_teams_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_cancel_copilot_seat_assignment_for_teams_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @cancel_copilot_seat_assignment_for_teams_partition_spec
      )

    Pristine.Operation.new(%{
      id: "copilot/cancel-copilot-seat-assignment-for-teams",
      method: :delete,
      path_template: "/orgs/{org}/copilot/billing/selected_teams",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :copilot, :cancel_copilot_seat_assignment_for_teams],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @cancel_copilot_seat_assignment_for_users_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove users from the Copilot subscription for an organization\n\n> [!NOTE]\n> This endpoint is in public preview and is subject to change.\n\nSets seats for all users specified to \"pending cancellation\".\nThis will cause the specified users to lose access to GitHub Copilot at the end of the current billing cycle unless they retain access through team membership.\nFor more information about disabling access to Copilot, see \"[Revoking access to Copilot for members of your organization](https://docs.github.com/copilot/managing-copilot/managing-github-copilot-in-your-organization/managing-access-to-github-copilot-in-your-organization/revoking-access-to-copilot-for-members-of-your-organization).\"\n\nOnly organization owners can cancel Copilot seats for their organization members.\n\nThe response contains the total number of seats set to \"pending cancellation\".\n\nOAuth app tokens and personal access tokens (classic) need either the `manage_billing:copilot` or `admin:org` scopes to use this endpoint."
  @spec cancel_copilot_seat_assignment_for_users(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def cancel_copilot_seat_assignment_for_users(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_cancel_copilot_seat_assignment_for_users_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_cancel_copilot_seat_assignment_for_users_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @cancel_copilot_seat_assignment_for_users_partition_spec
      )

    Pristine.Operation.new(%{
      id: "copilot/cancel-copilot-seat-assignment-for-users",
      method: :delete,
      path_template: "/orgs/{org}/copilot/billing/selected_users",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :copilot, :cancel_copilot_seat_assignment_for_users],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @copilot_content_exclusion_for_organization_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get Copilot content exclusion rules for an organization\n\n> [!NOTE]\n> This endpoint is in public preview and is subject to change.\n\nGets information about an organization's Copilot content exclusion path rules.\nTo configure these settings, go to the organization's settings on GitHub.\nFor more information, see \"[Excluding content from GitHub Copilot](https://docs.github.com/copilot/managing-copilot/configuring-and-auditing-content-exclusion/excluding-content-from-github-copilot#configuring-content-exclusions-for-your-organization).\"\n\nOrganization owners can view details about Copilot content exclusion rules for the organization.\n\nOAuth app tokens and personal access tokens (classic) need either the `copilot` or `read:org` scopes to use this endpoint.\n\n> [!CAUTION]\n> * At this time, the API does not support comments. This endpoint will not return any comments in the existing rules.\n> * At this time, the API does not support duplicate keys. If your content exclusion configuration contains duplicate keys, the API will return only the last occurrence of that key. For example, if duplicate entries are present, only the final value will be included in the response."
  @spec copilot_content_exclusion_for_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def copilot_content_exclusion_for_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_copilot_content_exclusion_for_organization_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_copilot_content_exclusion_for_organization_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @copilot_content_exclusion_for_organization_partition_spec
      )

    Pristine.Operation.new(%{
      id: "copilot/copilot-content-exclusion-for-organization",
      method: :get,
      path_template: "/orgs/{org}/copilot/content_exclusion",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :copilot, :copilot_content_exclusion_for_organization],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @copilot_metrics_for_organization_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"since", :since},
      {"until", :until},
      {"page", :page},
      {"per_page", :per_page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get Copilot metrics for an organization\n\nUse this endpoint to see a breakdown of aggregated metrics for various GitHub Copilot features. See the response schema tab for detailed metrics definitions.\n\n> [!NOTE]\n> This endpoint will only return results for a given day if the organization contained **five or more members with active Copilot licenses** on that day, as evaluated at the end of that day.\n\nThe response contains metrics for up to 100 days prior. Metrics are processed once per day for the previous day,\nand the response will only include data up until yesterday. In order for an end user to be counted towards these metrics,\nthey must have telemetry enabled in their IDE.\n\nTo access this endpoint, the Copilot Metrics API access policy must be enabled for the organization.\nOnly organization owners and owners and billing managers of the parent enterprise can view Copilot metrics.\n\nOAuth app tokens and personal access tokens (classic) need either the `manage_billing:copilot`, `read:org`, or `read:enterprise` scopes to use this endpoint."
  @spec copilot_metrics_for_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def copilot_metrics_for_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_copilot_metrics_for_organization_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_copilot_metrics_for_organization(term(), map(), keyword()) :: Enumerable.t()
  def stream_copilot_metrics_for_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_copilot_metrics_for_organization_operation(params) end,
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

  defp build_copilot_metrics_for_organization_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @copilot_metrics_for_organization_partition_spec)

    Pristine.Operation.new(%{
      id: "copilot/copilot-metrics-for-organization",
      method: :get,
      path_template: "/orgs/{org}/copilot/metrics",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :copilot, :copilot_metrics_for_organization],
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

  @copilot_metrics_for_team_partition_spec %{
    path: [{"org", :org}, {"team_slug", :team_slug}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"since", :since},
      {"until", :until},
      {"page", :page},
      {"per_page", :per_page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get Copilot metrics for a team\n\nUse this endpoint to see a breakdown of aggregated metrics for various GitHub Copilot features. See the response schema tab for detailed metrics definitions.\n\n> [!NOTE]\n> This endpoint will only return results for a given day if the team had **five or more members with active Copilot licenses** on that day, as evaluated at the end of that day.\n\nThe response contains metrics for up to 100 days prior. Metrics are processed once per day for the previous day,\nand the response will only include data up until yesterday. In order for an end user to be counted towards these metrics,\nthey must have telemetry enabled in their IDE.\n\nTo access this endpoint, the Copilot Metrics API access policy must be enabled for the organization containing the team within GitHub settings.\nOnly organization owners for the organization that contains this team and owners and billing managers of the parent enterprise can view Copilot metrics for a team.\n\nOAuth app tokens and personal access tokens (classic) need either the `manage_billing:copilot`, `read:org`, or `read:enterprise` scopes to use this endpoint."
  @spec copilot_metrics_for_team(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def copilot_metrics_for_team(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_copilot_metrics_for_team_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_copilot_metrics_for_team(term(), map(), keyword()) :: Enumerable.t()
  def stream_copilot_metrics_for_team(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_copilot_metrics_for_team_operation(params) end,
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

  defp build_copilot_metrics_for_team_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @copilot_metrics_for_team_partition_spec)

    Pristine.Operation.new(%{
      id: "copilot/copilot-metrics-for-team",
      method: :get,
      path_template: "/orgs/{org}/team/{team_slug}/copilot/metrics",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :copilot, :copilot_metrics_for_team],
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

  @get_copilot_organization_details_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get Copilot seat information and settings for an organization\n\n> [!NOTE]\n> This endpoint is in public preview and is subject to change.\n\nGets information about an organization's Copilot subscription, including seat breakdown\nand feature policies. To configure these settings, go to your organization's settings on GitHub.com.\nFor more information, see \"[Managing policies for Copilot in your organization](https://docs.github.com/copilot/managing-copilot/managing-policies-for-copilot-business-in-your-organization).\"\n\nOnly organization owners can view details about the organization's Copilot Business or Copilot Enterprise subscription.\n\nOAuth app tokens and personal access tokens (classic) need either the `manage_billing:copilot` or `read:org` scopes to use this endpoint."
  @spec get_copilot_organization_details(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_copilot_organization_details(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_copilot_organization_details_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_copilot_organization_details_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @get_copilot_organization_details_partition_spec)

    Pristine.Operation.new(%{
      id: "copilot/get-copilot-organization-details",
      method: :get,
      path_template: "/orgs/{org}/copilot/billing",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :copilot, :get_copilot_organization_details],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_copilot_seat_details_for_user_partition_spec %{
    path: [{"org", :org}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get Copilot seat assignment details for a user\n\n> [!NOTE]\n> This endpoint is in public preview and is subject to change.\n\nGets the GitHub Copilot seat details for a member of an organization who currently has access to GitHub Copilot.\n\nThe seat object contains information about the user's most recent Copilot activity. Users must have telemetry enabled in their IDE for Copilot in the IDE activity to be reflected in `last_activity_at`.\nFor more information about activity data, see [Metrics data properties for GitHub Copilot](https://docs.github.com/copilot/reference/metrics-data).\n\nOnly organization owners can view Copilot seat assignment details for members of their organization.\n\nOAuth app tokens and personal access tokens (classic) need either the `manage_billing:copilot` or `read:org` scopes to use this endpoint."
  @spec get_copilot_seat_details_for_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_copilot_seat_details_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_copilot_seat_details_for_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_copilot_seat_details_for_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @get_copilot_seat_details_for_user_partition_spec)

    Pristine.Operation.new(%{
      id: "copilot/get-copilot-seat-details-for-user",
      method: :get,
      path_template: "/orgs/{org}/members/{username}/copilot",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :copilot, :get_copilot_seat_details_for_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @list_copilot_seats_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"page", :page}, {"per_page", :per_page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List all Copilot seat assignments for an organization\n\n> [!NOTE]\n> This endpoint is in public preview and is subject to change.\n\nLists all Copilot seats for which an organization with a Copilot Business or Copilot Enterprise subscription is currently being billed.\nOnly organization owners can view assigned seats.\n\nEach seat object contains information about the assigned user's most recent Copilot activity. Users must have telemetry enabled in their IDE for Copilot in the IDE activity to be reflected in `last_activity_at`.\nFor more information about activity data, see [Metrics data properties for GitHub Copilot](https://docs.github.com/copilot/reference/metrics-data).\n\nOAuth app tokens and personal access tokens (classic) need either the `manage_billing:copilot` or `read:org` scopes to use this endpoint."
  @spec list_copilot_seats(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_copilot_seats(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_copilot_seats_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_copilot_seats(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_copilot_seats(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_copilot_seats_operation(params) end,
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

  defp build_list_copilot_seats_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_copilot_seats_partition_spec)

    Pristine.Operation.new(%{
      id: "copilot/list-copilot-seats",
      method: :get,
      path_template: "/orgs/{org}/copilot/billing/seats",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :copilot, :list_copilot_seats],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: ["seats"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
  end

  @set_copilot_content_exclusion_for_organization_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set Copilot content exclusion rules for an organization\n\n> [!NOTE]\n> This endpoint is in public preview and is subject to change.\n\nSets Copilot content exclusion path rules for an organization.\nTo configure these settings, go to the organization's settings on GitHub.\nFor more information, see \"[Excluding content from GitHub Copilot](https://docs.github.com/copilot/managing-copilot/configuring-and-auditing-content-exclusion/excluding-content-from-github-copilot#configuring-content-exclusions-for-your-organization).\"\n\nOrganization owners can set Copilot content exclusion rules for the organization.\n\nOAuth app tokens and personal access tokens (classic) need the `copilot` scope to use this endpoint.\n\n> [!CAUTION]\n> * At this time, the API does not support comments. When using this endpoint, any existing comments in your rules will be deleted.\n> * At this time, the API does not support duplicate keys. If you submit content exclusions through the API with duplicate keys, only the last occurrence will be saved. Earlier entries with the same key will be overwritten."
  @spec set_copilot_content_exclusion_for_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_copilot_content_exclusion_for_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_set_copilot_content_exclusion_for_organization_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_set_copilot_content_exclusion_for_organization_operation(params)
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @set_copilot_content_exclusion_for_organization_partition_spec
      )

    Pristine.Operation.new(%{
      id: "copilot/set-copilot-content-exclusion-for-organization",
      method: :put,
      path_template: "/orgs/{org}/copilot/content_exclusion",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :copilot, :set_copilot_content_exclusion_for_organization],
        timeout_ms: nil
      },
      pagination: nil
    })
  end
end

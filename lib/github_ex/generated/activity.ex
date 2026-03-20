defmodule GitHubEx.Activity do
  @moduledoc """
  Generated Github Ex operations for activity.
  """

  @check_repo_is_starred_by_authenticated_user_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Check if a repository is starred by the authenticated user\n\nWhether the authenticated user has starred the repository."
  @spec check_repo_is_starred_by_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def check_repo_is_starred_by_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_check_repo_is_starred_by_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_check_repo_is_starred_by_authenticated_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @check_repo_is_starred_by_authenticated_user_partition_spec
      )

    Pristine.Operation.new(%{
      id: "activity/check-repo-is-starred-by-authenticated-user",
      method: :get,
      path_template: "/user/starred/{owner}/{repo}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :check_repo_is_starred_by_authenticated_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_repo_subscription_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Delete a repository subscription\n\nThis endpoint should only be used to stop watching a repository. To control whether or not you wish to receive notifications from a repository, [set the repository's subscription manually](https://docs.github.com/rest/activity/watching#set-a-repository-subscription)."
  @spec delete_repo_subscription(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_repo_subscription(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_delete_repo_subscription_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_delete_repo_subscription_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_repo_subscription_partition_spec)

    Pristine.Operation.new(%{
      id: "activity/delete-repo-subscription",
      method: :delete,
      path_template: "/repos/{owner}/{repo}/subscription",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :delete_repo_subscription],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_thread_subscription_partition_spec %{
    path: [{"thread_id", :thread_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Delete a thread subscription\n\nMutes all future notifications for a conversation until you comment on the thread or get an **@mention**. If you are watching the repository of the thread, you will still receive notifications. To ignore future notifications for a repository you are watching, use the [Set a thread subscription](https://docs.github.com/rest/activity/notifications#set-a-thread-subscription) endpoint and set `ignore` to `true`."
  @spec delete_thread_subscription(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_thread_subscription(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_delete_thread_subscription_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_delete_thread_subscription_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_thread_subscription_partition_spec)

    Pristine.Operation.new(%{
      id: "activity/delete-thread-subscription",
      method: :delete,
      path_template: "/notifications/threads/{thread_id}/subscription",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :delete_thread_subscription],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_feeds_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get feeds\n\nLists the feeds available to the authenticated user. The response provides a URL for each feed. You can then get a specific feed by sending a request to one of the feed URLs.\n\n*   **Timeline**: The GitHub global public timeline\n*   **User**: The public timeline for any user, using `uri_template`. For more information, see \"[Hypermedia](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#hypermedia).\"\n*   **Current user public**: The public timeline for the authenticated user\n*   **Current user**: The private timeline for the authenticated user\n*   **Current user actor**: The private timeline for activity created by the authenticated user\n*   **Current user organizations**: The private timeline for the organizations the authenticated user is a member of.\n*   **Security advisories**: A collection of public announcements that provide information about security-related vulnerabilities in software on GitHub.\n\nBy default, timeline resources are returned in JSON. You can specify the `application/atom+xml` type in the `Accept` header to return timeline resources in Atom format. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n> [!NOTE]\n> Private feeds are only returned when [authenticating via Basic Auth](https://docs.github.com/rest/authentication/authenticating-to-the-rest-api#using-basic-authentication) since current feed URIs use the older, non revocable auth tokens."
  @spec get_feeds(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_feeds(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_feeds_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_feeds_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_feeds_partition_spec)

    Pristine.Operation.new(%{
      id: "activity/get-feeds",
      method: :get,
      path_template: "/feeds",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :get_feeds],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_repo_subscription_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get a repository subscription\n\nGets information about whether the authenticated user is subscribed to the repository."
  @spec get_repo_subscription(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_repo_subscription(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_repo_subscription_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_repo_subscription_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_repo_subscription_partition_spec)

    Pristine.Operation.new(%{
      id: "activity/get-repo-subscription",
      method: :get,
      path_template: "/repos/{owner}/{repo}/subscription",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :get_repo_subscription],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_thread_partition_spec %{
    path: [{"thread_id", :thread_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get a thread\n\nGets information about a notification thread."
  @spec get_thread(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_thread(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_thread_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_thread_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_thread_partition_spec)

    Pristine.Operation.new(%{
      id: "activity/get-thread",
      method: :get,
      path_template: "/notifications/threads/{thread_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :get_thread],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_thread_subscription_for_authenticated_user_partition_spec %{
    path: [{"thread_id", :thread_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get a thread subscription for the authenticated user\n\nThis checks to see if the current user is subscribed to a thread. You can also [get a repository subscription](https://docs.github.com/rest/activity/watching#get-a-repository-subscription).\n\nNote that subscriptions are only generated if a user is participating in a conversation--for example, they've replied to the thread, were **@mentioned**, or manually subscribe to a thread."
  @spec get_thread_subscription_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_thread_subscription_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_thread_subscription_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_thread_subscription_for_authenticated_user_operation(params)
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @get_thread_subscription_for_authenticated_user_partition_spec
      )

    Pristine.Operation.new(%{
      id: "activity/get-thread-subscription-for-authenticated-user",
      method: :get,
      path_template: "/notifications/threads/{thread_id}/subscription",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :get_thread_subscription_for_authenticated_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @list_events_for_authenticated_user_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List events for the authenticated user\n\nIf you are authenticated as the given user, you will see your private events. Otherwise, you'll only see public events. _Optional_: use the fine-grained token with following permission set to view private events: \"Events\" user permissions (read).\n\n> [!NOTE]\n> This API is not built to serve real-time use cases. Depending on the time of day, event latency can be anywhere from 30s to 6h."
  @spec list_events_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_events_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_events_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_events_for_authenticated_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_events_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_events_for_authenticated_user_operation(params) end,
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

  defp build_list_events_for_authenticated_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @list_events_for_authenticated_user_partition_spec)

    Pristine.Operation.new(%{
      id: "activity/list-events-for-authenticated-user",
      method: :get,
      path_template: "/users/{username}/events",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :list_events_for_authenticated_user],
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

  @list_notifications_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [
      {"all", :all},
      {"participating", :participating},
      {"since", :since},
      {"before", :before},
      {"page", :page},
      {"per_page", :per_page}
    ],
    headers: []
  }

  @doc "List notifications for the authenticated user\n\nList all notifications for the current user, sorted by most recently updated."
  @spec list_notifications_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_notifications_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_notifications_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_notifications_for_authenticated_user(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_list_notifications_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_notifications_for_authenticated_user_operation(params) end,
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

  defp build_list_notifications_for_authenticated_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @list_notifications_for_authenticated_user_partition_spec
      )

    Pristine.Operation.new(%{
      id: "activity/list-notifications-for-authenticated-user",
      method: :get,
      path_template: "/notifications",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :list_notifications_for_authenticated_user],
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

  @list_org_events_for_authenticated_user_partition_spec %{
    path: [{"username", :username}, {"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List organization events for the authenticated user\n\nThis is the user's organization dashboard. You must be authenticated as the user to view this.\n\n> [!NOTE]\n> This API is not built to serve real-time use cases. Depending on the time of day, event latency can be anywhere from 30s to 6h."
  @spec list_org_events_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_org_events_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_org_events_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_org_events_for_authenticated_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_org_events_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_org_events_for_authenticated_user_operation(params) end,
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

  defp build_list_org_events_for_authenticated_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @list_org_events_for_authenticated_user_partition_spec)

    Pristine.Operation.new(%{
      id: "activity/list-org-events-for-authenticated-user",
      method: :get,
      path_template: "/users/{username}/events/orgs/{org}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :list_org_events_for_authenticated_user],
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

  @list_public_events_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List public events\n\n> [!NOTE]\n> This API is not built to serve real-time use cases. Depending on the time of day, event latency can be anywhere from 30s to 6h."
  @spec list_public_events(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_public_events(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_public_events_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_public_events(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_public_events(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_public_events_operation(params) end,
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

  defp build_list_public_events_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_public_events_partition_spec)

    Pristine.Operation.new(%{
      id: "activity/list-public-events",
      method: :get,
      path_template: "/events",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :list_public_events],
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

  @list_public_events_for_repo_network_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List public events for a network of repositories\n\n> [!NOTE]\n> This API is not built to serve real-time use cases. Depending on the time of day, event latency can be anywhere from 30s to 6h."
  @spec list_public_events_for_repo_network(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_public_events_for_repo_network(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_public_events_for_repo_network_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_public_events_for_repo_network(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_public_events_for_repo_network(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_public_events_for_repo_network_operation(params) end,
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

  defp build_list_public_events_for_repo_network_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @list_public_events_for_repo_network_partition_spec)

    Pristine.Operation.new(%{
      id: "activity/list-public-events-for-repo-network",
      method: :get,
      path_template: "/networks/{owner}/{repo}/events",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :list_public_events_for_repo_network],
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

  @list_public_events_for_user_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List public events for a user\n\n> [!NOTE]\n> This API is not built to serve real-time use cases. Depending on the time of day, event latency can be anywhere from 30s to 6h."
  @spec list_public_events_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_public_events_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_public_events_for_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_public_events_for_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_public_events_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_public_events_for_user_operation(params) end,
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

  defp build_list_public_events_for_user_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_public_events_for_user_partition_spec)

    Pristine.Operation.new(%{
      id: "activity/list-public-events-for-user",
      method: :get,
      path_template: "/users/{username}/events/public",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :list_public_events_for_user],
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

  @list_public_org_events_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List public organization events\n\n> [!NOTE]\n> This API is not built to serve real-time use cases. Depending on the time of day, event latency can be anywhere from 30s to 6h."
  @spec list_public_org_events(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_public_org_events(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_public_org_events_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_public_org_events(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_public_org_events(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_public_org_events_operation(params) end,
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

  defp build_list_public_org_events_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_public_org_events_partition_spec)

    Pristine.Operation.new(%{
      id: "activity/list-public-org-events",
      method: :get,
      path_template: "/orgs/{org}/events",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :list_public_org_events],
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

  @list_received_events_for_user_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List events received by the authenticated user\n\nThese are events that you've received by watching repositories and following users. If you are authenticated as the\ngiven user, you will see private events. Otherwise, you'll only see public events.\n\n> [!NOTE]\n> This API is not built to serve real-time use cases. Depending on the time of day, event latency can be anywhere from 30s to 6h."
  @spec list_received_events_for_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_received_events_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_received_events_for_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_received_events_for_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_received_events_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_received_events_for_user_operation(params) end,
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

  defp build_list_received_events_for_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @list_received_events_for_user_partition_spec)

    Pristine.Operation.new(%{
      id: "activity/list-received-events-for-user",
      method: :get,
      path_template: "/users/{username}/received_events",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :list_received_events_for_user],
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

  @list_received_public_events_for_user_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List public events received by a user\n\n> [!NOTE]\n> This API is not built to serve real-time use cases. Depending on the time of day, event latency can be anywhere from 30s to 6h."
  @spec list_received_public_events_for_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_received_public_events_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_received_public_events_for_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_received_public_events_for_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_received_public_events_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_received_public_events_for_user_operation(params) end,
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

  defp build_list_received_public_events_for_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @list_received_public_events_for_user_partition_spec)

    Pristine.Operation.new(%{
      id: "activity/list-received-public-events-for-user",
      method: :get,
      path_template: "/users/{username}/received_events/public",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :list_received_public_events_for_user],
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

  @list_repo_events_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List repository events\n\n> [!NOTE]\n> This API is not built to serve real-time use cases. Depending on the time of day, event latency can be anywhere from 30s to 6h."
  @spec list_repo_events(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_repo_events(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_repo_events_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_repo_events(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_repo_events(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_repo_events_operation(params) end,
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

  defp build_list_repo_events_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_repo_events_partition_spec)

    Pristine.Operation.new(%{
      id: "activity/list-repo-events",
      method: :get,
      path_template: "/repos/{owner}/{repo}/events",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :list_repo_events],
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

  @list_repo_notifications_for_authenticated_user_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [
      {"all", :all},
      {"participating", :participating},
      {"since", :since},
      {"before", :before},
      {"per_page", :per_page},
      {"page", :page}
    ],
    headers: []
  }

  @doc "List repository notifications for the authenticated user\n\nLists all notifications for the current user in the specified repository."
  @spec list_repo_notifications_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_repo_notifications_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_repo_notifications_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_repo_notifications_for_authenticated_user(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_list_repo_notifications_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_repo_notifications_for_authenticated_user_operation(params) end,
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

  defp build_list_repo_notifications_for_authenticated_user_operation(params)
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @list_repo_notifications_for_authenticated_user_partition_spec
      )

    Pristine.Operation.new(%{
      id: "activity/list-repo-notifications-for-authenticated-user",
      method: :get,
      path_template: "/repos/{owner}/{repo}/notifications",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :list_repo_notifications_for_authenticated_user],
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

  @list_repos_starred_by_authenticated_user_partition_spec %{
    path: [],
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

  @doc "List repositories starred by the authenticated user\n\nLists repositories the authenticated user has starred.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.star+json`**: Includes a timestamp of when the star was created."
  @spec list_repos_starred_by_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_repos_starred_by_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_repos_starred_by_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_repos_starred_by_authenticated_user(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_list_repos_starred_by_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_repos_starred_by_authenticated_user_operation(params) end,
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

  defp build_list_repos_starred_by_authenticated_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @list_repos_starred_by_authenticated_user_partition_spec
      )

    Pristine.Operation.new(%{
      id: "activity/list-repos-starred-by-authenticated-user",
      method: :get,
      path_template: "/user/starred",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :list_repos_starred_by_authenticated_user],
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

  @list_repos_starred_by_user_partition_spec %{
    path: [{"username", :username}],
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

  @doc "List repositories starred by a user\n\nLists repositories a user has starred.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.star+json`**: Includes a timestamp of when the star was created."
  @spec list_repos_starred_by_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_repos_starred_by_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_repos_starred_by_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_repos_starred_by_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_repos_starred_by_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_repos_starred_by_user_operation(params) end,
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

  defp build_list_repos_starred_by_user_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_repos_starred_by_user_partition_spec)

    Pristine.Operation.new(%{
      id: "activity/list-repos-starred-by-user",
      method: :get,
      path_template: "/users/{username}/starred",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :list_repos_starred_by_user],
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

  @list_repos_watched_by_user_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List repositories watched by a user\n\nLists repositories a user is watching."
  @spec list_repos_watched_by_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_repos_watched_by_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_repos_watched_by_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_repos_watched_by_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_repos_watched_by_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_repos_watched_by_user_operation(params) end,
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

  defp build_list_repos_watched_by_user_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_repos_watched_by_user_partition_spec)

    Pristine.Operation.new(%{
      id: "activity/list-repos-watched-by-user",
      method: :get,
      path_template: "/users/{username}/subscriptions",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :list_repos_watched_by_user],
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

  @list_stargazers_for_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List stargazers\n\nLists the people that have starred the repository.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.star+json`**: Includes a timestamp of when the star was created."
  @spec list_stargazers_for_repo(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_stargazers_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_stargazers_for_repo_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_stargazers_for_repo(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_stargazers_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_stargazers_for_repo_operation(params) end,
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

  defp build_list_stargazers_for_repo_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_stargazers_for_repo_partition_spec)

    Pristine.Operation.new(%{
      id: "activity/list-stargazers-for-repo",
      method: :get,
      path_template: "/repos/{owner}/{repo}/stargazers",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :list_stargazers_for_repo],
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

  @list_watched_repos_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List repositories watched by the authenticated user\n\nLists repositories the authenticated user is watching."
  @spec list_watched_repos_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_watched_repos_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_watched_repos_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_watched_repos_for_authenticated_user(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_list_watched_repos_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_watched_repos_for_authenticated_user_operation(params) end,
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

  defp build_list_watched_repos_for_authenticated_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @list_watched_repos_for_authenticated_user_partition_spec
      )

    Pristine.Operation.new(%{
      id: "activity/list-watched-repos-for-authenticated-user",
      method: :get,
      path_template: "/user/subscriptions",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :list_watched_repos_for_authenticated_user],
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

  @list_watchers_for_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: []
  }

  @doc "List watchers\n\nLists the people watching the specified repository."
  @spec list_watchers_for_repo(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_watchers_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_watchers_for_repo_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_watchers_for_repo(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_watchers_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_watchers_for_repo_operation(params) end,
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

  defp build_list_watchers_for_repo_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_watchers_for_repo_partition_spec)

    Pristine.Operation.new(%{
      id: "activity/list-watchers-for-repo",
      method: :get,
      path_template: "/repos/{owner}/{repo}/subscribers",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :list_watchers_for_repo],
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

  @mark_notifications_as_read_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Mark notifications as read\n\nMarks all notifications as \"read\" for the current user. If the number of notifications is too large to complete in one request, you will receive a `202 Accepted` status and GitHub will run an asynchronous process to mark notifications as \"read.\" To check whether any \"unread\" notifications remain, you can use the [List notifications for the authenticated user](https://docs.github.com/rest/activity/notifications#list-notifications-for-the-authenticated-user) endpoint and pass the query parameter `all=false`."
  @spec mark_notifications_as_read(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def mark_notifications_as_read(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_mark_notifications_as_read_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_mark_notifications_as_read_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @mark_notifications_as_read_partition_spec)

    Pristine.Operation.new(%{
      id: "activity/mark-notifications-as-read",
      method: :put,
      path_template: "/notifications",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :mark_notifications_as_read],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @mark_repo_notifications_as_read_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Mark repository notifications as read\n\nMarks all notifications in a repository as \"read\" for the current user. If the number of notifications is too large to complete in one request, you will receive a `202 Accepted` status and GitHub will run an asynchronous process to mark notifications as \"read.\" To check whether any \"unread\" notifications remain, you can use the [List repository notifications for the authenticated user](https://docs.github.com/rest/activity/notifications#list-repository-notifications-for-the-authenticated-user) endpoint and pass the query parameter `all=false`."
  @spec mark_repo_notifications_as_read(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def mark_repo_notifications_as_read(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_mark_repo_notifications_as_read_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_mark_repo_notifications_as_read_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @mark_repo_notifications_as_read_partition_spec)

    Pristine.Operation.new(%{
      id: "activity/mark-repo-notifications-as-read",
      method: :put,
      path_template: "/repos/{owner}/{repo}/notifications",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :mark_repo_notifications_as_read],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @mark_thread_as_done_partition_spec %{
    path: [{"thread_id", :thread_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Mark a thread as done\n\nMarks a thread as \"done.\" Marking a thread as \"done\" is equivalent to marking a notification in your notification inbox on GitHub as done: https://github.com/notifications."
  @spec mark_thread_as_done(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def mark_thread_as_done(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_mark_thread_as_done_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_mark_thread_as_done_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @mark_thread_as_done_partition_spec)

    Pristine.Operation.new(%{
      id: "activity/mark-thread-as-done",
      method: :delete,
      path_template: "/notifications/threads/{thread_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :mark_thread_as_done],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @mark_thread_as_read_partition_spec %{
    path: [{"thread_id", :thread_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Mark a thread as read\n\nMarks a thread as \"read.\" Marking a thread as \"read\" is equivalent to clicking a notification in your notification inbox on GitHub: https://github.com/notifications."
  @spec mark_thread_as_read(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def mark_thread_as_read(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_mark_thread_as_read_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_mark_thread_as_read_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @mark_thread_as_read_partition_spec)

    Pristine.Operation.new(%{
      id: "activity/mark-thread-as-read",
      method: :patch,
      path_template: "/notifications/threads/{thread_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :mark_thread_as_read],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @set_repo_subscription_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Set a repository subscription\n\nIf you would like to watch a repository, set `subscribed` to `true`. If you would like to ignore notifications made within a repository, set `ignored` to `true`. If you would like to stop watching a repository, [delete the repository's subscription](https://docs.github.com/rest/activity/watching#delete-a-repository-subscription) completely."
  @spec set_repo_subscription(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def set_repo_subscription(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_set_repo_subscription_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_set_repo_subscription_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @set_repo_subscription_partition_spec)

    Pristine.Operation.new(%{
      id: "activity/set-repo-subscription",
      method: :put,
      path_template: "/repos/{owner}/{repo}/subscription",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :set_repo_subscription],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @set_thread_subscription_partition_spec %{
    path: [{"thread_id", :thread_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Set a thread subscription\n\nIf you are watching a repository, you receive notifications for all threads by default. Use this endpoint to ignore future notifications for threads until you comment on the thread or get an **@mention**.\n\nYou can also use this endpoint to subscribe to threads that you are currently not receiving notifications for or to subscribed to threads that you have previously ignored.\n\nUnsubscribing from a conversation in a repository that you are not watching is functionally equivalent to the [Delete a thread subscription](https://docs.github.com/rest/activity/notifications#delete-a-thread-subscription) endpoint."
  @spec set_thread_subscription(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def set_thread_subscription(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_set_thread_subscription_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_set_thread_subscription_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @set_thread_subscription_partition_spec)

    Pristine.Operation.new(%{
      id: "activity/set-thread-subscription",
      method: :put,
      path_template: "/notifications/threads/{thread_id}/subscription",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :set_thread_subscription],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @star_repo_for_authenticated_user_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Star a repository for the authenticated user\n\nNote that you'll need to set `Content-Length` to zero when calling out to this endpoint. For more information, see \"[HTTP method](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method).\""
  @spec star_repo_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def star_repo_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_star_repo_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_star_repo_for_authenticated_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @star_repo_for_authenticated_user_partition_spec)

    Pristine.Operation.new(%{
      id: "activity/star-repo-for-authenticated-user",
      method: :put,
      path_template: "/user/starred/{owner}/{repo}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :star_repo_for_authenticated_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @unstar_repo_for_authenticated_user_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Unstar a repository for the authenticated user\n\nUnstar a repository that the authenticated user has previously starred."
  @spec unstar_repo_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def unstar_repo_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_unstar_repo_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_unstar_repo_for_authenticated_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @unstar_repo_for_authenticated_user_partition_spec)

    Pristine.Operation.new(%{
      id: "activity/unstar-repo-for-authenticated-user",
      method: :delete,
      path_template: "/user/starred/{owner}/{repo}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
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
        telemetry_event: [:github_ex, :activity, :unstar_repo_for_authenticated_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end
end

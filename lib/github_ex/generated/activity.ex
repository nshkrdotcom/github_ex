defmodule GitHubEx.Activity do
  @moduledoc """
  Generated GitHub REST operations for the `Activity` namespace.

  ## Operations

  * `activity/list-public-events`
  * `activity/get-feeds`
  * `activity/list-public-events-for-repo-network`
  * `activity/list-notifications-for-authenticated-user`
  * `activity/mark-notifications-as-read`
  * `activity/get-thread`
  * `activity/mark-thread-as-done`
  * `activity/mark-thread-as-read`
  * `activity/delete-thread-subscription`
  * `activity/get-thread-subscription-for-authenticated-user`
  * `activity/set-thread-subscription`
  * `activity/list-public-org-events`
  * `activity/list-repo-events`
  * `activity/list-repo-notifications-for-authenticated-user`
  * `activity/mark-repo-notifications-as-read`
  * `activity/list-stargazers-for-repo`
  * `activity/list-watchers-for-repo`
  * `activity/delete-repo-subscription`
  * `activity/get-repo-subscription`
  * `activity/set-repo-subscription`
  * `activity/list-repos-starred-by-authenticated-user`
  * `activity/check-repo-is-starred-by-authenticated-user`
  * `activity/star-repo-for-authenticated-user`
  * `activity/unstar-repo-for-authenticated-user`
  * `activity/list-watched-repos-for-authenticated-user`
  * `activity/list-events-for-authenticated-user`
  * `activity/list-org-events-for-authenticated-user`
  * `activity/list-public-events-for-user`
  * `activity/list-received-events-for-user`
  * `activity/list-received-public-events-for-user`
  * `activity/list-repos-starred-by-user`
  * `activity/list-repos-watched-by-user`
  """

  @type result :: {:ok, term()} | {:error, GitHubEx.Error.t()}

  @doc "Check if a repository is starred by the authenticated user\n\nPath: /user/starred/{owner}/{repo}\n\nMethod: get"
  @spec check_repo_is_starred_by_authenticated_user(GitHubEx.Client.t()) :: result
  @spec check_repo_is_starred_by_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def check_repo_is_starred_by_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Activity, :check_repo_is_starred_by_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/user/starred/{owner}/{repo}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Delete a repository subscription\n\nPath: /repos/{owner}/{repo}/subscription\n\nMethod: delete"
  @spec delete_repo_subscription(GitHubEx.Client.t()) :: result
  @spec delete_repo_subscription(GitHubEx.Client.t(), map()) :: result
  def delete_repo_subscription(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Activity, :delete_repo_subscription},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/subscription",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a thread subscription\n\nPath: /notifications/threads/{thread_id}/subscription\n\nMethod: delete"
  @spec delete_thread_subscription(GitHubEx.Client.t()) :: result
  @spec delete_thread_subscription(GitHubEx.Client.t(), map()) :: result
  def delete_thread_subscription(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Activity, :delete_thread_subscription},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"thread_id", :thread_id}],
      path_template: "/notifications/threads/{thread_id}/subscription",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Get feeds\n\nPath: /feeds\n\nMethod: get"
  @spec get_feeds(GitHubEx.Client.t()) :: result
  @spec get_feeds(GitHubEx.Client.t(), map()) :: result
  def get_feeds(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Activity, :get_feeds},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/feeds",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a repository subscription\n\nPath: /repos/{owner}/{repo}/subscription\n\nMethod: get"
  @spec get_repo_subscription(GitHubEx.Client.t()) :: result
  @spec get_repo_subscription(GitHubEx.Client.t(), map()) :: result
  def get_repo_subscription(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Activity, :get_repo_subscription},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/subscription",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a thread\n\nPath: /notifications/threads/{thread_id}\n\nMethod: get"
  @spec get_thread(GitHubEx.Client.t()) :: result
  @spec get_thread(GitHubEx.Client.t(), map()) :: result
  def get_thread(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Activity, :get_thread},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"thread_id", :thread_id}],
      path_template: "/notifications/threads/{thread_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a thread subscription for the authenticated user\n\nPath: /notifications/threads/{thread_id}/subscription\n\nMethod: get"
  @spec get_thread_subscription_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec get_thread_subscription_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def get_thread_subscription_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Activity, :get_thread_subscription_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"thread_id", :thread_id}],
      path_template: "/notifications/threads/{thread_id}/subscription",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List events for the authenticated user\n\nPath: /users/{username}/events\n\nMethod: get"
  @spec list_events_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec list_events_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def list_events_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Activity, :list_events_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"username", :username}],
      path_template: "/users/{username}/events",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List notifications for the authenticated user\n\nPath: /notifications\n\nMethod: get"
  @spec list_notifications_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec list_notifications_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def list_notifications_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Activity, :list_notifications_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/notifications",
      query: [
        {"all", :all},
        {"participating", :participating},
        {"since", :since},
        {"before", :before},
        {"page", :page},
        {"per_page", :per_page}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List organization events for the authenticated user\n\nPath: /users/{username}/events/orgs/{org}\n\nMethod: get"
  @spec list_org_events_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec list_org_events_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def list_org_events_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Activity, :list_org_events_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"username", :username}, {"org", :org}],
      path_template: "/users/{username}/events/orgs/{org}",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List public events\n\nPath: /events\n\nMethod: get"
  @spec list_public_events(GitHubEx.Client.t()) :: result
  @spec list_public_events(GitHubEx.Client.t(), map()) :: result
  def list_public_events(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Activity, :list_public_events},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/events",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List public events for a network of repositories\n\nPath: /networks/{owner}/{repo}/events\n\nMethod: get"
  @spec list_public_events_for_repo_network(GitHubEx.Client.t()) :: result
  @spec list_public_events_for_repo_network(GitHubEx.Client.t(), map()) :: result
  def list_public_events_for_repo_network(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Activity, :list_public_events_for_repo_network},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/networks/{owner}/{repo}/events",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List public events for a user\n\nPath: /users/{username}/events/public\n\nMethod: get"
  @spec list_public_events_for_user(GitHubEx.Client.t()) :: result
  @spec list_public_events_for_user(GitHubEx.Client.t(), map()) :: result
  def list_public_events_for_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Activity, :list_public_events_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"username", :username}],
      path_template: "/users/{username}/events/public",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List public organization events\n\nPath: /orgs/{org}/events\n\nMethod: get"
  @spec list_public_org_events(GitHubEx.Client.t()) :: result
  @spec list_public_org_events(GitHubEx.Client.t(), map()) :: result
  def list_public_org_events(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Activity, :list_public_org_events},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/events",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List events received by the authenticated user\n\nPath: /users/{username}/received_events\n\nMethod: get"
  @spec list_received_events_for_user(GitHubEx.Client.t()) :: result
  @spec list_received_events_for_user(GitHubEx.Client.t(), map()) :: result
  def list_received_events_for_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Activity, :list_received_events_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"username", :username}],
      path_template: "/users/{username}/received_events",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List public events received by a user\n\nPath: /users/{username}/received_events/public\n\nMethod: get"
  @spec list_received_public_events_for_user(GitHubEx.Client.t()) :: result
  @spec list_received_public_events_for_user(GitHubEx.Client.t(), map()) :: result
  def list_received_public_events_for_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Activity, :list_received_public_events_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"username", :username}],
      path_template: "/users/{username}/received_events/public",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repository events\n\nPath: /repos/{owner}/{repo}/events\n\nMethod: get"
  @spec list_repo_events(GitHubEx.Client.t()) :: result
  @spec list_repo_events(GitHubEx.Client.t(), map()) :: result
  def list_repo_events(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Activity, :list_repo_events},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/events",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repository notifications for the authenticated user\n\nPath: /repos/{owner}/{repo}/notifications\n\nMethod: get"
  @spec list_repo_notifications_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec list_repo_notifications_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def list_repo_notifications_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Activity, :list_repo_notifications_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/notifications",
      query: [
        {"all", :all},
        {"participating", :participating},
        {"since", :since},
        {"before", :before},
        {"per_page", :per_page},
        {"page", :page}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repositories starred by the authenticated user\n\nPath: /user/starred\n\nMethod: get"
  @spec list_repos_starred_by_authenticated_user(GitHubEx.Client.t()) :: result
  @spec list_repos_starred_by_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def list_repos_starred_by_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Activity, :list_repos_starred_by_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/user/starred",
      query: [
        {"sort", :sort},
        {"direction", :direction},
        {"per_page", :per_page},
        {"page", :page}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repositories starred by a user\n\nPath: /users/{username}/starred\n\nMethod: get"
  @spec list_repos_starred_by_user(GitHubEx.Client.t()) :: result
  @spec list_repos_starred_by_user(GitHubEx.Client.t(), map()) :: result
  def list_repos_starred_by_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Activity, :list_repos_starred_by_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"username", :username}],
      path_template: "/users/{username}/starred",
      query: [
        {"sort", :sort},
        {"direction", :direction},
        {"per_page", :per_page},
        {"page", :page}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repositories watched by a user\n\nPath: /users/{username}/subscriptions\n\nMethod: get"
  @spec list_repos_watched_by_user(GitHubEx.Client.t()) :: result
  @spec list_repos_watched_by_user(GitHubEx.Client.t(), map()) :: result
  def list_repos_watched_by_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Activity, :list_repos_watched_by_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"username", :username}],
      path_template: "/users/{username}/subscriptions",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List stargazers\n\nPath: /repos/{owner}/{repo}/stargazers\n\nMethod: get"
  @spec list_stargazers_for_repo(GitHubEx.Client.t()) :: result
  @spec list_stargazers_for_repo(GitHubEx.Client.t(), map()) :: result
  def list_stargazers_for_repo(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Activity, :list_stargazers_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/stargazers",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repositories watched by the authenticated user\n\nPath: /user/subscriptions\n\nMethod: get"
  @spec list_watched_repos_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec list_watched_repos_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def list_watched_repos_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Activity, :list_watched_repos_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/user/subscriptions",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List watchers\n\nPath: /repos/{owner}/{repo}/subscribers\n\nMethod: get"
  @spec list_watchers_for_repo(GitHubEx.Client.t()) :: result
  @spec list_watchers_for_repo(GitHubEx.Client.t(), map()) :: result
  def list_watchers_for_repo(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Activity, :list_watchers_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/subscribers",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Mark notifications as read\n\nPath: /notifications\n\nMethod: put"
  @spec mark_notifications_as_read(GitHubEx.Client.t()) :: result
  @spec mark_notifications_as_read(GitHubEx.Client.t(), map()) :: result
  def mark_notifications_as_read(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Activity, :mark_notifications_as_read},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [],
      path_template: "/notifications",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Mark repository notifications as read\n\nPath: /repos/{owner}/{repo}/notifications\n\nMethod: put"
  @spec mark_repo_notifications_as_read(GitHubEx.Client.t()) :: result
  @spec mark_repo_notifications_as_read(GitHubEx.Client.t(), map()) :: result
  def mark_repo_notifications_as_read(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Activity, :mark_repo_notifications_as_read},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/notifications",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Mark a thread as done\n\nPath: /notifications/threads/{thread_id}\n\nMethod: delete"
  @spec mark_thread_as_done(GitHubEx.Client.t()) :: result
  @spec mark_thread_as_done(GitHubEx.Client.t(), map()) :: result
  def mark_thread_as_done(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Activity, :mark_thread_as_done},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"thread_id", :thread_id}],
      path_template: "/notifications/threads/{thread_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Mark a thread as read\n\nPath: /notifications/threads/{thread_id}\n\nMethod: patch"
  @spec mark_thread_as_read(GitHubEx.Client.t()) :: result
  @spec mark_thread_as_read(GitHubEx.Client.t(), map()) :: result
  def mark_thread_as_read(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Activity, :mark_thread_as_read},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"thread_id", :thread_id}],
      path_template: "/notifications/threads/{thread_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set a repository subscription\n\nPath: /repos/{owner}/{repo}/subscription\n\nMethod: put"
  @spec set_repo_subscription(GitHubEx.Client.t()) :: result
  @spec set_repo_subscription(GitHubEx.Client.t(), map()) :: result
  def set_repo_subscription(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Activity, :set_repo_subscription},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/subscription",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set a thread subscription\n\nPath: /notifications/threads/{thread_id}/subscription\n\nMethod: put"
  @spec set_thread_subscription(GitHubEx.Client.t()) :: result
  @spec set_thread_subscription(GitHubEx.Client.t(), map()) :: result
  def set_thread_subscription(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Activity, :set_thread_subscription},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"thread_id", :thread_id}],
      path_template: "/notifications/threads/{thread_id}/subscription",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Star a repository for the authenticated user\n\nPath: /user/starred/{owner}/{repo}\n\nMethod: put"
  @spec star_repo_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec star_repo_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def star_repo_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Activity, :star_repo_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/user/starred/{owner}/{repo}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Unstar a repository for the authenticated user\n\nPath: /user/starred/{owner}/{repo}\n\nMethod: delete"
  @spec unstar_repo_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec unstar_repo_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def unstar_repo_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Activity, :unstar_repo_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/user/starred/{owner}/{repo}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end
end

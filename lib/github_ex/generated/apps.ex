defmodule GitHubEx.Apps do
  @moduledoc """
  Generated GitHub REST operations for the `Apps` namespace.

  ## Operations

  * `apps/get-authenticated`
  * `apps/create-from-manifest`
  * `apps/get-webhook-config-for-app`
  * `apps/update-webhook-config-for-app`
  * `apps/list-webhook-deliveries`
  * `apps/get-webhook-delivery`
  * `apps/redeliver-webhook-delivery`
  * `apps/list-installation-requests-for-authenticated-app`
  * `apps/list-installations`
  * `apps/delete-installation`
  * `apps/get-installation`
  * `apps/create-installation-access-token`
  * `apps/suspend-installation`
  * `apps/unsuspend-installation`
  * `apps/delete-authorization`
  * `apps/check-token`
  * `apps/delete-token`
  * `apps/reset-token`
  * `apps/scope-token`
  * `apps/get-by-slug`
  * `apps/list-repos-accessible-to-installation`
  * `apps/revoke-installation-access-token`
  * `apps/get-subscription-plan-for-account`
  * `apps/list-plans`
  * `apps/list-accounts-for-plan`
  * `apps/get-subscription-plan-for-account-stubbed`
  * `apps/list-plans-stubbed`
  * `apps/list-accounts-for-plan-stubbed`
  * `apps/get-org-installation`
  * `apps/get-repo-installation`
  * `apps/list-installations-for-authenticated-user`
  * `apps/list-installation-repos-for-authenticated-user`
  * `apps/add-repo-to-installation-for-authenticated-user`
  * `apps/remove-repo-from-installation-for-authenticated-user`
  * `apps/list-subscriptions-for-authenticated-user`
  * `apps/list-subscriptions-for-authenticated-user-stubbed`
  * `apps/get-user-installation`
  """

  @type result :: {:ok, term()} | {:error, GitHubEx.Error.t()}

  @doc "Add a repository to an app installation\n\nPath: /user/installations/{installation_id}/repositories/{repository_id}\n\nMethod: put"
  @spec add_repo_to_installation_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec add_repo_to_installation_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def add_repo_to_installation_for_authenticated_user(client, params \\ %{})
      when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :add_repo_to_installation_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"installation_id", :installation_id}, {"repository_id", :repository_id}],
      path_template: "/user/installations/{installation_id}/repositories/{repository_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Check a token\n\nPath: /applications/{client_id}/token\n\nMethod: post"
  @spec check_token(GitHubEx.Client.t()) :: result
  @spec check_token(GitHubEx.Client.t(), map()) :: result
  def check_token(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :oauth_application,
      body_mode: :remaining,
      call: {GitHubEx.Apps, :check_token},
      circuit_breaker: "oauth",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"client_id", :client_id}],
      path_template: "/applications/{client_id}/token",
      query: [],
      rate_limit: "github.integration",
      resource: "oauth_application",
      retry: "github.oauth",
      use_default_auth: false
    })
  end

  @doc "Create a GitHub App from a manifest\n\nPath: /app-manifests/{code}/conversions\n\nMethod: post"
  @spec create_from_manifest(GitHubEx.Client.t()) :: result
  @spec create_from_manifest(GitHubEx.Client.t(), map()) :: result
  def create_from_manifest(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :create_from_manifest},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"code", :code}],
      path_template: "/app-manifests/{code}/conversions",
      query: [],
      rate_limit: "github.integration",
      resource: "app_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create an installation access token for an app\n\nPath: /app/installations/{installation_id}/access_tokens\n\nMethod: post"
  @spec create_installation_access_token(GitHubEx.Client.t()) :: result
  @spec create_installation_access_token(GitHubEx.Client.t(), map()) :: result
  def create_installation_access_token(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Apps, :create_installation_access_token},
      circuit_breaker: "app_auth",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"installation_id", :installation_id}],
      path_template: "/app/installations/{installation_id}/access_tokens",
      query: [],
      rate_limit: "github.integration",
      resource: "app_auth",
      retry: "github.app_auth",
      use_default_auth: true
    })
  end

  @doc "Delete an app authorization\n\nPath: /applications/{client_id}/grant\n\nMethod: delete"
  @spec delete_authorization(GitHubEx.Client.t()) :: result
  @spec delete_authorization(GitHubEx.Client.t(), map()) :: result
  def delete_authorization(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :oauth_application,
      body_mode: :remaining,
      call: {GitHubEx.Apps, :delete_authorization},
      circuit_breaker: "oauth",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"client_id", :client_id}],
      path_template: "/applications/{client_id}/grant",
      query: [],
      rate_limit: "github.integration",
      resource: "oauth_application",
      retry: "github.oauth",
      use_default_auth: false
    })
  end

  @doc "Delete an installation for the authenticated app\n\nPath: /app/installations/{installation_id}\n\nMethod: delete"
  @spec delete_installation(GitHubEx.Client.t()) :: result
  @spec delete_installation(GitHubEx.Client.t(), map()) :: result
  def delete_installation(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :delete_installation},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"installation_id", :installation_id}],
      path_template: "/app/installations/{installation_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "app_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Delete an app token\n\nPath: /applications/{client_id}/token\n\nMethod: delete"
  @spec delete_token(GitHubEx.Client.t()) :: result
  @spec delete_token(GitHubEx.Client.t(), map()) :: result
  def delete_token(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :oauth_application,
      body_mode: :remaining,
      call: {GitHubEx.Apps, :delete_token},
      circuit_breaker: "oauth",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"client_id", :client_id}],
      path_template: "/applications/{client_id}/token",
      query: [],
      rate_limit: "github.integration",
      resource: "oauth_application",
      retry: "github.oauth",
      use_default_auth: false
    })
  end

  @doc "Get the authenticated app\n\nPath: /app\n\nMethod: get"
  @spec get_authenticated(GitHubEx.Client.t()) :: result
  @spec get_authenticated(GitHubEx.Client.t(), map()) :: result
  def get_authenticated(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :get_authenticated},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/app",
      query: [],
      rate_limit: "github.integration",
      resource: "app_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get an app\n\nPath: /apps/{app_slug}\n\nMethod: get"
  @spec get_by_slug(GitHubEx.Client.t()) :: result
  @spec get_by_slug(GitHubEx.Client.t(), map()) :: result
  def get_by_slug(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :get_by_slug},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"app_slug", :app_slug}],
      path_template: "/apps/{app_slug}",
      query: [],
      rate_limit: "github.integration",
      resource: "app_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get an installation for the authenticated app\n\nPath: /app/installations/{installation_id}\n\nMethod: get"
  @spec get_installation(GitHubEx.Client.t()) :: result
  @spec get_installation(GitHubEx.Client.t(), map()) :: result
  def get_installation(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :get_installation},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"installation_id", :installation_id}],
      path_template: "/app/installations/{installation_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "app_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Get an organization installation for the authenticated app\n\nPath: /orgs/{org}/installation\n\nMethod: get"
  @spec get_org_installation(GitHubEx.Client.t()) :: result
  @spec get_org_installation(GitHubEx.Client.t(), map()) :: result
  def get_org_installation(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :get_org_installation},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/installation",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a repository installation for the authenticated app\n\nPath: /repos/{owner}/{repo}/installation\n\nMethod: get"
  @spec get_repo_installation(GitHubEx.Client.t()) :: result
  @spec get_repo_installation(GitHubEx.Client.t(), map()) :: result
  def get_repo_installation(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :get_repo_installation},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/installation",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a subscription plan for an account\n\nPath: /marketplace_listing/accounts/{account_id}\n\nMethod: get"
  @spec get_subscription_plan_for_account(GitHubEx.Client.t()) :: result
  @spec get_subscription_plan_for_account(GitHubEx.Client.t(), map()) :: result
  def get_subscription_plan_for_account(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :get_subscription_plan_for_account},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"account_id", :account_id}],
      path_template: "/marketplace_listing/accounts/{account_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a subscription plan for an account (stubbed)\n\nPath: /marketplace_listing/stubbed/accounts/{account_id}\n\nMethod: get"
  @spec get_subscription_plan_for_account_stubbed(GitHubEx.Client.t()) :: result
  @spec get_subscription_plan_for_account_stubbed(GitHubEx.Client.t(), map()) :: result
  def get_subscription_plan_for_account_stubbed(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :get_subscription_plan_for_account_stubbed},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"account_id", :account_id}],
      path_template: "/marketplace_listing/stubbed/accounts/{account_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a user installation for the authenticated app\n\nPath: /users/{username}/installation\n\nMethod: get"
  @spec get_user_installation(GitHubEx.Client.t()) :: result
  @spec get_user_installation(GitHubEx.Client.t(), map()) :: result
  def get_user_installation(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :get_user_installation},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"username", :username}],
      path_template: "/users/{username}/installation",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a webhook configuration for an app\n\nPath: /app/hook/config\n\nMethod: get"
  @spec get_webhook_config_for_app(GitHubEx.Client.t()) :: result
  @spec get_webhook_config_for_app(GitHubEx.Client.t(), map()) :: result
  def get_webhook_config_for_app(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :get_webhook_config_for_app},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/app/hook/config",
      query: [],
      rate_limit: "github.integration",
      resource: "app_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a delivery for an app webhook\n\nPath: /app/hook/deliveries/{delivery_id}\n\nMethod: get"
  @spec get_webhook_delivery(GitHubEx.Client.t()) :: result
  @spec get_webhook_delivery(GitHubEx.Client.t(), map()) :: result
  def get_webhook_delivery(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :get_webhook_delivery},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"delivery_id", :delivery_id}],
      path_template: "/app/hook/deliveries/{delivery_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "app_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List accounts for a plan\n\nPath: /marketplace_listing/plans/{plan_id}/accounts\n\nMethod: get"
  @spec list_accounts_for_plan(GitHubEx.Client.t()) :: result
  @spec list_accounts_for_plan(GitHubEx.Client.t(), map()) :: result
  def list_accounts_for_plan(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :list_accounts_for_plan},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"plan_id", :plan_id}],
      path_template: "/marketplace_listing/plans/{plan_id}/accounts",
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

  @doc "List accounts for a plan (stubbed)\n\nPath: /marketplace_listing/stubbed/plans/{plan_id}/accounts\n\nMethod: get"
  @spec list_accounts_for_plan_stubbed(GitHubEx.Client.t()) :: result
  @spec list_accounts_for_plan_stubbed(GitHubEx.Client.t(), map()) :: result
  def list_accounts_for_plan_stubbed(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :list_accounts_for_plan_stubbed},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"plan_id", :plan_id}],
      path_template: "/marketplace_listing/stubbed/plans/{plan_id}/accounts",
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

  @doc "List repositories accessible to the user access token\n\nPath: /user/installations/{installation_id}/repositories\n\nMethod: get"
  @spec list_installation_repos_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec list_installation_repos_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def list_installation_repos_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :list_installation_repos_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"installation_id", :installation_id}],
      path_template: "/user/installations/{installation_id}/repositories",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List installation requests for the authenticated app\n\nPath: /app/installation-requests\n\nMethod: get"
  @spec list_installation_requests_for_authenticated_app(GitHubEx.Client.t()) :: result
  @spec list_installation_requests_for_authenticated_app(GitHubEx.Client.t(), map()) :: result
  def list_installation_requests_for_authenticated_app(client, params \\ %{})
      when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :list_installation_requests_for_authenticated_app},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/app/installation-requests",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "app_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List installations for the authenticated app\n\nPath: /app/installations\n\nMethod: get"
  @spec list_installations(GitHubEx.Client.t()) :: result
  @spec list_installations(GitHubEx.Client.t(), map()) :: result
  def list_installations(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :list_installations},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/app/installations",
      query: [
        {"per_page", :per_page},
        {"page", :page},
        {"since", :since},
        {"outdated", :outdated}
      ],
      rate_limit: "github.integration",
      resource: "app_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List app installations accessible to the user access token\n\nPath: /user/installations\n\nMethod: get"
  @spec list_installations_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec list_installations_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def list_installations_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :list_installations_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/user/installations",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List plans\n\nPath: /marketplace_listing/plans\n\nMethod: get"
  @spec list_plans(GitHubEx.Client.t()) :: result
  @spec list_plans(GitHubEx.Client.t(), map()) :: result
  def list_plans(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :list_plans},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/marketplace_listing/plans",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List plans (stubbed)\n\nPath: /marketplace_listing/stubbed/plans\n\nMethod: get"
  @spec list_plans_stubbed(GitHubEx.Client.t()) :: result
  @spec list_plans_stubbed(GitHubEx.Client.t(), map()) :: result
  def list_plans_stubbed(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :list_plans_stubbed},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/marketplace_listing/stubbed/plans",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repositories accessible to the app installation\n\nPath: /installation/repositories\n\nMethod: get"
  @spec list_repos_accessible_to_installation(GitHubEx.Client.t()) :: result
  @spec list_repos_accessible_to_installation(GitHubEx.Client.t(), map()) :: result
  def list_repos_accessible_to_installation(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :list_repos_accessible_to_installation},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/installation/repositories",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List subscriptions for the authenticated user\n\nPath: /user/marketplace_purchases\n\nMethod: get"
  @spec list_subscriptions_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec list_subscriptions_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def list_subscriptions_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :list_subscriptions_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/user/marketplace_purchases",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List subscriptions for the authenticated user (stubbed)\n\nPath: /user/marketplace_purchases/stubbed\n\nMethod: get"
  @spec list_subscriptions_for_authenticated_user_stubbed(GitHubEx.Client.t()) :: result
  @spec list_subscriptions_for_authenticated_user_stubbed(GitHubEx.Client.t(), map()) :: result
  def list_subscriptions_for_authenticated_user_stubbed(client, params \\ %{})
      when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :list_subscriptions_for_authenticated_user_stubbed},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/user/marketplace_purchases/stubbed",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List deliveries for an app webhook\n\nPath: /app/hook/deliveries\n\nMethod: get"
  @spec list_webhook_deliveries(GitHubEx.Client.t()) :: result
  @spec list_webhook_deliveries(GitHubEx.Client.t(), map()) :: result
  def list_webhook_deliveries(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :list_webhook_deliveries},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/app/hook/deliveries",
      query: [{"per_page", :per_page}, {"cursor", :cursor}],
      rate_limit: "github.integration",
      resource: "app_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Redeliver a delivery for an app webhook\n\nPath: /app/hook/deliveries/{delivery_id}/attempts\n\nMethod: post"
  @spec redeliver_webhook_delivery(GitHubEx.Client.t()) :: result
  @spec redeliver_webhook_delivery(GitHubEx.Client.t(), map()) :: result
  def redeliver_webhook_delivery(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :redeliver_webhook_delivery},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"delivery_id", :delivery_id}],
      path_template: "/app/hook/deliveries/{delivery_id}/attempts",
      query: [],
      rate_limit: "github.integration",
      resource: "app_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Remove a repository from an app installation\n\nPath: /user/installations/{installation_id}/repositories/{repository_id}\n\nMethod: delete"
  @spec remove_repo_from_installation_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec remove_repo_from_installation_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def remove_repo_from_installation_for_authenticated_user(client, params \\ %{})
      when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :remove_repo_from_installation_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"installation_id", :installation_id}, {"repository_id", :repository_id}],
      path_template: "/user/installations/{installation_id}/repositories/{repository_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Reset a token\n\nPath: /applications/{client_id}/token\n\nMethod: patch"
  @spec reset_token(GitHubEx.Client.t()) :: result
  @spec reset_token(GitHubEx.Client.t(), map()) :: result
  def reset_token(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :oauth_application,
      body_mode: :remaining,
      call: {GitHubEx.Apps, :reset_token},
      circuit_breaker: "oauth",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"client_id", :client_id}],
      path_template: "/applications/{client_id}/token",
      query: [],
      rate_limit: "github.integration",
      resource: "oauth_application",
      retry: "github.oauth",
      use_default_auth: false
    })
  end

  @doc "Revoke an installation access token\n\nPath: /installation/token\n\nMethod: delete"
  @spec revoke_installation_access_token(GitHubEx.Client.t()) :: result
  @spec revoke_installation_access_token(GitHubEx.Client.t(), map()) :: result
  def revoke_installation_access_token(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :revoke_installation_access_token},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [],
      path_template: "/installation/token",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Create a scoped access token\n\nPath: /applications/{client_id}/token/scoped\n\nMethod: post"
  @spec scope_token(GitHubEx.Client.t()) :: result
  @spec scope_token(GitHubEx.Client.t(), map()) :: result
  def scope_token(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :oauth_application,
      body_mode: :remaining,
      call: {GitHubEx.Apps, :scope_token},
      circuit_breaker: "oauth",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"client_id", :client_id}],
      path_template: "/applications/{client_id}/token/scoped",
      query: [],
      rate_limit: "github.integration",
      resource: "oauth_application",
      retry: "github.oauth",
      use_default_auth: false
    })
  end

  @doc "Suspend an app installation\n\nPath: /app/installations/{installation_id}/suspended\n\nMethod: put"
  @spec suspend_installation(GitHubEx.Client.t()) :: result
  @spec suspend_installation(GitHubEx.Client.t(), map()) :: result
  def suspend_installation(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :suspend_installation},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"installation_id", :installation_id}],
      path_template: "/app/installations/{installation_id}/suspended",
      query: [],
      rate_limit: "github.integration",
      resource: "app_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Unsuspend an app installation\n\nPath: /app/installations/{installation_id}/suspended\n\nMethod: delete"
  @spec unsuspend_installation(GitHubEx.Client.t()) :: result
  @spec unsuspend_installation(GitHubEx.Client.t(), map()) :: result
  def unsuspend_installation(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Apps, :unsuspend_installation},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"installation_id", :installation_id}],
      path_template: "/app/installations/{installation_id}/suspended",
      query: [],
      rate_limit: "github.integration",
      resource: "app_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update a webhook configuration for an app\n\nPath: /app/hook/config\n\nMethod: patch"
  @spec update_webhook_config_for_app(GitHubEx.Client.t()) :: result
  @spec update_webhook_config_for_app(GitHubEx.Client.t(), map()) :: result
  def update_webhook_config_for_app(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Apps, :update_webhook_config_for_app},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [],
      path_template: "/app/hook/config",
      query: [],
      rate_limit: "github.integration",
      resource: "app_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

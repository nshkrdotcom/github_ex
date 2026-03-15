defmodule GitHubSDK.PrivateRegistries do
  @moduledoc """
  Generated GitHub REST operations for the `PrivateRegistries` namespace.

  ## Operations

  * `private-registries/create-org-private-registry`
  * `private-registries/list-org-private-registries`
  * `private-registries/get-org-public-key`
  * `private-registries/delete-org-private-registry`
  * `private-registries/get-org-private-registry`
  * `private-registries/update-org-private-registry`
  """

  @type result :: {:ok, term()} | {:error, GitHubSDK.Error.t()}

  @doc "Create a private registry for an organization\n\nPath: /orgs/{org}/private-registries\n\nMethod: post"
  @spec create_org_private_registry(GitHubSDK.Client.t()) :: result
  @spec create_org_private_registry(GitHubSDK.Client.t(), map()) :: result
  def create_org_private_registry(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.PrivateRegistries, :create_org_private_registry},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/private-registries",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Delete a private registry for an organization\n\nPath: /orgs/{org}/private-registries/{secret_name}\n\nMethod: delete"
  @spec delete_org_private_registry(GitHubSDK.Client.t()) :: result
  @spec delete_org_private_registry(GitHubSDK.Client.t(), map()) :: result
  def delete_org_private_registry(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.PrivateRegistries, :delete_org_private_registry},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"secret_name", :secret_name}],
      path_template: "/orgs/{org}/private-registries/{secret_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Get a private registry for an organization\n\nPath: /orgs/{org}/private-registries/{secret_name}\n\nMethod: get"
  @spec get_org_private_registry(GitHubSDK.Client.t()) :: result
  @spec get_org_private_registry(GitHubSDK.Client.t(), map()) :: result
  def get_org_private_registry(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.PrivateRegistries, :get_org_private_registry},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"secret_name", :secret_name}],
      path_template: "/orgs/{org}/private-registries/{secret_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get private registries public key for an organization\n\nPath: /orgs/{org}/private-registries/public-key\n\nMethod: get"
  @spec get_org_public_key(GitHubSDK.Client.t()) :: result
  @spec get_org_public_key(GitHubSDK.Client.t(), map()) :: result
  def get_org_public_key(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.PrivateRegistries, :get_org_public_key},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/private-registries/public-key",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List private registries for an organization\n\nPath: /orgs/{org}/private-registries\n\nMethod: get"
  @spec list_org_private_registries(GitHubSDK.Client.t()) :: result
  @spec list_org_private_registries(GitHubSDK.Client.t(), map()) :: result
  def list_org_private_registries(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.PrivateRegistries, :list_org_private_registries},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/private-registries",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Update a private registry for an organization\n\nPath: /orgs/{org}/private-registries/{secret_name}\n\nMethod: patch"
  @spec update_org_private_registry(GitHubSDK.Client.t()) :: result
  @spec update_org_private_registry(GitHubSDK.Client.t(), map()) :: result
  def update_org_private_registry(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.PrivateRegistries, :update_org_private_registry},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"org", :org}, {"secret_name", :secret_name}],
      path_template: "/orgs/{org}/private-registries/{secret_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

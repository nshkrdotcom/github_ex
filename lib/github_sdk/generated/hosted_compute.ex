defmodule GitHubSDK.HostedCompute do
  @moduledoc """
  Generated GitHub REST operations for the `HostedCompute` namespace.

  ## Operations

  * `hosted-compute/create-network-configuration-for-org`
  * `hosted-compute/list-network-configurations-for-org`
  * `hosted-compute/delete-network-configuration-from-org`
  * `hosted-compute/get-network-configuration-for-org`
  * `hosted-compute/update-network-configuration-for-org`
  * `hosted-compute/get-network-settings-for-org`
  """

  @type result :: {:ok, term()} | {:error, GitHubSDK.Error.t()}

  @doc "Create a hosted compute network configuration for an organization\n\nPath: /orgs/{org}/settings/network-configurations\n\nMethod: post"
  @spec create_network_configuration_for_org(GitHubSDK.Client.t()) :: result
  @spec create_network_configuration_for_org(GitHubSDK.Client.t(), map()) :: result
  def create_network_configuration_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.HostedCompute, :create_network_configuration_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/settings/network-configurations",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Delete a hosted compute network configuration from an organization\n\nPath: /orgs/{org}/settings/network-configurations/{network_configuration_id}\n\nMethod: delete"
  @spec delete_network_configuration_from_org(GitHubSDK.Client.t()) :: result
  @spec delete_network_configuration_from_org(GitHubSDK.Client.t(), map()) :: result
  def delete_network_configuration_from_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.HostedCompute, :delete_network_configuration_from_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"network_configuration_id", :network_configuration_id}],
      path_template: "/orgs/{org}/settings/network-configurations/{network_configuration_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Get a hosted compute network configuration for an organization\n\nPath: /orgs/{org}/settings/network-configurations/{network_configuration_id}\n\nMethod: get"
  @spec get_network_configuration_for_org(GitHubSDK.Client.t()) :: result
  @spec get_network_configuration_for_org(GitHubSDK.Client.t(), map()) :: result
  def get_network_configuration_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.HostedCompute, :get_network_configuration_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"network_configuration_id", :network_configuration_id}],
      path_template: "/orgs/{org}/settings/network-configurations/{network_configuration_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a hosted compute network settings resource for an organization\n\nPath: /orgs/{org}/settings/network-settings/{network_settings_id}\n\nMethod: get"
  @spec get_network_settings_for_org(GitHubSDK.Client.t()) :: result
  @spec get_network_settings_for_org(GitHubSDK.Client.t(), map()) :: result
  def get_network_settings_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.HostedCompute, :get_network_settings_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"network_settings_id", :network_settings_id}],
      path_template: "/orgs/{org}/settings/network-settings/{network_settings_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List hosted compute network configurations for an organization\n\nPath: /orgs/{org}/settings/network-configurations\n\nMethod: get"
  @spec list_network_configurations_for_org(GitHubSDK.Client.t()) :: result
  @spec list_network_configurations_for_org(GitHubSDK.Client.t(), map()) :: result
  def list_network_configurations_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.HostedCompute, :list_network_configurations_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/settings/network-configurations",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Update a hosted compute network configuration for an organization\n\nPath: /orgs/{org}/settings/network-configurations/{network_configuration_id}\n\nMethod: patch"
  @spec update_network_configuration_for_org(GitHubSDK.Client.t()) :: result
  @spec update_network_configuration_for_org(GitHubSDK.Client.t(), map()) :: result
  def update_network_configuration_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.HostedCompute, :update_network_configuration_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"org", :org}, {"network_configuration_id", :network_configuration_id}],
      path_template: "/orgs/{org}/settings/network-configurations/{network_configuration_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

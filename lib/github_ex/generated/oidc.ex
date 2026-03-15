defmodule GitHubEx.Oidc do
  @moduledoc """
  Generated GitHub REST operations for the `Oidc` namespace.

  ## Operations

  * `oidc/create-oidc-custom-property-inclusion-for-enterprise`
  * `oidc/list-oidc-custom-property-inclusions-for-enterprise`
  * `oidc/delete-oidc-custom-property-inclusion-for-enterprise`
  * `oidc/create-oidc-custom-property-inclusion-for-org`
  * `oidc/list-oidc-custom-property-inclusions-for-org`
  * `oidc/delete-oidc-custom-property-inclusion-for-org`
  * `oidc/get-oidc-custom-sub-template-for-org`
  * `oidc/update-oidc-custom-sub-template-for-org`
  """

  @type result :: {:ok, term()} | {:error, GitHubEx.Error.t()}

  @doc "Create an OIDC custom property inclusion for an enterprise\n\nPath: /enterprises/{enterprise}/actions/oidc/customization/properties/repo\n\nMethod: post"
  @spec create_oidc_custom_property_inclusion_for_enterprise(GitHubEx.Client.t()) :: result
  @spec create_oidc_custom_property_inclusion_for_enterprise(GitHubEx.Client.t(), map()) :: result
  def create_oidc_custom_property_inclusion_for_enterprise(client, params \\ %{})
      when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Oidc, :create_oidc_custom_property_inclusion_for_enterprise},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"enterprise", :enterprise}],
      path_template: "/enterprises/{enterprise}/actions/oidc/customization/properties/repo",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create an OIDC custom property inclusion for an organization\n\nPath: /orgs/{org}/actions/oidc/customization/properties/repo\n\nMethod: post"
  @spec create_oidc_custom_property_inclusion_for_org(GitHubEx.Client.t()) :: result
  @spec create_oidc_custom_property_inclusion_for_org(GitHubEx.Client.t(), map()) :: result
  def create_oidc_custom_property_inclusion_for_org(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Oidc, :create_oidc_custom_property_inclusion_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/oidc/customization/properties/repo",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Delete an OIDC custom property inclusion for an enterprise\n\nPath: /enterprises/{enterprise}/actions/oidc/customization/properties/repo/{custom_property_name}\n\nMethod: delete"
  @spec delete_oidc_custom_property_inclusion_for_enterprise(GitHubEx.Client.t()) :: result
  @spec delete_oidc_custom_property_inclusion_for_enterprise(GitHubEx.Client.t(), map()) :: result
  def delete_oidc_custom_property_inclusion_for_enterprise(client, params \\ %{})
      when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Oidc, :delete_oidc_custom_property_inclusion_for_enterprise},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"enterprise", :enterprise}, {"custom_property_name", :custom_property_name}],
      path_template:
        "/enterprises/{enterprise}/actions/oidc/customization/properties/repo/{custom_property_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete an OIDC custom property inclusion for an organization\n\nPath: /orgs/{org}/actions/oidc/customization/properties/repo/{custom_property_name}\n\nMethod: delete"
  @spec delete_oidc_custom_property_inclusion_for_org(GitHubEx.Client.t()) :: result
  @spec delete_oidc_custom_property_inclusion_for_org(GitHubEx.Client.t(), map()) :: result
  def delete_oidc_custom_property_inclusion_for_org(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Oidc, :delete_oidc_custom_property_inclusion_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"custom_property_name", :custom_property_name}],
      path_template:
        "/orgs/{org}/actions/oidc/customization/properties/repo/{custom_property_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Get the customization template for an OIDC subject claim for an organization\n\nPath: /orgs/{org}/actions/oidc/customization/sub\n\nMethod: get"
  @spec get_oidc_custom_sub_template_for_org(GitHubEx.Client.t()) :: result
  @spec get_oidc_custom_sub_template_for_org(GitHubEx.Client.t(), map()) :: result
  def get_oidc_custom_sub_template_for_org(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Oidc, :get_oidc_custom_sub_template_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/oidc/customization/sub",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List OIDC custom property inclusions for an enterprise\n\nPath: /enterprises/{enterprise}/actions/oidc/customization/properties/repo\n\nMethod: get"
  @spec list_oidc_custom_property_inclusions_for_enterprise(GitHubEx.Client.t()) :: result
  @spec list_oidc_custom_property_inclusions_for_enterprise(GitHubEx.Client.t(), map()) :: result
  def list_oidc_custom_property_inclusions_for_enterprise(client, params \\ %{})
      when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Oidc, :list_oidc_custom_property_inclusions_for_enterprise},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"enterprise", :enterprise}],
      path_template: "/enterprises/{enterprise}/actions/oidc/customization/properties/repo",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List OIDC custom property inclusions for an organization\n\nPath: /orgs/{org}/actions/oidc/customization/properties/repo\n\nMethod: get"
  @spec list_oidc_custom_property_inclusions_for_org(GitHubEx.Client.t()) :: result
  @spec list_oidc_custom_property_inclusions_for_org(GitHubEx.Client.t(), map()) :: result
  def list_oidc_custom_property_inclusions_for_org(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Oidc, :list_oidc_custom_property_inclusions_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/oidc/customization/properties/repo",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Set the customization template for an OIDC subject claim for an organization\n\nPath: /orgs/{org}/actions/oidc/customization/sub\n\nMethod: put"
  @spec update_oidc_custom_sub_template_for_org(GitHubEx.Client.t()) :: result
  @spec update_oidc_custom_sub_template_for_org(GitHubEx.Client.t(), map()) :: result
  def update_oidc_custom_sub_template_for_org(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Oidc, :update_oidc_custom_sub_template_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/oidc/customization/sub",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

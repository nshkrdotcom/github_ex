defmodule GitHubSDK.CodeSecurity do
  @moduledoc """
  Generated GitHub REST operations for the `CodeSecurity` namespace.

  ## Operations

  * `code-security/create-configuration-for-enterprise`
  * `code-security/get-configurations-for-enterprise`
  * `code-security/get-default-configurations-for-enterprise`
  * `code-security/delete-configuration-for-enterprise`
  * `code-security/get-single-configuration-for-enterprise`
  * `code-security/update-enterprise-configuration`
  * `code-security/attach-enterprise-configuration`
  * `code-security/set-configuration-as-default-for-enterprise`
  * `code-security/get-repositories-for-enterprise-configuration`
  * `code-security/create-configuration`
  * `code-security/get-configurations-for-org`
  * `code-security/get-default-configurations`
  * `code-security/detach-configuration`
  * `code-security/delete-configuration`
  * `code-security/get-configuration`
  * `code-security/update-configuration`
  * `code-security/attach-configuration`
  * `code-security/set-configuration-as-default`
  * `code-security/get-repositories-for-configuration`
  * `code-security/get-configuration-for-repository`
  """

  @type result :: {:ok, term()} | {:error, GitHubSDK.Error.t()}

  @doc "Attach a configuration to repositories\n\nPath: /orgs/{org}/code-security/configurations/{configuration_id}/attach\n\nMethod: post"
  @spec attach_configuration(GitHubSDK.Client.t()) :: result
  @spec attach_configuration(GitHubSDK.Client.t(), map()) :: result
  def attach_configuration(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.CodeSecurity, :attach_configuration},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}, {"configuration_id", :configuration_id}],
      path_template: "/orgs/{org}/code-security/configurations/{configuration_id}/attach",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Attach an enterprise configuration to repositories\n\nPath: /enterprises/{enterprise}/code-security/configurations/{configuration_id}/attach\n\nMethod: post"
  @spec attach_enterprise_configuration(GitHubSDK.Client.t()) :: result
  @spec attach_enterprise_configuration(GitHubSDK.Client.t(), map()) :: result
  def attach_enterprise_configuration(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.CodeSecurity, :attach_enterprise_configuration},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"enterprise", :enterprise}, {"configuration_id", :configuration_id}],
      path_template:
        "/enterprises/{enterprise}/code-security/configurations/{configuration_id}/attach",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a code security configuration\n\nPath: /orgs/{org}/code-security/configurations\n\nMethod: post"
  @spec create_configuration(GitHubSDK.Client.t()) :: result
  @spec create_configuration(GitHubSDK.Client.t(), map()) :: result
  def create_configuration(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.CodeSecurity, :create_configuration},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/code-security/configurations",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a code security configuration for an enterprise\n\nPath: /enterprises/{enterprise}/code-security/configurations\n\nMethod: post"
  @spec create_configuration_for_enterprise(GitHubSDK.Client.t()) :: result
  @spec create_configuration_for_enterprise(GitHubSDK.Client.t(), map()) :: result
  def create_configuration_for_enterprise(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.CodeSecurity, :create_configuration_for_enterprise},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"enterprise", :enterprise}],
      path_template: "/enterprises/{enterprise}/code-security/configurations",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Delete a code security configuration\n\nPath: /orgs/{org}/code-security/configurations/{configuration_id}\n\nMethod: delete"
  @spec delete_configuration(GitHubSDK.Client.t()) :: result
  @spec delete_configuration(GitHubSDK.Client.t(), map()) :: result
  def delete_configuration(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.CodeSecurity, :delete_configuration},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"configuration_id", :configuration_id}],
      path_template: "/orgs/{org}/code-security/configurations/{configuration_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a code security configuration for an enterprise\n\nPath: /enterprises/{enterprise}/code-security/configurations/{configuration_id}\n\nMethod: delete"
  @spec delete_configuration_for_enterprise(GitHubSDK.Client.t()) :: result
  @spec delete_configuration_for_enterprise(GitHubSDK.Client.t(), map()) :: result
  def delete_configuration_for_enterprise(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.CodeSecurity, :delete_configuration_for_enterprise},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"enterprise", :enterprise}, {"configuration_id", :configuration_id}],
      path_template: "/enterprises/{enterprise}/code-security/configurations/{configuration_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Detach configurations from repositories\n\nPath: /orgs/{org}/code-security/configurations/detach\n\nMethod: delete"
  @spec detach_configuration(GitHubSDK.Client.t()) :: result
  @spec detach_configuration(GitHubSDK.Client.t(), map()) :: result
  def detach_configuration(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.CodeSecurity, :detach_configuration},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/code-security/configurations/detach",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Get a code security configuration\n\nPath: /orgs/{org}/code-security/configurations/{configuration_id}\n\nMethod: get"
  @spec get_configuration(GitHubSDK.Client.t()) :: result
  @spec get_configuration(GitHubSDK.Client.t(), map()) :: result
  def get_configuration(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.CodeSecurity, :get_configuration},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"configuration_id", :configuration_id}],
      path_template: "/orgs/{org}/code-security/configurations/{configuration_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get the code security configuration associated with a repository\n\nPath: /repos/{owner}/{repo}/code-security-configuration\n\nMethod: get"
  @spec get_configuration_for_repository(GitHubSDK.Client.t()) :: result
  @spec get_configuration_for_repository(GitHubSDK.Client.t(), map()) :: result
  def get_configuration_for_repository(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.CodeSecurity, :get_configuration_for_repository},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/code-security-configuration",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get code security configurations for an enterprise\n\nPath: /enterprises/{enterprise}/code-security/configurations\n\nMethod: get"
  @spec get_configurations_for_enterprise(GitHubSDK.Client.t()) :: result
  @spec get_configurations_for_enterprise(GitHubSDK.Client.t(), map()) :: result
  def get_configurations_for_enterprise(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.CodeSecurity, :get_configurations_for_enterprise},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"enterprise", :enterprise}],
      path_template: "/enterprises/{enterprise}/code-security/configurations",
      query: [{"per_page", :per_page}, {"before", :before}, {"after", :after}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get code security configurations for an organization\n\nPath: /orgs/{org}/code-security/configurations\n\nMethod: get"
  @spec get_configurations_for_org(GitHubSDK.Client.t()) :: result
  @spec get_configurations_for_org(GitHubSDK.Client.t(), map()) :: result
  def get_configurations_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.CodeSecurity, :get_configurations_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/code-security/configurations",
      query: [
        {"target_type", :target_type},
        {"per_page", :per_page},
        {"before", :before},
        {"after", :after}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get default code security configurations\n\nPath: /orgs/{org}/code-security/configurations/defaults\n\nMethod: get"
  @spec get_default_configurations(GitHubSDK.Client.t()) :: result
  @spec get_default_configurations(GitHubSDK.Client.t(), map()) :: result
  def get_default_configurations(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.CodeSecurity, :get_default_configurations},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/code-security/configurations/defaults",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get default code security configurations for an enterprise\n\nPath: /enterprises/{enterprise}/code-security/configurations/defaults\n\nMethod: get"
  @spec get_default_configurations_for_enterprise(GitHubSDK.Client.t()) :: result
  @spec get_default_configurations_for_enterprise(GitHubSDK.Client.t(), map()) :: result
  def get_default_configurations_for_enterprise(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.CodeSecurity, :get_default_configurations_for_enterprise},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"enterprise", :enterprise}],
      path_template: "/enterprises/{enterprise}/code-security/configurations/defaults",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get repositories associated with a code security configuration\n\nPath: /orgs/{org}/code-security/configurations/{configuration_id}/repositories\n\nMethod: get"
  @spec get_repositories_for_configuration(GitHubSDK.Client.t()) :: result
  @spec get_repositories_for_configuration(GitHubSDK.Client.t(), map()) :: result
  def get_repositories_for_configuration(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.CodeSecurity, :get_repositories_for_configuration},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"configuration_id", :configuration_id}],
      path_template: "/orgs/{org}/code-security/configurations/{configuration_id}/repositories",
      query: [
        {"per_page", :per_page},
        {"before", :before},
        {"after", :after},
        {"status", :status}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get repositories associated with an enterprise code security configuration\n\nPath: /enterprises/{enterprise}/code-security/configurations/{configuration_id}/repositories\n\nMethod: get"
  @spec get_repositories_for_enterprise_configuration(GitHubSDK.Client.t()) :: result
  @spec get_repositories_for_enterprise_configuration(GitHubSDK.Client.t(), map()) :: result
  def get_repositories_for_enterprise_configuration(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.CodeSecurity, :get_repositories_for_enterprise_configuration},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"enterprise", :enterprise}, {"configuration_id", :configuration_id}],
      path_template:
        "/enterprises/{enterprise}/code-security/configurations/{configuration_id}/repositories",
      query: [
        {"per_page", :per_page},
        {"before", :before},
        {"after", :after},
        {"status", :status}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Retrieve a code security configuration of an enterprise\n\nPath: /enterprises/{enterprise}/code-security/configurations/{configuration_id}\n\nMethod: get"
  @spec get_single_configuration_for_enterprise(GitHubSDK.Client.t()) :: result
  @spec get_single_configuration_for_enterprise(GitHubSDK.Client.t(), map()) :: result
  def get_single_configuration_for_enterprise(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.CodeSecurity, :get_single_configuration_for_enterprise},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"enterprise", :enterprise}, {"configuration_id", :configuration_id}],
      path_template: "/enterprises/{enterprise}/code-security/configurations/{configuration_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Set a code security configuration as a default for an organization\n\nPath: /orgs/{org}/code-security/configurations/{configuration_id}/defaults\n\nMethod: put"
  @spec set_configuration_as_default(GitHubSDK.Client.t()) :: result
  @spec set_configuration_as_default(GitHubSDK.Client.t(), map()) :: result
  def set_configuration_as_default(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.CodeSecurity, :set_configuration_as_default},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"configuration_id", :configuration_id}],
      path_template: "/orgs/{org}/code-security/configurations/{configuration_id}/defaults",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set a code security configuration as a default for an enterprise\n\nPath: /enterprises/{enterprise}/code-security/configurations/{configuration_id}/defaults\n\nMethod: put"
  @spec set_configuration_as_default_for_enterprise(GitHubSDK.Client.t()) :: result
  @spec set_configuration_as_default_for_enterprise(GitHubSDK.Client.t(), map()) :: result
  def set_configuration_as_default_for_enterprise(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.CodeSecurity, :set_configuration_as_default_for_enterprise},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"enterprise", :enterprise}, {"configuration_id", :configuration_id}],
      path_template:
        "/enterprises/{enterprise}/code-security/configurations/{configuration_id}/defaults",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update a code security configuration\n\nPath: /orgs/{org}/code-security/configurations/{configuration_id}\n\nMethod: patch"
  @spec update_configuration(GitHubSDK.Client.t()) :: result
  @spec update_configuration(GitHubSDK.Client.t(), map()) :: result
  def update_configuration(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.CodeSecurity, :update_configuration},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"org", :org}, {"configuration_id", :configuration_id}],
      path_template: "/orgs/{org}/code-security/configurations/{configuration_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update a custom code security configuration for an enterprise\n\nPath: /enterprises/{enterprise}/code-security/configurations/{configuration_id}\n\nMethod: patch"
  @spec update_enterprise_configuration(GitHubSDK.Client.t()) :: result
  @spec update_enterprise_configuration(GitHubSDK.Client.t(), map()) :: result
  def update_enterprise_configuration(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.CodeSecurity, :update_enterprise_configuration},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"enterprise", :enterprise}, {"configuration_id", :configuration_id}],
      path_template: "/enterprises/{enterprise}/code-security/configurations/{configuration_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

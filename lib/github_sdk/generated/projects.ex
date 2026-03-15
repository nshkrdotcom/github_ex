defmodule GitHubSDK.Projects do
  @moduledoc """
  Generated GitHub REST operations for the `Projects` namespace.

  ## Operations

  * `projects/list-for-org`
  * `projects/get-for-org`
  * `projects/create-draft-item-for-org`
  * `projects/add-field-for-org`
  * `projects/list-fields-for-org`
  * `projects/get-field-for-org`
  * `projects/add-item-for-org`
  * `projects/list-items-for-org`
  * `projects/delete-item-for-org`
  * `projects/get-org-item`
  * `projects/update-item-for-org`
  * `projects/create-view-for-org`
  * `projects/list-view-items-for-org`
  * `projects/create-draft-item-for-authenticated-user`
  * `projects/create-view-for-user`
  * `projects/list-for-user`
  * `projects/get-for-user`
  * `projects/add-field-for-user`
  * `projects/list-fields-for-user`
  * `projects/get-field-for-user`
  * `projects/add-item-for-user`
  * `projects/list-items-for-user`
  * `projects/delete-item-for-user`
  * `projects/get-user-item`
  * `projects/update-item-for-user`
  * `projects/list-view-items-for-user`
  """

  @type result :: {:ok, term()} | {:error, GitHubSDK.Error.t()}

  @doc "Add a field to an organization-owned project.\n\nPath: /orgs/{org}/projectsV2/{project_number}/fields\n\nMethod: post"
  @spec add_field_for_org(GitHubSDK.Client.t()) :: result
  @spec add_field_for_org(GitHubSDK.Client.t(), map()) :: result
  def add_field_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Projects, :add_field_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"project_number", :project_number}, {"org", :org}],
      path_template: "/orgs/{org}/projectsV2/{project_number}/fields",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Add field to user owned project\n\nPath: /users/{username}/projectsV2/{project_number}/fields\n\nMethod: post"
  @spec add_field_for_user(GitHubSDK.Client.t()) :: result
  @spec add_field_for_user(GitHubSDK.Client.t(), map()) :: result
  def add_field_for_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Projects, :add_field_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"username", :username}, {"project_number", :project_number}],
      path_template: "/users/{username}/projectsV2/{project_number}/fields",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Add item to organization owned project\n\nPath: /orgs/{org}/projectsV2/{project_number}/items\n\nMethod: post"
  @spec add_item_for_org(GitHubSDK.Client.t()) :: result
  @spec add_item_for_org(GitHubSDK.Client.t(), map()) :: result
  def add_item_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Projects, :add_item_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}, {"project_number", :project_number}],
      path_template: "/orgs/{org}/projectsV2/{project_number}/items",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Add item to user owned project\n\nPath: /users/{username}/projectsV2/{project_number}/items\n\nMethod: post"
  @spec add_item_for_user(GitHubSDK.Client.t()) :: result
  @spec add_item_for_user(GitHubSDK.Client.t(), map()) :: result
  def add_item_for_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Projects, :add_item_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"username", :username}, {"project_number", :project_number}],
      path_template: "/users/{username}/projectsV2/{project_number}/items",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create draft item for user owned project\n\nPath: /user/{user_id}/projectsV2/{project_number}/drafts\n\nMethod: post"
  @spec create_draft_item_for_authenticated_user(GitHubSDK.Client.t()) :: result
  @spec create_draft_item_for_authenticated_user(GitHubSDK.Client.t(), map()) :: result
  def create_draft_item_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Projects, :create_draft_item_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"user_id", :user_id}, {"project_number", :project_number}],
      path_template: "/user/{user_id}/projectsV2/{project_number}/drafts",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create draft item for organization owned project\n\nPath: /orgs/{org}/projectsV2/{project_number}/drafts\n\nMethod: post"
  @spec create_draft_item_for_org(GitHubSDK.Client.t()) :: result
  @spec create_draft_item_for_org(GitHubSDK.Client.t(), map()) :: result
  def create_draft_item_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Projects, :create_draft_item_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}, {"project_number", :project_number}],
      path_template: "/orgs/{org}/projectsV2/{project_number}/drafts",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a view for an organization-owned project\n\nPath: /orgs/{org}/projectsV2/{project_number}/views\n\nMethod: post"
  @spec create_view_for_org(GitHubSDK.Client.t()) :: result
  @spec create_view_for_org(GitHubSDK.Client.t(), map()) :: result
  def create_view_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Projects, :create_view_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}, {"project_number", :project_number}],
      path_template: "/orgs/{org}/projectsV2/{project_number}/views",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a view for a user-owned project\n\nPath: /users/{user_id}/projectsV2/{project_number}/views\n\nMethod: post"
  @spec create_view_for_user(GitHubSDK.Client.t()) :: result
  @spec create_view_for_user(GitHubSDK.Client.t(), map()) :: result
  def create_view_for_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Projects, :create_view_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"user_id", :user_id}, {"project_number", :project_number}],
      path_template: "/users/{user_id}/projectsV2/{project_number}/views",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Delete project item for organization\n\nPath: /orgs/{org}/projectsV2/{project_number}/items/{item_id}\n\nMethod: delete"
  @spec delete_item_for_org(GitHubSDK.Client.t()) :: result
  @spec delete_item_for_org(GitHubSDK.Client.t(), map()) :: result
  def delete_item_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Projects, :delete_item_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"project_number", :project_number}, {"org", :org}, {"item_id", :item_id}],
      path_template: "/orgs/{org}/projectsV2/{project_number}/items/{item_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete project item for user\n\nPath: /users/{username}/projectsV2/{project_number}/items/{item_id}\n\nMethod: delete"
  @spec delete_item_for_user(GitHubSDK.Client.t()) :: result
  @spec delete_item_for_user(GitHubSDK.Client.t(), map()) :: result
  def delete_item_for_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Projects, :delete_item_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"project_number", :project_number}, {"username", :username}, {"item_id", :item_id}],
      path_template: "/users/{username}/projectsV2/{project_number}/items/{item_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Get project field for organization\n\nPath: /orgs/{org}/projectsV2/{project_number}/fields/{field_id}\n\nMethod: get"
  @spec get_field_for_org(GitHubSDK.Client.t()) :: result
  @spec get_field_for_org(GitHubSDK.Client.t(), map()) :: result
  def get_field_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Projects, :get_field_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"project_number", :project_number}, {"field_id", :field_id}, {"org", :org}],
      path_template: "/orgs/{org}/projectsV2/{project_number}/fields/{field_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get project field for user\n\nPath: /users/{username}/projectsV2/{project_number}/fields/{field_id}\n\nMethod: get"
  @spec get_field_for_user(GitHubSDK.Client.t()) :: result
  @spec get_field_for_user(GitHubSDK.Client.t(), map()) :: result
  def get_field_for_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Projects, :get_field_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [
        {"project_number", :project_number},
        {"field_id", :field_id},
        {"username", :username}
      ],
      path_template: "/users/{username}/projectsV2/{project_number}/fields/{field_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get project for organization\n\nPath: /orgs/{org}/projectsV2/{project_number}\n\nMethod: get"
  @spec get_for_org(GitHubSDK.Client.t()) :: result
  @spec get_for_org(GitHubSDK.Client.t(), map()) :: result
  def get_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Projects, :get_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"project_number", :project_number}, {"org", :org}],
      path_template: "/orgs/{org}/projectsV2/{project_number}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get project for user\n\nPath: /users/{username}/projectsV2/{project_number}\n\nMethod: get"
  @spec get_for_user(GitHubSDK.Client.t()) :: result
  @spec get_for_user(GitHubSDK.Client.t(), map()) :: result
  def get_for_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Projects, :get_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"project_number", :project_number}, {"username", :username}],
      path_template: "/users/{username}/projectsV2/{project_number}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get an item for an organization owned project\n\nPath: /orgs/{org}/projectsV2/{project_number}/items/{item_id}\n\nMethod: get"
  @spec get_org_item(GitHubSDK.Client.t()) :: result
  @spec get_org_item(GitHubSDK.Client.t(), map()) :: result
  def get_org_item(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Projects, :get_org_item},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"project_number", :project_number}, {"org", :org}, {"item_id", :item_id}],
      path_template: "/orgs/{org}/projectsV2/{project_number}/items/{item_id}",
      query: [{"fields", :fields}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get an item for a user owned project\n\nPath: /users/{username}/projectsV2/{project_number}/items/{item_id}\n\nMethod: get"
  @spec get_user_item(GitHubSDK.Client.t()) :: result
  @spec get_user_item(GitHubSDK.Client.t(), map()) :: result
  def get_user_item(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Projects, :get_user_item},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"project_number", :project_number}, {"username", :username}, {"item_id", :item_id}],
      path_template: "/users/{username}/projectsV2/{project_number}/items/{item_id}",
      query: [{"fields", :fields}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List project fields for organization\n\nPath: /orgs/{org}/projectsV2/{project_number}/fields\n\nMethod: get"
  @spec list_fields_for_org(GitHubSDK.Client.t()) :: result
  @spec list_fields_for_org(GitHubSDK.Client.t(), map()) :: result
  def list_fields_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Projects, :list_fields_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"project_number", :project_number}, {"org", :org}],
      path_template: "/orgs/{org}/projectsV2/{project_number}/fields",
      query: [{"per_page", :per_page}, {"before", :before}, {"after", :after}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List project fields for user\n\nPath: /users/{username}/projectsV2/{project_number}/fields\n\nMethod: get"
  @spec list_fields_for_user(GitHubSDK.Client.t()) :: result
  @spec list_fields_for_user(GitHubSDK.Client.t(), map()) :: result
  def list_fields_for_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Projects, :list_fields_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"project_number", :project_number}, {"username", :username}],
      path_template: "/users/{username}/projectsV2/{project_number}/fields",
      query: [{"per_page", :per_page}, {"before", :before}, {"after", :after}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List projects for organization\n\nPath: /orgs/{org}/projectsV2\n\nMethod: get"
  @spec list_for_org(GitHubSDK.Client.t()) :: result
  @spec list_for_org(GitHubSDK.Client.t(), map()) :: result
  def list_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Projects, :list_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/projectsV2",
      query: [{"q", :q}, {"before", :before}, {"after", :after}, {"per_page", :per_page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List projects for user\n\nPath: /users/{username}/projectsV2\n\nMethod: get"
  @spec list_for_user(GitHubSDK.Client.t()) :: result
  @spec list_for_user(GitHubSDK.Client.t(), map()) :: result
  def list_for_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Projects, :list_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"username", :username}],
      path_template: "/users/{username}/projectsV2",
      query: [{"q", :q}, {"before", :before}, {"after", :after}, {"per_page", :per_page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List items for an organization owned project\n\nPath: /orgs/{org}/projectsV2/{project_number}/items\n\nMethod: get"
  @spec list_items_for_org(GitHubSDK.Client.t()) :: result
  @spec list_items_for_org(GitHubSDK.Client.t(), map()) :: result
  def list_items_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Projects, :list_items_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"project_number", :project_number}, {"org", :org}],
      path_template: "/orgs/{org}/projectsV2/{project_number}/items",
      query: [
        {"q", :q},
        {"fields", :fields},
        {"before", :before},
        {"after", :after},
        {"per_page", :per_page}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List items for a user owned project\n\nPath: /users/{username}/projectsV2/{project_number}/items\n\nMethod: get"
  @spec list_items_for_user(GitHubSDK.Client.t()) :: result
  @spec list_items_for_user(GitHubSDK.Client.t(), map()) :: result
  def list_items_for_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Projects, :list_items_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"project_number", :project_number}, {"username", :username}],
      path_template: "/users/{username}/projectsV2/{project_number}/items",
      query: [
        {"before", :before},
        {"after", :after},
        {"per_page", :per_page},
        {"q", :q},
        {"fields", :fields}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List items for an organization project view\n\nPath: /orgs/{org}/projectsV2/{project_number}/views/{view_number}/items\n\nMethod: get"
  @spec list_view_items_for_org(GitHubSDK.Client.t()) :: result
  @spec list_view_items_for_org(GitHubSDK.Client.t(), map()) :: result
  def list_view_items_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Projects, :list_view_items_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"project_number", :project_number}, {"org", :org}, {"view_number", :view_number}],
      path_template: "/orgs/{org}/projectsV2/{project_number}/views/{view_number}/items",
      query: [
        {"fields", :fields},
        {"before", :before},
        {"after", :after},
        {"per_page", :per_page}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List items for a user project view\n\nPath: /users/{username}/projectsV2/{project_number}/views/{view_number}/items\n\nMethod: get"
  @spec list_view_items_for_user(GitHubSDK.Client.t()) :: result
  @spec list_view_items_for_user(GitHubSDK.Client.t(), map()) :: result
  def list_view_items_for_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Projects, :list_view_items_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [
        {"project_number", :project_number},
        {"username", :username},
        {"view_number", :view_number}
      ],
      path_template: "/users/{username}/projectsV2/{project_number}/views/{view_number}/items",
      query: [
        {"fields", :fields},
        {"before", :before},
        {"after", :after},
        {"per_page", :per_page}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Update project item for organization\n\nPath: /orgs/{org}/projectsV2/{project_number}/items/{item_id}\n\nMethod: patch"
  @spec update_item_for_org(GitHubSDK.Client.t()) :: result
  @spec update_item_for_org(GitHubSDK.Client.t(), map()) :: result
  def update_item_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Projects, :update_item_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"project_number", :project_number}, {"org", :org}, {"item_id", :item_id}],
      path_template: "/orgs/{org}/projectsV2/{project_number}/items/{item_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update project item for user\n\nPath: /users/{username}/projectsV2/{project_number}/items/{item_id}\n\nMethod: patch"
  @spec update_item_for_user(GitHubSDK.Client.t()) :: result
  @spec update_item_for_user(GitHubSDK.Client.t(), map()) :: result
  def update_item_for_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Projects, :update_item_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"project_number", :project_number}, {"username", :username}, {"item_id", :item_id}],
      path_template: "/users/{username}/projectsV2/{project_number}/items/{item_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

defmodule GitHubEx.Projects do
  @moduledoc """
  Generated Github Ex operations for projects.
  """

  alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient

  @add_field_for_org_partition_spec %{
    path: [{"project_number", :project_number}, {"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add a field to an organization-owned project.\n\nAdd a field to an organization-owned project."
  @spec add_field_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def add_field_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_add_field_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_field_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @add_field_for_org_partition_spec)

    %{
      id: "projects/add-field-for-org",
      args: params,
      call: {__MODULE__, :add_field_for_org},
      opts: opts,
      method: :post,
      path_template: "/orgs/{org}/projectsV2/{project_number}/fields",
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :projects, :add_field_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @add_field_for_user_partition_spec %{
    path: [{"username", :username}, {"project_number", :project_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add field to user owned project\n\nAdd a field to a specified user owned project."
  @spec add_field_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def add_field_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_add_field_for_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_field_for_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @add_field_for_user_partition_spec)

    %{
      id: "projects/add-field-for-user",
      args: params,
      call: {__MODULE__, :add_field_for_user},
      opts: opts,
      method: :post,
      path_template: "/users/{username}/projectsV2/{project_number}/fields",
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :projects, :add_field_for_user],
      timeout: nil,
      pagination: nil
    }
  end

  @add_item_for_org_partition_spec %{
    path: [{"org", :org}, {"project_number", :project_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add item to organization owned project\n\nAdd an issue or pull request item to the specified organization owned project."
  @spec add_item_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def add_item_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_add_item_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_item_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @add_item_for_org_partition_spec)

    %{
      id: "projects/add-item-for-org",
      args: params,
      call: {__MODULE__, :add_item_for_org},
      opts: opts,
      method: :post,
      path_template: "/orgs/{org}/projectsV2/{project_number}/items",
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :projects, :add_item_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @add_item_for_user_partition_spec %{
    path: [{"username", :username}, {"project_number", :project_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add item to user owned project\n\nAdd an issue or pull request item to the specified user owned project."
  @spec add_item_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def add_item_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_add_item_for_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_item_for_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @add_item_for_user_partition_spec)

    %{
      id: "projects/add-item-for-user",
      args: params,
      call: {__MODULE__, :add_item_for_user},
      opts: opts,
      method: :post,
      path_template: "/users/{username}/projectsV2/{project_number}/items",
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :projects, :add_item_for_user],
      timeout: nil,
      pagination: nil
    }
  end

  @create_draft_item_for_authenticated_user_partition_spec %{
    path: [{"user_id", :user_id}, {"project_number", :project_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create draft item for user owned project\n\nCreate draft issue item for the specified user owned project."
  @spec create_draft_item_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def create_draft_item_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_draft_item_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_draft_item_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @create_draft_item_for_authenticated_user_partition_spec)

    %{
      id: "projects/create-draft-item-for-authenticated-user",
      args: params,
      call: {__MODULE__, :create_draft_item_for_authenticated_user},
      opts: opts,
      method: :post,
      path_template: "/user/{user_id}/projectsV2/{project_number}/drafts",
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :projects, :create_draft_item_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @create_draft_item_for_org_partition_spec %{
    path: [{"org", :org}, {"project_number", :project_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create draft item for organization owned project\n\nCreate draft issue item for the specified organization owned project."
  @spec create_draft_item_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_draft_item_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_draft_item_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_draft_item_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_draft_item_for_org_partition_spec)

    %{
      id: "projects/create-draft-item-for-org",
      args: params,
      call: {__MODULE__, :create_draft_item_for_org},
      opts: opts,
      method: :post,
      path_template: "/orgs/{org}/projectsV2/{project_number}/drafts",
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :projects, :create_draft_item_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @create_view_for_org_partition_spec %{
    path: [{"org", :org}, {"project_number", :project_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a view for an organization-owned project\n\nCreate a new view in an organization-owned project. Views allow you to customize how items in a project are displayed and filtered."
  @spec create_view_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_view_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_view_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_view_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_view_for_org_partition_spec)

    %{
      id: "projects/create-view-for-org",
      args: params,
      call: {__MODULE__, :create_view_for_org},
      opts: opts,
      method: :post,
      path_template: "/orgs/{org}/projectsV2/{project_number}/views",
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :projects, :create_view_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @create_view_for_user_partition_spec %{
    path: [{"user_id", :user_id}, {"project_number", :project_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a view for a user-owned project\n\nCreate a new view in a user-owned project. Views allow you to customize how items in a project are displayed and filtered."
  @spec create_view_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_view_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_view_for_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_view_for_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_view_for_user_partition_spec)

    %{
      id: "projects/create-view-for-user",
      args: params,
      call: {__MODULE__, :create_view_for_user},
      opts: opts,
      method: :post,
      path_template: "/users/{user_id}/projectsV2/{project_number}/views",
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :projects, :create_view_for_user],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_item_for_org_partition_spec %{
    path: [
      {"project_number", :project_number},
      {"org", :org},
      {"item_id", :item_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete project item for organization\n\nDelete a specific item from an organization-owned project."
  @spec delete_item_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_item_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_item_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_item_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_item_for_org_partition_spec)

    %{
      id: "projects/delete-item-for-org",
      args: params,
      call: {__MODULE__, :delete_item_for_org},
      opts: opts,
      method: :delete,
      path_template: "/orgs/{org}/projectsV2/{project_number}/items/{item_id}",
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
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :projects, :delete_item_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_item_for_user_partition_spec %{
    path: [
      {"project_number", :project_number},
      {"username", :username},
      {"item_id", :item_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete project item for user\n\nDelete a specific item from a user-owned project."
  @spec delete_item_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_item_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_item_for_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_item_for_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_item_for_user_partition_spec)

    %{
      id: "projects/delete-item-for-user",
      args: params,
      call: {__MODULE__, :delete_item_for_user},
      opts: opts,
      method: :delete,
      path_template: "/users/{username}/projectsV2/{project_number}/items/{item_id}",
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
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :projects, :delete_item_for_user],
      timeout: nil,
      pagination: nil
    }
  end

  @get_field_for_org_partition_spec %{
    path: [
      {"project_number", :project_number},
      {"field_id", :field_id},
      {"org", :org}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get project field for organization\n\nGet a specific field for an organization-owned project."
  @spec get_field_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_field_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_field_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_field_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_field_for_org_partition_spec)

    %{
      id: "projects/get-field-for-org",
      args: params,
      call: {__MODULE__, :get_field_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/projectsV2/{project_number}/fields/{field_id}",
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :projects, :get_field_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @get_field_for_user_partition_spec %{
    path: [
      {"project_number", :project_number},
      {"field_id", :field_id},
      {"username", :username}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get project field for user\n\nGet a specific field for a user-owned project."
  @spec get_field_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_field_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_field_for_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_field_for_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_field_for_user_partition_spec)

    %{
      id: "projects/get-field-for-user",
      args: params,
      call: {__MODULE__, :get_field_for_user},
      opts: opts,
      method: :get,
      path_template: "/users/{username}/projectsV2/{project_number}/fields/{field_id}",
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :projects, :get_field_for_user],
      timeout: nil,
      pagination: nil
    }
  end

  @get_for_org_partition_spec %{
    path: [{"project_number", :project_number}, {"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get project for organization\n\nGet a specific organization-owned project."
  @spec get_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_for_org_partition_spec)

    %{
      id: "projects/get-for-org",
      args: params,
      call: {__MODULE__, :get_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/projectsV2/{project_number}",
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :projects, :get_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @get_for_user_partition_spec %{
    path: [{"project_number", :project_number}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get project for user\n\nGet a specific user-owned project."
  @spec get_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_for_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_for_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_for_user_partition_spec)

    %{
      id: "projects/get-for-user",
      args: params,
      call: {__MODULE__, :get_for_user},
      opts: opts,
      method: :get,
      path_template: "/users/{username}/projectsV2/{project_number}",
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :projects, :get_for_user],
      timeout: nil,
      pagination: nil
    }
  end

  @get_org_item_partition_spec %{
    path: [
      {"project_number", :project_number},
      {"org", :org},
      {"item_id", :item_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"fields", :fields}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get an item for an organization owned project\n\nGet a specific item from an organization-owned project."
  @spec get_org_item(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_org_item(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_org_item_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_org_item_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_org_item_partition_spec)

    %{
      id: "projects/get-org-item",
      args: params,
      call: {__MODULE__, :get_org_item},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/projectsV2/{project_number}/items/{item_id}",
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :projects, :get_org_item],
      timeout: nil,
      pagination: nil
    }
  end

  @get_user_item_partition_spec %{
    path: [
      {"project_number", :project_number},
      {"username", :username},
      {"item_id", :item_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"fields", :fields}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get an item for a user owned project\n\nGet a specific item from a user-owned project."
  @spec get_user_item(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_user_item(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_user_item_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_user_item_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_user_item_partition_spec)

    %{
      id: "projects/get-user-item",
      args: params,
      call: {__MODULE__, :get_user_item},
      opts: opts,
      method: :get,
      path_template: "/users/{username}/projectsV2/{project_number}/items/{item_id}",
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :projects, :get_user_item],
      timeout: nil,
      pagination: nil
    }
  end

  @list_fields_for_org_partition_spec %{
    path: [{"project_number", :project_number}, {"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"before", :before}, {"after", :after}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List project fields for organization\n\nList all fields for a specific organization-owned project."
  @spec list_fields_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_fields_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_fields_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_fields_for_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_fields_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_fields_for_org_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_fields_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_fields_for_org_partition_spec)

    %{
      id: "projects/list-fields-for-org",
      args: params,
      call: {__MODULE__, :list_fields_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/projectsV2/{project_number}/fields",
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :projects, :list_fields_for_org],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: nil,
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_fields_for_user_partition_spec %{
    path: [{"project_number", :project_number}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"before", :before}, {"after", :after}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List project fields for user\n\nList all fields for a specific user-owned project."
  @spec list_fields_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_fields_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_fields_for_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_fields_for_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_fields_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_fields_for_user_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_fields_for_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_fields_for_user_partition_spec)

    %{
      id: "projects/list-fields-for-user",
      args: params,
      call: {__MODULE__, :list_fields_for_user},
      opts: opts,
      method: :get,
      path_template: "/users/{username}/projectsV2/{project_number}/fields",
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :projects, :list_fields_for_user],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: nil,
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"q", :q},
      {"before", :before},
      {"after", :after},
      {"per_page", :per_page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List projects for organization\n\nList all projects owned by a specific organization accessible by the authenticated user."
  @spec list_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_for_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_for_org_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_for_org_partition_spec)

    %{
      id: "projects/list-for-org",
      args: params,
      call: {__MODULE__, :list_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/projectsV2",
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :projects, :list_for_org],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: nil,
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_for_user_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"q", :q},
      {"before", :before},
      {"after", :after},
      {"per_page", :per_page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List projects for user\n\nList all projects owned by a specific user accessible by the authenticated user."
  @spec list_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_for_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_for_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_for_user_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_for_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_for_user_partition_spec)

    %{
      id: "projects/list-for-user",
      args: params,
      call: {__MODULE__, :list_for_user},
      opts: opts,
      method: :get,
      path_template: "/users/{username}/projectsV2",
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :projects, :list_for_user],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: nil,
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_items_for_org_partition_spec %{
    path: [{"project_number", :project_number}, {"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"q", :q},
      {"fields", :fields},
      {"before", :before},
      {"after", :after},
      {"per_page", :per_page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List items for an organization owned project\n\nList all items for a specific organization-owned project accessible by the authenticated user."
  @spec list_items_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_items_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_items_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_items_for_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_items_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_items_for_org_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_items_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_items_for_org_partition_spec)

    %{
      id: "projects/list-items-for-org",
      args: params,
      call: {__MODULE__, :list_items_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/projectsV2/{project_number}/items",
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :projects, :list_items_for_org],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: nil,
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_items_for_user_partition_spec %{
    path: [{"project_number", :project_number}, {"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"before", :before},
      {"after", :after},
      {"per_page", :per_page},
      {"q", :q},
      {"fields", :fields}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List items for a user owned project\n\nList all items for a specific user-owned project accessible by the authenticated user."
  @spec list_items_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_items_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_items_for_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_items_for_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_items_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_items_for_user_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_items_for_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_items_for_user_partition_spec)

    %{
      id: "projects/list-items-for-user",
      args: params,
      call: {__MODULE__, :list_items_for_user},
      opts: opts,
      method: :get,
      path_template: "/users/{username}/projectsV2/{project_number}/items",
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :projects, :list_items_for_user],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: nil,
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_view_items_for_org_partition_spec %{
    path: [
      {"project_number", :project_number},
      {"org", :org},
      {"view_number", :view_number}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"fields", :fields},
      {"before", :before},
      {"after", :after},
      {"per_page", :per_page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List items for an organization project view\n\nList items in an organization project with the saved view's filter applied."
  @spec list_view_items_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_view_items_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_view_items_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_view_items_for_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_view_items_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_view_items_for_org_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_view_items_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_view_items_for_org_partition_spec)

    %{
      id: "projects/list-view-items-for-org",
      args: params,
      call: {__MODULE__, :list_view_items_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/projectsV2/{project_number}/views/{view_number}/items",
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :projects, :list_view_items_for_org],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: nil,
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_view_items_for_user_partition_spec %{
    path: [
      {"project_number", :project_number},
      {"username", :username},
      {"view_number", :view_number}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"fields", :fields},
      {"before", :before},
      {"after", :after},
      {"per_page", :per_page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List items for a user project view\n\nList items in a user project with the saved view's filter applied."
  @spec list_view_items_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_view_items_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_view_items_for_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_view_items_for_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_view_items_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_view_items_for_user_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_view_items_for_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_view_items_for_user_partition_spec)

    %{
      id: "projects/list-view-items-for-user",
      args: params,
      call: {__MODULE__, :list_view_items_for_user},
      opts: opts,
      method: :get,
      path_template: "/users/{username}/projectsV2/{project_number}/views/{view_number}/items",
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :projects, :list_view_items_for_user],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: nil,
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @update_item_for_org_partition_spec %{
    path: [
      {"project_number", :project_number},
      {"org", :org},
      {"item_id", :item_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update project item for organization\n\nUpdate a specific item in an organization-owned project."
  @spec update_item_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_item_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_item_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_item_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_item_for_org_partition_spec)

    %{
      id: "projects/update-item-for-org",
      args: params,
      call: {__MODULE__, :update_item_for_org},
      opts: opts,
      method: :patch,
      path_template: "/orgs/{org}/projectsV2/{project_number}/items/{item_id}",
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :projects, :update_item_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @update_item_for_user_partition_spec %{
    path: [
      {"project_number", :project_number},
      {"username", :username},
      {"item_id", :item_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update project item for user\n\nUpdate a specific item in a user-owned project."
  @spec update_item_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_item_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_item_for_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_item_for_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_item_for_user_partition_spec)

    %{
      id: "projects/update-item-for-user",
      args: params,
      call: {__MODULE__, :update_item_for_user},
      opts: opts,
      method: :patch,
      path_template: "/users/{username}/projectsV2/{project_number}/items/{item_id}",
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :projects, :update_item_for_user],
      timeout: nil,
      pagination: nil
    }
  end

  @spec normalize_request_opts!(list()) :: keyword()
  defp normalize_request_opts!(opts) when is_list(opts) do
    if Keyword.keyword?(opts) do
      opts
    else
      raise ArgumentError, "request opts must be a keyword list"
    end
  end
end

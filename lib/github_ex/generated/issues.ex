defmodule GitHubEx.Issues do
  @moduledoc """
  Generated Github Ex operations for issues.
  """

  alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient

  @add_assignees_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add assignees to an issue\n\nAdds up to 10 assignees to an issue. Users already assigned to an issue are not replaced."
  @spec add_assignees(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def add_assignees(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_add_assignees_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_assignees_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @add_assignees_partition_spec)

    %{
      id: "issues/add-assignees",
      args: params,
      call: {__MODULE__, :add_assignees},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/assignees",
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
      telemetry: [:github_ex, :issues, :add_assignees],
      timeout: nil,
      pagination: nil
    }
  end

  @add_blocked_by_dependency_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add a dependency an issue is blocked by\n\nYou can use the REST API to add a 'blocked by' relationship to an issue.\n\nCreating content too quickly using this endpoint may result in secondary rate limiting.\nFor more information, see [Rate limits for the API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)\nand [Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api).\n\nThis endpoint supports the following custom media types. For more information, see [Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\n\n- **`application/vnd.github.raw+json`**: Returns the raw Markdown body. Response will include `body`. This is the default if you do not pass any specific media type.\n- **`application/vnd.github.text+json`**: Returns a text only representation of the Markdown body. Response will include `body_text`.\n- **`application/vnd.github.html+json`**: Returns HTML rendered from the body's Markdown. Response will include `body_html`.\n- **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`."
  @spec add_blocked_by_dependency(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def add_blocked_by_dependency(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_add_blocked_by_dependency_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_blocked_by_dependency_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @add_blocked_by_dependency_partition_spec)

    %{
      id: "issues/add-blocked-by-dependency",
      args: params,
      call: {__MODULE__, :add_blocked_by_dependency},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/dependencies/blocked_by",
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
      telemetry: [:github_ex, :issues, :add_blocked_by_dependency],
      timeout: nil,
      pagination: nil
    }
  end

  @add_issue_field_values_partition_spec %{
    path: [{"repository_id", :repository_id}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Add issue field values to an issue

       Add custom field values to an issue. You can set values for organization-level issue fields that have been defined for the repository's organization.
       Adding an empty array will clear all existing field values for the issue.

       This endpoint supports the following field data types:
       - **`text`**: String values for text fields
       - **`single_select`**: Option names for single-select fields (must match an existing option name)
       - **`number`**: Numeric values for number fields
       - **`date`**: ISO 8601 date strings for date fields

       Only users with push access to the repository can add issue field values. If you don't have the proper permissions, you'll receive a `403 Forbidden` response.

       This endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications). Creating content too quickly using this endpoint may result in secondary rate limiting. For more information, see "[Rate limits for the API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)"
       and "[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec add_issue_field_values(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def add_issue_field_values(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_add_issue_field_values_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_issue_field_values_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @add_issue_field_values_partition_spec)

    %{
      id: "issues/add-issue-field-values",
      args: params,
      call: {__MODULE__, :add_issue_field_values},
      opts: opts,
      method: :post,
      path_template: "/repositories/{repository_id}/issues/{issue_number}/issue-field-values",
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
      telemetry: [:github_ex, :issues, :add_issue_field_values],
      timeout: nil,
      pagination: nil
    }
  end

  @add_labels_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add labels to an issue\n\nAdds labels to an issue."
  @spec add_labels(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def add_labels(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_add_labels_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_labels_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @add_labels_partition_spec)

    %{
      id: "issues/add-labels",
      args: params,
      call: {__MODULE__, :add_labels},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/labels",
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
      telemetry: [:github_ex, :issues, :add_labels],
      timeout: nil,
      pagination: nil
    }
  end

  @add_sub_issue_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Add sub-issue

       You can use the REST API to add sub-issues to issues.

       Creating content too quickly using this endpoint may result in secondary rate limiting.
       For more information, see "[Rate limits for the API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)"
       and "[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."

       This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

       - **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
       - **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
       - **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
       - **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec add_sub_issue(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def add_sub_issue(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_add_sub_issue_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_sub_issue_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @add_sub_issue_partition_spec)

    %{
      id: "issues/add-sub-issue",
      args: params,
      call: {__MODULE__, :add_sub_issue},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/sub_issues",
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
      telemetry: [:github_ex, :issues, :add_sub_issue],
      timeout: nil,
      pagination: nil
    }
  end

  @check_user_can_be_assigned_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"assignee", :assignee}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Check if a user can be assigned\n\nChecks if a user has permission to be assigned to an issue in this repository.\n\nIf the `assignee` can be assigned to issues in the repository, a `204` header with no content is returned.\n\nOtherwise a `404` status code is returned."
  @spec check_user_can_be_assigned(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def check_user_can_be_assigned(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_check_user_can_be_assigned_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_check_user_can_be_assigned_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @check_user_can_be_assigned_partition_spec)

    %{
      id: "issues/check-user-can-be-assigned",
      args: params,
      call: {__MODULE__, :check_user_can_be_assigned},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/assignees/{assignee}",
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
      telemetry: [:github_ex, :issues, :check_user_can_be_assigned],
      timeout: nil,
      pagination: nil
    }
  end

  @check_user_can_be_assigned_to_issue_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"issue_number", :issue_number},
      {"assignee", :assignee}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Check if a user can be assigned to a issue\n\nChecks if a user has permission to be assigned to a specific issue.\n\nIf the `assignee` can be assigned to this issue, a `204` status code with no content is returned.\n\nOtherwise a `404` status code is returned."
  @spec check_user_can_be_assigned_to_issue(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def check_user_can_be_assigned_to_issue(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_check_user_can_be_assigned_to_issue_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_check_user_can_be_assigned_to_issue_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @check_user_can_be_assigned_to_issue_partition_spec)

    %{
      id: "issues/check-user-can-be-assigned-to-issue",
      args: params,
      call: {__MODULE__, :check_user_can_be_assigned_to_issue},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/assignees/{assignee}",
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
      telemetry: [:github_ex, :issues, :check_user_can_be_assigned_to_issue],
      timeout: nil,
      pagination: nil
    }
  end

  @create_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Create an issue

       Any user with pull access to a repository can create an issue. If [issues are disabled in the repository](https://docs.github.com/articles/disabling-issues/), the API returns a `410 Gone` status.

       This endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications). Creating content too quickly using this endpoint may result in secondary rate limiting. For more information, see "[Rate limits for the API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)"
       and "[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."

       This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

       - **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
       - **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
       - **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
       - **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec create(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_partition_spec)

    %{
      id: "issues/create",
      args: params,
      call: {__MODULE__, :create},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/issues",
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
      telemetry: [:github_ex, :issues, :create],
      timeout: nil,
      pagination: nil
    }
  end

  @create_comment_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Create an issue comment

       You can use the REST API to create comments on issues and pull requests. Every pull request is an issue, but not every issue is a pull request.

       This endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications).
       Creating content too quickly using this endpoint may result in secondary rate limiting.
       For more information, see "[Rate limits for the API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)"
       and "[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."

       This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

       - **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
       - **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
       - **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
       - **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec create_comment(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_comment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_comment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_comment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_comment_partition_spec)

    %{
      id: "issues/create-comment",
      args: params,
      call: {__MODULE__, :create_comment},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/comments",
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
      telemetry: [:github_ex, :issues, :create_comment],
      timeout: nil,
      pagination: nil
    }
  end

  @create_label_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a label\n\nCreates a label for the specified repository with the given name and color. The name and color parameters are required. The color must be a valid [hexadecimal color code](http://www.color-hex.com/)."
  @spec create_label(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_label(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_label_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_label_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_label_partition_spec)

    %{
      id: "issues/create-label",
      args: params,
      call: {__MODULE__, :create_label},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/labels",
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
      telemetry: [:github_ex, :issues, :create_label],
      timeout: nil,
      pagination: nil
    }
  end

  @create_milestone_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a milestone\n\nCreates a milestone."
  @spec create_milestone(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_milestone(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_milestone_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_milestone_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_milestone_partition_spec)

    %{
      id: "issues/create-milestone",
      args: params,
      call: {__MODULE__, :create_milestone},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/milestones",
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
      telemetry: [:github_ex, :issues, :create_milestone],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_comment_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete an issue comment\n\nYou can use the REST API to delete comments on issues and pull requests. Every pull request is an issue, but not every issue is a pull request."
  @spec delete_comment(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_comment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_comment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_comment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_comment_partition_spec)

    %{
      id: "issues/delete-comment",
      args: params,
      call: {__MODULE__, :delete_comment},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/issues/comments/{comment_id}",
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
      telemetry: [:github_ex, :issues, :delete_comment],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_issue_field_value_partition_spec %{
    path: [
      {"repository_id", :repository_id},
      {"issue_number", :issue_number},
      {"issue_field_id", :issue_field_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Delete an issue field value from an issue

       Remove a specific custom field value from an issue.

       Only users with push access to the repository can delete issue field values. If you don't have the proper permissions, you'll receive a `403 Forbidden` response.

       If the specified field does not have a value set on the issue, this operation will return a `404` error.

       This endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications). Creating content too quickly using this endpoint may result in secondary rate limiting. For more information, see "[Rate limits for the API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)"
       and "[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec delete_issue_field_value(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_issue_field_value(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_issue_field_value_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_issue_field_value_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_issue_field_value_partition_spec)

    %{
      id: "issues/delete-issue-field-value",
      args: params,
      call: {__MODULE__, :delete_issue_field_value},
      opts: opts,
      method: :delete,
      path_template:
        "/repositories/{repository_id}/issues/{issue_number}/issue-field-values/{issue_field_id}",
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
      telemetry: [:github_ex, :issues, :delete_issue_field_value],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_label_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"name", :name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a label\n\nDeletes a label using the given label name."
  @spec delete_label(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_label(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_label_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_label_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_label_partition_spec)

    %{
      id: "issues/delete-label",
      args: params,
      call: {__MODULE__, :delete_label},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/labels/{name}",
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
      telemetry: [:github_ex, :issues, :delete_label],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_milestone_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"milestone_number", :milestone_number}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a milestone\n\nDeletes a milestone using the given milestone number."
  @spec delete_milestone(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_milestone(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_milestone_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_milestone_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_milestone_partition_spec)

    %{
      id: "issues/delete-milestone",
      args: params,
      call: {__MODULE__, :delete_milestone},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/milestones/{milestone_number}",
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
      telemetry: [:github_ex, :issues, :delete_milestone],
      timeout: nil,
      pagination: nil
    }
  end

  @get_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Get an issue

       The API returns a [`301 Moved Permanently` status](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api#follow-redirects) if the issue was
       [transferred](https://docs.github.com/articles/transferring-an-issue-to-another-repository/) to another repository. If
       the issue was transferred to or deleted from a repository where the authenticated user lacks read access, the API
       returns a `404 Not Found` status. If the issue was deleted from a repository where the authenticated user has read
       access, the API returns a `410 Gone` status. To receive webhook events for transferred and deleted issues, subscribe
       to the [`issues`](https://docs.github.com/webhooks/event-payloads/#issues) webhook.

       > [!NOTE]
       > GitHub's REST API considers every pull request an issue, but not every issue is a pull request. For this reason, "Issues" endpoints may return both issues and pull requests in the response. You can identify pull requests by the `pull_request` key. Be aware that the `id` of a pull request returned from "Issues" endpoints will be an _issue id_. To find out the pull request id, use the "[List pull requests](https://docs.github.com/rest/pulls/pulls#list-pull-requests)" endpoint.

       This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

       - **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
       - **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
       - **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
       - **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec get(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_partition_spec)

    %{
      id: "issues/get",
      args: params,
      call: {__MODULE__, :get},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}",
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
      telemetry: [:github_ex, :issues, :get],
      timeout: nil,
      pagination: nil
    }
  end

  @get_comment_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get an issue comment\n\nYou can use the REST API to get comments on issues and pull requests. Every pull request is an issue, but not every issue is a pull request.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.\n- **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.\n- **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.\n- **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`."
  @spec get_comment(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_comment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_comment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_comment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_comment_partition_spec)

    %{
      id: "issues/get-comment",
      args: params,
      call: {__MODULE__, :get_comment},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/issues/comments/{comment_id}",
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
      telemetry: [:github_ex, :issues, :get_comment],
      timeout: nil,
      pagination: nil
    }
  end

  @get_event_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"event_id", :event_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get an issue event\n\nGets a single event by the event id."
  @spec get_event(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_event(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_event_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_event_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_event_partition_spec)

    %{
      id: "issues/get-event",
      args: params,
      call: {__MODULE__, :get_event},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/issues/events/{event_id}",
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
      telemetry: [:github_ex, :issues, :get_event],
      timeout: nil,
      pagination: nil
    }
  end

  @get_label_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"name", :name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a label\n\nGets a label using the given name."
  @spec get_label(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_label(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_label_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_label_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_label_partition_spec)

    %{
      id: "issues/get-label",
      args: params,
      call: {__MODULE__, :get_label},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/labels/{name}",
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
      telemetry: [:github_ex, :issues, :get_label],
      timeout: nil,
      pagination: nil
    }
  end

  @get_milestone_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"milestone_number", :milestone_number}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a milestone\n\nGets a milestone using the given milestone number."
  @spec get_milestone(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_milestone(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_milestone_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_milestone_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_milestone_partition_spec)

    %{
      id: "issues/get-milestone",
      args: params,
      call: {__MODULE__, :get_milestone},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/milestones/{milestone_number}",
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
      telemetry: [:github_ex, :issues, :get_milestone],
      timeout: nil,
      pagination: nil
    }
  end

  @get_parent_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get parent issue\n\nYou can use the REST API to get the parent issue of a sub-issue.\n\nThis endpoint supports the following custom media types. For more information, see [Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\n\n- **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.\n- **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.\n- **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.\n- **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`."
  @spec get_parent(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_parent(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_parent_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_parent_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_parent_partition_spec)

    %{
      id: "issues/get-parent",
      args: params,
      call: {__MODULE__, :get_parent},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/parent",
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
      telemetry: [:github_ex, :issues, :get_parent],
      timeout: nil,
      pagination: nil
    }
  end

  @list_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"filter", :filter},
      {"state", :state},
      {"labels", :labels},
      {"sort", :sort},
      {"direction", :direction},
      {"since", :since},
      {"collab", :collab},
      {"orgs", :orgs},
      {"owned", :owned},
      {"pulls", :pulls},
      {"per_page", :per_page},
      {"page", :page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       List issues assigned to the authenticated user

       List issues assigned to the authenticated user across all visible repositories including owned repositories, member
       repositories, and organization repositories. You can use the `filter` query parameter to fetch issues that are not
       necessarily assigned to you.

       > [!NOTE]
       > GitHub's REST API considers every pull request an issue, but not every issue is a pull request. For this reason, "Issues" endpoints may return both issues and pull requests in the response. You can identify pull requests by the `pull_request` key. Be aware that the `id` of a pull request returned from "Issues" endpoints will be an _issue id_. To find out the pull request id, use the "[List pull requests](https://docs.github.com/rest/pulls/pulls#list-pull-requests)" endpoint.

       This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

       - **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
       - **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
       - **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
       - **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec list(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list(term(), map(), keyword()) :: Enumerable.t()
  def stream_list(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_request(client, params, opts) end,
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

  defp build_list_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_partition_spec)

    %{
      id: "issues/list",
      args: params,
      call: {__MODULE__, :list},
      opts: opts,
      method: :get,
      path_template: "/issues",
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
      telemetry: [:github_ex, :issues, :list],
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

  @list_assignees_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List assignees\n\nLists the [available assignees](https://docs.github.com/articles/assigning-issues-and-pull-requests-to-other-github-users/) for issues in a repository."
  @spec list_assignees(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_assignees(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_assignees_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_assignees(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_assignees(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_assignees_request(client, params, opts) end,
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

  defp build_list_assignees_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_assignees_partition_spec)

    %{
      id: "issues/list-assignees",
      args: params,
      call: {__MODULE__, :list_assignees},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/assignees",
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
      telemetry: [:github_ex, :issues, :list_assignees],
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

  @list_comments_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"since", :since}, {"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List issue comments\n\nYou can use the REST API to list comments on issues and pull requests. Every pull request is an issue, but not every issue is a pull request.\n\nIssue comments are ordered by ascending ID.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.\n- **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.\n- **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.\n- **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`."
  @spec list_comments(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_comments(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_comments_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_comments(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_comments(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_comments_request(client, params, opts) end,
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

  defp build_list_comments_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_comments_partition_spec)

    %{
      id: "issues/list-comments",
      args: params,
      call: {__MODULE__, :list_comments},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/comments",
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
      telemetry: [:github_ex, :issues, :list_comments],
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

  @list_comments_for_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"sort", :sort},
      {"direction", :direction},
      {"since", :since},
      {"per_page", :per_page},
      {"page", :page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List issue comments for a repository\n\nYou can use the REST API to list comments on issues and pull requests for a repository. Every pull request is an issue, but not every issue is a pull request.\n\nBy default, issue comments are ordered by ascending ID.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.\n- **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.\n- **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.\n- **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`."
  @spec list_comments_for_repo(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_comments_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_comments_for_repo_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_comments_for_repo(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_comments_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_comments_for_repo_request(client, params, opts) end,
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

  defp build_list_comments_for_repo_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_comments_for_repo_partition_spec)

    %{
      id: "issues/list-comments-for-repo",
      args: params,
      call: {__MODULE__, :list_comments_for_repo},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/issues/comments",
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
      telemetry: [:github_ex, :issues, :list_comments_for_repo],
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

  @list_dependencies_blocked_by_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List dependencies an issue is blocked by\n\nYou can use the REST API to list the dependencies an issue is blocked by.\n\nThis endpoint supports the following custom media types. For more information, see [Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\n\n- **`application/vnd.github.raw+json`**: Returns the raw Markdown body. Response will include `body`. This is the default if you do not pass any specific media type.\n- **`application/vnd.github.text+json`**: Returns a text only representation of the Markdown body. Response will include `body_text`.\n- **`application/vnd.github.html+json`**: Returns HTML rendered from the body's Markdown. Response will include `body_html`.\n- **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`."
  @spec list_dependencies_blocked_by(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_dependencies_blocked_by(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_dependencies_blocked_by_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_dependencies_blocked_by(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_dependencies_blocked_by(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_dependencies_blocked_by_request(client, params, opts) end,
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

  defp build_list_dependencies_blocked_by_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_dependencies_blocked_by_partition_spec)

    %{
      id: "issues/list-dependencies-blocked-by",
      args: params,
      call: {__MODULE__, :list_dependencies_blocked_by},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/dependencies/blocked_by",
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
      telemetry: [:github_ex, :issues, :list_dependencies_blocked_by],
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

  @list_dependencies_blocking_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List dependencies an issue is blocking\n\nYou can use the REST API to list the dependencies an issue is blocking.\n\nThis endpoint supports the following custom media types. For more information, see [Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\n\n- **`application/vnd.github.raw+json`**: Returns the raw Markdown body. Response will include `body`. This is the default if you do not pass any specific media type.\n- **`application/vnd.github.text+json`**: Returns a text only representation of the Markdown body. Response will include `body_text`.\n- **`application/vnd.github.html+json`**: Returns HTML rendered from the body's Markdown. Response will include `body_html`.\n- **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`."
  @spec list_dependencies_blocking(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_dependencies_blocking(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_dependencies_blocking_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_dependencies_blocking(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_dependencies_blocking(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_dependencies_blocking_request(client, params, opts) end,
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

  defp build_list_dependencies_blocking_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_dependencies_blocking_partition_spec)

    %{
      id: "issues/list-dependencies-blocking",
      args: params,
      call: {__MODULE__, :list_dependencies_blocking},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/dependencies/blocking",
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
      telemetry: [:github_ex, :issues, :list_dependencies_blocking],
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

  @list_events_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List issue events\n\nLists all events for an issue."
  @spec list_events(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_events(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_events_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_events(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_events(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_events_request(client, params, opts) end,
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

  defp build_list_events_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_events_partition_spec)

    %{
      id: "issues/list-events",
      args: params,
      call: {__MODULE__, :list_events},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/events",
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
      telemetry: [:github_ex, :issues, :list_events],
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

  @list_events_for_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List issue events for a repository\n\nLists events for a repository."
  @spec list_events_for_repo(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_events_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_events_for_repo_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_events_for_repo(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_events_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_events_for_repo_request(client, params, opts) end,
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

  defp build_list_events_for_repo_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_events_for_repo_partition_spec)

    %{
      id: "issues/list-events-for-repo",
      args: params,
      call: {__MODULE__, :list_events_for_repo},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/issues/events",
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
      telemetry: [:github_ex, :issues, :list_events_for_repo],
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

  @list_events_for_timeline_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List timeline events for an issue\n\nList all timeline events for an issue."
  @spec list_events_for_timeline(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_events_for_timeline(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_events_for_timeline_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_events_for_timeline(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_events_for_timeline(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_events_for_timeline_request(client, params, opts) end,
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

  defp build_list_events_for_timeline_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_events_for_timeline_partition_spec)

    %{
      id: "issues/list-events-for-timeline",
      args: params,
      call: {__MODULE__, :list_events_for_timeline},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/timeline",
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
      telemetry: [:github_ex, :issues, :list_events_for_timeline],
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

  @list_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"filter", :filter},
      {"state", :state},
      {"labels", :labels},
      {"sort", :sort},
      {"direction", :direction},
      {"since", :since},
      {"per_page", :per_page},
      {"page", :page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       List user account issues assigned to the authenticated user

       List issues across owned and member repositories assigned to the authenticated user.

       > [!NOTE]
       > GitHub's REST API considers every pull request an issue, but not every issue is a pull request. For this reason, "Issues" endpoints may return both issues and pull requests in the response. You can identify pull requests by the `pull_request` key. Be aware that the `id` of a pull request returned from "Issues" endpoints will be an _issue id_. To find out the pull request id, use the "[List pull requests](https://docs.github.com/rest/pulls/pulls#list-pull-requests)" endpoint.

       This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

       - **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
       - **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
       - **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
       - **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec list_for_authenticated_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_for_authenticated_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_for_authenticated_user_request(client, params, opts) end,
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

  defp build_list_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_for_authenticated_user_partition_spec)

    %{
      id: "issues/list-for-authenticated-user",
      args: params,
      call: {__MODULE__, :list_for_authenticated_user},
      opts: opts,
      method: :get,
      path_template: "/user/issues",
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
      telemetry: [:github_ex, :issues, :list_for_authenticated_user],
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
      {"filter", :filter},
      {"state", :state},
      {"labels", :labels},
      {"type", :type},
      {"sort", :sort},
      {"direction", :direction},
      {"since", :since},
      {"per_page", :per_page},
      {"page", :page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       List organization issues assigned to the authenticated user

       List issues in an organization assigned to the authenticated user.

       > [!NOTE]
       > GitHub's REST API considers every pull request an issue, but not every issue is a pull request. For this reason, "Issues" endpoints may return both issues and pull requests in the response. You can identify pull requests by the `pull_request` key. Be aware that the `id` of a pull request returned from "Issues" endpoints will be an _issue id_. To find out the pull request id, use the "[List pull requests](https://docs.github.com/rest/pulls/pulls#list-pull-requests)" endpoint.

       This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

       - **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
       - **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
       - **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
       - **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
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
      id: "issues/list-for-org",
      args: params,
      call: {__MODULE__, :list_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/issues",
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
      telemetry: [:github_ex, :issues, :list_for_org],
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

  @list_for_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"milestone", :milestone},
      {"state", :state},
      {"assignee", :assignee},
      {"type", :type},
      {"creator", :creator},
      {"mentioned", :mentioned},
      {"labels", :labels},
      {"sort", :sort},
      {"direction", :direction},
      {"since", :since},
      {"per_page", :per_page},
      {"page", :page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       List repository issues

       List issues in a repository. Only open issues will be listed.

       > [!NOTE]
       > GitHub's REST API considers every pull request an issue, but not every issue is a pull request. For this reason, "Issues" endpoints may return both issues and pull requests in the response. You can identify pull requests by the `pull_request` key. Be aware that the `id` of a pull request returned from "Issues" endpoints will be an _issue id_. To find out the pull request id, use the "[List pull requests](https://docs.github.com/rest/pulls/pulls#list-pull-requests)" endpoint.

       This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."

       - **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.
       - **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
       - **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
       - **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec list_for_repo(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_for_repo_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_for_repo(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_for_repo_request(client, params, opts) end,
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

  defp build_list_for_repo_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_for_repo_partition_spec)

    %{
      id: "issues/list-for-repo",
      args: params,
      call: {__MODULE__, :list_for_repo},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/issues",
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
      telemetry: [:github_ex, :issues, :list_for_repo],
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

  @list_issue_field_values_for_issue_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List issue field values for an issue\n\nLists all issue field values for an issue."
  @spec list_issue_field_values_for_issue(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_issue_field_values_for_issue(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_issue_field_values_for_issue_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_issue_field_values_for_issue(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_issue_field_values_for_issue(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_issue_field_values_for_issue_request(client, params, opts) end,
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

  defp build_list_issue_field_values_for_issue_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_issue_field_values_for_issue_partition_spec)

    %{
      id: "issues/list-issue-field-values-for-issue",
      args: params,
      call: {__MODULE__, :list_issue_field_values_for_issue},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/issue-field-values",
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
      telemetry: [:github_ex, :issues, :list_issue_field_values_for_issue],
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

  @list_labels_for_milestone_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"milestone_number", :milestone_number}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List labels for issues in a milestone\n\nLists labels for issues in a milestone."
  @spec list_labels_for_milestone(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_labels_for_milestone(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_labels_for_milestone_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_labels_for_milestone(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_labels_for_milestone(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_labels_for_milestone_request(client, params, opts) end,
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

  defp build_list_labels_for_milestone_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_labels_for_milestone_partition_spec)

    %{
      id: "issues/list-labels-for-milestone",
      args: params,
      call: {__MODULE__, :list_labels_for_milestone},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/milestones/{milestone_number}/labels",
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
      telemetry: [:github_ex, :issues, :list_labels_for_milestone],
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

  @list_labels_for_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List labels for a repository\n\nLists all labels for a repository."
  @spec list_labels_for_repo(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_labels_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_labels_for_repo_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_labels_for_repo(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_labels_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_labels_for_repo_request(client, params, opts) end,
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

  defp build_list_labels_for_repo_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_labels_for_repo_partition_spec)

    %{
      id: "issues/list-labels-for-repo",
      args: params,
      call: {__MODULE__, :list_labels_for_repo},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/labels",
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
      telemetry: [:github_ex, :issues, :list_labels_for_repo],
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

  @list_labels_on_issue_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List labels for an issue\n\nLists all labels for an issue."
  @spec list_labels_on_issue(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_labels_on_issue(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_labels_on_issue_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_labels_on_issue(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_labels_on_issue(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_labels_on_issue_request(client, params, opts) end,
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

  defp build_list_labels_on_issue_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_labels_on_issue_partition_spec)

    %{
      id: "issues/list-labels-on-issue",
      args: params,
      call: {__MODULE__, :list_labels_on_issue},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/labels",
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
      telemetry: [:github_ex, :issues, :list_labels_on_issue],
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

  @list_milestones_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"state", :state},
      {"sort", :sort},
      {"direction", :direction},
      {"per_page", :per_page},
      {"page", :page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List milestones\n\nLists milestones for a repository."
  @spec list_milestones(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_milestones(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_milestones_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_milestones(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_milestones(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_milestones_request(client, params, opts) end,
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

  defp build_list_milestones_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_milestones_partition_spec)

    %{
      id: "issues/list-milestones",
      args: params,
      call: {__MODULE__, :list_milestones},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/milestones",
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
      telemetry: [:github_ex, :issues, :list_milestones],
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

  @list_sub_issues_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List sub-issues\n\nYou can use the REST API to list the sub-issues on an issue.\n\nThis endpoint supports the following custom media types. For more information, see [Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\n\n- **`application/vnd.github.raw+json`**: Returns the raw Markdown body. Response will include `body`. This is the default if you do not pass any specific media type.\n- **`application/vnd.github.text+json`**: Returns a text only representation of the Markdown body. Response will include `body_text`.\n- **`application/vnd.github.html+json`**: Returns HTML rendered from the body's Markdown. Response will include `body_html`.\n- **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`."
  @spec list_sub_issues(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_sub_issues(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_sub_issues_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_sub_issues(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_sub_issues(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_sub_issues_request(client, params, opts) end,
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

  defp build_list_sub_issues_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_sub_issues_partition_spec)

    %{
      id: "issues/list-sub-issues",
      args: params,
      call: {__MODULE__, :list_sub_issues},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/sub_issues",
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
      telemetry: [:github_ex, :issues, :list_sub_issues],
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

  @lock_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Lock an issue\n\nUsers with push access can lock an issue or pull request's conversation.\n\nNote that, if you choose not to pass any parameters, you'll need to set `Content-Length` to zero when calling out to this endpoint. For more information, see \"[HTTP method](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method).\""
  @spec lock(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def lock(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_lock_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_lock_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @lock_partition_spec)

    %{
      id: "issues/lock",
      args: params,
      call: {__MODULE__, :lock},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/lock",
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
      telemetry: [:github_ex, :issues, :lock],
      timeout: nil,
      pagination: nil
    }
  end

  @pin_comment_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Pin an issue comment\n\nYou can use the REST API to pin comments on issues.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.\n- **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.\n- **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.\n- **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`."
  @spec pin_comment(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def pin_comment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_pin_comment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_pin_comment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @pin_comment_partition_spec)

    %{
      id: "issues/pin-comment",
      args: params,
      call: {__MODULE__, :pin_comment},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/issues/comments/{comment_id}/pin",
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
      telemetry: [:github_ex, :issues, :pin_comment],
      timeout: nil,
      pagination: nil
    }
  end

  @remove_all_labels_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove all labels from an issue\n\nRemoves all labels from an issue."
  @spec remove_all_labels(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def remove_all_labels(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_remove_all_labels_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_remove_all_labels_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @remove_all_labels_partition_spec)

    %{
      id: "issues/remove-all-labels",
      args: params,
      call: {__MODULE__, :remove_all_labels},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/labels",
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
      telemetry: [:github_ex, :issues, :remove_all_labels],
      timeout: nil,
      pagination: nil
    }
  end

  @remove_assignees_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove assignees from an issue\n\nRemoves one or more assignees from an issue."
  @spec remove_assignees(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def remove_assignees(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_remove_assignees_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_remove_assignees_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @remove_assignees_partition_spec)

    %{
      id: "issues/remove-assignees",
      args: params,
      call: {__MODULE__, :remove_assignees},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/assignees",
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
      telemetry: [:github_ex, :issues, :remove_assignees],
      timeout: nil,
      pagination: nil
    }
  end

  @remove_dependency_blocked_by_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"issue_number", :issue_number},
      {"issue_id", :issue_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove dependency an issue is blocked by\n\nYou can use the REST API to remove a dependency that an issue is blocked by.\n\nRemoving content too quickly using this endpoint may result in secondary rate limiting.\nFor more information, see [Rate limits for the API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)\nand [Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api).\n\nThis endpoint supports the following custom media types. For more information, see [Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\n- **`application/vnd.github.raw+json`**: Returns the raw Markdown body. Response will include `body`. This is the default if you do not pass a specific media type.\n- **`application/vnd.github.text+json`**: Returns a text only representation of the Markdown body. Response will include `body_text`.\n- **`application/vnd.github.html+json`**: Returns HTML rendered from the body's Markdown. Response will include `body_html`.\n- **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`."
  @spec remove_dependency_blocked_by(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def remove_dependency_blocked_by(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_remove_dependency_blocked_by_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_remove_dependency_blocked_by_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @remove_dependency_blocked_by_partition_spec)

    %{
      id: "issues/remove-dependency-blocked-by",
      args: params,
      call: {__MODULE__, :remove_dependency_blocked_by},
      opts: opts,
      method: :delete,
      path_template:
        "/repos/{owner}/{repo}/issues/{issue_number}/dependencies/blocked_by/{issue_id}",
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
      telemetry: [:github_ex, :issues, :remove_dependency_blocked_by],
      timeout: nil,
      pagination: nil
    }
  end

  @remove_label_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"issue_number", :issue_number},
      {"name", :name}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove a label from an issue\n\nRemoves the specified label from the issue, and returns the remaining labels on the issue. This endpoint returns a `404 Not Found` status if the label does not exist."
  @spec remove_label(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def remove_label(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_remove_label_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_remove_label_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @remove_label_partition_spec)

    %{
      id: "issues/remove-label",
      args: params,
      call: {__MODULE__, :remove_label},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/labels/{name}",
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
      telemetry: [:github_ex, :issues, :remove_label],
      timeout: nil,
      pagination: nil
    }
  end

  @remove_sub_issue_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Remove sub-issue

       You can use the REST API to remove a sub-issue from an issue.
       Removing content too quickly using this endpoint may result in secondary rate limiting.
       For more information, see "[Rate limits for the API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)"
       and "[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."
       This endpoint supports the following custom media types. For more information, see "[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types)."
       - **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass a specific media type.
       - **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.
       - **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.
       - **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`.
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec remove_sub_issue(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def remove_sub_issue(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_remove_sub_issue_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_remove_sub_issue_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @remove_sub_issue_partition_spec)

    %{
      id: "issues/remove-sub-issue",
      args: params,
      call: {__MODULE__, :remove_sub_issue},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/sub_issue",
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
      telemetry: [:github_ex, :issues, :remove_sub_issue],
      timeout: nil,
      pagination: nil
    }
  end

  @reprioritize_sub_issue_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Reprioritize sub-issue\n\nYou can use the REST API to reprioritize a sub-issue to a different position in the parent list."
  @spec reprioritize_sub_issue(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def reprioritize_sub_issue(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_reprioritize_sub_issue_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_reprioritize_sub_issue_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @reprioritize_sub_issue_partition_spec)

    %{
      id: "issues/reprioritize-sub-issue",
      args: params,
      call: {__MODULE__, :reprioritize_sub_issue},
      opts: opts,
      method: :patch,
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/sub_issues/priority",
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
      telemetry: [:github_ex, :issues, :reprioritize_sub_issue],
      timeout: nil,
      pagination: nil
    }
  end

  @set_issue_field_values_partition_spec %{
    path: [{"repository_id", :repository_id}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Set issue field values for an issue

       Set custom field values for an issue, replacing any existing values. You can set values for organization-level issue fields that have been defined for the repository's organization.

       This endpoint supports the following field data types:
       - **`text`**: String values for text fields
       - **`single_select`**: Option names for single-select fields (must match an existing option name)
       - **`number`**: Numeric values for number fields
       - **`date`**: ISO 8601 date strings for date fields

       This operation will replace all existing field values with the provided ones. If you want to add field values without replacing existing ones, use the `POST` endpoint instead.

       Only users with push access to the repository can set issue field values. If you don't have the proper permissions, you'll receive a `403 Forbidden` response.

       This endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications). Creating content too quickly using this endpoint may result in secondary rate limiting. For more information, see "[Rate limits for the API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)"
       and "[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api)."
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec set_issue_field_values(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def set_issue_field_values(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_set_issue_field_values_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_issue_field_values_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @set_issue_field_values_partition_spec)

    %{
      id: "issues/set-issue-field-values",
      args: params,
      call: {__MODULE__, :set_issue_field_values},
      opts: opts,
      method: :put,
      path_template: "/repositories/{repository_id}/issues/{issue_number}/issue-field-values",
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
      telemetry: [:github_ex, :issues, :set_issue_field_values],
      timeout: nil,
      pagination: nil
    }
  end

  @set_labels_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set labels for an issue\n\nRemoves any previous labels and sets the new labels for an issue."
  @spec set_labels(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def set_labels(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_set_labels_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_labels_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @set_labels_partition_spec)

    %{
      id: "issues/set-labels",
      args: params,
      call: {__MODULE__, :set_labels},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/labels",
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
      telemetry: [:github_ex, :issues, :set_labels],
      timeout: nil,
      pagination: nil
    }
  end

  @unlock_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Unlock an issue\n\nUsers with push access can unlock an issue's conversation."
  @spec unlock(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def unlock(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_unlock_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_unlock_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @unlock_partition_spec)

    %{
      id: "issues/unlock",
      args: params,
      call: {__MODULE__, :unlock},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/lock",
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
      telemetry: [:github_ex, :issues, :unlock],
      timeout: nil,
      pagination: nil
    }
  end

  @unpin_comment_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Unpin an issue comment\n\nYou can use the REST API to unpin comments on issues."
  @spec unpin_comment(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def unpin_comment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_unpin_comment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_unpin_comment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @unpin_comment_partition_spec)

    %{
      id: "issues/unpin-comment",
      args: params,
      call: {__MODULE__, :unpin_comment},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/issues/comments/{comment_id}/pin",
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
      telemetry: [:github_ex, :issues, :unpin_comment],
      timeout: nil,
      pagination: nil
    }
  end

  @update_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update an issue\n\nIssue owners and users with push access or Triage role can edit an issue.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.\n- **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.\n- **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.\n- **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`."
  @spec update(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_partition_spec)

    %{
      id: "issues/update",
      args: params,
      call: {__MODULE__, :update},
      opts: opts,
      method: :patch,
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}",
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
      telemetry: [:github_ex, :issues, :update],
      timeout: nil,
      pagination: nil
    }
  end

  @update_comment_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update an issue comment\n\nYou can use the REST API to update comments on issues and pull requests. Every pull request is an issue, but not every issue is a pull request.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.\n- **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.\n- **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.\n- **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`."
  @spec update_comment(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_comment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_comment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_comment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_comment_partition_spec)

    %{
      id: "issues/update-comment",
      args: params,
      call: {__MODULE__, :update_comment},
      opts: opts,
      method: :patch,
      path_template: "/repos/{owner}/{repo}/issues/comments/{comment_id}",
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
      telemetry: [:github_ex, :issues, :update_comment],
      timeout: nil,
      pagination: nil
    }
  end

  @update_label_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"name", :name}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update a label\n\nUpdates a label using the given label name."
  @spec update_label(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_label(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_label_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_label_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_label_partition_spec)

    %{
      id: "issues/update-label",
      args: params,
      call: {__MODULE__, :update_label},
      opts: opts,
      method: :patch,
      path_template: "/repos/{owner}/{repo}/labels/{name}",
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
      telemetry: [:github_ex, :issues, :update_label],
      timeout: nil,
      pagination: nil
    }
  end

  @update_milestone_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"milestone_number", :milestone_number}
    ],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update a milestone"
  @spec update_milestone(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_milestone(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_milestone_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_milestone_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_milestone_partition_spec)

    %{
      id: "issues/update-milestone",
      args: params,
      call: {__MODULE__, :update_milestone},
      opts: opts,
      method: :patch,
      path_template: "/repos/{owner}/{repo}/milestones/{milestone_number}",
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
      telemetry: [:github_ex, :issues, :update_milestone],
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

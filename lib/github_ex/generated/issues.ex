defmodule GitHubEx.Issues do
  @moduledoc """
  Generated Github Ex operations for issues.
  """

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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_add_assignees_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_add_assignees_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @add_assignees_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/add-assignees",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :issues, :add_assignees],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_add_blocked_by_dependency_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_add_blocked_by_dependency_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @add_blocked_by_dependency_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/add-blocked-by-dependency",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :issues, :add_blocked_by_dependency],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @add_issue_field_values_partition_spec %{
    path: [{"repository_id", :repository_id}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add issue field values to an issue\n\nAdd custom field values to an issue. You can set values for organization-level issue fields that have been defined for the repository's organization.\nAdding an empty array will clear all existing field values for the issue.\n\nThis endpoint supports the following field data types:\n- **`text`**: String values for text fields\n- **`single_select`**: Option names for single-select fields (must match an existing option name)\n- **`number`**: Numeric values for number fields\n- **`date`**: ISO 8601 date strings for date fields\n\nOnly users with push access to the repository can add issue field values. If you don't have the proper permissions, you'll receive a `403 Forbidden` response.\n\nThis endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications). Creating content too quickly using this endpoint may result in secondary rate limiting. For more information, see \"[Rate limits for the API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)\"\nand \"[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api).\""
  @spec add_issue_field_values(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def add_issue_field_values(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_add_issue_field_values_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_add_issue_field_values_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @add_issue_field_values_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/add-issue-field-values",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :issues, :add_issue_field_values],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_add_labels_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_add_labels_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @add_labels_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/add-labels",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :issues, :add_labels],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @add_sub_issue_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add sub-issue\n\nYou can use the REST API to add sub-issues to issues.\n\nCreating content too quickly using this endpoint may result in secondary rate limiting.\nFor more information, see \"[Rate limits for the API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)\"\nand \"[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api).\"\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.\n- **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.\n- **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.\n- **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`."
  @spec add_sub_issue(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def add_sub_issue(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_add_sub_issue_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_add_sub_issue_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @add_sub_issue_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/add-sub-issue",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :issues, :add_sub_issue],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_check_user_can_be_assigned_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_check_user_can_be_assigned_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @check_user_can_be_assigned_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/check-user-can-be-assigned",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :issues, :check_user_can_be_assigned],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_check_user_can_be_assigned_to_issue_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_check_user_can_be_assigned_to_issue_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @check_user_can_be_assigned_to_issue_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/check-user-can-be-assigned-to-issue",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :issues, :check_user_can_be_assigned_to_issue],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @create_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create an issue\n\nAny user with pull access to a repository can create an issue. If [issues are disabled in the repository](https://docs.github.com/articles/disabling-issues/), the API returns a `410 Gone` status.\n\nThis endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications). Creating content too quickly using this endpoint may result in secondary rate limiting. For more information, see \"[Rate limits for the API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)\"\nand \"[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api).\"\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.\n- **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.\n- **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.\n- **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`."
  @spec create(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_create_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_create_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @create_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/create",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :issues, :create],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @create_comment_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create an issue comment\n\nYou can use the REST API to create comments on issues and pull requests. Every pull request is an issue, but not every issue is a pull request.\n\nThis endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications).\nCreating content too quickly using this endpoint may result in secondary rate limiting.\nFor more information, see \"[Rate limits for the API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)\"\nand \"[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api).\"\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.\n- **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.\n- **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.\n- **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`."
  @spec create_comment(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_comment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_create_comment_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_create_comment_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @create_comment_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/create-comment",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :issues, :create_comment],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_create_label_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_create_label_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @create_label_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/create-label",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :issues, :create_label],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_create_milestone_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_create_milestone_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @create_milestone_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/create-milestone",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :issues, :create_milestone],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_delete_comment_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_delete_comment_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_comment_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/delete-comment",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :issues, :delete_comment],
        timeout_ms: nil
      },
      pagination: nil
    })
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

  @doc "Delete an issue field value from an issue\n\nRemove a specific custom field value from an issue.\n\nOnly users with push access to the repository can delete issue field values. If you don't have the proper permissions, you'll receive a `403 Forbidden` response.\n\nIf the specified field does not have a value set on the issue, this operation will return a `404` error.\n\nThis endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications). Creating content too quickly using this endpoint may result in secondary rate limiting. For more information, see \"[Rate limits for the API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)\"\nand \"[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api).\""
  @spec delete_issue_field_value(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_issue_field_value(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_delete_issue_field_value_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_delete_issue_field_value_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_issue_field_value_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/delete-issue-field-value",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :issues, :delete_issue_field_value],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_delete_label_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_delete_label_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_label_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/delete-label",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :issues, :delete_label],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_delete_milestone_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_delete_milestone_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_milestone_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/delete-milestone",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :issues, :delete_milestone],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get an issue\n\nThe API returns a [`301 Moved Permanently` status](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api#follow-redirects) if the issue was\n[transferred](https://docs.github.com/articles/transferring-an-issue-to-another-repository/) to another repository. If\nthe issue was transferred to or deleted from a repository where the authenticated user lacks read access, the API\nreturns a `404 Not Found` status. If the issue was deleted from a repository where the authenticated user has read\naccess, the API returns a `410 Gone` status. To receive webhook events for transferred and deleted issues, subscribe\nto the [`issues`](https://docs.github.com/webhooks/event-payloads/#issues) webhook.\n\n> [!NOTE]\n> GitHub's REST API considers every pull request an issue, but not every issue is a pull request. For this reason, \"Issues\" endpoints may return both issues and pull requests in the response. You can identify pull requests by the `pull_request` key. Be aware that the `id` of a pull request returned from \"Issues\" endpoints will be an _issue id_. To find out the pull request id, use the \"[List pull requests](https://docs.github.com/rest/pulls/pulls#list-pull-requests)\" endpoint.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.\n- **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.\n- **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.\n- **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`."
  @spec get(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/get",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :issues, :get],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_comment_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_comment_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_comment_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/get-comment",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :issues, :get_comment],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_event_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_event_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_event_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/get-event",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :issues, :get_event],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_label_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_label_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_label_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/get-label",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :issues, :get_label],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_milestone_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_milestone_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_milestone_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/get-milestone",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :issues, :get_milestone],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_parent_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_parent_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_parent_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/get-parent",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :issues, :get_parent],
        timeout_ms: nil
      },
      pagination: nil
    })
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

  @doc "List issues assigned to the authenticated user\n\nList issues assigned to the authenticated user across all visible repositories including owned repositories, member\nrepositories, and organization repositories. You can use the `filter` query parameter to fetch issues that are not\nnecessarily assigned to you.\n\n> [!NOTE]\n> GitHub's REST API considers every pull request an issue, but not every issue is a pull request. For this reason, \"Issues\" endpoints may return both issues and pull requests in the response. You can identify pull requests by the `pull_request` key. Be aware that the `id` of a pull request returned from \"Issues\" endpoints will be an _issue id_. To find out the pull request id, use the \"[List pull requests](https://docs.github.com/rest/pulls/pulls#list-pull-requests)\" endpoint.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.\n- **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.\n- **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.\n- **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`."
  @spec list(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list(term(), map(), keyword()) :: Enumerable.t()
  def stream_list(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_operation(params) end,
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

  defp build_list_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/list",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :issues, :list],
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_assignees_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_assignees(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_assignees(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_assignees_operation(params) end,
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

  defp build_list_assignees_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_assignees_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/list-assignees",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :issues, :list_assignees],
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_comments_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_comments(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_comments(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_comments_operation(params) end,
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

  defp build_list_comments_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_comments_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/list-comments",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :issues, :list_comments],
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_comments_for_repo_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_comments_for_repo(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_comments_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_comments_for_repo_operation(params) end,
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

  defp build_list_comments_for_repo_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_comments_for_repo_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/list-comments-for-repo",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :issues, :list_comments_for_repo],
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_dependencies_blocked_by_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_dependencies_blocked_by(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_dependencies_blocked_by(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_dependencies_blocked_by_operation(params) end,
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

  defp build_list_dependencies_blocked_by_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_dependencies_blocked_by_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/list-dependencies-blocked-by",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :issues, :list_dependencies_blocked_by],
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_dependencies_blocking_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_dependencies_blocking(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_dependencies_blocking(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_dependencies_blocking_operation(params) end,
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

  defp build_list_dependencies_blocking_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_dependencies_blocking_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/list-dependencies-blocking",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :issues, :list_dependencies_blocking],
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_events_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_events(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_events(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_events_operation(params) end,
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

  defp build_list_events_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_events_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/list-events",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :issues, :list_events],
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_events_for_repo_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_events_for_repo(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_events_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_events_for_repo_operation(params) end,
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

  defp build_list_events_for_repo_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_events_for_repo_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/list-events-for-repo",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :issues, :list_events_for_repo],
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_events_for_timeline_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_events_for_timeline(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_events_for_timeline(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_events_for_timeline_operation(params) end,
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

  defp build_list_events_for_timeline_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_events_for_timeline_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/list-events-for-timeline",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :issues, :list_events_for_timeline],
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

  @doc "List user account issues assigned to the authenticated user\n\nList issues across owned and member repositories assigned to the authenticated user.\n\n> [!NOTE]\n> GitHub's REST API considers every pull request an issue, but not every issue is a pull request. For this reason, \"Issues\" endpoints may return both issues and pull requests in the response. You can identify pull requests by the `pull_request` key. Be aware that the `id` of a pull request returned from \"Issues\" endpoints will be an _issue id_. To find out the pull request id, use the \"[List pull requests](https://docs.github.com/rest/pulls/pulls#list-pull-requests)\" endpoint.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.\n- **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.\n- **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.\n- **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`."
  @spec list_for_authenticated_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_for_authenticated_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_for_authenticated_user_operation(params) end,
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

  defp build_list_for_authenticated_user_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_for_authenticated_user_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/list-for-authenticated-user",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :issues, :list_for_authenticated_user],
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

  @doc "List organization issues assigned to the authenticated user\n\nList issues in an organization assigned to the authenticated user.\n\n> [!NOTE]\n> GitHub's REST API considers every pull request an issue, but not every issue is a pull request. For this reason, \"Issues\" endpoints may return both issues and pull requests in the response. You can identify pull requests by the `pull_request` key. Be aware that the `id` of a pull request returned from \"Issues\" endpoints will be an _issue id_. To find out the pull request id, use the \"[List pull requests](https://docs.github.com/rest/pulls/pulls#list-pull-requests)\" endpoint.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.\n- **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.\n- **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.\n- **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`."
  @spec list_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_for_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_for_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_for_org_operation(params) end,
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

  defp build_list_for_org_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_for_org_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/list-for-org",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :issues, :list_for_org],
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

  @doc "List repository issues\n\nList issues in a repository. Only open issues will be listed.\n\n> [!NOTE]\n> GitHub's REST API considers every pull request an issue, but not every issue is a pull request. For this reason, \"Issues\" endpoints may return both issues and pull requests in the response. You can identify pull requests by the `pull_request` key. Be aware that the `id` of a pull request returned from \"Issues\" endpoints will be an _issue id_. To find out the pull request id, use the \"[List pull requests](https://docs.github.com/rest/pulls/pulls#list-pull-requests)\" endpoint.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass any specific media type.\n- **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.\n- **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.\n- **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`."
  @spec list_for_repo(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_for_repo_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_for_repo(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_for_repo_operation(params) end,
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

  defp build_list_for_repo_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_for_repo_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/list-for-repo",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :issues, :list_for_repo],
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_issue_field_values_for_issue_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_issue_field_values_for_issue(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_issue_field_values_for_issue(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_issue_field_values_for_issue_operation(params) end,
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

  defp build_list_issue_field_values_for_issue_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @list_issue_field_values_for_issue_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/list-issue-field-values-for-issue",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :issues, :list_issue_field_values_for_issue],
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_labels_for_milestone_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_labels_for_milestone(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_labels_for_milestone(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_labels_for_milestone_operation(params) end,
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

  defp build_list_labels_for_milestone_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_labels_for_milestone_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/list-labels-for-milestone",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :issues, :list_labels_for_milestone],
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_labels_for_repo_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_labels_for_repo(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_labels_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_labels_for_repo_operation(params) end,
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

  defp build_list_labels_for_repo_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_labels_for_repo_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/list-labels-for-repo",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :issues, :list_labels_for_repo],
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_labels_on_issue_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_labels_on_issue(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_labels_on_issue(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_labels_on_issue_operation(params) end,
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

  defp build_list_labels_on_issue_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_labels_on_issue_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/list-labels-on-issue",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :issues, :list_labels_on_issue],
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_milestones_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_milestones(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_milestones(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_milestones_operation(params) end,
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

  defp build_list_milestones_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_milestones_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/list-milestones",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :issues, :list_milestones],
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_sub_issues_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_sub_issues(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_sub_issues(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_sub_issues_operation(params) end,
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

  defp build_list_sub_issues_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_sub_issues_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/list-sub-issues",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :issues, :list_sub_issues],
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_lock_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_lock_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @lock_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/lock",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :issues, :lock],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_pin_comment_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_pin_comment_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @pin_comment_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/pin-comment",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :issues, :pin_comment],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_remove_all_labels_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_remove_all_labels_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @remove_all_labels_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/remove-all-labels",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :issues, :remove_all_labels],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_remove_assignees_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_remove_assignees_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @remove_assignees_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/remove-assignees",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :issues, :remove_assignees],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_remove_dependency_blocked_by_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_remove_dependency_blocked_by_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @remove_dependency_blocked_by_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/remove-dependency-blocked-by",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :issues, :remove_dependency_blocked_by],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_remove_label_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_remove_label_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @remove_label_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/remove-label",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :issues, :remove_label],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @remove_sub_issue_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove sub-issue\n\nYou can use the REST API to remove a sub-issue from an issue.\nRemoving content too quickly using this endpoint may result in secondary rate limiting.\nFor more information, see \"[Rate limits for the API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)\"\nand \"[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api).\"\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n- **`application/vnd.github.raw+json`**: Returns the raw markdown body. Response will include `body`. This is the default if you do not pass a specific media type.\n- **`application/vnd.github.text+json`**: Returns a text only representation of the markdown body. Response will include `body_text`.\n- **`application/vnd.github.html+json`**: Returns HTML rendered from the body's markdown. Response will include `body_html`.\n- **`application/vnd.github.full+json`**: Returns raw, text, and HTML representations. Response will include `body`, `body_text`, and `body_html`."
  @spec remove_sub_issue(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def remove_sub_issue(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_remove_sub_issue_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_remove_sub_issue_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @remove_sub_issue_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/remove-sub-issue",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :issues, :remove_sub_issue],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_reprioritize_sub_issue_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_reprioritize_sub_issue_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @reprioritize_sub_issue_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/reprioritize-sub-issue",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :issues, :reprioritize_sub_issue],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @set_issue_field_values_partition_spec %{
    path: [{"repository_id", :repository_id}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set issue field values for an issue\n\nSet custom field values for an issue, replacing any existing values. You can set values for organization-level issue fields that have been defined for the repository's organization.\n\nThis endpoint supports the following field data types:\n- **`text`**: String values for text fields\n- **`single_select`**: Option names for single-select fields (must match an existing option name)\n- **`number`**: Numeric values for number fields\n- **`date`**: ISO 8601 date strings for date fields\n\nThis operation will replace all existing field values with the provided ones. If you want to add field values without replacing existing ones, use the `POST` endpoint instead.\n\nOnly users with push access to the repository can set issue field values. If you don't have the proper permissions, you'll receive a `403 Forbidden` response.\n\nThis endpoint triggers [notifications](https://docs.github.com/github/managing-subscriptions-and-notifications-on-github/about-notifications). Creating content too quickly using this endpoint may result in secondary rate limiting. For more information, see \"[Rate limits for the API](https://docs.github.com/rest/using-the-rest-api/rate-limits-for-the-rest-api#about-secondary-rate-limits)\"\nand \"[Best practices for using the REST API](https://docs.github.com/rest/guides/best-practices-for-using-the-rest-api).\""
  @spec set_issue_field_values(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def set_issue_field_values(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_set_issue_field_values_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_set_issue_field_values_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @set_issue_field_values_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/set-issue-field-values",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :issues, :set_issue_field_values],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_set_labels_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_set_labels_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @set_labels_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/set-labels",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :issues, :set_labels],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_unlock_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_unlock_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @unlock_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/unlock",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :issues, :unlock],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_unpin_comment_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_unpin_comment_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @unpin_comment_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/unpin-comment",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :issues, :unpin_comment],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_update_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_update_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @update_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/update",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :issues, :update],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_update_comment_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_update_comment_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @update_comment_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/update-comment",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :issues, :update_comment],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_update_label_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_update_label_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @update_label_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/update-label",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :issues, :update_label],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_update_milestone_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_update_milestone_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @update_milestone_partition_spec)

    Pristine.Operation.new(%{
      id: "issues/update-milestone",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :issues, :update_milestone],
        timeout_ms: nil
      },
      pagination: nil
    })
  end
end

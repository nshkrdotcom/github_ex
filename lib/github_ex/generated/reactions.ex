defmodule GitHubEx.Reactions do
  @moduledoc """
  Generated Github Ex operations for reactions.
  """

  @create_for_commit_comment_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create reaction for a commit comment\n\nCreate a reaction to a [commit comment](https://docs.github.com/rest/commits/comments#get-a-commit-comment). A response with an HTTP `200` status means that you already added the reaction type to this commit comment."
  @spec create_for_commit_comment(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_for_commit_comment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_create_for_commit_comment_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_create_for_commit_comment_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @create_for_commit_comment_partition_spec)

    Pristine.Operation.new(%{
      id: "reactions/create-for-commit-comment",
      method: :post,
      path_template: "/repos/{owner}/{repo}/comments/{comment_id}/reactions",
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
        telemetry_event: [:github_ex, :reactions, :create_for_commit_comment],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @create_for_issue_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create reaction for an issue\n\nCreate a reaction to an [issue](https://docs.github.com/rest/issues/issues#get-an-issue). A response with an HTTP `200` status means that you already added the reaction type to this issue."
  @spec create_for_issue(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_for_issue(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_create_for_issue_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_create_for_issue_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @create_for_issue_partition_spec)

    Pristine.Operation.new(%{
      id: "reactions/create-for-issue",
      method: :post,
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/reactions",
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
        telemetry_event: [:github_ex, :reactions, :create_for_issue],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @create_for_issue_comment_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create reaction for an issue comment\n\nCreate a reaction to an [issue comment](https://docs.github.com/rest/issues/comments#get-an-issue-comment). A response with an HTTP `200` status means that you already added the reaction type to this issue comment."
  @spec create_for_issue_comment(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_for_issue_comment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_create_for_issue_comment_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_create_for_issue_comment_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @create_for_issue_comment_partition_spec)

    Pristine.Operation.new(%{
      id: "reactions/create-for-issue-comment",
      method: :post,
      path_template: "/repos/{owner}/{repo}/issues/comments/{comment_id}/reactions",
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
        telemetry_event: [:github_ex, :reactions, :create_for_issue_comment],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @create_for_pull_request_review_comment_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create reaction for a pull request review comment\n\nCreate a reaction to a [pull request review comment](https://docs.github.com/rest/pulls/comments#get-a-review-comment-for-a-pull-request). A response with an HTTP `200` status means that you already added the reaction type to this pull request review comment."
  @spec create_for_pull_request_review_comment(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def create_for_pull_request_review_comment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_create_for_pull_request_review_comment_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_create_for_pull_request_review_comment_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @create_for_pull_request_review_comment_partition_spec)

    Pristine.Operation.new(%{
      id: "reactions/create-for-pull-request-review-comment",
      method: :post,
      path_template: "/repos/{owner}/{repo}/pulls/comments/{comment_id}/reactions",
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
        telemetry_event: [:github_ex, :reactions, :create_for_pull_request_review_comment],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @create_for_release_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"release_id", :release_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create reaction for a release\n\nCreate a reaction to a [release](https://docs.github.com/rest/releases/releases#get-a-release). A response with a `Status: 200 OK` means that you already added the reaction type to this release."
  @spec create_for_release(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_for_release(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_create_for_release_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_create_for_release_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @create_for_release_partition_spec)

    Pristine.Operation.new(%{
      id: "reactions/create-for-release",
      method: :post,
      path_template: "/repos/{owner}/{repo}/releases/{release_id}/reactions",
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
        telemetry_event: [:github_ex, :reactions, :create_for_release],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_for_commit_comment_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"comment_id", :comment_id},
      {"reaction_id", :reaction_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a commit comment reaction\n\n> [!NOTE]\n> You can also specify a repository by `repository_id` using the route `DELETE /repositories/:repository_id/comments/:comment_id/reactions/:reaction_id`.\n\nDelete a reaction to a [commit comment](https://docs.github.com/rest/commits/comments#get-a-commit-comment)."
  @spec delete_for_commit_comment(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_for_commit_comment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_delete_for_commit_comment_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_delete_for_commit_comment_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_for_commit_comment_partition_spec)

    Pristine.Operation.new(%{
      id: "reactions/delete-for-commit-comment",
      method: :delete,
      path_template: "/repos/{owner}/{repo}/comments/{comment_id}/reactions/{reaction_id}",
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
        telemetry_event: [:github_ex, :reactions, :delete_for_commit_comment],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_for_issue_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"issue_number", :issue_number},
      {"reaction_id", :reaction_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete an issue reaction\n\n> [!NOTE]\n> You can also specify a repository by `repository_id` using the route `DELETE /repositories/:repository_id/issues/:issue_number/reactions/:reaction_id`.\n\nDelete a reaction to an [issue](https://docs.github.com/rest/issues/issues#get-an-issue)."
  @spec delete_for_issue(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_for_issue(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_delete_for_issue_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_delete_for_issue_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_for_issue_partition_spec)

    Pristine.Operation.new(%{
      id: "reactions/delete-for-issue",
      method: :delete,
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/reactions/{reaction_id}",
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
        telemetry_event: [:github_ex, :reactions, :delete_for_issue],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_for_issue_comment_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"comment_id", :comment_id},
      {"reaction_id", :reaction_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete an issue comment reaction\n\n> [!NOTE]\n> You can also specify a repository by `repository_id` using the route `DELETE delete /repositories/:repository_id/issues/comments/:comment_id/reactions/:reaction_id`.\n\nDelete a reaction to an [issue comment](https://docs.github.com/rest/issues/comments#get-an-issue-comment)."
  @spec delete_for_issue_comment(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_for_issue_comment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_delete_for_issue_comment_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_delete_for_issue_comment_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_for_issue_comment_partition_spec)

    Pristine.Operation.new(%{
      id: "reactions/delete-for-issue-comment",
      method: :delete,
      path_template: "/repos/{owner}/{repo}/issues/comments/{comment_id}/reactions/{reaction_id}",
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
        telemetry_event: [:github_ex, :reactions, :delete_for_issue_comment],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_for_pull_request_comment_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"comment_id", :comment_id},
      {"reaction_id", :reaction_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a pull request comment reaction\n\n> [!NOTE]\n> You can also specify a repository by `repository_id` using the route `DELETE /repositories/:repository_id/pulls/comments/:comment_id/reactions/:reaction_id.`\n\nDelete a reaction to a [pull request review comment](https://docs.github.com/rest/pulls/comments#get-a-review-comment-for-a-pull-request)."
  @spec delete_for_pull_request_comment(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def delete_for_pull_request_comment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_delete_for_pull_request_comment_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_delete_for_pull_request_comment_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @delete_for_pull_request_comment_partition_spec)

    Pristine.Operation.new(%{
      id: "reactions/delete-for-pull-request-comment",
      method: :delete,
      path_template: "/repos/{owner}/{repo}/pulls/comments/{comment_id}/reactions/{reaction_id}",
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
        telemetry_event: [:github_ex, :reactions, :delete_for_pull_request_comment],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_for_release_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"release_id", :release_id},
      {"reaction_id", :reaction_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a release reaction\n\n> [!NOTE]\n> You can also specify a repository by `repository_id` using the route `DELETE delete /repositories/:repository_id/releases/:release_id/reactions/:reaction_id`.\n\nDelete a reaction to a [release](https://docs.github.com/rest/releases/releases#get-a-release)."
  @spec delete_for_release(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_for_release(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_delete_for_release_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  defp build_delete_for_release_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_for_release_partition_spec)

    Pristine.Operation.new(%{
      id: "reactions/delete-for-release",
      method: :delete,
      path_template: "/repos/{owner}/{repo}/releases/{release_id}/reactions/{reaction_id}",
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
        telemetry_event: [:github_ex, :reactions, :delete_for_release],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @list_for_commit_comment_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"content", :content}, {"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List reactions for a commit comment\n\nList the reactions to a [commit comment](https://docs.github.com/rest/commits/comments#get-a-commit-comment)."
  @spec list_for_commit_comment(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_for_commit_comment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_for_commit_comment_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_for_commit_comment(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_for_commit_comment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_for_commit_comment_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_for_commit_comment_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_for_commit_comment_partition_spec)

    Pristine.Operation.new(%{
      id: "reactions/list-for-commit-comment",
      method: :get,
      path_template: "/repos/{owner}/{repo}/comments/{comment_id}/reactions",
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
        telemetry_event: [:github_ex, :reactions, :list_for_commit_comment],
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

  @list_for_issue_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"content", :content}, {"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List reactions for an issue\n\nList the reactions to an [issue](https://docs.github.com/rest/issues/issues#get-an-issue)."
  @spec list_for_issue(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_for_issue(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_for_issue_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_for_issue(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_for_issue(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_for_issue_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_for_issue_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_for_issue_partition_spec)

    Pristine.Operation.new(%{
      id: "reactions/list-for-issue",
      method: :get,
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/reactions",
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
        telemetry_event: [:github_ex, :reactions, :list_for_issue],
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

  @list_for_issue_comment_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"content", :content}, {"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List reactions for an issue comment\n\nList the reactions to an [issue comment](https://docs.github.com/rest/issues/comments#get-an-issue-comment)."
  @spec list_for_issue_comment(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_for_issue_comment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_for_issue_comment_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_for_issue_comment(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_for_issue_comment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_for_issue_comment_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_for_issue_comment_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_for_issue_comment_partition_spec)

    Pristine.Operation.new(%{
      id: "reactions/list-for-issue-comment",
      method: :get,
      path_template: "/repos/{owner}/{repo}/issues/comments/{comment_id}/reactions",
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
        telemetry_event: [:github_ex, :reactions, :list_for_issue_comment],
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

  @list_for_pull_request_review_comment_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"content", :content}, {"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List reactions for a pull request review comment\n\nList the reactions to a [pull request review comment](https://docs.github.com/rest/pulls/comments#get-a-review-comment-for-a-pull-request)."
  @spec list_for_pull_request_review_comment(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_for_pull_request_review_comment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_for_pull_request_review_comment_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_for_pull_request_review_comment(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_for_pull_request_review_comment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_for_pull_request_review_comment_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_for_pull_request_review_comment_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @list_for_pull_request_review_comment_partition_spec)

    Pristine.Operation.new(%{
      id: "reactions/list-for-pull-request-review-comment",
      method: :get,
      path_template: "/repos/{owner}/{repo}/pulls/comments/{comment_id}/reactions",
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
        telemetry_event: [:github_ex, :reactions, :list_for_pull_request_review_comment],
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

  @list_for_release_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"release_id", :release_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"content", :content}, {"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List reactions for a release\n\nList the reactions to a [release](https://docs.github.com/rest/releases/releases#get-a-release)."
  @spec list_for_release(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_for_release(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_list_for_release_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_list_for_release(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_for_release(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_list_for_release_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

          case Pristine.execute(runtime_client, operation, execute_opts) do
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

  defp build_list_for_release_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_for_release_partition_spec)

    Pristine.Operation.new(%{
      id: "reactions/list-for-release",
      method: :get,
      path_template: "/repos/{owner}/{repo}/releases/{release_id}/reactions",
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
        telemetry_event: [:github_ex, :reactions, :list_for_release],
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
end

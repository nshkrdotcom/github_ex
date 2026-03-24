defmodule GitHubEx.Reactions do
  @moduledoc """
  Generated Github Ex operations for reactions.
  """

  alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient

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
    opts = normalize_request_opts!(opts)
    request = build_create_for_commit_comment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_for_commit_comment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_for_commit_comment_partition_spec)

    %{
      id: "reactions/create-for-commit-comment",
      args: params,
      call: {__MODULE__, :create_for_commit_comment},
      opts: opts,
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :reactions, :create_for_commit_comment],
      timeout: nil,
      pagination: nil
    }
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
    opts = normalize_request_opts!(opts)
    request = build_create_for_issue_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_for_issue_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_for_issue_partition_spec)

    %{
      id: "reactions/create-for-issue",
      args: params,
      call: {__MODULE__, :create_for_issue},
      opts: opts,
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :reactions, :create_for_issue],
      timeout: nil,
      pagination: nil
    }
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
    opts = normalize_request_opts!(opts)
    request = build_create_for_issue_comment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_for_issue_comment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_for_issue_comment_partition_spec)

    %{
      id: "reactions/create-for-issue-comment",
      args: params,
      call: {__MODULE__, :create_for_issue_comment},
      opts: opts,
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :reactions, :create_for_issue_comment],
      timeout: nil,
      pagination: nil
    }
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
    opts = normalize_request_opts!(opts)
    request = build_create_for_pull_request_review_comment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_for_pull_request_review_comment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @create_for_pull_request_review_comment_partition_spec)

    %{
      id: "reactions/create-for-pull-request-review-comment",
      args: params,
      call: {__MODULE__, :create_for_pull_request_review_comment},
      opts: opts,
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :reactions, :create_for_pull_request_review_comment],
      timeout: nil,
      pagination: nil
    }
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
    opts = normalize_request_opts!(opts)
    request = build_create_for_release_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_for_release_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_for_release_partition_spec)

    %{
      id: "reactions/create-for-release",
      args: params,
      call: {__MODULE__, :create_for_release},
      opts: opts,
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :reactions, :create_for_release],
      timeout: nil,
      pagination: nil
    }
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
    opts = normalize_request_opts!(opts)
    request = build_delete_for_commit_comment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_for_commit_comment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_for_commit_comment_partition_spec)

    %{
      id: "reactions/delete-for-commit-comment",
      args: params,
      call: {__MODULE__, :delete_for_commit_comment},
      opts: opts,
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
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :reactions, :delete_for_commit_comment],
      timeout: nil,
      pagination: nil
    }
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
    opts = normalize_request_opts!(opts)
    request = build_delete_for_issue_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_for_issue_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_for_issue_partition_spec)

    %{
      id: "reactions/delete-for-issue",
      args: params,
      call: {__MODULE__, :delete_for_issue},
      opts: opts,
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
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :reactions, :delete_for_issue],
      timeout: nil,
      pagination: nil
    }
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
    opts = normalize_request_opts!(opts)
    request = build_delete_for_issue_comment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_for_issue_comment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_for_issue_comment_partition_spec)

    %{
      id: "reactions/delete-for-issue-comment",
      args: params,
      call: {__MODULE__, :delete_for_issue_comment},
      opts: opts,
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
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :reactions, :delete_for_issue_comment],
      timeout: nil,
      pagination: nil
    }
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
    opts = normalize_request_opts!(opts)
    request = build_delete_for_pull_request_comment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_for_pull_request_comment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_for_pull_request_comment_partition_spec)

    %{
      id: "reactions/delete-for-pull-request-comment",
      args: params,
      call: {__MODULE__, :delete_for_pull_request_comment},
      opts: opts,
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
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :reactions, :delete_for_pull_request_comment],
      timeout: nil,
      pagination: nil
    }
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
    opts = normalize_request_opts!(opts)
    request = build_delete_for_release_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_for_release_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_for_release_partition_spec)

    %{
      id: "reactions/delete-for-release",
      args: params,
      call: {__MODULE__, :delete_for_release},
      opts: opts,
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
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :reactions, :delete_for_release],
      timeout: nil,
      pagination: nil
    }
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
    opts = normalize_request_opts!(opts)
    request = build_list_for_commit_comment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_for_commit_comment(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_for_commit_comment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_for_commit_comment_request(client, params, opts) end,
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

  defp build_list_for_commit_comment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_for_commit_comment_partition_spec)

    %{
      id: "reactions/list-for-commit-comment",
      args: params,
      call: {__MODULE__, :list_for_commit_comment},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :reactions, :list_for_commit_comment],
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
    opts = normalize_request_opts!(opts)
    request = build_list_for_issue_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_for_issue(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_for_issue(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_for_issue_request(client, params, opts) end,
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

  defp build_list_for_issue_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_for_issue_partition_spec)

    %{
      id: "reactions/list-for-issue",
      args: params,
      call: {__MODULE__, :list_for_issue},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :reactions, :list_for_issue],
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
    opts = normalize_request_opts!(opts)
    request = build_list_for_issue_comment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_for_issue_comment(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_for_issue_comment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_for_issue_comment_request(client, params, opts) end,
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

  defp build_list_for_issue_comment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_for_issue_comment_partition_spec)

    %{
      id: "reactions/list-for-issue-comment",
      args: params,
      call: {__MODULE__, :list_for_issue_comment},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :reactions, :list_for_issue_comment],
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
    opts = normalize_request_opts!(opts)
    request = build_list_for_pull_request_review_comment_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_for_pull_request_review_comment(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_for_pull_request_review_comment(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_for_pull_request_review_comment_request(client, params, opts) end,
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

  defp build_list_for_pull_request_review_comment_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @list_for_pull_request_review_comment_partition_spec)

    %{
      id: "reactions/list-for-pull-request-review-comment",
      args: params,
      call: {__MODULE__, :list_for_pull_request_review_comment},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :reactions, :list_for_pull_request_review_comment],
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
    opts = normalize_request_opts!(opts)
    request = build_list_for_release_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_for_release(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_for_release(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_for_release_request(client, params, opts) end,
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

  defp build_list_for_release_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_for_release_partition_spec)

    %{
      id: "reactions/list-for-release",
      args: params,
      call: {__MODULE__, :list_for_release},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :reactions, :list_for_release],
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

  @spec normalize_request_opts!(list()) :: keyword()
  defp normalize_request_opts!(opts) when is_list(opts) do
    if Keyword.keyword?(opts) do
      opts
    else
      raise ArgumentError, "request opts must be a keyword list"
    end
  end
end

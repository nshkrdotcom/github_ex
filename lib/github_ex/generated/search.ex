defmodule GitHubEx.Search do
  @moduledoc """
  Generated Github Ex operations for search.
  """

  @code_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"q", :q},
      {"sort", :sort},
      {"order", :order},
      {"per_page", :per_page},
      {"page", :page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Search code\n\nSearches for query terms inside of a file. This method returns up to 100 results [per page](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api).\n\nWhen searching for code, you can get text match metadata for the file **content** and file **path** fields when you pass the `text-match` media type. For more details about how to receive highlighted search results, see [Text match metadata](https://docs.github.com/rest/search/search#text-match-metadata).\n\nFor example, if you want to find the definition of the `addClass` function inside [jQuery](https://github.com/jquery/jquery) repository, your query would look something like this:\n\n`q=addClass+in:file+language:js+repo:jquery/jquery`\n\nThis query searches for the keyword `addClass` within a file's contents. The query limits the search to files where the language is JavaScript in the `jquery/jquery` repository.\n\nConsiderations for code search:\n\nDue to the complexity of searching code, there are a few restrictions on how searches are performed:\n\n*   Only the _default branch_ is considered. In most cases, this will be the `master` branch.\n*   Only files smaller than 384 KB are searchable.\n*   You must always include at least one search term when searching source code. For example, searching for [`language:go`](https://github.com/search?utf8=%E2%9C%93&q=language%3Ago&type=Code) is not valid, while [`amazing\nlanguage:go`](https://github.com/search?utf8=%E2%9C%93&q=amazing+language%3Ago&type=Code) is.\n\nThis endpoint requires you to authenticate and limits you to 10 requests per minute."
  @spec code(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def code(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_code_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_code(term(), map(), keyword()) :: Enumerable.t()
  def stream_code(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_code_operation(params) end,
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

  defp build_code_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @code_partition_spec)

    Pristine.Operation.new(%{
      id: "search/code",
      method: :get,
      path_template: "/search/code",
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
        telemetry_event: [:github_ex, :search, :code],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: ["items"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
  end

  @commits_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"q", :q},
      {"sort", :sort},
      {"order", :order},
      {"per_page", :per_page},
      {"page", :page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Search commits\n\nFind commits via various criteria on the default branch (usually `main`). This method returns up to 100 results [per page](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api).\n\nWhen searching for commits, you can get text match metadata for the **message** field when you provide the `text-match` media type. For more details about how to receive highlighted search results, see [Text match\nmetadata](https://docs.github.com/rest/search/search#text-match-metadata).\n\nFor example, if you want to find commits related to CSS in the [octocat/Spoon-Knife](https://github.com/octocat/Spoon-Knife) repository. Your query would look something like this:\n\n`q=repo:octocat/Spoon-Knife+css`"
  @spec commits(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def commits(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_commits_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_commits(term(), map(), keyword()) :: Enumerable.t()
  def stream_commits(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_commits_operation(params) end,
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

  defp build_commits_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @commits_partition_spec)

    Pristine.Operation.new(%{
      id: "search/commits",
      method: :get,
      path_template: "/search/commits",
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
        telemetry_event: [:github_ex, :search, :commits],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: ["items"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
  end

  @issues_and_pull_requests_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"q", :q},
      {"sort", :sort},
      {"order", :order},
      {"per_page", :per_page},
      {"page", :page},
      {"advanced_search", :advanced_search}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Search issues and pull requests\n\nFind issues by state and keyword. This method returns up to 100 results [per page](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api).\n\nWhen searching for issues, you can get text match metadata for the issue **title**, issue **body**, and issue **comment body** fields when you pass the `text-match` media type. For more details about how to receive highlighted\nsearch results, see [Text match metadata](https://docs.github.com/rest/search/search#text-match-metadata).\n\nFor example, if you want to find the oldest unresolved Python bugs on Windows. Your query might look something like this.\n\n`q=windows+label:bug+language:python+state:open&sort=created&order=asc`\n\nThis query searches for the keyword `windows`, within any open issue that is labeled as `bug`. The search runs across repositories whose primary language is Python. The results are sorted by creation date in ascending order, which means the oldest issues appear first in the search results.\n\n> [!NOTE]\n> For requests made by GitHub Apps with a user access token, you can't retrieve a combination of issues and pull requests in a single query. Requests that don't include the `is:issue` or `is:pull-request` qualifier will receive an HTTP `422 Unprocessable Entity` response. To get results for both issues and pull requests, you must send separate queries for issues and pull requests. For more information about the `is` qualifier, see \"[Searching only issues or pull requests](https://docs.github.com/github/searching-for-information-on-github/searching-issues-and-pull-requests#search-only-issues-or-pull-requests).\""
  @spec issues_and_pull_requests(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def issues_and_pull_requests(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_issues_and_pull_requests_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_issues_and_pull_requests(term(), map(), keyword()) :: Enumerable.t()
  def stream_issues_and_pull_requests(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_issues_and_pull_requests_operation(params) end,
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

  defp build_issues_and_pull_requests_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @issues_and_pull_requests_partition_spec)

    Pristine.Operation.new(%{
      id: "search/issues-and-pull-requests",
      method: :get,
      path_template: "/search/issues",
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
        telemetry_event: [:github_ex, :search, :issues_and_pull_requests],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: ["items"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
  end

  @labels_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"repository_id", :repository_id},
      {"q", :q},
      {"sort", :sort},
      {"order", :order},
      {"per_page", :per_page},
      {"page", :page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Search labels\n\nFind labels in a repository with names or descriptions that match search keywords. Returns up to 100 results [per page](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api).\n\nWhen searching for labels, you can get text match metadata for the label **name** and **description** fields when you pass the `text-match` media type. For more details about how to receive highlighted search results, see [Text match metadata](https://docs.github.com/rest/search/search#text-match-metadata).\n\nFor example, if you want to find labels in the `linguist` repository that match `bug`, `defect`, or `enhancement`. Your query might look like this:\n\n`q=bug+defect+enhancement&repository_id=64778136`\n\nThe labels that best match the query appear first in the search results."
  @spec labels(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def labels(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_labels_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_labels(term(), map(), keyword()) :: Enumerable.t()
  def stream_labels(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_labels_operation(params) end,
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

  defp build_labels_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @labels_partition_spec)

    Pristine.Operation.new(%{
      id: "search/labels",
      method: :get,
      path_template: "/search/labels",
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
        telemetry_event: [:github_ex, :search, :labels],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: ["items"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
  end

  @repos_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"q", :q},
      {"sort", :sort},
      {"order", :order},
      {"per_page", :per_page},
      {"page", :page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Search repositories\n\nFind repositories via various criteria. This method returns up to 100 results [per page](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api).\n\nWhen searching for repositories, you can get text match metadata for the **name** and **description** fields when you pass the `text-match` media type. For more details about how to receive highlighted search results, see [Text match metadata](https://docs.github.com/rest/search/search#text-match-metadata).\n\nFor example, if you want to search for popular Tetris repositories written in assembly code, your query might look like this:\n\n`q=tetris+language:assembly&sort=stars&order=desc`\n\nThis query searches for repositories with the word `tetris` in the name, the description, or the README. The results are limited to repositories where the primary language is assembly. The results are sorted by stars in descending order, so that the most popular repositories appear first in the search results."
  @spec repos(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def repos(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_repos_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_repos(term(), map(), keyword()) :: Enumerable.t()
  def stream_repos(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_repos_operation(params) end,
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

  defp build_repos_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @repos_partition_spec)

    Pristine.Operation.new(%{
      id: "search/repos",
      method: :get,
      path_template: "/search/repositories",
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
        telemetry_event: [:github_ex, :search, :repos],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: ["items"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
  end

  @topics_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"q", :q}, {"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Search topics\n\nFind topics via various criteria. Results are sorted by best match. This method returns up to 100 results [per page](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api). See \"[Searching topics](https://docs.github.com/articles/searching-topics/)\" for a detailed list of qualifiers.\n\nWhen searching for topics, you can get text match metadata for the topic's **short\\_description**, **description**, **name**, or **display\\_name** field when you pass the `text-match` media type. For more details about how to receive highlighted search results, see [Text match metadata](https://docs.github.com/rest/search/search#text-match-metadata).\n\nFor example, if you want to search for topics related to Ruby that are featured on https://github.com/topics. Your query might look like this:\n\n`q=ruby+is:featured`\n\nThis query searches for topics with the keyword `ruby` and limits the results to find only topics that are featured. The topics that are the best match for the query appear first in the search results."
  @spec topics(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def topics(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_topics_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_topics(term(), map(), keyword()) :: Enumerable.t()
  def stream_topics(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_topics_operation(params) end,
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

  defp build_topics_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @topics_partition_spec)

    Pristine.Operation.new(%{
      id: "search/topics",
      method: :get,
      path_template: "/search/topics",
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
        telemetry_event: [:github_ex, :search, :topics],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: ["items"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
  end

  @users_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"q", :q},
      {"sort", :sort},
      {"order", :order},
      {"per_page", :per_page},
      {"page", :page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Search users\n\nFind users via various criteria. This method returns up to 100 results [per page](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api).\n\nWhen searching for users, you can get text match metadata for the issue **login**, public **email**, and **name** fields when you pass the `text-match` media type. For more details about highlighting search results, see [Text match metadata](https://docs.github.com/rest/search/search#text-match-metadata). For more details about how to receive highlighted search results, see [Text match metadata](https://docs.github.com/rest/search/search#text-match-metadata).\n\nFor example, if you're looking for a list of popular users, you might try this query:\n\n`q=tom+repos:%3E42+followers:%3E1000`\n\nThis query searches for users with the name `tom`. The results are restricted to users with more than 42 repositories and over 1,000 followers.\n\nThis endpoint does not accept authentication and will only include publicly visible users. As an alternative, you can use the GraphQL API. The GraphQL API requires authentication and will return private users, including Enterprise Managed Users (EMUs), that you are authorized to view. For more information, see \"[GraphQL Queries](https://docs.github.com/graphql/reference/queries#search).\""
  @spec users(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def users(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)
    operation = build_users_operation(params)
    operation = GitHubEx.Client.runtime_operation(client, operation, execute_opts)

    Pristine.execute(runtime_client, operation, execute_opts)
  end

  @spec stream_users(term(), map(), keyword()) :: Enumerable.t()
  def stream_users(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)

    Stream.resource(
      fn -> build_users_operation(params) end,
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

  defp build_users_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @users_partition_spec)

    Pristine.Operation.new(%{
      id: "search/users",
      method: :get,
      path_template: "/search/users",
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
        telemetry_event: [:github_ex, :search, :users],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: ["items"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
  end
end

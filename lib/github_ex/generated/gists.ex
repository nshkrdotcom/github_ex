defmodule GitHubEx.Gists do
  @moduledoc """
  Generated Github Ex operations for gists.
  """

  @check_is_starred_partition_spec %{
    path: [{"gist_id", :gist_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Check if a gist is starred"
  @spec check_is_starred(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def check_is_starred(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_check_is_starred_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_check_is_starred_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @check_is_starred_partition_spec)

    Pristine.Operation.new(%{
      id: "gists/check-is-starred",
      method: :get,
      path_template: "/gists/{gist_id}/star",
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
        telemetry_event: [:github_ex, :gists, :check_is_starred],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @create_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a gist\n\nAllows you to add a new gist with one or more files.\n\n> [!NOTE]\n> Don't name your files \"gistfile\" with a numerical suffix. This is the format of the automatic naming scheme that Gist uses internally."
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
      id: "gists/create",
      method: :post,
      path_template: "/gists",
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
        telemetry_event: [:github_ex, :gists, :create],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @create_comment_partition_spec %{
    path: [{"gist_id", :gist_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a gist comment\n\nCreates a comment on a gist.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.raw+json`**: Returns the raw markdown. This is the default if you do not pass any specific media type.\n- **`application/vnd.github.base64+json`**: Returns the base64-encoded contents. This can be useful if your gist contains any invalid UTF-8 sequences."
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
      id: "gists/create-comment",
      method: :post,
      path_template: "/gists/{gist_id}/comments",
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
        telemetry_event: [:github_ex, :gists, :create_comment],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_partition_spec %{
    path: [{"gist_id", :gist_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a gist"
  @spec delete(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_delete_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_delete_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_partition_spec)

    Pristine.Operation.new(%{
      id: "gists/delete",
      method: :delete,
      path_template: "/gists/{gist_id}",
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
        telemetry_event: [:github_ex, :gists, :delete],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_comment_partition_spec %{
    path: [{"gist_id", :gist_id}, {"comment_id", :comment_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a gist comment"
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
      id: "gists/delete-comment",
      method: :delete,
      path_template: "/gists/{gist_id}/comments/{comment_id}",
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
        telemetry_event: [:github_ex, :gists, :delete_comment],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @fork_partition_spec %{
    path: [{"gist_id", :gist_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Fork a gist"
  @spec fork(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def fork(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_fork_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_fork_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @fork_partition_spec)

    Pristine.Operation.new(%{
      id: "gists/fork",
      method: :post,
      path_template: "/gists/{gist_id}/forks",
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
        telemetry_event: [:github_ex, :gists, :fork],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_partition_spec %{
    path: [{"gist_id", :gist_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a gist\n\nGets a specified gist.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.raw+json`**: Returns the raw markdown. This is the default if you do not pass any specific media type.\n- **`application/vnd.github.base64+json`**: Returns the base64-encoded contents. This can be useful if your gist contains any invalid UTF-8 sequences."
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
      id: "gists/get",
      method: :get,
      path_template: "/gists/{gist_id}",
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
        telemetry_event: [:github_ex, :gists, :get],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_comment_partition_spec %{
    path: [{"gist_id", :gist_id}, {"comment_id", :comment_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a gist comment\n\nGets a comment on a gist.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.raw+json`**: Returns the raw markdown. This is the default if you do not pass any specific media type.\n- **`application/vnd.github.base64+json`**: Returns the base64-encoded contents. This can be useful if your gist contains any invalid UTF-8 sequences."
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
      id: "gists/get-comment",
      method: :get,
      path_template: "/gists/{gist_id}/comments/{comment_id}",
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
        telemetry_event: [:github_ex, :gists, :get_comment],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_revision_partition_spec %{
    path: [{"gist_id", :gist_id}, {"sha", :sha}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a gist revision\n\nGets a specified gist revision.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.raw+json`**: Returns the raw markdown. This is the default if you do not pass any specific media type.\n- **`application/vnd.github.base64+json`**: Returns the base64-encoded contents. This can be useful if your gist contains any invalid UTF-8 sequences."
  @spec get_revision(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_revision(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_revision_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_revision_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_revision_partition_spec)

    Pristine.Operation.new(%{
      id: "gists/get-revision",
      method: :get,
      path_template: "/gists/{gist_id}/{sha}",
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
        telemetry_event: [:github_ex, :gists, :get_revision],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @list_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"since", :since}, {"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List gists for the authenticated user\n\nLists the authenticated user's gists or if called anonymously, this endpoint returns all public gists:"
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
      id: "gists/list",
      method: :get,
      path_template: "/gists",
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
        telemetry_event: [:github_ex, :gists, :list],
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
    path: [{"gist_id", :gist_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List gist comments\n\nLists the comments on a gist.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.raw+json`**: Returns the raw markdown. This is the default if you do not pass any specific media type.\n- **`application/vnd.github.base64+json`**: Returns the base64-encoded contents. This can be useful if your gist contains any invalid UTF-8 sequences."
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
      id: "gists/list-comments",
      method: :get,
      path_template: "/gists/{gist_id}/comments",
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
        telemetry_event: [:github_ex, :gists, :list_comments],
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

  @list_commits_partition_spec %{
    path: [{"gist_id", :gist_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List gist commits"
  @spec list_commits(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_commits(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_commits_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_commits(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_commits(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_commits_operation(params) end,
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

  defp build_list_commits_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_commits_partition_spec)

    Pristine.Operation.new(%{
      id: "gists/list-commits",
      method: :get,
      path_template: "/gists/{gist_id}/commits",
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
        telemetry_event: [:github_ex, :gists, :list_commits],
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

  @list_for_user_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"since", :since}, {"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List gists for a user\n\nLists public gists for the specified user:"
  @spec list_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_for_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_for_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_for_user_operation(params) end,
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

  defp build_list_for_user_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_for_user_partition_spec)

    Pristine.Operation.new(%{
      id: "gists/list-for-user",
      method: :get,
      path_template: "/users/{username}/gists",
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
        telemetry_event: [:github_ex, :gists, :list_for_user],
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

  @list_forks_partition_spec %{
    path: [{"gist_id", :gist_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List gist forks"
  @spec list_forks(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_forks(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_forks_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_forks(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_forks(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_forks_operation(params) end,
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

  defp build_list_forks_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_forks_partition_spec)

    Pristine.Operation.new(%{
      id: "gists/list-forks",
      method: :get,
      path_template: "/gists/{gist_id}/forks",
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
        telemetry_event: [:github_ex, :gists, :list_forks],
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

  @list_public_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"since", :since}, {"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List public gists\n\nList public gists sorted by most recently updated to least recently updated.\n\nNote: With [pagination](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api), you can fetch up to 3000 gists. For example, you can fetch 100 pages with 30 gists per page or 30 pages with 100 gists per page."
  @spec list_public(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_public(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_public_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_public(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_public(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_public_operation(params) end,
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

  defp build_list_public_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_public_partition_spec)

    Pristine.Operation.new(%{
      id: "gists/list-public",
      method: :get,
      path_template: "/gists/public",
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
        telemetry_event: [:github_ex, :gists, :list_public],
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

  @list_starred_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"since", :since}, {"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List starred gists\n\nList the authenticated user's starred gists:"
  @spec list_starred(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_starred(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_starred_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_starred(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_starred(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_starred_operation(params) end,
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

  defp build_list_starred_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_starred_partition_spec)

    Pristine.Operation.new(%{
      id: "gists/list-starred",
      method: :get,
      path_template: "/gists/starred",
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
        telemetry_event: [:github_ex, :gists, :list_starred],
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

  @star_partition_spec %{
    path: [{"gist_id", :gist_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Star a gist\n\nNote that you'll need to set `Content-Length` to zero when calling out to this endpoint. For more information, see \"[HTTP method](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method).\""
  @spec star(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def star(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_star_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_star_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @star_partition_spec)

    Pristine.Operation.new(%{
      id: "gists/star",
      method: :put,
      path_template: "/gists/{gist_id}/star",
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
        telemetry_event: [:github_ex, :gists, :star],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @unstar_partition_spec %{
    path: [{"gist_id", :gist_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Unstar a gist"
  @spec unstar(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def unstar(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_unstar_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_unstar_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @unstar_partition_spec)

    Pristine.Operation.new(%{
      id: "gists/unstar",
      method: :delete,
      path_template: "/gists/{gist_id}/star",
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
        telemetry_event: [:github_ex, :gists, :unstar],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @update_partition_spec %{
    path: [{"gist_id", :gist_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update a gist\n\nAllows you to update a gist's description and to update, delete, or rename gist files. Files\nfrom the previous version of the gist that aren't explicitly changed during an edit\nare unchanged.\n\nAt least one of `description` or `files` is required.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.raw+json`**: Returns the raw markdown. This is the default if you do not pass any specific media type.\n- **`application/vnd.github.base64+json`**: Returns the base64-encoded contents. This can be useful if your gist contains any invalid UTF-8 sequences."
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
      id: "gists/update",
      method: :patch,
      path_template: "/gists/{gist_id}",
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
        telemetry_event: [:github_ex, :gists, :update],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @update_comment_partition_spec %{
    path: [{"gist_id", :gist_id}, {"comment_id", :comment_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update a gist comment\n\nUpdates a comment on a gist.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.raw+json`**: Returns the raw markdown. This is the default if you do not pass any specific media type.\n- **`application/vnd.github.base64+json`**: Returns the base64-encoded contents. This can be useful if your gist contains any invalid UTF-8 sequences."
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
      id: "gists/update-comment",
      method: :patch,
      path_template: "/gists/{gist_id}/comments/{comment_id}",
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
        telemetry_event: [:github_ex, :gists, :update_comment],
        timeout_ms: nil
      },
      pagination: nil
    })
  end
end

defmodule GitHubEx.Migrations do
  @moduledoc """
  Generated Github Ex operations for migrations.
  """

  @cancel_import_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Cancel an import\n\nStop an import for a repository.\n\n> [!WARNING]\n> **Endpoint closing down notice:** Due to very low levels of usage and available alternatives, this endpoint is closing down and will no longer be available from 00:00 UTC on April 12, 2024. For more details and alternatives, see the [changelog](https://gh.io/source-imports-api-deprecation)."
  @spec cancel_import(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def cancel_import(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_cancel_import_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_cancel_import_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @cancel_import_partition_spec)

    Pristine.Operation.new(%{
      id: "migrations/cancel-import",
      method: :delete,
      path_template: "/repos/{owner}/{repo}/import",
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
        telemetry_event: [:github_ex, :migrations, :cancel_import],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_archive_for_authenticated_user_partition_spec %{
    path: [{"migration_id", :migration_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a user migration archive\n\nDeletes a previous migration archive. Downloadable migration archives are automatically deleted after seven days. Migration metadata, which is returned in the [List user migrations](https://docs.github.com/rest/migrations/users#list-user-migrations) and [Get a user migration status](https://docs.github.com/rest/migrations/users#get-a-user-migration-status) endpoints, will continue to be available even after an archive is deleted."
  @spec delete_archive_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def delete_archive_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_delete_archive_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_delete_archive_for_authenticated_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @delete_archive_for_authenticated_user_partition_spec)

    Pristine.Operation.new(%{
      id: "migrations/delete-archive-for-authenticated-user",
      method: :delete,
      path_template: "/user/migrations/{migration_id}/archive",
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
        telemetry_event: [:github_ex, :migrations, :delete_archive_for_authenticated_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_archive_for_org_partition_spec %{
    path: [{"org", :org}, {"migration_id", :migration_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete an organization migration archive\n\nDeletes a previous migration archive. Migration archives are automatically deleted after seven days."
  @spec delete_archive_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_archive_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_delete_archive_for_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_delete_archive_for_org_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_archive_for_org_partition_spec)

    Pristine.Operation.new(%{
      id: "migrations/delete-archive-for-org",
      method: :delete,
      path_template: "/orgs/{org}/migrations/{migration_id}/archive",
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
        telemetry_event: [:github_ex, :migrations, :delete_archive_for_org],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @download_archive_for_org_partition_spec %{
    path: [{"org", :org}, {"migration_id", :migration_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Download an organization migration archive\n\nFetches the URL to a migration archive."
  @spec download_archive_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def download_archive_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_download_archive_for_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_download_archive_for_org_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @download_archive_for_org_partition_spec)

    Pristine.Operation.new(%{
      id: "migrations/download-archive-for-org",
      method: :get,
      path_template: "/orgs/{org}/migrations/{migration_id}/archive",
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
        telemetry_event: [:github_ex, :migrations, :download_archive_for_org],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_archive_for_authenticated_user_partition_spec %{
    path: [{"migration_id", :migration_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Download a user migration archive\n\nFetches the URL to download the migration archive as a `tar.gz` file. Depending on the resources your repository uses, the migration archive can contain JSON files with data for these objects:\n\n*   attachments\n*   bases\n*   commit\\_comments\n*   issue\\_comments\n*   issue\\_events\n*   issues\n*   milestones\n*   organizations\n*   projects\n*   protected\\_branches\n*   pull\\_request\\_reviews\n*   pull\\_requests\n*   releases\n*   repositories\n*   review\\_comments\n*   schema\n*   users\n\nThe archive will also contain an `attachments` directory that includes all attachment files uploaded to GitHub.com and a `repositories` directory that contains the repository's Git data."
  @spec get_archive_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_archive_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_archive_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_archive_for_authenticated_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @get_archive_for_authenticated_user_partition_spec)

    Pristine.Operation.new(%{
      id: "migrations/get-archive-for-authenticated-user",
      method: :get,
      path_template: "/user/migrations/{migration_id}/archive",
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
        telemetry_event: [:github_ex, :migrations, :get_archive_for_authenticated_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_commit_authors_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"since", :since}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get commit authors\n\nEach type of source control system represents authors in a different way. For example, a Git commit author has a display name and an email address, but a Subversion commit author just has a username. The GitHub Importer will make the author information valid, but the author might not be correct. For example, it will change the bare Subversion username `hubot` into something like `hubot <hubot@12341234-abab-fefe-8787-fedcba987654>`.\n\nThis endpoint and the [Map a commit author](https://docs.github.com/rest/migrations/source-imports#map-a-commit-author) endpoint allow you to provide correct Git author information.\n\n> [!WARNING]\n> **Endpoint closing down notice:** Due to very low levels of usage and available alternatives, this endpoint is closing down and will no longer be available from 00:00 UTC on April 12, 2024. For more details and alternatives, see the [changelog](https://gh.io/source-imports-api-deprecation)."
  @spec get_commit_authors(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_commit_authors(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_commit_authors_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_commit_authors_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_commit_authors_partition_spec)

    Pristine.Operation.new(%{
      id: "migrations/get-commit-authors",
      method: :get,
      path_template: "/repos/{owner}/{repo}/import/authors",
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
        telemetry_event: [:github_ex, :migrations, :get_commit_authors],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_import_status_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get an import status\n\nView the progress of an import.\n\n> [!WARNING]\n> **Endpoint closing down notice:** Due to very low levels of usage and available alternatives, this endpoint is closing down and will no longer be available from 00:00 UTC on April 12, 2024. For more details and alternatives, see the [changelog](https://gh.io/source-imports-api-deprecation).\n\n**Import status**\n\nThis section includes details about the possible values of the `status` field of the Import Progress response.\n\nAn import that does not have errors will progress through these steps:\n\n*   `detecting` - the \"detection\" step of the import is in progress because the request did not include a `vcs` parameter. The import is identifying the type of source control present at the URL.\n*   `importing` - the \"raw\" step of the import is in progress. This is where commit data is fetched from the original repository. The import progress response will include `commit_count` (the total number of raw commits that will be imported) and `percent` (0 - 100, the current progress through the import).\n*   `mapping` - the \"rewrite\" step of the import is in progress. This is where SVN branches are converted to Git branches, and where author updates are applied. The import progress response does not include progress information.\n*   `pushing` - the \"push\" step of the import is in progress. This is where the importer updates the repository on GitHub. The import progress response will include `push_percent`, which is the percent value reported by `git push` when it is \"Writing objects\".\n*   `complete` - the import is complete, and the repository is ready on GitHub.\n\nIf there are problems, you will see one of these in the `status` field:\n\n*   `auth_failed` - the import requires authentication in order to connect to the original repository. To update authentication for the import, please see the [Update an import](https://docs.github.com/rest/migrations/source-imports#update-an-import) section.\n*   `error` - the import encountered an error. The import progress response will include the `failed_step` and an error message. Contact [GitHub Support](https://support.github.com/contact?tags=dotcom-rest-api) for more information.\n*   `detection_needs_auth` - the importer requires authentication for the originating repository to continue detection. To update authentication for the import, please see the [Update an import](https://docs.github.com/rest/migrations/source-imports#update-an-import) section.\n*   `detection_found_nothing` - the importer didn't recognize any source control at the URL. To resolve, [Cancel the import](https://docs.github.com/rest/migrations/source-imports#cancel-an-import) and [retry](https://docs.github.com/rest/migrations/source-imports#start-an-import) with the correct URL.\n*   `detection_found_multiple` - the importer found several projects or repositories at the provided URL. When this is the case, the Import Progress response will also include a `project_choices` field with the possible project choices as values. To update project choice, please see the [Update an import](https://docs.github.com/rest/migrations/source-imports#update-an-import) section.\n\n**The project_choices field**\n\nWhen multiple projects are found at the provided URL, the response hash will include a `project_choices` field, the value of which is an array of hashes each representing a project choice. The exact key/value pairs of the project hashes will differ depending on the version control type.\n\n**Git LFS related fields**\n\nThis section includes details about Git LFS related fields that may be present in the Import Progress response.\n\n*   `use_lfs` - describes whether the import has been opted in or out of using Git LFS. The value can be `opt_in`, `opt_out`, or `undecided` if no action has been taken.\n*   `has_large_files` - the boolean value describing whether files larger than 100MB were found during the `importing` step.\n*   `large_files_size` - the total size in gigabytes of files larger than 100MB found in the originating repository.\n*   `large_files_count` - the total number of files larger than 100MB found in the originating repository. To see a list of these files, make a \"Get Large Files\" request."
  @spec get_import_status(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_import_status(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_import_status_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_import_status_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_import_status_partition_spec)

    Pristine.Operation.new(%{
      id: "migrations/get-import-status",
      method: :get,
      path_template: "/repos/{owner}/{repo}/import",
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
        telemetry_event: [:github_ex, :migrations, :get_import_status],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_large_files_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get large files\n\nList files larger than 100MB found during the import\n\n> [!WARNING]\n> **Endpoint closing down notice:** Due to very low levels of usage and available alternatives, this endpoint is closing down and will no longer be available from 00:00 UTC on April 12, 2024. For more details and alternatives, see the [changelog](https://gh.io/source-imports-api-deprecation)."
  @spec get_large_files(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_large_files(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_large_files_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_large_files_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_large_files_partition_spec)

    Pristine.Operation.new(%{
      id: "migrations/get-large-files",
      method: :get,
      path_template: "/repos/{owner}/{repo}/import/large_files",
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
        telemetry_event: [:github_ex, :migrations, :get_large_files],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_status_for_authenticated_user_partition_spec %{
    path: [{"migration_id", :migration_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"exclude", :exclude}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a user migration status\n\nFetches a single user migration. The response includes the `state` of the migration, which can be one of the following values:\n\n*   `pending` - the migration hasn't started yet.\n*   `exporting` - the migration is in progress.\n*   `exported` - the migration finished successfully.\n*   `failed` - the migration failed.\n\nOnce the migration has been `exported` you can [download the migration archive](https://docs.github.com/rest/migrations/users#download-a-user-migration-archive)."
  @spec get_status_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_status_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_status_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_status_for_authenticated_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @get_status_for_authenticated_user_partition_spec)

    Pristine.Operation.new(%{
      id: "migrations/get-status-for-authenticated-user",
      method: :get,
      path_template: "/user/migrations/{migration_id}",
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
        telemetry_event: [:github_ex, :migrations, :get_status_for_authenticated_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_status_for_org_partition_spec %{
    path: [{"org", :org}, {"migration_id", :migration_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"exclude", :exclude}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get an organization migration status\n\nFetches the status of a migration.\n\nThe `state` of a migration can be one of the following values:\n\n*   `pending`, which means the migration hasn't started yet.\n*   `exporting`, which means the migration is in progress.\n*   `exported`, which means the migration finished successfully.\n*   `failed`, which means the migration failed."
  @spec get_status_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_status_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_status_for_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_status_for_org_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_status_for_org_partition_spec)

    Pristine.Operation.new(%{
      id: "migrations/get-status-for-org",
      method: :get,
      path_template: "/orgs/{org}/migrations/{migration_id}",
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
        telemetry_event: [:github_ex, :migrations, :get_status_for_org],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @list_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List user migrations\n\nLists all migrations a user has started."
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
      id: "migrations/list-for-authenticated-user",
      method: :get,
      path_template: "/user/migrations",
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
        telemetry_event: [:github_ex, :migrations, :list_for_authenticated_user],
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
    query: [{"per_page", :per_page}, {"page", :page}, {"exclude", :exclude}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List organization migrations\n\nLists the most recent migrations, including both exports (which can be started through the REST API) and imports (which cannot be started using the REST API).\n\nA list of `repositories` is only returned for export migrations."
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
      id: "migrations/list-for-org",
      method: :get,
      path_template: "/orgs/{org}/migrations",
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
        telemetry_event: [:github_ex, :migrations, :list_for_org],
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

  @list_repos_for_authenticated_user_partition_spec %{
    path: [{"migration_id", :migration_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List repositories for a user migration\n\nLists all the repositories for this user migration."
  @spec list_repos_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_repos_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_repos_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_repos_for_authenticated_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_repos_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_repos_for_authenticated_user_operation(params) end,
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

  defp build_list_repos_for_authenticated_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @list_repos_for_authenticated_user_partition_spec)

    Pristine.Operation.new(%{
      id: "migrations/list-repos-for-authenticated-user",
      method: :get,
      path_template: "/user/migrations/{migration_id}/repositories",
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
        telemetry_event: [:github_ex, :migrations, :list_repos_for_authenticated_user],
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

  @list_repos_for_org_partition_spec %{
    path: [{"org", :org}, {"migration_id", :migration_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List repositories in an organization migration\n\nList all the repositories for this organization migration."
  @spec list_repos_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_repos_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_repos_for_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_repos_for_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_repos_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_repos_for_org_operation(params) end,
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

  defp build_list_repos_for_org_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_repos_for_org_partition_spec)

    Pristine.Operation.new(%{
      id: "migrations/list-repos-for-org",
      method: :get,
      path_template: "/orgs/{org}/migrations/{migration_id}/repositories",
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
        telemetry_event: [:github_ex, :migrations, :list_repos_for_org],
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

  @map_commit_author_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"author_id", :author_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Map a commit author\n\nUpdate an author's identity for the import. Your application can continue updating authors any time before you push\nnew commits to the repository.\n\n> [!WARNING]\n> **Endpoint closing down notice:** Due to very low levels of usage and available alternatives, this endpoint is closing down and will no longer be available from 00:00 UTC on April 12, 2024. For more details and alternatives, see the [changelog](https://gh.io/source-imports-api-deprecation)."
  @spec map_commit_author(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def map_commit_author(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_map_commit_author_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_map_commit_author_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @map_commit_author_partition_spec)

    Pristine.Operation.new(%{
      id: "migrations/map-commit-author",
      method: :patch,
      path_template: "/repos/{owner}/{repo}/import/authors/{author_id}",
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
        telemetry_event: [:github_ex, :migrations, :map_commit_author],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @set_lfs_preference_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update Git LFS preference\n\nYou can import repositories from Subversion, Mercurial, and TFS that include files larger than 100MB. This ability\nis powered by [Git LFS](https://git-lfs.com).\n\nYou can learn more about our LFS feature and working with large files [on our help\nsite](https://docs.github.com/repositories/working-with-files/managing-large-files).\n\n> [!WARNING]\n> **Endpoint closing down notice:** Due to very low levels of usage and available alternatives, this endpoint is closing down and will no longer be available from 00:00 UTC on April 12, 2024. For more details and alternatives, see the [changelog](https://gh.io/source-imports-api-deprecation)."
  @spec set_lfs_preference(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def set_lfs_preference(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_set_lfs_preference_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_set_lfs_preference_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @set_lfs_preference_partition_spec)

    Pristine.Operation.new(%{
      id: "migrations/set-lfs-preference",
      method: :patch,
      path_template: "/repos/{owner}/{repo}/import/lfs",
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
        telemetry_event: [:github_ex, :migrations, :set_lfs_preference],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @start_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Start a user migration\n\nInitiates the generation of a user migration archive."
  @spec start_for_authenticated_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def start_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_start_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_start_for_authenticated_user_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @start_for_authenticated_user_partition_spec)

    Pristine.Operation.new(%{
      id: "migrations/start-for-authenticated-user",
      method: :post,
      path_template: "/user/migrations",
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
        telemetry_event: [:github_ex, :migrations, :start_for_authenticated_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @start_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Start an organization migration\n\nInitiates the generation of a migration archive."
  @spec start_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def start_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_start_for_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_start_for_org_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @start_for_org_partition_spec)

    Pristine.Operation.new(%{
      id: "migrations/start-for-org",
      method: :post,
      path_template: "/orgs/{org}/migrations",
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
        telemetry_event: [:github_ex, :migrations, :start_for_org],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @start_import_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Start an import\n\nStart a source import to a GitHub repository using GitHub Importer.\nImporting into a GitHub repository with GitHub Actions enabled is not supported and will\nreturn a status `422 Unprocessable Entity` response.\n\n> [!WARNING]\n> **Endpoint closing down notice:** Due to very low levels of usage and available alternatives, this endpoint is closing down and will no longer be available from 00:00 UTC on April 12, 2024. For more details and alternatives, see the [changelog](https://gh.io/source-imports-api-deprecation)."
  @spec start_import(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def start_import(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_start_import_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_start_import_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @start_import_partition_spec)

    Pristine.Operation.new(%{
      id: "migrations/start-import",
      method: :put,
      path_template: "/repos/{owner}/{repo}/import",
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
        telemetry_event: [:github_ex, :migrations, :start_import],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @unlock_repo_for_authenticated_user_partition_spec %{
    path: [{"migration_id", :migration_id}, {"repo_name", :repo_name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Unlock a user repository\n\nUnlocks a repository. You can lock repositories when you [start a user migration](https://docs.github.com/rest/migrations/users#start-a-user-migration). Once the migration is complete you can unlock each repository to begin using it again or [delete the repository](https://docs.github.com/rest/repos/repos#delete-a-repository) if you no longer need the source data. Returns a status of `404 Not Found` if the repository is not locked."
  @spec unlock_repo_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def unlock_repo_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_unlock_repo_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_unlock_repo_for_authenticated_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @unlock_repo_for_authenticated_user_partition_spec)

    Pristine.Operation.new(%{
      id: "migrations/unlock-repo-for-authenticated-user",
      method: :delete,
      path_template: "/user/migrations/{migration_id}/repos/{repo_name}/lock",
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
        telemetry_event: [:github_ex, :migrations, :unlock_repo_for_authenticated_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @unlock_repo_for_org_partition_spec %{
    path: [
      {"org", :org},
      {"migration_id", :migration_id},
      {"repo_name", :repo_name}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Unlock an organization repository\n\nUnlocks a repository that was locked for migration. You should unlock each migrated repository and [delete them](https://docs.github.com/rest/repos/repos#delete-a-repository) when the migration is complete and you no longer need the source data."
  @spec unlock_repo_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def unlock_repo_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_unlock_repo_for_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_unlock_repo_for_org_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @unlock_repo_for_org_partition_spec)

    Pristine.Operation.new(%{
      id: "migrations/unlock-repo-for-org",
      method: :delete,
      path_template: "/orgs/{org}/migrations/{migration_id}/repos/{repo_name}/lock",
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
        telemetry_event: [:github_ex, :migrations, :unlock_repo_for_org],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @update_import_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update an import\n\nAn import can be updated with credentials or a project choice by passing in the appropriate parameters in this API\nrequest. If no parameters are provided, the import will be restarted.\n\nSome servers (e.g. TFS servers) can have several projects at a single URL. In those cases the import progress will\nhave the status `detection_found_multiple` and the Import Progress response will include a `project_choices` array.\nYou can select the project to import by providing one of the objects in the `project_choices` array in the update request.\n\n> [!WARNING]\n> **Endpoint closing down notice:** Due to very low levels of usage and available alternatives, this endpoint is closing down and will no longer be available from 00:00 UTC on April 12, 2024. For more details and alternatives, see the [changelog](https://gh.io/source-imports-api-deprecation)."
  @spec update_import(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_import(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_update_import_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_update_import_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @update_import_partition_spec)

    Pristine.Operation.new(%{
      id: "migrations/update-import",
      method: :patch,
      path_template: "/repos/{owner}/{repo}/import",
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
        telemetry_event: [:github_ex, :migrations, :update_import],
        timeout_ms: nil
      },
      pagination: nil
    })
  end
end

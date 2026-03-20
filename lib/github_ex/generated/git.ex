defmodule GitHubEx.Git do
  @moduledoc """
  Generated Github Ex operations for git.
  """

  @create_blob_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Create a blob"
  @spec create_blob(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_blob(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_create_blob_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_create_blob_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @create_blob_partition_spec)

    Pristine.Operation.new(%{
      id: "git/create-blob",
      method: :post,
      path_template: "/repos/{owner}/{repo}/git/blobs",
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
        telemetry_event: [:github_ex, :git, :create_blob],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @create_commit_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Create a commit\n\nCreates a new Git [commit object](https://git-scm.com/book/en/v2/Git-Internals-Git-Objects).\n\n**Signature verification object**\n\nThe response will include a `verification` object that describes the result of verifying the commit's signature. The following fields are included in the `verification` object:\n\n| Name | Type | Description |\n| ---- | ---- | ----------- |\n| `verified` | `boolean` | Indicates whether GitHub considers the signature in this commit to be verified. |\n| `reason` | `string` | The reason for verified value. Possible values and their meanings are enumerated in the table below. |\n| `signature` | `string` | The signature that was extracted from the commit. |\n| `payload` | `string` | The value that was signed. |\n| `verified_at` | `string` | The date the signature was verified by GitHub. |\n\nThese are the possible values for `reason` in the `verification` object:\n\n| Value | Description |\n| ----- | ----------- |\n| `expired_key` | The key that made the signature is expired. |\n| `not_signing_key` | The \"signing\" flag is not among the usage flags in the GPG key that made the signature. |\n| `gpgverify_error` | There was an error communicating with the signature verification service. |\n| `gpgverify_unavailable` | The signature verification service is currently unavailable. |\n| `unsigned` | The object does not include a signature. |\n| `unknown_signature_type` | A non-PGP signature was found in the commit. |\n| `no_user` | No user was associated with the `committer` email address in the commit. |\n| `unverified_email` | The `committer` email address in the commit was associated with a user, but the email address is not verified on their account. |\n| `bad_email` | The `committer` email address in the commit is not included in the identities of the PGP key that made the signature. |\n| `unknown_key` | The key that made the signature has not been registered with any user's account. |\n| `malformed_signature` | There was an error parsing the signature. |\n| `invalid` | The signature could not be cryptographically verified using the key whose key-id was found in the signature. |\n| `valid` | None of the above errors applied, so the signature is considered to be verified. |"
  @spec create_commit(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_commit(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_create_commit_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_create_commit_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @create_commit_partition_spec)

    Pristine.Operation.new(%{
      id: "git/create-commit",
      method: :post,
      path_template: "/repos/{owner}/{repo}/git/commits",
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
        telemetry_event: [:github_ex, :git, :create_commit],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @create_ref_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Create a reference\n\nCreates a reference for your repository. You are unable to create new references for empty repositories, even if the commit SHA-1 hash used exists. Empty repositories are repositories without branches."
  @spec create_ref(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_ref(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_create_ref_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_create_ref_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @create_ref_partition_spec)

    Pristine.Operation.new(%{
      id: "git/create-ref",
      method: :post,
      path_template: "/repos/{owner}/{repo}/git/refs",
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
        telemetry_event: [:github_ex, :git, :create_ref],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @create_tag_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Create a tag object\n\nNote that creating a tag object does not create the reference that makes a tag in Git. If you want to create an annotated tag in Git, you have to do this call to create the tag object, and then [create](https://docs.github.com/rest/git/refs#create-a-reference) the `refs/tags/[tag]` reference. If you want to create a lightweight tag, you only have to [create](https://docs.github.com/rest/git/refs#create-a-reference) the tag reference - this call would be unnecessary.\n\n**Signature verification object**\n\nThe response will include a `verification` object that describes the result of verifying the commit's signature. The following fields are included in the `verification` object:\n\n| Name | Type | Description |\n| ---- | ---- | ----------- |\n| `verified` | `boolean` | Indicates whether GitHub considers the signature in this commit to be verified. |\n| `reason` | `string` | The reason for verified value. Possible values and their meanings are enumerated in table below. |\n| `signature` | `string` | The signature that was extracted from the commit. |\n| `payload` | `string` | The value that was signed. |\n| `verified_at` | `string` | The date the signature was verified by GitHub. |\n\nThese are the possible values for `reason` in the `verification` object:\n\n| Value | Description |\n| ----- | ----------- |\n| `expired_key` | The key that made the signature is expired. |\n| `not_signing_key` | The \"signing\" flag is not among the usage flags in the GPG key that made the signature. |\n| `gpgverify_error` | There was an error communicating with the signature verification service. |\n| `gpgverify_unavailable` | The signature verification service is currently unavailable. |\n| `unsigned` | The object does not include a signature. |\n| `unknown_signature_type` | A non-PGP signature was found in the commit. |\n| `no_user` | No user was associated with the `committer` email address in the commit. |\n| `unverified_email` | The `committer` email address in the commit was associated with a user, but the email address is not verified on their account. |\n| `bad_email` | The `committer` email address in the commit is not included in the identities of the PGP key that made the signature. |\n| `unknown_key` | The key that made the signature has not been registered with any user's account. |\n| `malformed_signature` | There was an error parsing the signature. |\n| `invalid` | The signature could not be cryptographically verified using the key whose key-id was found in the signature. |\n| `valid` | None of the above errors applied, so the signature is considered to be verified. |"
  @spec create_tag(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_tag(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_create_tag_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_create_tag_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @create_tag_partition_spec)

    Pristine.Operation.new(%{
      id: "git/create-tag",
      method: :post,
      path_template: "/repos/{owner}/{repo}/git/tags",
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
        telemetry_event: [:github_ex, :git, :create_tag],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @create_tree_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Create a tree\n\nThe tree creation API accepts nested entries. If you specify both a tree and a nested path modifying that tree, this endpoint will overwrite the contents of the tree with the new path contents, and create a new tree structure.\n\nIf you use this endpoint to add, delete, or modify the file contents in a tree, you will need to commit the tree and then update a branch to point to the commit. For more information see \"[Create a commit](https://docs.github.com/rest/git/commits#create-a-commit)\" and \"[Update a reference](https://docs.github.com/rest/git/refs#update-a-reference).\"\n\nReturns an error if you try to delete a file that does not exist."
  @spec create_tree(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_tree(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_create_tree_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_create_tree_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @create_tree_partition_spec)

    Pristine.Operation.new(%{
      id: "git/create-tree",
      method: :post,
      path_template: "/repos/{owner}/{repo}/git/trees",
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
        telemetry_event: [:github_ex, :git, :create_tree],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_ref_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"ref", :ref}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Delete a reference\n\nDeletes the provided reference."
  @spec delete_ref(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_ref(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_delete_ref_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_delete_ref_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_ref_partition_spec)

    Pristine.Operation.new(%{
      id: "git/delete-ref",
      method: :delete,
      path_template: "/repos/{owner}/{repo}/git/refs/{ref}",
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
        telemetry_event: [:github_ex, :git, :delete_ref],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_blob_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"file_sha", :file_sha}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get a blob\n\nThe `content` in the response will always be Base64 encoded.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.raw+json`**: Returns the raw blob data.\n- **`application/vnd.github+json`**: Returns a JSON representation of the blob with `content` as a base64 encoded string. This is the default if no media type is specified.\n\n**Note** This endpoint supports blobs up to 100 megabytes in size."
  @spec get_blob(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_blob(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_blob_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_blob_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_blob_partition_spec)

    Pristine.Operation.new(%{
      id: "git/get-blob",
      method: :get,
      path_template: "/repos/{owner}/{repo}/git/blobs/{file_sha}",
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
        telemetry_event: [:github_ex, :git, :get_blob],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_commit_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"commit_sha", :commit_sha}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get a commit object\n\nGets a Git [commit object](https://git-scm.com/book/en/v2/Git-Internals-Git-Objects).\n\nTo get the contents of a commit, see \"[Get a commit](/rest/commits/commits#get-a-commit).\"\n\n**Signature verification object**\n\nThe response will include a `verification` object that describes the result of verifying the commit's signature. The following fields are included in the `verification` object:\n\n| Name | Type | Description |\n| ---- | ---- | ----------- |\n| `verified` | `boolean` | Indicates whether GitHub considers the signature in this commit to be verified. |\n| `reason` | `string` | The reason for verified value. Possible values and their meanings are enumerated in the table below. |\n| `signature` | `string` | The signature that was extracted from the commit. |\n| `payload` | `string` | The value that was signed. |\n| `verified_at` | `string` | The date the signature was verified by GitHub. |\n\nThese are the possible values for `reason` in the `verification` object:\n\n| Value | Description |\n| ----- | ----------- |\n| `expired_key` | The key that made the signature is expired. |\n| `not_signing_key` | The \"signing\" flag is not among the usage flags in the GPG key that made the signature. |\n| `gpgverify_error` | There was an error communicating with the signature verification service. |\n| `gpgverify_unavailable` | The signature verification service is currently unavailable. |\n| `unsigned` | The object does not include a signature. |\n| `unknown_signature_type` | A non-PGP signature was found in the commit. |\n| `no_user` | No user was associated with the `committer` email address in the commit. |\n| `unverified_email` | The `committer` email address in the commit was associated with a user, but the email address is not verified on their account. |\n| `bad_email` | The `committer` email address in the commit is not included in the identities of the PGP key that made the signature. |\n| `unknown_key` | The key that made the signature has not been registered with any user's account. |\n| `malformed_signature` | There was an error parsing the signature. |\n| `invalid` | The signature could not be cryptographically verified using the key whose key-id was found in the signature. |\n| `valid` | None of the above errors applied, so the signature is considered to be verified. |"
  @spec get_commit(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_commit(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_commit_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_commit_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_commit_partition_spec)

    Pristine.Operation.new(%{
      id: "git/get-commit",
      method: :get,
      path_template: "/repos/{owner}/{repo}/git/commits/{commit_sha}",
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
        telemetry_event: [:github_ex, :git, :get_commit],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_ref_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"ref", :ref}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get a reference\n\nReturns a single reference from your Git database. The `:ref` in the URL must be formatted as `heads/<branch name>` for branches and `tags/<tag name>` for tags. If the `:ref` doesn't match an existing ref, a `404` is returned.\n\n> [!NOTE]\n> You need to explicitly [request a pull request](https://docs.github.com/rest/pulls/pulls#get-a-pull-request) to trigger a test merge commit, which checks the mergeability of pull requests. For more information, see \"[Checking mergeability of pull requests](https://docs.github.com/rest/guides/getting-started-with-the-git-database-api#checking-mergeability-of-pull-requests)\"."
  @spec get_ref(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_ref(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_ref_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_ref_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_ref_partition_spec)

    Pristine.Operation.new(%{
      id: "git/get-ref",
      method: :get,
      path_template: "/repos/{owner}/{repo}/git/ref/{ref}",
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
        telemetry_event: [:github_ex, :git, :get_ref],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_tag_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"tag_sha", :tag_sha}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get a tag\n\n**Signature verification object**\n\nThe response will include a `verification` object that describes the result of verifying the commit's signature. The following fields are included in the `verification` object:\n\n| Name | Type | Description |\n| ---- | ---- | ----------- |\n| `verified` | `boolean` | Indicates whether GitHub considers the signature in this commit to be verified. |\n| `reason` | `string` | The reason for verified value. Possible values and their meanings are enumerated in table below. |\n| `signature` | `string` | The signature that was extracted from the commit. |\n| `payload` | `string` | The value that was signed. |\n| `verified_at` | `string` | The date the signature was verified by GitHub. |\n\nThese are the possible values for `reason` in the `verification` object:\n\n| Value | Description |\n| ----- | ----------- |\n| `expired_key` | The key that made the signature is expired. |\n| `not_signing_key` | The \"signing\" flag is not among the usage flags in the GPG key that made the signature. |\n| `gpgverify_error` | There was an error communicating with the signature verification service. |\n| `gpgverify_unavailable` | The signature verification service is currently unavailable. |\n| `unsigned` | The object does not include a signature. |\n| `unknown_signature_type` | A non-PGP signature was found in the commit. |\n| `no_user` | No user was associated with the `committer` email address in the commit. |\n| `unverified_email` | The `committer` email address in the commit was associated with a user, but the email address is not verified on their account. |\n| `bad_email` | The `committer` email address in the commit is not included in the identities of the PGP key that made the signature. |\n| `unknown_key` | The key that made the signature has not been registered with any user's account. |\n| `malformed_signature` | There was an error parsing the signature. |\n| `invalid` | The signature could not be cryptographically verified using the key whose key-id was found in the signature. |\n| `valid` | None of the above errors applied, so the signature is considered to be verified. |"
  @spec get_tag(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_tag(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_tag_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_tag_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_tag_partition_spec)

    Pristine.Operation.new(%{
      id: "git/get-tag",
      method: :get,
      path_template: "/repos/{owner}/{repo}/git/tags/{tag_sha}",
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
        telemetry_event: [:github_ex, :git, :get_tag],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_tree_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"tree_sha", :tree_sha}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"recursive", :recursive}],
    headers: []
  }

  @doc "Get a tree\n\nReturns a single tree using the SHA1 value or ref name for that tree.\n\nIf `truncated` is `true` in the response then the number of items in the `tree` array exceeded our maximum limit. If you need to fetch more items, use the non-recursive method of fetching trees, and fetch one sub-tree at a time.\n\n> [!NOTE]\n> The limit for the `tree` array is 100,000 entries with a maximum size of 7 MB when using the `recursive` parameter."
  @spec get_tree(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_tree(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_tree_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_tree_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_tree_partition_spec)

    Pristine.Operation.new(%{
      id: "git/get-tree",
      method: :get,
      path_template: "/repos/{owner}/{repo}/git/trees/{tree_sha}",
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
        telemetry_event: [:github_ex, :git, :get_tree],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @list_matching_refs_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"ref", :ref}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "List matching references\n\nReturns an array of references from your Git database that match the supplied name. The `:ref` in the URL must be formatted as `heads/<branch name>` for branches and `tags/<tag name>` for tags. If the `:ref` doesn't exist in the repository, but existing refs start with `:ref`, they will be returned as an array.\n\nWhen you use this endpoint without providing a `:ref`, it will return an array of all the references from your Git database, including notes and stashes if they exist on the server. Anything in the namespace is returned, not just `heads` and `tags`.\n\n> [!NOTE]\n> You need to explicitly [request a pull request](https://docs.github.com/rest/pulls/pulls#get-a-pull-request) to trigger a test merge commit, which checks the mergeability of pull requests. For more information, see \"[Checking mergeability of pull requests](https://docs.github.com/rest/guides/getting-started-with-the-git-database-api#checking-mergeability-of-pull-requests)\".\n\nIf you request matching references for a branch named `feature` but the branch `feature` doesn't exist, the response can still include other matching head refs that start with the word `feature`, such as `featureA` and `featureB`."
  @spec list_matching_refs(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_matching_refs(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_matching_refs_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_matching_refs(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_matching_refs(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_matching_refs_operation(params) end,
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

  defp build_list_matching_refs_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_matching_refs_partition_spec)

    Pristine.Operation.new(%{
      id: "git/list-matching-refs",
      method: :get,
      path_template: "/repos/{owner}/{repo}/git/matching-refs/{ref}",
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
        telemetry_event: [:github_ex, :git, :list_matching_refs],
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

  @update_ref_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"ref", :ref}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Update a reference\n\nUpdates the provided reference to point to a new SHA. For more information, see \"[Git References](https://git-scm.com/book/en/v2/Git-Internals-Git-References)\" in the Git documentation."
  @spec update_ref(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_ref(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_update_ref_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_update_ref_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @update_ref_partition_spec)

    Pristine.Operation.new(%{
      id: "git/update-ref",
      method: :patch,
      path_template: "/repos/{owner}/{repo}/git/refs/{ref}",
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
        telemetry_event: [:github_ex, :git, :update_ref],
        timeout_ms: nil
      },
      pagination: nil
    })
  end
end

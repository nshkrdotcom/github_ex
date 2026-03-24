defmodule GitHubEx.Git do
  @moduledoc """
  Generated Github Ex operations for git.
  """

  alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient

  @create_blob_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a blob"
  @spec create_blob(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_blob(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_blob_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_blob_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_blob_partition_spec)

    %{
      id: "git/create-blob",
      args: params,
      call: {__MODULE__, :create_blob},
      opts: opts,
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :git, :create_blob],
      timeout: nil,
      pagination: nil
    }
  end

  @create_commit_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a commit\n\nCreates a new Git [commit object](https://git-scm.com/book/en/v2/Git-Internals-Git-Objects).\n\n**Signature verification object**\n\nThe response will include a `verification` object that describes the result of verifying the commit's signature. The following fields are included in the `verification` object:\n\n| Name | Type | Description |\n| ---- | ---- | ----------- |\n| `verified` | `boolean` | Indicates whether GitHub considers the signature in this commit to be verified. |\n| `reason` | `string` | The reason for verified value. Possible values and their meanings are enumerated in the table below. |\n| `signature` | `string` | The signature that was extracted from the commit. |\n| `payload` | `string` | The value that was signed. |\n| `verified_at` | `string` | The date the signature was verified by GitHub. |\n\nThese are the possible values for `reason` in the `verification` object:\n\n| Value | Description |\n| ----- | ----------- |\n| `expired_key` | The key that made the signature is expired. |\n| `not_signing_key` | The \"signing\" flag is not among the usage flags in the GPG key that made the signature. |\n| `gpgverify_error` | There was an error communicating with the signature verification service. |\n| `gpgverify_unavailable` | The signature verification service is currently unavailable. |\n| `unsigned` | The object does not include a signature. |\n| `unknown_signature_type` | A non-PGP signature was found in the commit. |\n| `no_user` | No user was associated with the `committer` email address in the commit. |\n| `unverified_email` | The `committer` email address in the commit was associated with a user, but the email address is not verified on their account. |\n| `bad_email` | The `committer` email address in the commit is not included in the identities of the PGP key that made the signature. |\n| `unknown_key` | The key that made the signature has not been registered with any user's account. |\n| `malformed_signature` | There was an error parsing the signature. |\n| `invalid` | The signature could not be cryptographically verified using the key whose key-id was found in the signature. |\n| `valid` | None of the above errors applied, so the signature is considered to be verified. |"
  @spec create_commit(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_commit(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_commit_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_commit_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_commit_partition_spec)

    %{
      id: "git/create-commit",
      args: params,
      call: {__MODULE__, :create_commit},
      opts: opts,
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :git, :create_commit],
      timeout: nil,
      pagination: nil
    }
  end

  @create_ref_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a reference\n\nCreates a reference for your repository. You are unable to create new references for empty repositories, even if the commit SHA-1 hash used exists. Empty repositories are repositories without branches."
  @spec create_ref(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_ref(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_ref_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_ref_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_ref_partition_spec)

    %{
      id: "git/create-ref",
      args: params,
      call: {__MODULE__, :create_ref},
      opts: opts,
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :git, :create_ref],
      timeout: nil,
      pagination: nil
    }
  end

  @create_tag_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a tag object\n\nNote that creating a tag object does not create the reference that makes a tag in Git. If you want to create an annotated tag in Git, you have to do this call to create the tag object, and then [create](https://docs.github.com/rest/git/refs#create-a-reference) the `refs/tags/[tag]` reference. If you want to create a lightweight tag, you only have to [create](https://docs.github.com/rest/git/refs#create-a-reference) the tag reference - this call would be unnecessary.\n\n**Signature verification object**\n\nThe response will include a `verification` object that describes the result of verifying the commit's signature. The following fields are included in the `verification` object:\n\n| Name | Type | Description |\n| ---- | ---- | ----------- |\n| `verified` | `boolean` | Indicates whether GitHub considers the signature in this commit to be verified. |\n| `reason` | `string` | The reason for verified value. Possible values and their meanings are enumerated in table below. |\n| `signature` | `string` | The signature that was extracted from the commit. |\n| `payload` | `string` | The value that was signed. |\n| `verified_at` | `string` | The date the signature was verified by GitHub. |\n\nThese are the possible values for `reason` in the `verification` object:\n\n| Value | Description |\n| ----- | ----------- |\n| `expired_key` | The key that made the signature is expired. |\n| `not_signing_key` | The \"signing\" flag is not among the usage flags in the GPG key that made the signature. |\n| `gpgverify_error` | There was an error communicating with the signature verification service. |\n| `gpgverify_unavailable` | The signature verification service is currently unavailable. |\n| `unsigned` | The object does not include a signature. |\n| `unknown_signature_type` | A non-PGP signature was found in the commit. |\n| `no_user` | No user was associated with the `committer` email address in the commit. |\n| `unverified_email` | The `committer` email address in the commit was associated with a user, but the email address is not verified on their account. |\n| `bad_email` | The `committer` email address in the commit is not included in the identities of the PGP key that made the signature. |\n| `unknown_key` | The key that made the signature has not been registered with any user's account. |\n| `malformed_signature` | There was an error parsing the signature. |\n| `invalid` | The signature could not be cryptographically verified using the key whose key-id was found in the signature. |\n| `valid` | None of the above errors applied, so the signature is considered to be verified. |"
  @spec create_tag(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_tag(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_tag_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_tag_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_tag_partition_spec)

    %{
      id: "git/create-tag",
      args: params,
      call: {__MODULE__, :create_tag},
      opts: opts,
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :git, :create_tag],
      timeout: nil,
      pagination: nil
    }
  end

  @create_tree_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Create a tree

       The tree creation API accepts nested entries. If you specify both a tree and a nested path modifying that tree, this endpoint will overwrite the contents of the tree with the new path contents, and create a new tree structure.

       If you use this endpoint to add, delete, or modify the file contents in a tree, you will need to commit the tree and then update a branch to point to the commit. For more information see "[Create a commit](https://docs.github.com/rest/git/commits#create-a-commit)" and "[Update a reference](https://docs.github.com/rest/git/refs#update-a-reference)."

       Returns an error if you try to delete a file that does not exist.
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec create_tree(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_tree(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_tree_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_tree_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_tree_partition_spec)

    %{
      id: "git/create-tree",
      args: params,
      call: {__MODULE__, :create_tree},
      opts: opts,
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :git, :create_tree],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_ref_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"ref", :ref}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a reference\n\nDeletes the provided reference."
  @spec delete_ref(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_ref(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_ref_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_ref_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_ref_partition_spec)

    %{
      id: "git/delete-ref",
      args: params,
      call: {__MODULE__, :delete_ref},
      opts: opts,
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
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :git, :delete_ref],
      timeout: nil,
      pagination: nil
    }
  end

  @get_blob_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"file_sha", :file_sha}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a blob\n\nThe `content` in the response will always be Base64 encoded.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.raw+json`**: Returns the raw blob data.\n- **`application/vnd.github+json`**: Returns a JSON representation of the blob with `content` as a base64 encoded string. This is the default if no media type is specified.\n\n**Note** This endpoint supports blobs up to 100 megabytes in size."
  @spec get_blob(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_blob(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_blob_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_blob_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_blob_partition_spec)

    %{
      id: "git/get-blob",
      args: params,
      call: {__MODULE__, :get_blob},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :git, :get_blob],
      timeout: nil,
      pagination: nil
    }
  end

  @get_commit_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"commit_sha", :commit_sha}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Get a commit object

       Gets a Git [commit object](https://git-scm.com/book/en/v2/Git-Internals-Git-Objects).

       To get the contents of a commit, see "[Get a commit](https://docs.github.com/rest/commits/commits#get-a-commit)."

       **Signature verification object**

       The response will include a `verification` object that describes the result of verifying the commit's signature. The following fields are included in the `verification` object:

       | Name | Type | Description |
       | ---- | ---- | ----------- |
       | `verified` | `boolean` | Indicates whether GitHub considers the signature in this commit to be verified. |
       | `reason` | `string` | The reason for verified value. Possible values and their meanings are enumerated in the table below. |
       | `signature` | `string` | The signature that was extracted from the commit. |
       | `payload` | `string` | The value that was signed. |
       | `verified_at` | `string` | The date the signature was verified by GitHub. |

       These are the possible values for `reason` in the `verification` object:

       | Value | Description |
       | ----- | ----------- |
       | `expired_key` | The key that made the signature is expired. |
       | `not_signing_key` | The "signing" flag is not among the usage flags in the GPG key that made the signature. |
       | `gpgverify_error` | There was an error communicating with the signature verification service. |
       | `gpgverify_unavailable` | The signature verification service is currently unavailable. |
       | `unsigned` | The object does not include a signature. |
       | `unknown_signature_type` | A non-PGP signature was found in the commit. |
       | `no_user` | No user was associated with the `committer` email address in the commit. |
       | `unverified_email` | The `committer` email address in the commit was associated with a user, but the email address is not verified on their account. |
       | `bad_email` | The `committer` email address in the commit is not included in the identities of the PGP key that made the signature. |
       | `unknown_key` | The key that made the signature has not been registered with any user's account. |
       | `malformed_signature` | There was an error parsing the signature. |
       | `invalid` | The signature could not be cryptographically verified using the key whose key-id was found in the signature. |
       | `valid` | None of the above errors applied, so the signature is considered to be verified. |
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec get_commit(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_commit(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_commit_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_commit_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_commit_partition_spec)

    %{
      id: "git/get-commit",
      args: params,
      call: {__MODULE__, :get_commit},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :git, :get_commit],
      timeout: nil,
      pagination: nil
    }
  end

  @get_ref_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"ref", :ref}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a reference\n\nReturns a single reference from your Git database. The `:ref` in the URL must be formatted as `heads/<branch name>` for branches and `tags/<tag name>` for tags. If the `:ref` doesn't match an existing ref, a `404` is returned.\n\n> [!NOTE]\n> You need to explicitly [request a pull request](https://docs.github.com/rest/pulls/pulls#get-a-pull-request) to trigger a test merge commit, which checks the mergeability of pull requests. For more information, see \"[Checking mergeability of pull requests](https://docs.github.com/rest/guides/getting-started-with-the-git-database-api#checking-mergeability-of-pull-requests)\"."
  @spec get_ref(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_ref(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_ref_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_ref_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_ref_partition_spec)

    %{
      id: "git/get-ref",
      args: params,
      call: {__MODULE__, :get_ref},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :git, :get_ref],
      timeout: nil,
      pagination: nil
    }
  end

  @get_tag_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"tag_sha", :tag_sha}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a tag\n\n**Signature verification object**\n\nThe response will include a `verification` object that describes the result of verifying the commit's signature. The following fields are included in the `verification` object:\n\n| Name | Type | Description |\n| ---- | ---- | ----------- |\n| `verified` | `boolean` | Indicates whether GitHub considers the signature in this commit to be verified. |\n| `reason` | `string` | The reason for verified value. Possible values and their meanings are enumerated in table below. |\n| `signature` | `string` | The signature that was extracted from the commit. |\n| `payload` | `string` | The value that was signed. |\n| `verified_at` | `string` | The date the signature was verified by GitHub. |\n\nThese are the possible values for `reason` in the `verification` object:\n\n| Value | Description |\n| ----- | ----------- |\n| `expired_key` | The key that made the signature is expired. |\n| `not_signing_key` | The \"signing\" flag is not among the usage flags in the GPG key that made the signature. |\n| `gpgverify_error` | There was an error communicating with the signature verification service. |\n| `gpgverify_unavailable` | The signature verification service is currently unavailable. |\n| `unsigned` | The object does not include a signature. |\n| `unknown_signature_type` | A non-PGP signature was found in the commit. |\n| `no_user` | No user was associated with the `committer` email address in the commit. |\n| `unverified_email` | The `committer` email address in the commit was associated with a user, but the email address is not verified on their account. |\n| `bad_email` | The `committer` email address in the commit is not included in the identities of the PGP key that made the signature. |\n| `unknown_key` | The key that made the signature has not been registered with any user's account. |\n| `malformed_signature` | There was an error parsing the signature. |\n| `invalid` | The signature could not be cryptographically verified using the key whose key-id was found in the signature. |\n| `valid` | None of the above errors applied, so the signature is considered to be verified. |"
  @spec get_tag(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_tag(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_tag_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_tag_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_tag_partition_spec)

    %{
      id: "git/get-tag",
      args: params,
      call: {__MODULE__, :get_tag},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :git, :get_tag],
      timeout: nil,
      pagination: nil
    }
  end

  @get_tree_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"tree_sha", :tree_sha}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"recursive", :recursive}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a tree\n\nReturns a single tree using the SHA1 value or ref name for that tree.\n\nIf `truncated` is `true` in the response then the number of items in the `tree` array exceeded our maximum limit. If you need to fetch more items, use the non-recursive method of fetching trees, and fetch one sub-tree at a time.\n\n> [!NOTE]\n> The limit for the `tree` array is 100,000 entries with a maximum size of 7 MB when using the `recursive` parameter."
  @spec get_tree(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_tree(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_tree_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_tree_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_tree_partition_spec)

    %{
      id: "git/get-tree",
      args: params,
      call: {__MODULE__, :get_tree},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :git, :get_tree],
      timeout: nil,
      pagination: nil
    }
  end

  @list_matching_refs_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"ref", :ref}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List matching references\n\nReturns an array of references from your Git database that match the supplied name. The `:ref` in the URL must be formatted as `heads/<branch name>` for branches and `tags/<tag name>` for tags. If the `:ref` doesn't exist in the repository, but existing refs start with `:ref`, they will be returned as an array.\n\nWhen you use this endpoint without providing a `:ref`, it will return an array of all the references from your Git database, including notes and stashes if they exist on the server. Anything in the namespace is returned, not just `heads` and `tags`.\n\n> [!NOTE]\n> You need to explicitly [request a pull request](https://docs.github.com/rest/pulls/pulls#get-a-pull-request) to trigger a test merge commit, which checks the mergeability of pull requests. For more information, see \"[Checking mergeability of pull requests](https://docs.github.com/rest/guides/getting-started-with-the-git-database-api#checking-mergeability-of-pull-requests)\".\n\nIf you request matching references for a branch named `feature` but the branch `feature` doesn't exist, the response can still include other matching head refs that start with the word `feature`, such as `featureA` and `featureB`."
  @spec list_matching_refs(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_matching_refs(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_matching_refs_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_matching_refs(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_matching_refs(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_matching_refs_request(client, params, opts) end,
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

  defp build_list_matching_refs_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_matching_refs_partition_spec)

    %{
      id: "git/list-matching-refs",
      args: params,
      call: {__MODULE__, :list_matching_refs},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :git, :list_matching_refs],
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

  @update_ref_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"ref", :ref}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update a reference\n\nUpdates the provided reference to point to a new SHA. For more information, see \"[Git References](https://git-scm.com/book/en/v2/Git-Internals-Git-References)\" in the Git documentation."
  @spec update_ref(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_ref(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_ref_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_ref_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_ref_partition_spec)

    %{
      id: "git/update-ref",
      args: params,
      call: {__MODULE__, :update_ref},
      opts: opts,
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :git, :update_ref],
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

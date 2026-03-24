defmodule GitHubEx.Users do
  @moduledoc """
  Generated Github Ex operations for users.
  """

  alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient

  @add_email_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add an email address for the authenticated user\n\nOAuth app tokens and personal access tokens (classic) need the `user` scope to use this endpoint."
  @spec add_email_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def add_email_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_add_email_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_email_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @add_email_for_authenticated_user_partition_spec)

    %{
      id: "users/add-email-for-authenticated-user",
      args: params,
      call: {__MODULE__, :add_email_for_authenticated_user},
      opts: opts,
      method: :post,
      path_template: "/user/emails",
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
      telemetry: [:github_ex, :users, :add_email_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @add_social_account_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add social accounts for the authenticated user\n\nAdd one or more social accounts to the authenticated user's profile.\n\nOAuth app tokens and personal access tokens (classic) need the `user` scope to use this endpoint."
  @spec add_social_account_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def add_social_account_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_add_social_account_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_social_account_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @add_social_account_for_authenticated_user_partition_spec)

    %{
      id: "users/add-social-account-for-authenticated-user",
      args: params,
      call: {__MODULE__, :add_social_account_for_authenticated_user},
      opts: opts,
      method: :post,
      path_template: "/user/social_accounts",
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
      telemetry: [:github_ex, :users, :add_social_account_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @block_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Block a user\n\nBlocks the given user and returns a 204. If the authenticated user cannot block the given user a 422 is returned."
  @spec block(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def block(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_block_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_block_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @block_partition_spec)

    %{
      id: "users/block",
      args: params,
      call: {__MODULE__, :block},
      opts: opts,
      method: :put,
      path_template: "/user/blocks/{username}",
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
      telemetry: [:github_ex, :users, :block],
      timeout: nil,
      pagination: nil
    }
  end

  @check_blocked_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Check if a user is blocked by the authenticated user\n\nReturns a 204 if the given user is blocked by the authenticated user. Returns a 404 if the given user is not blocked by the authenticated user, or if the given user account has been identified as spam by GitHub."
  @spec check_blocked(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def check_blocked(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_check_blocked_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_check_blocked_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @check_blocked_partition_spec)

    %{
      id: "users/check-blocked",
      args: params,
      call: {__MODULE__, :check_blocked},
      opts: opts,
      method: :get,
      path_template: "/user/blocks/{username}",
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
      telemetry: [:github_ex, :users, :check_blocked],
      timeout: nil,
      pagination: nil
    }
  end

  @check_following_for_user_partition_spec %{
    path: [{"username", :username}, {"target_user", :target_user}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Check if a user follows another user"
  @spec check_following_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def check_following_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_check_following_for_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_check_following_for_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @check_following_for_user_partition_spec)

    %{
      id: "users/check-following-for-user",
      args: params,
      call: {__MODULE__, :check_following_for_user},
      opts: opts,
      method: :get,
      path_template: "/users/{username}/following/{target_user}",
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
      telemetry: [:github_ex, :users, :check_following_for_user],
      timeout: nil,
      pagination: nil
    }
  end

  @check_person_is_followed_by_authenticated_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Check if a person is followed by the authenticated user"
  @spec check_person_is_followed_by_authenticated(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def check_person_is_followed_by_authenticated(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_check_person_is_followed_by_authenticated_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_check_person_is_followed_by_authenticated_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @check_person_is_followed_by_authenticated_partition_spec)

    %{
      id: "users/check-person-is-followed-by-authenticated",
      args: params,
      call: {__MODULE__, :check_person_is_followed_by_authenticated},
      opts: opts,
      method: :get,
      path_template: "/user/following/{username}",
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
      telemetry: [:github_ex, :users, :check_person_is_followed_by_authenticated],
      timeout: nil,
      pagination: nil
    }
  end

  @create_gpg_key_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a GPG key for the authenticated user\n\nAdds a GPG key to the authenticated user's GitHub account.\n\nOAuth app tokens and personal access tokens (classic) need the `write:gpg_key` scope to use this endpoint."
  @spec create_gpg_key_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def create_gpg_key_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_gpg_key_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_gpg_key_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @create_gpg_key_for_authenticated_user_partition_spec)

    %{
      id: "users/create-gpg-key-for-authenticated-user",
      args: params,
      call: {__MODULE__, :create_gpg_key_for_authenticated_user},
      opts: opts,
      method: :post,
      path_template: "/user/gpg_keys",
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
      telemetry: [:github_ex, :users, :create_gpg_key_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @create_public_ssh_key_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a public SSH key for the authenticated user\n\nAdds a public SSH key to the authenticated user's GitHub account.\n\nOAuth app tokens and personal access tokens (classic) need the `write:public_key` scope to use this endpoint."
  @spec create_public_ssh_key_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def create_public_ssh_key_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_public_ssh_key_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_public_ssh_key_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @create_public_ssh_key_for_authenticated_user_partition_spec
      )

    %{
      id: "users/create-public-ssh-key-for-authenticated-user",
      args: params,
      call: {__MODULE__, :create_public_ssh_key_for_authenticated_user},
      opts: opts,
      method: :post,
      path_template: "/user/keys",
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
      telemetry: [:github_ex, :users, :create_public_ssh_key_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @create_ssh_signing_key_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a SSH signing key for the authenticated user\n\nCreates an SSH signing key for the authenticated user's GitHub account.\n\nOAuth app tokens and personal access tokens (classic) need the `write:ssh_signing_key` scope to use this endpoint."
  @spec create_ssh_signing_key_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def create_ssh_signing_key_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_ssh_signing_key_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_ssh_signing_key_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @create_ssh_signing_key_for_authenticated_user_partition_spec
      )

    %{
      id: "users/create-ssh-signing-key-for-authenticated-user",
      args: params,
      call: {__MODULE__, :create_ssh_signing_key_for_authenticated_user},
      opts: opts,
      method: :post,
      path_template: "/user/ssh_signing_keys",
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
      telemetry: [:github_ex, :users, :create_ssh_signing_key_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_attestations_bulk_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete attestations in bulk\n\nDelete artifact attestations in bulk by either subject digests or unique ID."
  @spec delete_attestations_bulk(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_attestations_bulk(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_attestations_bulk_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_attestations_bulk_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_attestations_bulk_partition_spec)

    %{
      id: "users/delete-attestations-bulk",
      args: params,
      call: {__MODULE__, :delete_attestations_bulk},
      opts: opts,
      method: :post,
      path_template: "/users/{username}/attestations/delete-request",
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
      telemetry: [:github_ex, :users, :delete_attestations_bulk],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_attestations_by_id_partition_spec %{
    path: [{"username", :username}, {"attestation_id", :attestation_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete attestations by ID\n\nDelete an artifact attestation by unique ID that is associated with a repository owned by a user."
  @spec delete_attestations_by_id(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_attestations_by_id(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_attestations_by_id_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_attestations_by_id_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_attestations_by_id_partition_spec)

    %{
      id: "users/delete-attestations-by-id",
      args: params,
      call: {__MODULE__, :delete_attestations_by_id},
      opts: opts,
      method: :delete,
      path_template: "/users/{username}/attestations/{attestation_id}",
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
      telemetry: [:github_ex, :users, :delete_attestations_by_id],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_attestations_by_subject_digest_partition_spec %{
    path: [{"username", :username}, {"subject_digest", :subject_digest}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete attestations by subject digest\n\nDelete an artifact attestation by subject digest."
  @spec delete_attestations_by_subject_digest(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def delete_attestations_by_subject_digest(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_attestations_by_subject_digest_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_attestations_by_subject_digest_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @delete_attestations_by_subject_digest_partition_spec)

    %{
      id: "users/delete-attestations-by-subject-digest",
      args: params,
      call: {__MODULE__, :delete_attestations_by_subject_digest},
      opts: opts,
      method: :delete,
      path_template: "/users/{username}/attestations/digest/{subject_digest}",
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
      telemetry: [:github_ex, :users, :delete_attestations_by_subject_digest],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_email_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete an email address for the authenticated user\n\nOAuth app tokens and personal access tokens (classic) need the `user` scope to use this endpoint."
  @spec delete_email_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def delete_email_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_email_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_email_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @delete_email_for_authenticated_user_partition_spec)

    %{
      id: "users/delete-email-for-authenticated-user",
      args: params,
      call: {__MODULE__, :delete_email_for_authenticated_user},
      opts: opts,
      method: :delete,
      path_template: "/user/emails",
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
      telemetry: [:github_ex, :users, :delete_email_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_gpg_key_for_authenticated_user_partition_spec %{
    path: [{"gpg_key_id", :gpg_key_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a GPG key for the authenticated user\n\nRemoves a GPG key from the authenticated user's GitHub account.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:gpg_key` scope to use this endpoint."
  @spec delete_gpg_key_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def delete_gpg_key_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_gpg_key_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_gpg_key_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @delete_gpg_key_for_authenticated_user_partition_spec)

    %{
      id: "users/delete-gpg-key-for-authenticated-user",
      args: params,
      call: {__MODULE__, :delete_gpg_key_for_authenticated_user},
      opts: opts,
      method: :delete,
      path_template: "/user/gpg_keys/{gpg_key_id}",
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
      telemetry: [:github_ex, :users, :delete_gpg_key_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_public_ssh_key_for_authenticated_user_partition_spec %{
    path: [{"key_id", :key_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a public SSH key for the authenticated user\n\nRemoves a public SSH key from the authenticated user's GitHub account.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:public_key` scope to use this endpoint."
  @spec delete_public_ssh_key_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def delete_public_ssh_key_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_public_ssh_key_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_public_ssh_key_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @delete_public_ssh_key_for_authenticated_user_partition_spec
      )

    %{
      id: "users/delete-public-ssh-key-for-authenticated-user",
      args: params,
      call: {__MODULE__, :delete_public_ssh_key_for_authenticated_user},
      opts: opts,
      method: :delete,
      path_template: "/user/keys/{key_id}",
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
      telemetry: [:github_ex, :users, :delete_public_ssh_key_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_social_account_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete social accounts for the authenticated user\n\nDeletes one or more social accounts from the authenticated user's profile.\n\nOAuth app tokens and personal access tokens (classic) need the `user` scope to use this endpoint."
  @spec delete_social_account_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def delete_social_account_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_social_account_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_social_account_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @delete_social_account_for_authenticated_user_partition_spec
      )

    %{
      id: "users/delete-social-account-for-authenticated-user",
      args: params,
      call: {__MODULE__, :delete_social_account_for_authenticated_user},
      opts: opts,
      method: :delete,
      path_template: "/user/social_accounts",
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
      telemetry: [:github_ex, :users, :delete_social_account_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_ssh_signing_key_for_authenticated_user_partition_spec %{
    path: [{"ssh_signing_key_id", :ssh_signing_key_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete an SSH signing key for the authenticated user\n\nDeletes an SSH signing key from the authenticated user's GitHub account.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:ssh_signing_key` scope to use this endpoint."
  @spec delete_ssh_signing_key_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def delete_ssh_signing_key_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_ssh_signing_key_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_ssh_signing_key_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @delete_ssh_signing_key_for_authenticated_user_partition_spec
      )

    %{
      id: "users/delete-ssh-signing-key-for-authenticated-user",
      args: params,
      call: {__MODULE__, :delete_ssh_signing_key_for_authenticated_user},
      opts: opts,
      method: :delete,
      path_template: "/user/ssh_signing_keys/{ssh_signing_key_id}",
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
      telemetry: [:github_ex, :users, :delete_ssh_signing_key_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @follow_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Follow a user\n\nNote that you'll need to set `Content-Length` to zero when calling out to this endpoint. For more information, see \"[HTTP verbs](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#http-method).\"\n\nOAuth app tokens and personal access tokens (classic) need the `user:follow` scope to use this endpoint."
  @spec follow(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def follow(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_follow_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_follow_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @follow_partition_spec)

    %{
      id: "users/follow",
      args: params,
      call: {__MODULE__, :follow},
      opts: opts,
      method: :put,
      path_template: "/user/following/{username}",
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
      telemetry: [:github_ex, :users, :follow],
      timeout: nil,
      pagination: nil
    }
  end

  @get_authenticated_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get the authenticated user\n\nOAuth app tokens and personal access tokens (classic) need the `user` scope in order for the response to include private profile information."
  @spec get_authenticated(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_authenticated(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_authenticated_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_authenticated_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_authenticated_partition_spec)

    %{
      id: "users/get-authenticated",
      args: params,
      call: {__MODULE__, :get_authenticated},
      opts: opts,
      method: :get,
      path_template: "/user",
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
      telemetry: [:github_ex, :users, :get_authenticated],
      timeout: nil,
      pagination: nil
    }
  end

  @get_by_id_partition_spec %{
    path: [{"account_id", :account_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a user using their ID\n\nProvides publicly available information about someone with a GitHub account. This method takes their durable user `ID` instead of their `login`, which can change over time.\n\nIf you are requesting information about an [Enterprise Managed User](https://docs.github.com/enterprise-cloud@latest/admin/managing-iam/understanding-iam-for-enterprises/about-enterprise-managed-users), or a GitHub App bot that is installed in an organization that uses Enterprise Managed Users, your requests must be authenticated as a user or GitHub App that has access to the organization to view that account's information. If you are not authorized, the request will return a `404 Not Found` status.\n\nThe `email` key in the following response is the publicly visible email address from your GitHub [profile page](https://github.com/settings/profile). When setting up your profile, you can select a primary email address to be public which provides an email entry for this endpoint. If you do not set a public email address for `email`, then it will have a value of `null`. You only see publicly visible email addresses when authenticated with GitHub. For more information, see [Authentication](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#authentication).\n\nThe Emails API enables you to list all of your email addresses, and toggle a primary email to be visible publicly. For more information, see [Emails API](https://docs.github.com/rest/users/emails)."
  @spec get_by_id(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_by_id(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_by_id_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_by_id_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_by_id_partition_spec)

    %{
      id: "users/get-by-id",
      args: params,
      call: {__MODULE__, :get_by_id},
      opts: opts,
      method: :get,
      path_template: "/user/{account_id}",
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
      telemetry: [:github_ex, :users, :get_by_id],
      timeout: nil,
      pagination: nil
    }
  end

  @get_by_username_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a user\n\nProvides publicly available information about someone with a GitHub account.\n\nIf you are requesting information about an [Enterprise Managed User](https://docs.github.com/enterprise-cloud@latest/admin/managing-iam/understanding-iam-for-enterprises/about-enterprise-managed-users), or a GitHub App bot that is installed in an organization that uses Enterprise Managed Users, your requests must be authenticated as a user or GitHub App that has access to the organization to view that account's information. If you are not authorized, the request will return a `404 Not Found` status.\n\nThe `email` key in the following response is the publicly visible email address from your GitHub [profile page](https://github.com/settings/profile). When setting up your profile, you can select a primary email address to be public which provides an email entry for this endpoint. If you do not set a public email address for `email`, then it will have a value of `null`. You only see publicly visible email addresses when authenticated with GitHub. For more information, see [Authentication](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#authentication).\n\nThe Emails API enables you to list all of your email addresses, and toggle a primary email to be visible publicly. For more information, see [Emails API](https://docs.github.com/rest/users/emails)."
  @spec get_by_username(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_by_username(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_by_username_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_by_username_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_by_username_partition_spec)

    %{
      id: "users/get-by-username",
      args: params,
      call: {__MODULE__, :get_by_username},
      opts: opts,
      method: :get,
      path_template: "/users/{username}",
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
      telemetry: [:github_ex, :users, :get_by_username],
      timeout: nil,
      pagination: nil
    }
  end

  @get_context_for_user_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"subject_type", :subject_type}, {"subject_id", :subject_id}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get contextual information for a user\n\nProvides hovercard information. You can find out more about someone in relation to their pull requests, issues, repositories, and organizations.\n\n  The `subject_type` and `subject_id` parameters provide context for the person's hovercard, which returns more information than without the parameters. For example, if you wanted to find out more about `octocat` who owns the `Spoon-Knife` repository, you would use a `subject_type` value of `repository` and a `subject_id` value of `1300192` (the ID of the `Spoon-Knife` repository).\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_context_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_context_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_context_for_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_context_for_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_context_for_user_partition_spec)

    %{
      id: "users/get-context-for-user",
      args: params,
      call: {__MODULE__, :get_context_for_user},
      opts: opts,
      method: :get,
      path_template: "/users/{username}/hovercard",
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
      telemetry: [:github_ex, :users, :get_context_for_user],
      timeout: nil,
      pagination: nil
    }
  end

  @get_gpg_key_for_authenticated_user_partition_spec %{
    path: [{"gpg_key_id", :gpg_key_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a GPG key for the authenticated user\n\nView extended details for a single GPG key.\n\nOAuth app tokens and personal access tokens (classic) need the `read:gpg_key` scope to use this endpoint."
  @spec get_gpg_key_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_gpg_key_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_gpg_key_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_gpg_key_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @get_gpg_key_for_authenticated_user_partition_spec)

    %{
      id: "users/get-gpg-key-for-authenticated-user",
      args: params,
      call: {__MODULE__, :get_gpg_key_for_authenticated_user},
      opts: opts,
      method: :get,
      path_template: "/user/gpg_keys/{gpg_key_id}",
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
      telemetry: [:github_ex, :users, :get_gpg_key_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @get_public_ssh_key_for_authenticated_user_partition_spec %{
    path: [{"key_id", :key_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a public SSH key for the authenticated user\n\nView extended details for a single public SSH key.\n\nOAuth app tokens and personal access tokens (classic) need the `read:public_key` scope to use this endpoint."
  @spec get_public_ssh_key_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_public_ssh_key_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_public_ssh_key_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_public_ssh_key_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @get_public_ssh_key_for_authenticated_user_partition_spec)

    %{
      id: "users/get-public-ssh-key-for-authenticated-user",
      args: params,
      call: {__MODULE__, :get_public_ssh_key_for_authenticated_user},
      opts: opts,
      method: :get,
      path_template: "/user/keys/{key_id}",
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
      telemetry: [:github_ex, :users, :get_public_ssh_key_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @get_ssh_signing_key_for_authenticated_user_partition_spec %{
    path: [{"ssh_signing_key_id", :ssh_signing_key_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get an SSH signing key for the authenticated user\n\nGets extended details for an SSH signing key.\n\nOAuth app tokens and personal access tokens (classic) need the `read:ssh_signing_key` scope to use this endpoint."
  @spec get_ssh_signing_key_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_ssh_signing_key_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_ssh_signing_key_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_ssh_signing_key_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @get_ssh_signing_key_for_authenticated_user_partition_spec)

    %{
      id: "users/get-ssh-signing-key-for-authenticated-user",
      args: params,
      call: {__MODULE__, :get_ssh_signing_key_for_authenticated_user},
      opts: opts,
      method: :get,
      path_template: "/user/ssh_signing_keys/{ssh_signing_key_id}",
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
      telemetry: [:github_ex, :users, :get_ssh_signing_key_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @list_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"since", :since}, {"per_page", :per_page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List users\n\nLists all users, in the order that they signed up on GitHub. This list includes personal user accounts and organization accounts.\n\nNote: Pagination is powered exclusively by the `since` parameter. Use the [Link header](https://docs.github.com/rest/guides/using-pagination-in-the-rest-api#using-link-headers) to get the URL for the next page of users."
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
      id: "users/list",
      args: params,
      call: {__MODULE__, :list},
      opts: opts,
      method: :get,
      path_template: "/users",
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
      telemetry: [:github_ex, :users, :list],
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

  @list_attestations_partition_spec %{
    path: [{"username", :username}, {"subject_digest", :subject_digest}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"per_page", :per_page},
      {"before", :before},
      {"after", :after},
      {"predicate_type", :predicate_type}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List attestations\n\nList a collection of artifact attestations with a given subject digest that are associated with repositories owned by a user.\n\nThe collection of attestations returned by this endpoint is filtered according to the authenticated user's permissions; if the authenticated user cannot read a repository, the attestations associated with that repository will not be included in the response. In addition, when using a fine-grained access token the `attestations:read` permission is required.\n\n**Please note:** in order to offer meaningful security benefits, an attestation's signature and timestamps **must** be cryptographically verified, and the identity of the attestation signer **must** be validated. Attestations can be verified using the [GitHub CLI `attestation verify` command](https://cli.github.com/manual/gh_attestation_verify). For more information, see [our guide on how to use artifact attestations to establish a build's provenance](https://docs.github.com/actions/security-guides/using-artifact-attestations-to-establish-provenance-for-builds)."
  @spec list_attestations(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_attestations(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_attestations_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_attestations(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_attestations(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_attestations_request(client, params, opts) end,
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

  defp build_list_attestations_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_attestations_partition_spec)

    %{
      id: "users/list-attestations",
      args: params,
      call: {__MODULE__, :list_attestations},
      opts: opts,
      method: :get,
      path_template: "/users/{username}/attestations/{subject_digest}",
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
      telemetry: [:github_ex, :users, :list_attestations],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["attestations"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_attestations_bulk_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [{"per_page", :per_page}, {"before", :before}, {"after", :after}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List attestations by bulk subject digests\n\nList a collection of artifact attestations associated with any entry in a list of subject digests owned by a user.\n\nThe collection of attestations returned by this endpoint is filtered according to the authenticated user's permissions; if the authenticated user cannot read a repository, the attestations associated with that repository will not be included in the response. In addition, when using a fine-grained access token the `attestations:read` permission is required.\n\n**Please note:** in order to offer meaningful security benefits, an attestation's signature and timestamps **must** be cryptographically verified, and the identity of the attestation signer **must** be validated. Attestations can be verified using the [GitHub CLI `attestation verify` command](https://cli.github.com/manual/gh_attestation_verify). For more information, see [our guide on how to use artifact attestations to establish a build's provenance](https://docs.github.com/actions/security-guides/using-artifact-attestations-to-establish-provenance-for-builds)."
  @spec list_attestations_bulk(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_attestations_bulk(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_attestations_bulk_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_list_attestations_bulk_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_attestations_bulk_partition_spec)

    %{
      id: "users/list-attestations-bulk",
      args: params,
      call: {__MODULE__, :list_attestations_bulk},
      opts: opts,
      method: :post,
      path_template: "/users/{username}/attestations/bulk-list",
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
      telemetry: [:github_ex, :users, :list_attestations_bulk],
      timeout: nil,
      pagination: nil
    }
  end

  @list_blocked_by_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List users blocked by the authenticated user\n\nList the users you've blocked on your personal account."
  @spec list_blocked_by_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_blocked_by_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_blocked_by_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_blocked_by_authenticated_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_blocked_by_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_blocked_by_authenticated_user_request(client, params, opts) end,
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

  defp build_list_blocked_by_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @list_blocked_by_authenticated_user_partition_spec)

    %{
      id: "users/list-blocked-by-authenticated-user",
      args: params,
      call: {__MODULE__, :list_blocked_by_authenticated_user},
      opts: opts,
      method: :get,
      path_template: "/user/blocks",
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
      telemetry: [:github_ex, :users, :list_blocked_by_authenticated_user],
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

  @list_emails_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List email addresses for the authenticated user\n\nLists all of your email addresses, and specifies which one is visible\nto the public.\n\nOAuth app tokens and personal access tokens (classic) need the `user:email` scope to use this endpoint."
  @spec list_emails_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_emails_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_emails_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_emails_for_authenticated_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_emails_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_emails_for_authenticated_user_request(client, params, opts) end,
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

  defp build_list_emails_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @list_emails_for_authenticated_user_partition_spec)

    %{
      id: "users/list-emails-for-authenticated-user",
      args: params,
      call: {__MODULE__, :list_emails_for_authenticated_user},
      opts: opts,
      method: :get,
      path_template: "/user/emails",
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
      telemetry: [:github_ex, :users, :list_emails_for_authenticated_user],
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

  @list_followed_by_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List the people the authenticated user follows\n\nLists the people who the authenticated user follows."
  @spec list_followed_by_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_followed_by_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_followed_by_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_followed_by_authenticated_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_followed_by_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_followed_by_authenticated_user_request(client, params, opts) end,
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

  defp build_list_followed_by_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @list_followed_by_authenticated_user_partition_spec)

    %{
      id: "users/list-followed-by-authenticated-user",
      args: params,
      call: {__MODULE__, :list_followed_by_authenticated_user},
      opts: opts,
      method: :get,
      path_template: "/user/following",
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
      telemetry: [:github_ex, :users, :list_followed_by_authenticated_user],
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

  @list_followers_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List followers of the authenticated user\n\nLists the people following the authenticated user."
  @spec list_followers_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_followers_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_followers_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_followers_for_authenticated_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_followers_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_followers_for_authenticated_user_request(client, params, opts) end,
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

  defp build_list_followers_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @list_followers_for_authenticated_user_partition_spec)

    %{
      id: "users/list-followers-for-authenticated-user",
      args: params,
      call: {__MODULE__, :list_followers_for_authenticated_user},
      opts: opts,
      method: :get,
      path_template: "/user/followers",
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
      telemetry: [:github_ex, :users, :list_followers_for_authenticated_user],
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

  @list_followers_for_user_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List followers of a user\n\nLists the people following the specified user."
  @spec list_followers_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_followers_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_followers_for_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_followers_for_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_followers_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_followers_for_user_request(client, params, opts) end,
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

  defp build_list_followers_for_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_followers_for_user_partition_spec)

    %{
      id: "users/list-followers-for-user",
      args: params,
      call: {__MODULE__, :list_followers_for_user},
      opts: opts,
      method: :get,
      path_template: "/users/{username}/followers",
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
      telemetry: [:github_ex, :users, :list_followers_for_user],
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

  @list_following_for_user_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List the people a user follows\n\nLists the people who the specified user follows."
  @spec list_following_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_following_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_following_for_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_following_for_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_following_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_following_for_user_request(client, params, opts) end,
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

  defp build_list_following_for_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_following_for_user_partition_spec)

    %{
      id: "users/list-following-for-user",
      args: params,
      call: {__MODULE__, :list_following_for_user},
      opts: opts,
      method: :get,
      path_template: "/users/{username}/following",
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
      telemetry: [:github_ex, :users, :list_following_for_user],
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

  @list_gpg_keys_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List GPG keys for the authenticated user\n\nLists the current user's GPG keys.\n\nOAuth app tokens and personal access tokens (classic) need the `read:gpg_key` scope to use this endpoint."
  @spec list_gpg_keys_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_gpg_keys_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_gpg_keys_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_gpg_keys_for_authenticated_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_gpg_keys_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_gpg_keys_for_authenticated_user_request(client, params, opts) end,
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

  defp build_list_gpg_keys_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @list_gpg_keys_for_authenticated_user_partition_spec)

    %{
      id: "users/list-gpg-keys-for-authenticated-user",
      args: params,
      call: {__MODULE__, :list_gpg_keys_for_authenticated_user},
      opts: opts,
      method: :get,
      path_template: "/user/gpg_keys",
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
      telemetry: [:github_ex, :users, :list_gpg_keys_for_authenticated_user],
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

  @list_gpg_keys_for_user_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List GPG keys for a user\n\nLists the GPG keys for a user. This information is accessible by anyone."
  @spec list_gpg_keys_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_gpg_keys_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_gpg_keys_for_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_gpg_keys_for_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_gpg_keys_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_gpg_keys_for_user_request(client, params, opts) end,
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

  defp build_list_gpg_keys_for_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_gpg_keys_for_user_partition_spec)

    %{
      id: "users/list-gpg-keys-for-user",
      args: params,
      call: {__MODULE__, :list_gpg_keys_for_user},
      opts: opts,
      method: :get,
      path_template: "/users/{username}/gpg_keys",
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
      telemetry: [:github_ex, :users, :list_gpg_keys_for_user],
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

  @list_public_emails_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List public email addresses for the authenticated user\n\nLists your publicly visible email address, which you can set with the\n[Set primary email visibility for the authenticated user](https://docs.github.com/rest/users/emails#set-primary-email-visibility-for-the-authenticated-user)\nendpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `user:email` scope to use this endpoint."
  @spec list_public_emails_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_public_emails_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_public_emails_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_public_emails_for_authenticated_user(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_list_public_emails_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_public_emails_for_authenticated_user_request(client, params, opts) end,
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

  defp build_list_public_emails_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @list_public_emails_for_authenticated_user_partition_spec)

    %{
      id: "users/list-public-emails-for-authenticated-user",
      args: params,
      call: {__MODULE__, :list_public_emails_for_authenticated_user},
      opts: opts,
      method: :get,
      path_template: "/user/public_emails",
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
      telemetry: [:github_ex, :users, :list_public_emails_for_authenticated_user],
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

  @list_public_keys_for_user_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List public keys for a user\n\nLists the _verified_ public SSH keys for a user. This is accessible by anyone."
  @spec list_public_keys_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_public_keys_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_public_keys_for_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_public_keys_for_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_public_keys_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_public_keys_for_user_request(client, params, opts) end,
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

  defp build_list_public_keys_for_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_public_keys_for_user_partition_spec)

    %{
      id: "users/list-public-keys-for-user",
      args: params,
      call: {__MODULE__, :list_public_keys_for_user},
      opts: opts,
      method: :get,
      path_template: "/users/{username}/keys",
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
      telemetry: [:github_ex, :users, :list_public_keys_for_user],
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

  @list_public_ssh_keys_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List public SSH keys for the authenticated user\n\nLists the public SSH keys for the authenticated user's GitHub account.\n\nOAuth app tokens and personal access tokens (classic) need the `read:public_key` scope to use this endpoint."
  @spec list_public_ssh_keys_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_public_ssh_keys_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_public_ssh_keys_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_public_ssh_keys_for_authenticated_user(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_list_public_ssh_keys_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_public_ssh_keys_for_authenticated_user_request(client, params, opts) end,
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

  defp build_list_public_ssh_keys_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @list_public_ssh_keys_for_authenticated_user_partition_spec)

    %{
      id: "users/list-public-ssh-keys-for-authenticated-user",
      args: params,
      call: {__MODULE__, :list_public_ssh_keys_for_authenticated_user},
      opts: opts,
      method: :get,
      path_template: "/user/keys",
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
      telemetry: [:github_ex, :users, :list_public_ssh_keys_for_authenticated_user],
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

  @list_social_accounts_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List social accounts for the authenticated user\n\nLists all of your social accounts."
  @spec list_social_accounts_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_social_accounts_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_social_accounts_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_social_accounts_for_authenticated_user(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_list_social_accounts_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_social_accounts_for_authenticated_user_request(client, params, opts) end,
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

  defp build_list_social_accounts_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @list_social_accounts_for_authenticated_user_partition_spec)

    %{
      id: "users/list-social-accounts-for-authenticated-user",
      args: params,
      call: {__MODULE__, :list_social_accounts_for_authenticated_user},
      opts: opts,
      method: :get,
      path_template: "/user/social_accounts",
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
      telemetry: [:github_ex, :users, :list_social_accounts_for_authenticated_user],
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

  @list_social_accounts_for_user_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List social accounts for a user\n\nLists social media accounts for a user. This endpoint is accessible by anyone."
  @spec list_social_accounts_for_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_social_accounts_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_social_accounts_for_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_social_accounts_for_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_social_accounts_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_social_accounts_for_user_request(client, params, opts) end,
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

  defp build_list_social_accounts_for_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_social_accounts_for_user_partition_spec)

    %{
      id: "users/list-social-accounts-for-user",
      args: params,
      call: {__MODULE__, :list_social_accounts_for_user},
      opts: opts,
      method: :get,
      path_template: "/users/{username}/social_accounts",
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
      telemetry: [:github_ex, :users, :list_social_accounts_for_user],
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

  @list_ssh_signing_keys_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List SSH signing keys for the authenticated user\n\nLists the SSH signing keys for the authenticated user's GitHub account.\n\nOAuth app tokens and personal access tokens (classic) need the `read:ssh_signing_key` scope to use this endpoint."
  @spec list_ssh_signing_keys_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_ssh_signing_keys_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_ssh_signing_keys_for_authenticated_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_ssh_signing_keys_for_authenticated_user(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_list_ssh_signing_keys_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_ssh_signing_keys_for_authenticated_user_request(client, params, opts) end,
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

  defp build_list_ssh_signing_keys_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @list_ssh_signing_keys_for_authenticated_user_partition_spec
      )

    %{
      id: "users/list-ssh-signing-keys-for-authenticated-user",
      args: params,
      call: {__MODULE__, :list_ssh_signing_keys_for_authenticated_user},
      opts: opts,
      method: :get,
      path_template: "/user/ssh_signing_keys",
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
      telemetry: [:github_ex, :users, :list_ssh_signing_keys_for_authenticated_user],
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

  @list_ssh_signing_keys_for_user_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List SSH signing keys for a user\n\nLists the SSH signing keys for a user. This operation is accessible by anyone."
  @spec list_ssh_signing_keys_for_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_ssh_signing_keys_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_ssh_signing_keys_for_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_ssh_signing_keys_for_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_ssh_signing_keys_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_ssh_signing_keys_for_user_request(client, params, opts) end,
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

  defp build_list_ssh_signing_keys_for_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_ssh_signing_keys_for_user_partition_spec)

    %{
      id: "users/list-ssh-signing-keys-for-user",
      args: params,
      call: {__MODULE__, :list_ssh_signing_keys_for_user},
      opts: opts,
      method: :get,
      path_template: "/users/{username}/ssh_signing_keys",
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
      telemetry: [:github_ex, :users, :list_ssh_signing_keys_for_user],
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

  @set_primary_email_visibility_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set primary email visibility for the authenticated user\n\nSets the visibility for your primary email addresses."
  @spec set_primary_email_visibility_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_primary_email_visibility_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_set_primary_email_visibility_for_authenticated_user_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_primary_email_visibility_for_authenticated_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @set_primary_email_visibility_for_authenticated_user_partition_spec
      )

    %{
      id: "users/set-primary-email-visibility-for-authenticated-user",
      args: params,
      call: {__MODULE__, :set_primary_email_visibility_for_authenticated_user},
      opts: opts,
      method: :patch,
      path_template: "/user/email/visibility",
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
      telemetry: [:github_ex, :users, :set_primary_email_visibility_for_authenticated_user],
      timeout: nil,
      pagination: nil
    }
  end

  @unblock_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Unblock a user\n\nUnblocks the given user and returns a 204."
  @spec unblock(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def unblock(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_unblock_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_unblock_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @unblock_partition_spec)

    %{
      id: "users/unblock",
      args: params,
      call: {__MODULE__, :unblock},
      opts: opts,
      method: :delete,
      path_template: "/user/blocks/{username}",
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
      telemetry: [:github_ex, :users, :unblock],
      timeout: nil,
      pagination: nil
    }
  end

  @unfollow_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Unfollow a user\n\nOAuth app tokens and personal access tokens (classic) need the `user:follow` scope to use this endpoint."
  @spec unfollow(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def unfollow(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_unfollow_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_unfollow_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @unfollow_partition_spec)

    %{
      id: "users/unfollow",
      args: params,
      call: {__MODULE__, :unfollow},
      opts: opts,
      method: :delete,
      path_template: "/user/following/{username}",
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
      telemetry: [:github_ex, :users, :unfollow],
      timeout: nil,
      pagination: nil
    }
  end

  @update_authenticated_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update the authenticated user\n\n**Note:** If your email is set to private and you send an `email` parameter as part of this request to update your profile, your privacy settings are still enforced: the email address will not be displayed on your public profile or via the API."
  @spec update_authenticated(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_authenticated(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_authenticated_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_authenticated_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_authenticated_partition_spec)

    %{
      id: "users/update-authenticated",
      args: params,
      call: {__MODULE__, :update_authenticated},
      opts: opts,
      method: :patch,
      path_template: "/user",
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
      telemetry: [:github_ex, :users, :update_authenticated],
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

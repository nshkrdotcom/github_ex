defmodule GitHubEx.Users do
  @moduledoc """
  Generated GitHub REST operations for the `Users` namespace.

  ## Operations

  * `users/get-authenticated`
  * `users/update-authenticated`
  * `users/list-blocked-by-authenticated-user`
  * `users/block`
  * `users/check-blocked`
  * `users/unblock`
  * `users/set-primary-email-visibility-for-authenticated-user`
  * `users/add-email-for-authenticated-user`
  * `users/delete-email-for-authenticated-user`
  * `users/list-emails-for-authenticated-user`
  * `users/list-followers-for-authenticated-user`
  * `users/list-followed-by-authenticated-user`
  * `users/check-person-is-followed-by-authenticated`
  * `users/follow`
  * `users/unfollow`
  * `users/create-gpg-key-for-authenticated-user`
  * `users/list-gpg-keys-for-authenticated-user`
  * `users/delete-gpg-key-for-authenticated-user`
  * `users/get-gpg-key-for-authenticated-user`
  * `users/create-public-ssh-key-for-authenticated-user`
  * `users/list-public-ssh-keys-for-authenticated-user`
  * `users/delete-public-ssh-key-for-authenticated-user`
  * `users/get-public-ssh-key-for-authenticated-user`
  * `users/list-public-emails-for-authenticated-user`
  * `users/add-social-account-for-authenticated-user`
  * `users/delete-social-account-for-authenticated-user`
  * `users/list-social-accounts-for-authenticated-user`
  * `users/create-ssh-signing-key-for-authenticated-user`
  * `users/list-ssh-signing-keys-for-authenticated-user`
  * `users/delete-ssh-signing-key-for-authenticated-user`
  * `users/get-ssh-signing-key-for-authenticated-user`
  * `users/get-by-id`
  * `users/list`
  * `users/get-by-username`
  * `users/list-attestations-bulk`
  * `users/delete-attestations-bulk`
  * `users/delete-attestations-by-subject-digest`
  * `users/delete-attestations-by-id`
  * `users/list-attestations`
  * `users/list-followers-for-user`
  * `users/list-following-for-user`
  * `users/check-following-for-user`
  * `users/list-gpg-keys-for-user`
  * `users/get-context-for-user`
  * `users/list-public-keys-for-user`
  * `users/list-social-accounts-for-user`
  * `users/list-ssh-signing-keys-for-user`
  """

  @type result :: {:ok, term()} | {:error, GitHubEx.Error.t()}

  @doc "Add an email address for the authenticated user\n\nPath: /user/emails\n\nMethod: post"
  @spec add_email_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec add_email_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def add_email_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Users, :add_email_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [],
      path_template: "/user/emails",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Add social accounts for the authenticated user\n\nPath: /user/social_accounts\n\nMethod: post"
  @spec add_social_account_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec add_social_account_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def add_social_account_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Users, :add_social_account_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [],
      path_template: "/user/social_accounts",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Block a user\n\nPath: /user/blocks/{username}\n\nMethod: put"
  @spec block(GitHubEx.Client.t()) :: result
  @spec block(GitHubEx.Client.t(), map()) :: result
  def block(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :block},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"username", :username}],
      path_template: "/user/blocks/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Check if a user is blocked by the authenticated user\n\nPath: /user/blocks/{username}\n\nMethod: get"
  @spec check_blocked(GitHubEx.Client.t()) :: result
  @spec check_blocked(GitHubEx.Client.t(), map()) :: result
  def check_blocked(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :check_blocked},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"username", :username}],
      path_template: "/user/blocks/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Check if a user follows another user\n\nPath: /users/{username}/following/{target_user}\n\nMethod: get"
  @spec check_following_for_user(GitHubEx.Client.t()) :: result
  @spec check_following_for_user(GitHubEx.Client.t(), map()) :: result
  def check_following_for_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :check_following_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"username", :username}, {"target_user", :target_user}],
      path_template: "/users/{username}/following/{target_user}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Check if a person is followed by the authenticated user\n\nPath: /user/following/{username}\n\nMethod: get"
  @spec check_person_is_followed_by_authenticated(GitHubEx.Client.t()) :: result
  @spec check_person_is_followed_by_authenticated(GitHubEx.Client.t(), map()) :: result
  def check_person_is_followed_by_authenticated(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :check_person_is_followed_by_authenticated},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"username", :username}],
      path_template: "/user/following/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Create a GPG key for the authenticated user\n\nPath: /user/gpg_keys\n\nMethod: post"
  @spec create_gpg_key_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec create_gpg_key_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def create_gpg_key_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Users, :create_gpg_key_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [],
      path_template: "/user/gpg_keys",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a public SSH key for the authenticated user\n\nPath: /user/keys\n\nMethod: post"
  @spec create_public_ssh_key_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec create_public_ssh_key_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def create_public_ssh_key_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Users, :create_public_ssh_key_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [],
      path_template: "/user/keys",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a SSH signing key for the authenticated user\n\nPath: /user/ssh_signing_keys\n\nMethod: post"
  @spec create_ssh_signing_key_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec create_ssh_signing_key_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def create_ssh_signing_key_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Users, :create_ssh_signing_key_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [],
      path_template: "/user/ssh_signing_keys",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Delete attestations in bulk\n\nPath: /users/{username}/attestations/delete-request\n\nMethod: post"
  @spec delete_attestations_bulk(GitHubEx.Client.t()) :: result
  @spec delete_attestations_bulk(GitHubEx.Client.t(), map()) :: result
  def delete_attestations_bulk(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Users, :delete_attestations_bulk},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"username", :username}],
      path_template: "/users/{username}/attestations/delete-request",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Delete attestations by ID\n\nPath: /users/{username}/attestations/{attestation_id}\n\nMethod: delete"
  @spec delete_attestations_by_id(GitHubEx.Client.t()) :: result
  @spec delete_attestations_by_id(GitHubEx.Client.t(), map()) :: result
  def delete_attestations_by_id(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :delete_attestations_by_id},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"username", :username}, {"attestation_id", :attestation_id}],
      path_template: "/users/{username}/attestations/{attestation_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete attestations by subject digest\n\nPath: /users/{username}/attestations/digest/{subject_digest}\n\nMethod: delete"
  @spec delete_attestations_by_subject_digest(GitHubEx.Client.t()) :: result
  @spec delete_attestations_by_subject_digest(GitHubEx.Client.t(), map()) :: result
  def delete_attestations_by_subject_digest(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :delete_attestations_by_subject_digest},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"username", :username}, {"subject_digest", :subject_digest}],
      path_template: "/users/{username}/attestations/digest/{subject_digest}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete an email address for the authenticated user\n\nPath: /user/emails\n\nMethod: delete"
  @spec delete_email_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec delete_email_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def delete_email_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Users, :delete_email_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [],
      path_template: "/user/emails",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a GPG key for the authenticated user\n\nPath: /user/gpg_keys/{gpg_key_id}\n\nMethod: delete"
  @spec delete_gpg_key_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec delete_gpg_key_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def delete_gpg_key_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :delete_gpg_key_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"gpg_key_id", :gpg_key_id}],
      path_template: "/user/gpg_keys/{gpg_key_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a public SSH key for the authenticated user\n\nPath: /user/keys/{key_id}\n\nMethod: delete"
  @spec delete_public_ssh_key_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec delete_public_ssh_key_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def delete_public_ssh_key_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :delete_public_ssh_key_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"key_id", :key_id}],
      path_template: "/user/keys/{key_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete social accounts for the authenticated user\n\nPath: /user/social_accounts\n\nMethod: delete"
  @spec delete_social_account_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec delete_social_account_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def delete_social_account_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Users, :delete_social_account_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [],
      path_template: "/user/social_accounts",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete an SSH signing key for the authenticated user\n\nPath: /user/ssh_signing_keys/{ssh_signing_key_id}\n\nMethod: delete"
  @spec delete_ssh_signing_key_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec delete_ssh_signing_key_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def delete_ssh_signing_key_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :delete_ssh_signing_key_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"ssh_signing_key_id", :ssh_signing_key_id}],
      path_template: "/user/ssh_signing_keys/{ssh_signing_key_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Follow a user\n\nPath: /user/following/{username}\n\nMethod: put"
  @spec follow(GitHubEx.Client.t()) :: result
  @spec follow(GitHubEx.Client.t(), map()) :: result
  def follow(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :follow},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"username", :username}],
      path_template: "/user/following/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Get the authenticated user\n\nPath: /user\n\nMethod: get"
  @spec get_authenticated(GitHubEx.Client.t()) :: result
  @spec get_authenticated(GitHubEx.Client.t(), map()) :: result
  def get_authenticated(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :get_authenticated},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/user",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a user using their ID\n\nPath: /user/{account_id}\n\nMethod: get"
  @spec get_by_id(GitHubEx.Client.t()) :: result
  @spec get_by_id(GitHubEx.Client.t(), map()) :: result
  def get_by_id(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :get_by_id},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"account_id", :account_id}],
      path_template: "/user/{account_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a user\n\nPath: /users/{username}\n\nMethod: get"
  @spec get_by_username(GitHubEx.Client.t()) :: result
  @spec get_by_username(GitHubEx.Client.t(), map()) :: result
  def get_by_username(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :get_by_username},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"username", :username}],
      path_template: "/users/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get contextual information for a user\n\nPath: /users/{username}/hovercard\n\nMethod: get"
  @spec get_context_for_user(GitHubEx.Client.t()) :: result
  @spec get_context_for_user(GitHubEx.Client.t(), map()) :: result
  def get_context_for_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :get_context_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"username", :username}],
      path_template: "/users/{username}/hovercard",
      query: [{"subject_type", :subject_type}, {"subject_id", :subject_id}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a GPG key for the authenticated user\n\nPath: /user/gpg_keys/{gpg_key_id}\n\nMethod: get"
  @spec get_gpg_key_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec get_gpg_key_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def get_gpg_key_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :get_gpg_key_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"gpg_key_id", :gpg_key_id}],
      path_template: "/user/gpg_keys/{gpg_key_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a public SSH key for the authenticated user\n\nPath: /user/keys/{key_id}\n\nMethod: get"
  @spec get_public_ssh_key_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec get_public_ssh_key_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def get_public_ssh_key_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :get_public_ssh_key_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"key_id", :key_id}],
      path_template: "/user/keys/{key_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get an SSH signing key for the authenticated user\n\nPath: /user/ssh_signing_keys/{ssh_signing_key_id}\n\nMethod: get"
  @spec get_ssh_signing_key_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec get_ssh_signing_key_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def get_ssh_signing_key_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :get_ssh_signing_key_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"ssh_signing_key_id", :ssh_signing_key_id}],
      path_template: "/user/ssh_signing_keys/{ssh_signing_key_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List users\n\nPath: /users\n\nMethod: get"
  @spec list(GitHubEx.Client.t()) :: result
  @spec list(GitHubEx.Client.t(), map()) :: result
  def list(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :list},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/users",
      query: [{"since", :since}, {"per_page", :per_page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List attestations\n\nPath: /users/{username}/attestations/{subject_digest}\n\nMethod: get"
  @spec list_attestations(GitHubEx.Client.t()) :: result
  @spec list_attestations(GitHubEx.Client.t(), map()) :: result
  def list_attestations(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :list_attestations},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"username", :username}, {"subject_digest", :subject_digest}],
      path_template: "/users/{username}/attestations/{subject_digest}",
      query: [
        {"per_page", :per_page},
        {"before", :before},
        {"after", :after},
        {"predicate_type", :predicate_type}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List attestations by bulk subject digests\n\nPath: /users/{username}/attestations/bulk-list\n\nMethod: post"
  @spec list_attestations_bulk(GitHubEx.Client.t()) :: result
  @spec list_attestations_bulk(GitHubEx.Client.t(), map()) :: result
  def list_attestations_bulk(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Users, :list_attestations_bulk},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"username", :username}],
      path_template: "/users/{username}/attestations/bulk-list",
      query: [{"per_page", :per_page}, {"before", :before}, {"after", :after}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "List users blocked by the authenticated user\n\nPath: /user/blocks\n\nMethod: get"
  @spec list_blocked_by_authenticated_user(GitHubEx.Client.t()) :: result
  @spec list_blocked_by_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def list_blocked_by_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :list_blocked_by_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/user/blocks",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List email addresses for the authenticated user\n\nPath: /user/emails\n\nMethod: get"
  @spec list_emails_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec list_emails_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def list_emails_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :list_emails_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/user/emails",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List the people the authenticated user follows\n\nPath: /user/following\n\nMethod: get"
  @spec list_followed_by_authenticated_user(GitHubEx.Client.t()) :: result
  @spec list_followed_by_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def list_followed_by_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :list_followed_by_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/user/following",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List followers of the authenticated user\n\nPath: /user/followers\n\nMethod: get"
  @spec list_followers_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec list_followers_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def list_followers_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :list_followers_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/user/followers",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List followers of a user\n\nPath: /users/{username}/followers\n\nMethod: get"
  @spec list_followers_for_user(GitHubEx.Client.t()) :: result
  @spec list_followers_for_user(GitHubEx.Client.t(), map()) :: result
  def list_followers_for_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :list_followers_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"username", :username}],
      path_template: "/users/{username}/followers",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List the people a user follows\n\nPath: /users/{username}/following\n\nMethod: get"
  @spec list_following_for_user(GitHubEx.Client.t()) :: result
  @spec list_following_for_user(GitHubEx.Client.t(), map()) :: result
  def list_following_for_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :list_following_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"username", :username}],
      path_template: "/users/{username}/following",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List GPG keys for the authenticated user\n\nPath: /user/gpg_keys\n\nMethod: get"
  @spec list_gpg_keys_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec list_gpg_keys_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def list_gpg_keys_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :list_gpg_keys_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/user/gpg_keys",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List GPG keys for a user\n\nPath: /users/{username}/gpg_keys\n\nMethod: get"
  @spec list_gpg_keys_for_user(GitHubEx.Client.t()) :: result
  @spec list_gpg_keys_for_user(GitHubEx.Client.t(), map()) :: result
  def list_gpg_keys_for_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :list_gpg_keys_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"username", :username}],
      path_template: "/users/{username}/gpg_keys",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List public email addresses for the authenticated user\n\nPath: /user/public_emails\n\nMethod: get"
  @spec list_public_emails_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec list_public_emails_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def list_public_emails_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :list_public_emails_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/user/public_emails",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List public keys for a user\n\nPath: /users/{username}/keys\n\nMethod: get"
  @spec list_public_keys_for_user(GitHubEx.Client.t()) :: result
  @spec list_public_keys_for_user(GitHubEx.Client.t(), map()) :: result
  def list_public_keys_for_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :list_public_keys_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"username", :username}],
      path_template: "/users/{username}/keys",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List public SSH keys for the authenticated user\n\nPath: /user/keys\n\nMethod: get"
  @spec list_public_ssh_keys_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec list_public_ssh_keys_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def list_public_ssh_keys_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :list_public_ssh_keys_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/user/keys",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List social accounts for the authenticated user\n\nPath: /user/social_accounts\n\nMethod: get"
  @spec list_social_accounts_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec list_social_accounts_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def list_social_accounts_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :list_social_accounts_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/user/social_accounts",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List social accounts for a user\n\nPath: /users/{username}/social_accounts\n\nMethod: get"
  @spec list_social_accounts_for_user(GitHubEx.Client.t()) :: result
  @spec list_social_accounts_for_user(GitHubEx.Client.t(), map()) :: result
  def list_social_accounts_for_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :list_social_accounts_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"username", :username}],
      path_template: "/users/{username}/social_accounts",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List SSH signing keys for the authenticated user\n\nPath: /user/ssh_signing_keys\n\nMethod: get"
  @spec list_ssh_signing_keys_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec list_ssh_signing_keys_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def list_ssh_signing_keys_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :list_ssh_signing_keys_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/user/ssh_signing_keys",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List SSH signing keys for a user\n\nPath: /users/{username}/ssh_signing_keys\n\nMethod: get"
  @spec list_ssh_signing_keys_for_user(GitHubEx.Client.t()) :: result
  @spec list_ssh_signing_keys_for_user(GitHubEx.Client.t(), map()) :: result
  def list_ssh_signing_keys_for_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :list_ssh_signing_keys_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"username", :username}],
      path_template: "/users/{username}/ssh_signing_keys",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Set primary email visibility for the authenticated user\n\nPath: /user/email/visibility\n\nMethod: patch"
  @spec set_primary_email_visibility_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec set_primary_email_visibility_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def set_primary_email_visibility_for_authenticated_user(client, params \\ %{})
      when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Users, :set_primary_email_visibility_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [],
      path_template: "/user/email/visibility",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Unblock a user\n\nPath: /user/blocks/{username}\n\nMethod: delete"
  @spec unblock(GitHubEx.Client.t()) :: result
  @spec unblock(GitHubEx.Client.t(), map()) :: result
  def unblock(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :unblock},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"username", :username}],
      path_template: "/user/blocks/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Unfollow a user\n\nPath: /user/following/{username}\n\nMethod: delete"
  @spec unfollow(GitHubEx.Client.t()) :: result
  @spec unfollow(GitHubEx.Client.t(), map()) :: result
  def unfollow(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Users, :unfollow},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"username", :username}],
      path_template: "/user/following/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Update the authenticated user\n\nPath: /user\n\nMethod: patch"
  @spec update_authenticated(GitHubEx.Client.t()) :: result
  @spec update_authenticated(GitHubEx.Client.t(), map()) :: result
  def update_authenticated(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Users, :update_authenticated},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [],
      path_template: "/user",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

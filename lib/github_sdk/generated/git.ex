defmodule GitHubSDK.Git do
  @moduledoc """
  Generated GitHub REST operations for the `Git` namespace.

  ## Operations

  * `git/create-blob`
  * `git/get-blob`
  * `git/create-commit`
  * `git/get-commit`
  * `git/list-matching-refs`
  * `git/get-ref`
  * `git/create-ref`
  * `git/delete-ref`
  * `git/update-ref`
  * `git/create-tag`
  * `git/get-tag`
  * `git/create-tree`
  * `git/get-tree`
  """

  @type result :: {:ok, term()} | {:error, GitHubSDK.Error.t()}

  @doc "Create a blob\n\nPath: /repos/{owner}/{repo}/git/blobs\n\nMethod: post"
  @spec create_blob(GitHubSDK.Client.t()) :: result
  @spec create_blob(GitHubSDK.Client.t(), map()) :: result
  def create_blob(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Git, :create_blob},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/git/blobs",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a commit\n\nPath: /repos/{owner}/{repo}/git/commits\n\nMethod: post"
  @spec create_commit(GitHubSDK.Client.t()) :: result
  @spec create_commit(GitHubSDK.Client.t(), map()) :: result
  def create_commit(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Git, :create_commit},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/git/commits",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a reference\n\nPath: /repos/{owner}/{repo}/git/refs\n\nMethod: post"
  @spec create_ref(GitHubSDK.Client.t()) :: result
  @spec create_ref(GitHubSDK.Client.t(), map()) :: result
  def create_ref(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Git, :create_ref},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/git/refs",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a tag object\n\nPath: /repos/{owner}/{repo}/git/tags\n\nMethod: post"
  @spec create_tag(GitHubSDK.Client.t()) :: result
  @spec create_tag(GitHubSDK.Client.t(), map()) :: result
  def create_tag(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Git, :create_tag},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/git/tags",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a tree\n\nPath: /repos/{owner}/{repo}/git/trees\n\nMethod: post"
  @spec create_tree(GitHubSDK.Client.t()) :: result
  @spec create_tree(GitHubSDK.Client.t(), map()) :: result
  def create_tree(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Git, :create_tree},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/git/trees",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Delete a reference\n\nPath: /repos/{owner}/{repo}/git/refs/{ref}\n\nMethod: delete"
  @spec delete_ref(GitHubSDK.Client.t()) :: result
  @spec delete_ref(GitHubSDK.Client.t(), map()) :: result
  def delete_ref(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Git, :delete_ref},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"ref", :ref}],
      path_template: "/repos/{owner}/{repo}/git/refs/{ref}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Get a blob\n\nPath: /repos/{owner}/{repo}/git/blobs/{file_sha}\n\nMethod: get"
  @spec get_blob(GitHubSDK.Client.t()) :: result
  @spec get_blob(GitHubSDK.Client.t(), map()) :: result
  def get_blob(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Git, :get_blob},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"file_sha", :file_sha}],
      path_template: "/repos/{owner}/{repo}/git/blobs/{file_sha}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a commit object\n\nPath: /repos/{owner}/{repo}/git/commits/{commit_sha}\n\nMethod: get"
  @spec get_commit(GitHubSDK.Client.t()) :: result
  @spec get_commit(GitHubSDK.Client.t(), map()) :: result
  def get_commit(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Git, :get_commit},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"commit_sha", :commit_sha}],
      path_template: "/repos/{owner}/{repo}/git/commits/{commit_sha}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a reference\n\nPath: /repos/{owner}/{repo}/git/ref/{ref}\n\nMethod: get"
  @spec get_ref(GitHubSDK.Client.t()) :: result
  @spec get_ref(GitHubSDK.Client.t(), map()) :: result
  def get_ref(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Git, :get_ref},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"ref", :ref}],
      path_template: "/repos/{owner}/{repo}/git/ref/{ref}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a tag\n\nPath: /repos/{owner}/{repo}/git/tags/{tag_sha}\n\nMethod: get"
  @spec get_tag(GitHubSDK.Client.t()) :: result
  @spec get_tag(GitHubSDK.Client.t(), map()) :: result
  def get_tag(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Git, :get_tag},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"tag_sha", :tag_sha}],
      path_template: "/repos/{owner}/{repo}/git/tags/{tag_sha}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a tree\n\nPath: /repos/{owner}/{repo}/git/trees/{tree_sha}\n\nMethod: get"
  @spec get_tree(GitHubSDK.Client.t()) :: result
  @spec get_tree(GitHubSDK.Client.t(), map()) :: result
  def get_tree(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Git, :get_tree},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"tree_sha", :tree_sha}],
      path_template: "/repos/{owner}/{repo}/git/trees/{tree_sha}",
      query: [{"recursive", :recursive}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List matching references\n\nPath: /repos/{owner}/{repo}/git/matching-refs/{ref}\n\nMethod: get"
  @spec list_matching_refs(GitHubSDK.Client.t()) :: result
  @spec list_matching_refs(GitHubSDK.Client.t(), map()) :: result
  def list_matching_refs(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Git, :list_matching_refs},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"ref", :ref}],
      path_template: "/repos/{owner}/{repo}/git/matching-refs/{ref}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Update a reference\n\nPath: /repos/{owner}/{repo}/git/refs/{ref}\n\nMethod: patch"
  @spec update_ref(GitHubSDK.Client.t()) :: result
  @spec update_ref(GitHubSDK.Client.t(), map()) :: result
  def update_ref(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Git, :update_ref},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"owner", :owner}, {"repo", :repo}, {"ref", :ref}],
      path_template: "/repos/{owner}/{repo}/git/refs/{ref}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

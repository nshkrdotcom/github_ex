defmodule GitHubSDK.Gists do
  @moduledoc """
  Generated GitHub REST operations for the `Gists` namespace.

  ## Operations

  * `gists/create`
  * `gists/list`
  * `gists/list-public`
  * `gists/list-starred`
  * `gists/delete`
  * `gists/get`
  * `gists/update`
  * `gists/create-comment`
  * `gists/list-comments`
  * `gists/delete-comment`
  * `gists/get-comment`
  * `gists/update-comment`
  * `gists/list-commits`
  * `gists/fork`
  * `gists/list-forks`
  * `gists/check-is-starred`
  * `gists/star`
  * `gists/unstar`
  * `gists/get-revision`
  * `gists/list-for-user`
  """

  @type result :: {:ok, term()} | {:error, GitHubSDK.Error.t()}

  @doc "Check if a gist is starred\n\nPath: /gists/{gist_id}/star\n\nMethod: get"
  @spec check_is_starred(GitHubSDK.Client.t()) :: result
  @spec check_is_starred(GitHubSDK.Client.t(), map()) :: result
  def check_is_starred(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Gists, :check_is_starred},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"gist_id", :gist_id}],
      path_template: "/gists/{gist_id}/star",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Create a gist\n\nPath: /gists\n\nMethod: post"
  @spec create(GitHubSDK.Client.t()) :: result
  @spec create(GitHubSDK.Client.t(), map()) :: result
  def create(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Gists, :create},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [],
      path_template: "/gists",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a gist comment\n\nPath: /gists/{gist_id}/comments\n\nMethod: post"
  @spec create_comment(GitHubSDK.Client.t()) :: result
  @spec create_comment(GitHubSDK.Client.t(), map()) :: result
  def create_comment(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Gists, :create_comment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"gist_id", :gist_id}],
      path_template: "/gists/{gist_id}/comments",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Delete a gist\n\nPath: /gists/{gist_id}\n\nMethod: delete"
  @spec delete(GitHubSDK.Client.t()) :: result
  @spec delete(GitHubSDK.Client.t(), map()) :: result
  def delete(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Gists, :delete},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"gist_id", :gist_id}],
      path_template: "/gists/{gist_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a gist comment\n\nPath: /gists/{gist_id}/comments/{comment_id}\n\nMethod: delete"
  @spec delete_comment(GitHubSDK.Client.t()) :: result
  @spec delete_comment(GitHubSDK.Client.t(), map()) :: result
  def delete_comment(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Gists, :delete_comment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"gist_id", :gist_id}, {"comment_id", :comment_id}],
      path_template: "/gists/{gist_id}/comments/{comment_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Fork a gist\n\nPath: /gists/{gist_id}/forks\n\nMethod: post"
  @spec fork(GitHubSDK.Client.t()) :: result
  @spec fork(GitHubSDK.Client.t(), map()) :: result
  def fork(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Gists, :fork},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"gist_id", :gist_id}],
      path_template: "/gists/{gist_id}/forks",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Get a gist\n\nPath: /gists/{gist_id}\n\nMethod: get"
  @spec get(GitHubSDK.Client.t()) :: result
  @spec get(GitHubSDK.Client.t(), map()) :: result
  def get(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Gists, :get},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"gist_id", :gist_id}],
      path_template: "/gists/{gist_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a gist comment\n\nPath: /gists/{gist_id}/comments/{comment_id}\n\nMethod: get"
  @spec get_comment(GitHubSDK.Client.t()) :: result
  @spec get_comment(GitHubSDK.Client.t(), map()) :: result
  def get_comment(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Gists, :get_comment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"gist_id", :gist_id}, {"comment_id", :comment_id}],
      path_template: "/gists/{gist_id}/comments/{comment_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a gist revision\n\nPath: /gists/{gist_id}/{sha}\n\nMethod: get"
  @spec get_revision(GitHubSDK.Client.t()) :: result
  @spec get_revision(GitHubSDK.Client.t(), map()) :: result
  def get_revision(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Gists, :get_revision},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"gist_id", :gist_id}, {"sha", :sha}],
      path_template: "/gists/{gist_id}/{sha}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List gists for the authenticated user\n\nPath: /gists\n\nMethod: get"
  @spec list(GitHubSDK.Client.t()) :: result
  @spec list(GitHubSDK.Client.t(), map()) :: result
  def list(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Gists, :list},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/gists",
      query: [{"since", :since}, {"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List gist comments\n\nPath: /gists/{gist_id}/comments\n\nMethod: get"
  @spec list_comments(GitHubSDK.Client.t()) :: result
  @spec list_comments(GitHubSDK.Client.t(), map()) :: result
  def list_comments(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Gists, :list_comments},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"gist_id", :gist_id}],
      path_template: "/gists/{gist_id}/comments",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List gist commits\n\nPath: /gists/{gist_id}/commits\n\nMethod: get"
  @spec list_commits(GitHubSDK.Client.t()) :: result
  @spec list_commits(GitHubSDK.Client.t(), map()) :: result
  def list_commits(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Gists, :list_commits},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"gist_id", :gist_id}],
      path_template: "/gists/{gist_id}/commits",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List gists for a user\n\nPath: /users/{username}/gists\n\nMethod: get"
  @spec list_for_user(GitHubSDK.Client.t()) :: result
  @spec list_for_user(GitHubSDK.Client.t(), map()) :: result
  def list_for_user(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Gists, :list_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"username", :username}],
      path_template: "/users/{username}/gists",
      query: [{"since", :since}, {"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List gist forks\n\nPath: /gists/{gist_id}/forks\n\nMethod: get"
  @spec list_forks(GitHubSDK.Client.t()) :: result
  @spec list_forks(GitHubSDK.Client.t(), map()) :: result
  def list_forks(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Gists, :list_forks},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"gist_id", :gist_id}],
      path_template: "/gists/{gist_id}/forks",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List public gists\n\nPath: /gists/public\n\nMethod: get"
  @spec list_public(GitHubSDK.Client.t()) :: result
  @spec list_public(GitHubSDK.Client.t(), map()) :: result
  def list_public(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Gists, :list_public},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/gists/public",
      query: [{"since", :since}, {"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List starred gists\n\nPath: /gists/starred\n\nMethod: get"
  @spec list_starred(GitHubSDK.Client.t()) :: result
  @spec list_starred(GitHubSDK.Client.t(), map()) :: result
  def list_starred(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Gists, :list_starred},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/gists/starred",
      query: [{"since", :since}, {"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Star a gist\n\nPath: /gists/{gist_id}/star\n\nMethod: put"
  @spec star(GitHubSDK.Client.t()) :: result
  @spec star(GitHubSDK.Client.t(), map()) :: result
  def star(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Gists, :star},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"gist_id", :gist_id}],
      path_template: "/gists/{gist_id}/star",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Unstar a gist\n\nPath: /gists/{gist_id}/star\n\nMethod: delete"
  @spec unstar(GitHubSDK.Client.t()) :: result
  @spec unstar(GitHubSDK.Client.t(), map()) :: result
  def unstar(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Gists, :unstar},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"gist_id", :gist_id}],
      path_template: "/gists/{gist_id}/star",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Update a gist\n\nPath: /gists/{gist_id}\n\nMethod: patch"
  @spec update(GitHubSDK.Client.t()) :: result
  @spec update(GitHubSDK.Client.t(), map()) :: result
  def update(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Gists, :update},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"gist_id", :gist_id}],
      path_template: "/gists/{gist_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update a gist comment\n\nPath: /gists/{gist_id}/comments/{comment_id}\n\nMethod: patch"
  @spec update_comment(GitHubSDK.Client.t()) :: result
  @spec update_comment(GitHubSDK.Client.t(), map()) :: result
  def update_comment(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Gists, :update_comment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"gist_id", :gist_id}, {"comment_id", :comment_id}],
      path_template: "/gists/{gist_id}/comments/{comment_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

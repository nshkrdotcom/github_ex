defmodule GitHubEx.Gists do
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

  @type result :: {:ok, term()} | {:error, GitHubEx.Error.t()}

  @doc "Check if a gist is starred\n\nPath: /gists/{gist_id}/star\n\nMethod: get"
  @spec check_is_starred(GitHubEx.Client.t()) :: result
  @spec check_is_starred(GitHubEx.Client.t(), map()) :: result
  def check_is_starred(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Gists, :check_is_starred},
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
  @spec create(GitHubEx.Client.t()) :: result
  @spec create(GitHubEx.Client.t(), map()) :: result
  def create(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Gists, :create},
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
  @spec create_comment(GitHubEx.Client.t()) :: result
  @spec create_comment(GitHubEx.Client.t(), map()) :: result
  def create_comment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Gists, :create_comment},
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
  @spec delete(GitHubEx.Client.t()) :: result
  @spec delete(GitHubEx.Client.t(), map()) :: result
  def delete(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Gists, :delete},
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
  @spec delete_comment(GitHubEx.Client.t()) :: result
  @spec delete_comment(GitHubEx.Client.t(), map()) :: result
  def delete_comment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Gists, :delete_comment},
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
  @spec fork(GitHubEx.Client.t()) :: result
  @spec fork(GitHubEx.Client.t(), map()) :: result
  def fork(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Gists, :fork},
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
  @spec get(GitHubEx.Client.t()) :: result
  @spec get(GitHubEx.Client.t(), map()) :: result
  def get(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Gists, :get},
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
  @spec get_comment(GitHubEx.Client.t()) :: result
  @spec get_comment(GitHubEx.Client.t(), map()) :: result
  def get_comment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Gists, :get_comment},
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
  @spec get_revision(GitHubEx.Client.t()) :: result
  @spec get_revision(GitHubEx.Client.t(), map()) :: result
  def get_revision(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Gists, :get_revision},
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
  @spec list(GitHubEx.Client.t()) :: result
  @spec list(GitHubEx.Client.t(), map()) :: result
  def list(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Gists, :list},
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
  @spec list_comments(GitHubEx.Client.t()) :: result
  @spec list_comments(GitHubEx.Client.t(), map()) :: result
  def list_comments(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Gists, :list_comments},
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
  @spec list_commits(GitHubEx.Client.t()) :: result
  @spec list_commits(GitHubEx.Client.t(), map()) :: result
  def list_commits(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Gists, :list_commits},
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
  @spec list_for_user(GitHubEx.Client.t()) :: result
  @spec list_for_user(GitHubEx.Client.t(), map()) :: result
  def list_for_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Gists, :list_for_user},
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
  @spec list_forks(GitHubEx.Client.t()) :: result
  @spec list_forks(GitHubEx.Client.t(), map()) :: result
  def list_forks(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Gists, :list_forks},
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
  @spec list_public(GitHubEx.Client.t()) :: result
  @spec list_public(GitHubEx.Client.t(), map()) :: result
  def list_public(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Gists, :list_public},
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
  @spec list_starred(GitHubEx.Client.t()) :: result
  @spec list_starred(GitHubEx.Client.t(), map()) :: result
  def list_starred(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Gists, :list_starred},
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
  @spec star(GitHubEx.Client.t()) :: result
  @spec star(GitHubEx.Client.t(), map()) :: result
  def star(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Gists, :star},
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
  @spec unstar(GitHubEx.Client.t()) :: result
  @spec unstar(GitHubEx.Client.t(), map()) :: result
  def unstar(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Gists, :unstar},
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
  @spec update(GitHubEx.Client.t()) :: result
  @spec update(GitHubEx.Client.t(), map()) :: result
  def update(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Gists, :update},
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
  @spec update_comment(GitHubEx.Client.t()) :: result
  @spec update_comment(GitHubEx.Client.t(), map()) :: result
  def update_comment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Gists, :update_comment},
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

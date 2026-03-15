defmodule GitHubEx.Reactions do
  @moduledoc """
  Generated GitHub REST operations for the `Reactions` namespace.

  ## Operations

  * `reactions/create-for-commit-comment`
  * `reactions/list-for-commit-comment`
  * `reactions/delete-for-commit-comment`
  * `reactions/create-for-issue-comment`
  * `reactions/list-for-issue-comment`
  * `reactions/delete-for-issue-comment`
  * `reactions/create-for-issue`
  * `reactions/list-for-issue`
  * `reactions/delete-for-issue`
  * `reactions/create-for-pull-request-review-comment`
  * `reactions/list-for-pull-request-review-comment`
  * `reactions/delete-for-pull-request-comment`
  * `reactions/create-for-release`
  * `reactions/list-for-release`
  * `reactions/delete-for-release`
  """

  @type result :: {:ok, term()} | {:error, GitHubEx.Error.t()}

  @doc "Create reaction for a commit comment\n\nPath: /repos/{owner}/{repo}/comments/{comment_id}/reactions\n\nMethod: post"
  @spec create_for_commit_comment(GitHubEx.Client.t()) :: result
  @spec create_for_commit_comment(GitHubEx.Client.t(), map()) :: result
  def create_for_commit_comment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Reactions, :create_for_commit_comment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
      path_template: "/repos/{owner}/{repo}/comments/{comment_id}/reactions",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create reaction for an issue\n\nPath: /repos/{owner}/{repo}/issues/{issue_number}/reactions\n\nMethod: post"
  @spec create_for_issue(GitHubEx.Client.t()) :: result
  @spec create_for_issue(GitHubEx.Client.t(), map()) :: result
  def create_for_issue(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Reactions, :create_for_issue},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/reactions",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create reaction for an issue comment\n\nPath: /repos/{owner}/{repo}/issues/comments/{comment_id}/reactions\n\nMethod: post"
  @spec create_for_issue_comment(GitHubEx.Client.t()) :: result
  @spec create_for_issue_comment(GitHubEx.Client.t(), map()) :: result
  def create_for_issue_comment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Reactions, :create_for_issue_comment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
      path_template: "/repos/{owner}/{repo}/issues/comments/{comment_id}/reactions",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create reaction for a pull request review comment\n\nPath: /repos/{owner}/{repo}/pulls/comments/{comment_id}/reactions\n\nMethod: post"
  @spec create_for_pull_request_review_comment(GitHubEx.Client.t()) :: result
  @spec create_for_pull_request_review_comment(GitHubEx.Client.t(), map()) :: result
  def create_for_pull_request_review_comment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Reactions, :create_for_pull_request_review_comment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
      path_template: "/repos/{owner}/{repo}/pulls/comments/{comment_id}/reactions",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create reaction for a release\n\nPath: /repos/{owner}/{repo}/releases/{release_id}/reactions\n\nMethod: post"
  @spec create_for_release(GitHubEx.Client.t()) :: result
  @spec create_for_release(GitHubEx.Client.t(), map()) :: result
  def create_for_release(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Reactions, :create_for_release},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"release_id", :release_id}],
      path_template: "/repos/{owner}/{repo}/releases/{release_id}/reactions",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Delete a commit comment reaction\n\nPath: /repos/{owner}/{repo}/comments/{comment_id}/reactions/{reaction_id}\n\nMethod: delete"
  @spec delete_for_commit_comment(GitHubEx.Client.t()) :: result
  @spec delete_for_commit_comment(GitHubEx.Client.t(), map()) :: result
  def delete_for_commit_comment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Reactions, :delete_for_commit_comment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"comment_id", :comment_id},
        {"reaction_id", :reaction_id}
      ],
      path_template: "/repos/{owner}/{repo}/comments/{comment_id}/reactions/{reaction_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete an issue reaction\n\nPath: /repos/{owner}/{repo}/issues/{issue_number}/reactions/{reaction_id}\n\nMethod: delete"
  @spec delete_for_issue(GitHubEx.Client.t()) :: result
  @spec delete_for_issue(GitHubEx.Client.t(), map()) :: result
  def delete_for_issue(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Reactions, :delete_for_issue},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"issue_number", :issue_number},
        {"reaction_id", :reaction_id}
      ],
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/reactions/{reaction_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete an issue comment reaction\n\nPath: /repos/{owner}/{repo}/issues/comments/{comment_id}/reactions/{reaction_id}\n\nMethod: delete"
  @spec delete_for_issue_comment(GitHubEx.Client.t()) :: result
  @spec delete_for_issue_comment(GitHubEx.Client.t(), map()) :: result
  def delete_for_issue_comment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Reactions, :delete_for_issue_comment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"comment_id", :comment_id},
        {"reaction_id", :reaction_id}
      ],
      path_template: "/repos/{owner}/{repo}/issues/comments/{comment_id}/reactions/{reaction_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a pull request comment reaction\n\nPath: /repos/{owner}/{repo}/pulls/comments/{comment_id}/reactions/{reaction_id}\n\nMethod: delete"
  @spec delete_for_pull_request_comment(GitHubEx.Client.t()) :: result
  @spec delete_for_pull_request_comment(GitHubEx.Client.t(), map()) :: result
  def delete_for_pull_request_comment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Reactions, :delete_for_pull_request_comment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"comment_id", :comment_id},
        {"reaction_id", :reaction_id}
      ],
      path_template: "/repos/{owner}/{repo}/pulls/comments/{comment_id}/reactions/{reaction_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a release reaction\n\nPath: /repos/{owner}/{repo}/releases/{release_id}/reactions/{reaction_id}\n\nMethod: delete"
  @spec delete_for_release(GitHubEx.Client.t()) :: result
  @spec delete_for_release(GitHubEx.Client.t(), map()) :: result
  def delete_for_release(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Reactions, :delete_for_release},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"release_id", :release_id},
        {"reaction_id", :reaction_id}
      ],
      path_template: "/repos/{owner}/{repo}/releases/{release_id}/reactions/{reaction_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "List reactions for a commit comment\n\nPath: /repos/{owner}/{repo}/comments/{comment_id}/reactions\n\nMethod: get"
  @spec list_for_commit_comment(GitHubEx.Client.t()) :: result
  @spec list_for_commit_comment(GitHubEx.Client.t(), map()) :: result
  def list_for_commit_comment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Reactions, :list_for_commit_comment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
      path_template: "/repos/{owner}/{repo}/comments/{comment_id}/reactions",
      query: [{"content", :content}, {"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List reactions for an issue\n\nPath: /repos/{owner}/{repo}/issues/{issue_number}/reactions\n\nMethod: get"
  @spec list_for_issue(GitHubEx.Client.t()) :: result
  @spec list_for_issue(GitHubEx.Client.t(), map()) :: result
  def list_for_issue(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Reactions, :list_for_issue},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/reactions",
      query: [{"content", :content}, {"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List reactions for an issue comment\n\nPath: /repos/{owner}/{repo}/issues/comments/{comment_id}/reactions\n\nMethod: get"
  @spec list_for_issue_comment(GitHubEx.Client.t()) :: result
  @spec list_for_issue_comment(GitHubEx.Client.t(), map()) :: result
  def list_for_issue_comment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Reactions, :list_for_issue_comment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
      path_template: "/repos/{owner}/{repo}/issues/comments/{comment_id}/reactions",
      query: [{"content", :content}, {"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List reactions for a pull request review comment\n\nPath: /repos/{owner}/{repo}/pulls/comments/{comment_id}/reactions\n\nMethod: get"
  @spec list_for_pull_request_review_comment(GitHubEx.Client.t()) :: result
  @spec list_for_pull_request_review_comment(GitHubEx.Client.t(), map()) :: result
  def list_for_pull_request_review_comment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Reactions, :list_for_pull_request_review_comment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
      path_template: "/repos/{owner}/{repo}/pulls/comments/{comment_id}/reactions",
      query: [{"content", :content}, {"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List reactions for a release\n\nPath: /repos/{owner}/{repo}/releases/{release_id}/reactions\n\nMethod: get"
  @spec list_for_release(GitHubEx.Client.t()) :: result
  @spec list_for_release(GitHubEx.Client.t(), map()) :: result
  def list_for_release(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Reactions, :list_for_release},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"release_id", :release_id}],
      path_template: "/repos/{owner}/{repo}/releases/{release_id}/reactions",
      query: [{"content", :content}, {"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end
end

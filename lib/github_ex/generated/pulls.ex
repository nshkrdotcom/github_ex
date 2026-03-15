defmodule GitHubEx.Pulls do
  @moduledoc """
  Generated GitHub REST operations for the `Pulls` namespace.

  ## Operations

  * `pulls/create`
  * `pulls/list`
  * `pulls/list-review-comments-for-repo`
  * `pulls/delete-review-comment`
  * `pulls/get-review-comment`
  * `pulls/update-review-comment`
  * `pulls/get`
  * `pulls/update`
  * `pulls/create-review-comment`
  * `pulls/list-review-comments`
  * `pulls/create-reply-for-review-comment`
  * `pulls/list-commits`
  * `pulls/list-files`
  * `pulls/check-if-merged`
  * `pulls/merge`
  * `pulls/list-requested-reviewers`
  * `pulls/remove-requested-reviewers`
  * `pulls/request-reviewers`
  * `pulls/create-review`
  * `pulls/list-reviews`
  * `pulls/delete-pending-review`
  * `pulls/get-review`
  * `pulls/update-review`
  * `pulls/list-comments-for-review`
  * `pulls/dismiss-review`
  * `pulls/submit-review`
  * `pulls/update-branch`
  """

  @type result :: {:ok, term()} | {:error, GitHubEx.Error.t()}

  @doc "Check if a pull request has been merged\n\nPath: /repos/{owner}/{repo}/pulls/{pull_number}/merge\n\nMethod: get"
  @spec check_if_merged(GitHubEx.Client.t()) :: result
  @spec check_if_merged(GitHubEx.Client.t(), map()) :: result
  def check_if_merged(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Pulls, :check_if_merged},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"pull_number", :pull_number}],
      path_template: "/repos/{owner}/{repo}/pulls/{pull_number}/merge",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Create a pull request\n\nPath: /repos/{owner}/{repo}/pulls\n\nMethod: post"
  @spec create(GitHubEx.Client.t()) :: result
  @spec create(GitHubEx.Client.t(), map()) :: result
  def create(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Pulls, :create},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/pulls",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a reply for a review comment\n\nPath: /repos/{owner}/{repo}/pulls/{pull_number}/comments/{comment_id}/replies\n\nMethod: post"
  @spec create_reply_for_review_comment(GitHubEx.Client.t()) :: result
  @spec create_reply_for_review_comment(GitHubEx.Client.t(), map()) :: result
  def create_reply_for_review_comment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Pulls, :create_reply_for_review_comment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"pull_number", :pull_number},
        {"comment_id", :comment_id}
      ],
      path_template: "/repos/{owner}/{repo}/pulls/{pull_number}/comments/{comment_id}/replies",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a review for a pull request\n\nPath: /repos/{owner}/{repo}/pulls/{pull_number}/reviews\n\nMethod: post"
  @spec create_review(GitHubEx.Client.t()) :: result
  @spec create_review(GitHubEx.Client.t(), map()) :: result
  def create_review(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Pulls, :create_review},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"pull_number", :pull_number}],
      path_template: "/repos/{owner}/{repo}/pulls/{pull_number}/reviews",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a review comment for a pull request\n\nPath: /repos/{owner}/{repo}/pulls/{pull_number}/comments\n\nMethod: post"
  @spec create_review_comment(GitHubEx.Client.t()) :: result
  @spec create_review_comment(GitHubEx.Client.t(), map()) :: result
  def create_review_comment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Pulls, :create_review_comment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"pull_number", :pull_number}],
      path_template: "/repos/{owner}/{repo}/pulls/{pull_number}/comments",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Delete a pending review for a pull request\n\nPath: /repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}\n\nMethod: delete"
  @spec delete_pending_review(GitHubEx.Client.t()) :: result
  @spec delete_pending_review(GitHubEx.Client.t(), map()) :: result
  def delete_pending_review(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Pulls, :delete_pending_review},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"pull_number", :pull_number},
        {"review_id", :review_id}
      ],
      path_template: "/repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a review comment for a pull request\n\nPath: /repos/{owner}/{repo}/pulls/comments/{comment_id}\n\nMethod: delete"
  @spec delete_review_comment(GitHubEx.Client.t()) :: result
  @spec delete_review_comment(GitHubEx.Client.t(), map()) :: result
  def delete_review_comment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Pulls, :delete_review_comment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
      path_template: "/repos/{owner}/{repo}/pulls/comments/{comment_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Dismiss a review for a pull request\n\nPath: /repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}/dismissals\n\nMethod: put"
  @spec dismiss_review(GitHubEx.Client.t()) :: result
  @spec dismiss_review(GitHubEx.Client.t(), map()) :: result
  def dismiss_review(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Pulls, :dismiss_review},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"pull_number", :pull_number},
        {"review_id", :review_id}
      ],
      path_template: "/repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}/dismissals",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Get a pull request\n\nPath: /repos/{owner}/{repo}/pulls/{pull_number}\n\nMethod: get"
  @spec get(GitHubEx.Client.t()) :: result
  @spec get(GitHubEx.Client.t(), map()) :: result
  def get(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Pulls, :get},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"pull_number", :pull_number}],
      path_template: "/repos/{owner}/{repo}/pulls/{pull_number}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a review for a pull request\n\nPath: /repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}\n\nMethod: get"
  @spec get_review(GitHubEx.Client.t()) :: result
  @spec get_review(GitHubEx.Client.t(), map()) :: result
  def get_review(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Pulls, :get_review},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"pull_number", :pull_number},
        {"review_id", :review_id}
      ],
      path_template: "/repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a review comment for a pull request\n\nPath: /repos/{owner}/{repo}/pulls/comments/{comment_id}\n\nMethod: get"
  @spec get_review_comment(GitHubEx.Client.t()) :: result
  @spec get_review_comment(GitHubEx.Client.t(), map()) :: result
  def get_review_comment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Pulls, :get_review_comment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
      path_template: "/repos/{owner}/{repo}/pulls/comments/{comment_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List pull requests\n\nPath: /repos/{owner}/{repo}/pulls\n\nMethod: get"
  @spec list(GitHubEx.Client.t()) :: result
  @spec list(GitHubEx.Client.t(), map()) :: result
  def list(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Pulls, :list},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/pulls",
      query: [
        {"state", :state},
        {"head", :head},
        {"base", :base},
        {"sort", :sort},
        {"direction", :direction},
        {"per_page", :per_page},
        {"page", :page}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List comments for a pull request review\n\nPath: /repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}/comments\n\nMethod: get"
  @spec list_comments_for_review(GitHubEx.Client.t()) :: result
  @spec list_comments_for_review(GitHubEx.Client.t(), map()) :: result
  def list_comments_for_review(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Pulls, :list_comments_for_review},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"pull_number", :pull_number},
        {"review_id", :review_id}
      ],
      path_template: "/repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}/comments",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List commits on a pull request\n\nPath: /repos/{owner}/{repo}/pulls/{pull_number}/commits\n\nMethod: get"
  @spec list_commits(GitHubEx.Client.t()) :: result
  @spec list_commits(GitHubEx.Client.t(), map()) :: result
  def list_commits(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Pulls, :list_commits},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"pull_number", :pull_number}],
      path_template: "/repos/{owner}/{repo}/pulls/{pull_number}/commits",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List pull requests files\n\nPath: /repos/{owner}/{repo}/pulls/{pull_number}/files\n\nMethod: get"
  @spec list_files(GitHubEx.Client.t()) :: result
  @spec list_files(GitHubEx.Client.t(), map()) :: result
  def list_files(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Pulls, :list_files},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"pull_number", :pull_number}],
      path_template: "/repos/{owner}/{repo}/pulls/{pull_number}/files",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get all requested reviewers for a pull request\n\nPath: /repos/{owner}/{repo}/pulls/{pull_number}/requested_reviewers\n\nMethod: get"
  @spec list_requested_reviewers(GitHubEx.Client.t()) :: result
  @spec list_requested_reviewers(GitHubEx.Client.t(), map()) :: result
  def list_requested_reviewers(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Pulls, :list_requested_reviewers},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"pull_number", :pull_number}],
      path_template: "/repos/{owner}/{repo}/pulls/{pull_number}/requested_reviewers",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List review comments on a pull request\n\nPath: /repos/{owner}/{repo}/pulls/{pull_number}/comments\n\nMethod: get"
  @spec list_review_comments(GitHubEx.Client.t()) :: result
  @spec list_review_comments(GitHubEx.Client.t(), map()) :: result
  def list_review_comments(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Pulls, :list_review_comments},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"pull_number", :pull_number}],
      path_template: "/repos/{owner}/{repo}/pulls/{pull_number}/comments",
      query: [
        {"sort", :sort},
        {"direction", :direction},
        {"since", :since},
        {"per_page", :per_page},
        {"page", :page}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List review comments in a repository\n\nPath: /repos/{owner}/{repo}/pulls/comments\n\nMethod: get"
  @spec list_review_comments_for_repo(GitHubEx.Client.t()) :: result
  @spec list_review_comments_for_repo(GitHubEx.Client.t(), map()) :: result
  def list_review_comments_for_repo(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Pulls, :list_review_comments_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/pulls/comments",
      query: [
        {"sort", :sort},
        {"direction", :direction},
        {"since", :since},
        {"per_page", :per_page},
        {"page", :page}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List reviews for a pull request\n\nPath: /repos/{owner}/{repo}/pulls/{pull_number}/reviews\n\nMethod: get"
  @spec list_reviews(GitHubEx.Client.t()) :: result
  @spec list_reviews(GitHubEx.Client.t(), map()) :: result
  def list_reviews(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Pulls, :list_reviews},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"pull_number", :pull_number}],
      path_template: "/repos/{owner}/{repo}/pulls/{pull_number}/reviews",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Merge a pull request\n\nPath: /repos/{owner}/{repo}/pulls/{pull_number}/merge\n\nMethod: put"
  @spec merge(GitHubEx.Client.t()) :: result
  @spec merge(GitHubEx.Client.t(), map()) :: result
  def merge(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Pulls, :merge},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}, {"pull_number", :pull_number}],
      path_template: "/repos/{owner}/{repo}/pulls/{pull_number}/merge",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Remove requested reviewers from a pull request\n\nPath: /repos/{owner}/{repo}/pulls/{pull_number}/requested_reviewers\n\nMethod: delete"
  @spec remove_requested_reviewers(GitHubEx.Client.t()) :: result
  @spec remove_requested_reviewers(GitHubEx.Client.t(), map()) :: result
  def remove_requested_reviewers(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Pulls, :remove_requested_reviewers},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"pull_number", :pull_number}],
      path_template: "/repos/{owner}/{repo}/pulls/{pull_number}/requested_reviewers",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Request reviewers for a pull request\n\nPath: /repos/{owner}/{repo}/pulls/{pull_number}/requested_reviewers\n\nMethod: post"
  @spec request_reviewers(GitHubEx.Client.t()) :: result
  @spec request_reviewers(GitHubEx.Client.t(), map()) :: result
  def request_reviewers(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Pulls, :request_reviewers},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"pull_number", :pull_number}],
      path_template: "/repos/{owner}/{repo}/pulls/{pull_number}/requested_reviewers",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Submit a review for a pull request\n\nPath: /repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}/events\n\nMethod: post"
  @spec submit_review(GitHubEx.Client.t()) :: result
  @spec submit_review(GitHubEx.Client.t(), map()) :: result
  def submit_review(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Pulls, :submit_review},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"pull_number", :pull_number},
        {"review_id", :review_id}
      ],
      path_template: "/repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}/events",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update a pull request\n\nPath: /repos/{owner}/{repo}/pulls/{pull_number}\n\nMethod: patch"
  @spec update(GitHubEx.Client.t()) :: result
  @spec update(GitHubEx.Client.t(), map()) :: result
  def update(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Pulls, :update},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"owner", :owner}, {"repo", :repo}, {"pull_number", :pull_number}],
      path_template: "/repos/{owner}/{repo}/pulls/{pull_number}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update a pull request branch\n\nPath: /repos/{owner}/{repo}/pulls/{pull_number}/update-branch\n\nMethod: put"
  @spec update_branch(GitHubEx.Client.t()) :: result
  @spec update_branch(GitHubEx.Client.t(), map()) :: result
  def update_branch(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Pulls, :update_branch},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}, {"pull_number", :pull_number}],
      path_template: "/repos/{owner}/{repo}/pulls/{pull_number}/update-branch",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update a review for a pull request\n\nPath: /repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}\n\nMethod: put"
  @spec update_review(GitHubEx.Client.t()) :: result
  @spec update_review(GitHubEx.Client.t(), map()) :: result
  def update_review(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Pulls, :update_review},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"pull_number", :pull_number},
        {"review_id", :review_id}
      ],
      path_template: "/repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update a review comment for a pull request\n\nPath: /repos/{owner}/{repo}/pulls/comments/{comment_id}\n\nMethod: patch"
  @spec update_review_comment(GitHubEx.Client.t()) :: result
  @spec update_review_comment(GitHubEx.Client.t(), map()) :: result
  def update_review_comment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Pulls, :update_review_comment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
      path_template: "/repos/{owner}/{repo}/pulls/comments/{comment_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

defmodule GitHubEx.Issues do
  @moduledoc """
  Generated GitHub REST operations for the `Issues` namespace.

  ## Operations

  * `issues/list`
  * `issues/list-for-org`
  * `issues/list-assignees`
  * `issues/check-user-can-be-assigned`
  * `issues/create`
  * `issues/list-for-repo`
  * `issues/list-comments-for-repo`
  * `issues/delete-comment`
  * `issues/get-comment`
  * `issues/update-comment`
  * `issues/pin-comment`
  * `issues/unpin-comment`
  * `issues/list-events-for-repo`
  * `issues/get-event`
  * `issues/get`
  * `issues/update`
  * `issues/add-assignees`
  * `issues/remove-assignees`
  * `issues/check-user-can-be-assigned-to-issue`
  * `issues/create-comment`
  * `issues/list-comments`
  * `issues/add-blocked-by-dependency`
  * `issues/list-dependencies-blocked-by`
  * `issues/remove-dependency-blocked-by`
  * `issues/list-dependencies-blocking`
  * `issues/list-events`
  * `issues/list-issue-field-values-for-issue`
  * `issues/add-labels`
  * `issues/list-labels-on-issue`
  * `issues/remove-all-labels`
  * `issues/set-labels`
  * `issues/remove-label`
  * `issues/lock`
  * `issues/unlock`
  * `issues/get-parent`
  * `issues/remove-sub-issue`
  * `issues/add-sub-issue`
  * `issues/list-sub-issues`
  * `issues/reprioritize-sub-issue`
  * `issues/list-events-for-timeline`
  * `issues/create-label`
  * `issues/list-labels-for-repo`
  * `issues/delete-label`
  * `issues/get-label`
  * `issues/update-label`
  * `issues/create-milestone`
  * `issues/list-milestones`
  * `issues/delete-milestone`
  * `issues/get-milestone`
  * `issues/update-milestone`
  * `issues/list-labels-for-milestone`
  * `issues/add-issue-field-values`
  * `issues/set-issue-field-values`
  * `issues/delete-issue-field-value`
  * `issues/list-for-authenticated-user`
  """

  @type result :: {:ok, term()} | {:error, GitHubEx.Error.t()}

  @doc "Add assignees to an issue\n\nPath: /repos/{owner}/{repo}/issues/{issue_number}/assignees\n\nMethod: post"
  @spec add_assignees(GitHubEx.Client.t()) :: result
  @spec add_assignees(GitHubEx.Client.t(), map()) :: result
  def add_assignees(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Issues, :add_assignees},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/assignees",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Add a dependency an issue is blocked by\n\nPath: /repos/{owner}/{repo}/issues/{issue_number}/dependencies/blocked_by\n\nMethod: post"
  @spec add_blocked_by_dependency(GitHubEx.Client.t()) :: result
  @spec add_blocked_by_dependency(GitHubEx.Client.t(), map()) :: result
  def add_blocked_by_dependency(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Issues, :add_blocked_by_dependency},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/dependencies/blocked_by",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Add issue field values to an issue\n\nPath: /repositories/{repository_id}/issues/{issue_number}/issue-field-values\n\nMethod: post"
  @spec add_issue_field_values(GitHubEx.Client.t()) :: result
  @spec add_issue_field_values(GitHubEx.Client.t(), map()) :: result
  def add_issue_field_values(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Issues, :add_issue_field_values},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"repository_id", :repository_id}, {"issue_number", :issue_number}],
      path_template: "/repositories/{repository_id}/issues/{issue_number}/issue-field-values",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Add labels to an issue\n\nPath: /repos/{owner}/{repo}/issues/{issue_number}/labels\n\nMethod: post"
  @spec add_labels(GitHubEx.Client.t()) :: result
  @spec add_labels(GitHubEx.Client.t(), map()) :: result
  def add_labels(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Issues, :add_labels},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/labels",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Add sub-issue\n\nPath: /repos/{owner}/{repo}/issues/{issue_number}/sub_issues\n\nMethod: post"
  @spec add_sub_issue(GitHubEx.Client.t()) :: result
  @spec add_sub_issue(GitHubEx.Client.t(), map()) :: result
  def add_sub_issue(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Issues, :add_sub_issue},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/sub_issues",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Check if a user can be assigned\n\nPath: /repos/{owner}/{repo}/assignees/{assignee}\n\nMethod: get"
  @spec check_user_can_be_assigned(GitHubEx.Client.t()) :: result
  @spec check_user_can_be_assigned(GitHubEx.Client.t(), map()) :: result
  def check_user_can_be_assigned(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :check_user_can_be_assigned},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"assignee", :assignee}],
      path_template: "/repos/{owner}/{repo}/assignees/{assignee}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Check if a user can be assigned to a issue\n\nPath: /repos/{owner}/{repo}/issues/{issue_number}/assignees/{assignee}\n\nMethod: get"
  @spec check_user_can_be_assigned_to_issue(GitHubEx.Client.t()) :: result
  @spec check_user_can_be_assigned_to_issue(GitHubEx.Client.t(), map()) :: result
  def check_user_can_be_assigned_to_issue(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :check_user_can_be_assigned_to_issue},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"issue_number", :issue_number},
        {"assignee", :assignee}
      ],
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/assignees/{assignee}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Create an issue\n\nPath: /repos/{owner}/{repo}/issues\n\nMethod: post"
  @spec create(GitHubEx.Client.t()) :: result
  @spec create(GitHubEx.Client.t(), map()) :: result
  def create(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Issues, :create},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/issues",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create an issue comment\n\nPath: /repos/{owner}/{repo}/issues/{issue_number}/comments\n\nMethod: post"
  @spec create_comment(GitHubEx.Client.t()) :: result
  @spec create_comment(GitHubEx.Client.t(), map()) :: result
  def create_comment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Issues, :create_comment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/comments",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a label\n\nPath: /repos/{owner}/{repo}/labels\n\nMethod: post"
  @spec create_label(GitHubEx.Client.t()) :: result
  @spec create_label(GitHubEx.Client.t(), map()) :: result
  def create_label(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Issues, :create_label},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/labels",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a milestone\n\nPath: /repos/{owner}/{repo}/milestones\n\nMethod: post"
  @spec create_milestone(GitHubEx.Client.t()) :: result
  @spec create_milestone(GitHubEx.Client.t(), map()) :: result
  def create_milestone(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Issues, :create_milestone},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/milestones",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Delete an issue comment\n\nPath: /repos/{owner}/{repo}/issues/comments/{comment_id}\n\nMethod: delete"
  @spec delete_comment(GitHubEx.Client.t()) :: result
  @spec delete_comment(GitHubEx.Client.t(), map()) :: result
  def delete_comment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :delete_comment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
      path_template: "/repos/{owner}/{repo}/issues/comments/{comment_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete an issue field value from an issue\n\nPath: /repositories/{repository_id}/issues/{issue_number}/issue-field-values/{issue_field_id}\n\nMethod: delete"
  @spec delete_issue_field_value(GitHubEx.Client.t()) :: result
  @spec delete_issue_field_value(GitHubEx.Client.t(), map()) :: result
  def delete_issue_field_value(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :delete_issue_field_value},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [
        {"repository_id", :repository_id},
        {"issue_number", :issue_number},
        {"issue_field_id", :issue_field_id}
      ],
      path_template:
        "/repositories/{repository_id}/issues/{issue_number}/issue-field-values/{issue_field_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a label\n\nPath: /repos/{owner}/{repo}/labels/{name}\n\nMethod: delete"
  @spec delete_label(GitHubEx.Client.t()) :: result
  @spec delete_label(GitHubEx.Client.t(), map()) :: result
  def delete_label(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :delete_label},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"name", :name}],
      path_template: "/repos/{owner}/{repo}/labels/{name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a milestone\n\nPath: /repos/{owner}/{repo}/milestones/{milestone_number}\n\nMethod: delete"
  @spec delete_milestone(GitHubEx.Client.t()) :: result
  @spec delete_milestone(GitHubEx.Client.t(), map()) :: result
  def delete_milestone(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :delete_milestone},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"milestone_number", :milestone_number}],
      path_template: "/repos/{owner}/{repo}/milestones/{milestone_number}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Get an issue\n\nPath: /repos/{owner}/{repo}/issues/{issue_number}\n\nMethod: get"
  @spec get(GitHubEx.Client.t()) :: result
  @spec get(GitHubEx.Client.t(), map()) :: result
  def get(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :get},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get an issue comment\n\nPath: /repos/{owner}/{repo}/issues/comments/{comment_id}\n\nMethod: get"
  @spec get_comment(GitHubEx.Client.t()) :: result
  @spec get_comment(GitHubEx.Client.t(), map()) :: result
  def get_comment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :get_comment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
      path_template: "/repos/{owner}/{repo}/issues/comments/{comment_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get an issue event\n\nPath: /repos/{owner}/{repo}/issues/events/{event_id}\n\nMethod: get"
  @spec get_event(GitHubEx.Client.t()) :: result
  @spec get_event(GitHubEx.Client.t(), map()) :: result
  def get_event(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :get_event},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"event_id", :event_id}],
      path_template: "/repos/{owner}/{repo}/issues/events/{event_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a label\n\nPath: /repos/{owner}/{repo}/labels/{name}\n\nMethod: get"
  @spec get_label(GitHubEx.Client.t()) :: result
  @spec get_label(GitHubEx.Client.t(), map()) :: result
  def get_label(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :get_label},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"name", :name}],
      path_template: "/repos/{owner}/{repo}/labels/{name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a milestone\n\nPath: /repos/{owner}/{repo}/milestones/{milestone_number}\n\nMethod: get"
  @spec get_milestone(GitHubEx.Client.t()) :: result
  @spec get_milestone(GitHubEx.Client.t(), map()) :: result
  def get_milestone(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :get_milestone},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"milestone_number", :milestone_number}],
      path_template: "/repos/{owner}/{repo}/milestones/{milestone_number}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get parent issue\n\nPath: /repos/{owner}/{repo}/issues/{issue_number}/parent\n\nMethod: get"
  @spec get_parent(GitHubEx.Client.t()) :: result
  @spec get_parent(GitHubEx.Client.t(), map()) :: result
  def get_parent(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :get_parent},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/parent",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List issues assigned to the authenticated user\n\nPath: /issues\n\nMethod: get"
  @spec list(GitHubEx.Client.t()) :: result
  @spec list(GitHubEx.Client.t(), map()) :: result
  def list(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :list},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/issues",
      query: [
        {"filter", :filter},
        {"state", :state},
        {"labels", :labels},
        {"sort", :sort},
        {"direction", :direction},
        {"since", :since},
        {"collab", :collab},
        {"orgs", :orgs},
        {"owned", :owned},
        {"pulls", :pulls},
        {"per_page", :per_page},
        {"page", :page}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List assignees\n\nPath: /repos/{owner}/{repo}/assignees\n\nMethod: get"
  @spec list_assignees(GitHubEx.Client.t()) :: result
  @spec list_assignees(GitHubEx.Client.t(), map()) :: result
  def list_assignees(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :list_assignees},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/assignees",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List issue comments\n\nPath: /repos/{owner}/{repo}/issues/{issue_number}/comments\n\nMethod: get"
  @spec list_comments(GitHubEx.Client.t()) :: result
  @spec list_comments(GitHubEx.Client.t(), map()) :: result
  def list_comments(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :list_comments},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/comments",
      query: [{"since", :since}, {"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List issue comments for a repository\n\nPath: /repos/{owner}/{repo}/issues/comments\n\nMethod: get"
  @spec list_comments_for_repo(GitHubEx.Client.t()) :: result
  @spec list_comments_for_repo(GitHubEx.Client.t(), map()) :: result
  def list_comments_for_repo(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :list_comments_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/issues/comments",
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

  @doc "List dependencies an issue is blocked by\n\nPath: /repos/{owner}/{repo}/issues/{issue_number}/dependencies/blocked_by\n\nMethod: get"
  @spec list_dependencies_blocked_by(GitHubEx.Client.t()) :: result
  @spec list_dependencies_blocked_by(GitHubEx.Client.t(), map()) :: result
  def list_dependencies_blocked_by(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :list_dependencies_blocked_by},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/dependencies/blocked_by",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List dependencies an issue is blocking\n\nPath: /repos/{owner}/{repo}/issues/{issue_number}/dependencies/blocking\n\nMethod: get"
  @spec list_dependencies_blocking(GitHubEx.Client.t()) :: result
  @spec list_dependencies_blocking(GitHubEx.Client.t(), map()) :: result
  def list_dependencies_blocking(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :list_dependencies_blocking},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/dependencies/blocking",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List issue events\n\nPath: /repos/{owner}/{repo}/issues/{issue_number}/events\n\nMethod: get"
  @spec list_events(GitHubEx.Client.t()) :: result
  @spec list_events(GitHubEx.Client.t(), map()) :: result
  def list_events(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :list_events},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/events",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List issue events for a repository\n\nPath: /repos/{owner}/{repo}/issues/events\n\nMethod: get"
  @spec list_events_for_repo(GitHubEx.Client.t()) :: result
  @spec list_events_for_repo(GitHubEx.Client.t(), map()) :: result
  def list_events_for_repo(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :list_events_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/issues/events",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List timeline events for an issue\n\nPath: /repos/{owner}/{repo}/issues/{issue_number}/timeline\n\nMethod: get"
  @spec list_events_for_timeline(GitHubEx.Client.t()) :: result
  @spec list_events_for_timeline(GitHubEx.Client.t(), map()) :: result
  def list_events_for_timeline(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :list_events_for_timeline},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/timeline",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List user account issues assigned to the authenticated user\n\nPath: /user/issues\n\nMethod: get"
  @spec list_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec list_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def list_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :list_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/user/issues",
      query: [
        {"filter", :filter},
        {"state", :state},
        {"labels", :labels},
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

  @doc "List organization issues assigned to the authenticated user\n\nPath: /orgs/{org}/issues\n\nMethod: get"
  @spec list_for_org(GitHubEx.Client.t()) :: result
  @spec list_for_org(GitHubEx.Client.t(), map()) :: result
  def list_for_org(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :list_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/issues",
      query: [
        {"filter", :filter},
        {"state", :state},
        {"labels", :labels},
        {"type", :type},
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

  @doc "List repository issues\n\nPath: /repos/{owner}/{repo}/issues\n\nMethod: get"
  @spec list_for_repo(GitHubEx.Client.t()) :: result
  @spec list_for_repo(GitHubEx.Client.t(), map()) :: result
  def list_for_repo(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :list_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/issues",
      query: [
        {"milestone", :milestone},
        {"state", :state},
        {"assignee", :assignee},
        {"type", :type},
        {"creator", :creator},
        {"mentioned", :mentioned},
        {"labels", :labels},
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

  @doc "List issue field values for an issue\n\nPath: /repos/{owner}/{repo}/issues/{issue_number}/issue-field-values\n\nMethod: get"
  @spec list_issue_field_values_for_issue(GitHubEx.Client.t()) :: result
  @spec list_issue_field_values_for_issue(GitHubEx.Client.t(), map()) :: result
  def list_issue_field_values_for_issue(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :list_issue_field_values_for_issue},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/issue-field-values",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List labels for issues in a milestone\n\nPath: /repos/{owner}/{repo}/milestones/{milestone_number}/labels\n\nMethod: get"
  @spec list_labels_for_milestone(GitHubEx.Client.t()) :: result
  @spec list_labels_for_milestone(GitHubEx.Client.t(), map()) :: result
  def list_labels_for_milestone(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :list_labels_for_milestone},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"milestone_number", :milestone_number}],
      path_template: "/repos/{owner}/{repo}/milestones/{milestone_number}/labels",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List labels for a repository\n\nPath: /repos/{owner}/{repo}/labels\n\nMethod: get"
  @spec list_labels_for_repo(GitHubEx.Client.t()) :: result
  @spec list_labels_for_repo(GitHubEx.Client.t(), map()) :: result
  def list_labels_for_repo(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :list_labels_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/labels",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List labels for an issue\n\nPath: /repos/{owner}/{repo}/issues/{issue_number}/labels\n\nMethod: get"
  @spec list_labels_on_issue(GitHubEx.Client.t()) :: result
  @spec list_labels_on_issue(GitHubEx.Client.t(), map()) :: result
  def list_labels_on_issue(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :list_labels_on_issue},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/labels",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List milestones\n\nPath: /repos/{owner}/{repo}/milestones\n\nMethod: get"
  @spec list_milestones(GitHubEx.Client.t()) :: result
  @spec list_milestones(GitHubEx.Client.t(), map()) :: result
  def list_milestones(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :list_milestones},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/milestones",
      query: [
        {"state", :state},
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

  @doc "List sub-issues\n\nPath: /repos/{owner}/{repo}/issues/{issue_number}/sub_issues\n\nMethod: get"
  @spec list_sub_issues(GitHubEx.Client.t()) :: result
  @spec list_sub_issues(GitHubEx.Client.t(), map()) :: result
  def list_sub_issues(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :list_sub_issues},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/sub_issues",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Lock an issue\n\nPath: /repos/{owner}/{repo}/issues/{issue_number}/lock\n\nMethod: put"
  @spec lock(GitHubEx.Client.t()) :: result
  @spec lock(GitHubEx.Client.t(), map()) :: result
  def lock(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Issues, :lock},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/lock",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Pin an issue comment\n\nPath: /repos/{owner}/{repo}/issues/comments/{comment_id}/pin\n\nMethod: put"
  @spec pin_comment(GitHubEx.Client.t()) :: result
  @spec pin_comment(GitHubEx.Client.t(), map()) :: result
  def pin_comment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :pin_comment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
      path_template: "/repos/{owner}/{repo}/issues/comments/{comment_id}/pin",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Remove all labels from an issue\n\nPath: /repos/{owner}/{repo}/issues/{issue_number}/labels\n\nMethod: delete"
  @spec remove_all_labels(GitHubEx.Client.t()) :: result
  @spec remove_all_labels(GitHubEx.Client.t(), map()) :: result
  def remove_all_labels(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :remove_all_labels},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/labels",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove assignees from an issue\n\nPath: /repos/{owner}/{repo}/issues/{issue_number}/assignees\n\nMethod: delete"
  @spec remove_assignees(GitHubEx.Client.t()) :: result
  @spec remove_assignees(GitHubEx.Client.t(), map()) :: result
  def remove_assignees(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Issues, :remove_assignees},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/assignees",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove dependency an issue is blocked by\n\nPath: /repos/{owner}/{repo}/issues/{issue_number}/dependencies/blocked_by/{issue_id}\n\nMethod: delete"
  @spec remove_dependency_blocked_by(GitHubEx.Client.t()) :: result
  @spec remove_dependency_blocked_by(GitHubEx.Client.t(), map()) :: result
  def remove_dependency_blocked_by(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :remove_dependency_blocked_by},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"issue_number", :issue_number},
        {"issue_id", :issue_id}
      ],
      path_template:
        "/repos/{owner}/{repo}/issues/{issue_number}/dependencies/blocked_by/{issue_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove a label from an issue\n\nPath: /repos/{owner}/{repo}/issues/{issue_number}/labels/{name}\n\nMethod: delete"
  @spec remove_label(GitHubEx.Client.t()) :: result
  @spec remove_label(GitHubEx.Client.t(), map()) :: result
  def remove_label(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :remove_label},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}, {"name", :name}],
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/labels/{name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove sub-issue\n\nPath: /repos/{owner}/{repo}/issues/{issue_number}/sub_issue\n\nMethod: delete"
  @spec remove_sub_issue(GitHubEx.Client.t()) :: result
  @spec remove_sub_issue(GitHubEx.Client.t(), map()) :: result
  def remove_sub_issue(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Issues, :remove_sub_issue},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/sub_issue",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Reprioritize sub-issue\n\nPath: /repos/{owner}/{repo}/issues/{issue_number}/sub_issues/priority\n\nMethod: patch"
  @spec reprioritize_sub_issue(GitHubEx.Client.t()) :: result
  @spec reprioritize_sub_issue(GitHubEx.Client.t(), map()) :: result
  def reprioritize_sub_issue(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Issues, :reprioritize_sub_issue},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/sub_issues/priority",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set issue field values for an issue\n\nPath: /repositories/{repository_id}/issues/{issue_number}/issue-field-values\n\nMethod: put"
  @spec set_issue_field_values(GitHubEx.Client.t()) :: result
  @spec set_issue_field_values(GitHubEx.Client.t(), map()) :: result
  def set_issue_field_values(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Issues, :set_issue_field_values},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"repository_id", :repository_id}, {"issue_number", :issue_number}],
      path_template: "/repositories/{repository_id}/issues/{issue_number}/issue-field-values",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set labels for an issue\n\nPath: /repos/{owner}/{repo}/issues/{issue_number}/labels\n\nMethod: put"
  @spec set_labels(GitHubEx.Client.t()) :: result
  @spec set_labels(GitHubEx.Client.t(), map()) :: result
  def set_labels(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Issues, :set_labels},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/labels",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Unlock an issue\n\nPath: /repos/{owner}/{repo}/issues/{issue_number}/lock\n\nMethod: delete"
  @spec unlock(GitHubEx.Client.t()) :: result
  @spec unlock(GitHubEx.Client.t(), map()) :: result
  def unlock(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :unlock},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}/lock",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Unpin an issue comment\n\nPath: /repos/{owner}/{repo}/issues/comments/{comment_id}/pin\n\nMethod: delete"
  @spec unpin_comment(GitHubEx.Client.t()) :: result
  @spec unpin_comment(GitHubEx.Client.t(), map()) :: result
  def unpin_comment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Issues, :unpin_comment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
      path_template: "/repos/{owner}/{repo}/issues/comments/{comment_id}/pin",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Update an issue\n\nPath: /repos/{owner}/{repo}/issues/{issue_number}\n\nMethod: patch"
  @spec update(GitHubEx.Client.t()) :: result
  @spec update(GitHubEx.Client.t(), map()) :: result
  def update(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Issues, :update},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"owner", :owner}, {"repo", :repo}, {"issue_number", :issue_number}],
      path_template: "/repos/{owner}/{repo}/issues/{issue_number}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update an issue comment\n\nPath: /repos/{owner}/{repo}/issues/comments/{comment_id}\n\nMethod: patch"
  @spec update_comment(GitHubEx.Client.t()) :: result
  @spec update_comment(GitHubEx.Client.t(), map()) :: result
  def update_comment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Issues, :update_comment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
      path_template: "/repos/{owner}/{repo}/issues/comments/{comment_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update a label\n\nPath: /repos/{owner}/{repo}/labels/{name}\n\nMethod: patch"
  @spec update_label(GitHubEx.Client.t()) :: result
  @spec update_label(GitHubEx.Client.t(), map()) :: result
  def update_label(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Issues, :update_label},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"owner", :owner}, {"repo", :repo}, {"name", :name}],
      path_template: "/repos/{owner}/{repo}/labels/{name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update a milestone\n\nPath: /repos/{owner}/{repo}/milestones/{milestone_number}\n\nMethod: patch"
  @spec update_milestone(GitHubEx.Client.t()) :: result
  @spec update_milestone(GitHubEx.Client.t(), map()) :: result
  def update_milestone(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Issues, :update_milestone},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"owner", :owner}, {"repo", :repo}, {"milestone_number", :milestone_number}],
      path_template: "/repos/{owner}/{repo}/milestones/{milestone_number}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

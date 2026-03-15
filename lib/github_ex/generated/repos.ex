defmodule GitHubEx.Repos do
  @moduledoc """
  Generated GitHub REST operations for the `Repos` namespace.

  ## Operations

  * `repos/create-in-org`
  * `repos/list-for-org`
  * `repos/create-org-ruleset`
  * `repos/get-org-rulesets`
  * `repos/get-org-rule-suites`
  * `repos/get-org-rule-suite`
  * `repos/delete-org-ruleset`
  * `repos/get-org-ruleset`
  * `repos/update-org-ruleset`
  * `repos/delete`
  * `repos/get`
  * `repos/update`
  * `repos/list-activities`
  * `repos/create-attestation`
  * `repos/list-attestations`
  * `repos/create-autolink`
  * `repos/list-autolinks`
  * `repos/delete-autolink`
  * `repos/get-autolink`
  * `repos/check-automated-security-fixes`
  * `repos/disable-automated-security-fixes`
  * `repos/enable-automated-security-fixes`
  * `repos/list-branches`
  * `repos/get-branch`
  * `repos/delete-branch-protection`
  * `repos/get-branch-protection`
  * `repos/update-branch-protection`
  * `repos/delete-admin-branch-protection`
  * `repos/get-admin-branch-protection`
  * `repos/set-admin-branch-protection`
  * `repos/delete-pull-request-review-protection`
  * `repos/get-pull-request-review-protection`
  * `repos/update-pull-request-review-protection`
  * `repos/create-commit-signature-protection`
  * `repos/delete-commit-signature-protection`
  * `repos/get-commit-signature-protection`
  * `repos/get-status-checks-protection`
  * `repos/remove-status-check-protection`
  * `repos/update-status-check-protection`
  * `repos/add-status-check-contexts`
  * `repos/get-all-status-check-contexts`
  * `repos/remove-status-check-contexts`
  * `repos/set-status-check-contexts`
  * `repos/delete-access-restrictions`
  * `repos/get-access-restrictions`
  * `repos/add-app-access-restrictions`
  * `repos/get-apps-with-access-to-protected-branch`
  * `repos/remove-app-access-restrictions`
  * `repos/set-app-access-restrictions`
  * `repos/add-team-access-restrictions`
  * `repos/get-teams-with-access-to-protected-branch`
  * `repos/remove-team-access-restrictions`
  * `repos/set-team-access-restrictions`
  * `repos/add-user-access-restrictions`
  * `repos/get-users-with-access-to-protected-branch`
  * `repos/remove-user-access-restrictions`
  * `repos/set-user-access-restrictions`
  * `repos/rename-branch`
  * `repos/codeowners-errors`
  * `repos/list-collaborators`
  * `repos/add-collaborator`
  * `repos/check-collaborator`
  * `repos/remove-collaborator`
  * `repos/get-collaborator-permission-level`
  * `repos/list-commit-comments-for-repo`
  * `repos/delete-commit-comment`
  * `repos/get-commit-comment`
  * `repos/update-commit-comment`
  * `repos/list-commits`
  * `repos/list-branches-for-head-commit`
  * `repos/create-commit-comment`
  * `repos/list-comments-for-commit`
  * `repos/list-pull-requests-associated-with-commit`
  * `repos/get-commit`
  * `repos/get-combined-status-for-ref`
  * `repos/list-commit-statuses-for-ref`
  * `repos/get-community-profile-metrics`
  * `repos/compare-commits`
  * `repos/create-or-update-file-contents`
  * `repos/delete-file`
  * `repos/get-content`
  * `repos/list-contributors`
  * `repos/create-deployment`
  * `repos/list-deployments`
  * `repos/delete-deployment`
  * `repos/get-deployment`
  * `repos/create-deployment-status`
  * `repos/list-deployment-statuses`
  * `repos/get-deployment-status`
  * `repos/create-dispatch-event`
  * `repos/get-all-environments`
  * `repos/create-or-update-environment`
  * `repos/delete-an-environment`
  * `repos/get-environment`
  * `repos/create-deployment-branch-policy`
  * `repos/list-deployment-branch-policies`
  * `repos/delete-deployment-branch-policy`
  * `repos/get-deployment-branch-policy`
  * `repos/update-deployment-branch-policy`
  * `repos/create-deployment-protection-rule`
  * `repos/get-all-deployment-protection-rules`
  * `repos/list-custom-deployment-rule-integrations`
  * `repos/disable-deployment-protection-rule`
  * `repos/get-custom-deployment-protection-rule`
  * `repos/create-fork`
  * `repos/list-forks`
  * `repos/create-webhook`
  * `repos/list-webhooks`
  * `repos/delete-webhook`
  * `repos/get-webhook`
  * `repos/update-webhook`
  * `repos/get-webhook-config-for-repo`
  * `repos/update-webhook-config-for-repo`
  * `repos/list-webhook-deliveries`
  * `repos/get-webhook-delivery`
  * `repos/redeliver-webhook-delivery`
  * `repos/ping-webhook`
  * `repos/test-push-webhook`
  * `repos/check-immutable-releases`
  * `repos/disable-immutable-releases`
  * `repos/enable-immutable-releases`
  * `repos/list-invitations`
  * `repos/delete-invitation`
  * `repos/update-invitation`
  * `repos/create-deploy-key`
  * `repos/list-deploy-keys`
  * `repos/delete-deploy-key`
  * `repos/get-deploy-key`
  * `repos/list-languages`
  * `repos/merge-upstream`
  * `repos/merge`
  * `repos/create-pages-site`
  * `repos/delete-pages-site`
  * `repos/get-pages`
  * `repos/update-information-about-pages-site`
  * `repos/list-pages-builds`
  * `repos/request-pages-build`
  * `repos/get-latest-pages-build`
  * `repos/get-pages-build`
  * `repos/create-pages-deployment`
  * `repos/get-pages-deployment`
  * `repos/cancel-pages-deployment`
  * `repos/get-pages-health-check`
  * `repos/check-private-vulnerability-reporting`
  * `repos/disable-private-vulnerability-reporting`
  * `repos/enable-private-vulnerability-reporting`
  * `repos/custom-properties-for-repos-create-or-update-repository-values`
  * `repos/custom-properties-for-repos-get-repository-values`
  * `repos/get-readme`
  * `repos/get-readme-in-directory`
  * `repos/create-release`
  * `repos/list-releases`
  * `repos/delete-release-asset`
  * `repos/get-release-asset`
  * `repos/update-release-asset`
  * `repos/generate-release-notes`
  * `repos/get-latest-release`
  * `repos/get-release-by-tag`
  * `repos/delete-release`
  * `repos/get-release`
  * `repos/update-release`
  * `repos/list-release-assets`
  * `repos/upload-release-asset`
  * `repos/get-branch-rules`
  * `repos/create-repo-ruleset`
  * `repos/get-repo-rulesets`
  * `repos/get-repo-rule-suites`
  * `repos/get-repo-rule-suite`
  * `repos/delete-repo-ruleset`
  * `repos/get-repo-ruleset`
  * `repos/update-repo-ruleset`
  * `repos/get-repo-ruleset-history`
  * `repos/get-repo-ruleset-version`
  * `repos/get-code-frequency-stats`
  * `repos/get-commit-activity-stats`
  * `repos/get-contributors-stats`
  * `repos/get-participation-stats`
  * `repos/get-punch-card-stats`
  * `repos/create-commit-status`
  * `repos/list-tags`
  * `repos/download-tarball-archive`
  * `repos/list-teams`
  * `repos/get-all-topics`
  * `repos/replace-all-topics`
  * `repos/get-clones`
  * `repos/get-top-paths`
  * `repos/get-top-referrers`
  * `repos/get-views`
  * `repos/transfer`
  * `repos/check-vulnerability-alerts`
  * `repos/disable-vulnerability-alerts`
  * `repos/enable-vulnerability-alerts`
  * `repos/download-zipball-archive`
  * `repos/create-using-template`
  * `repos/list-public`
  * `repos/create-for-authenticated-user`
  * `repos/list-for-authenticated-user`
  * `repos/list-invitations-for-authenticated-user`
  * `repos/accept-invitation-for-authenticated-user`
  * `repos/decline-invitation-for-authenticated-user`
  * `repos/list-for-user`
  """

  @type result :: {:ok, term()} | {:error, GitHubEx.Error.t()}

  @doc "Accept a repository invitation\n\nPath: /user/repository_invitations/{invitation_id}\n\nMethod: patch"
  @spec accept_invitation_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec accept_invitation_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def accept_invitation_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :accept_invitation_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"invitation_id", :invitation_id}],
      path_template: "/user/repository_invitations/{invitation_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Add app access restrictions\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/restrictions/apps\n\nMethod: post"
  @spec add_app_access_restrictions(GitHubEx.Client.t()) :: result
  @spec add_app_access_restrictions(GitHubEx.Client.t(), map()) :: result
  def add_app_access_restrictions(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :add_app_access_restrictions},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/apps",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Add a repository collaborator\n\nPath: /repos/{owner}/{repo}/collaborators/{username}\n\nMethod: put"
  @spec add_collaborator(GitHubEx.Client.t()) :: result
  @spec add_collaborator(GitHubEx.Client.t(), map()) :: result
  def add_collaborator(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :add_collaborator},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}, {"username", :username}],
      path_template: "/repos/{owner}/{repo}/collaborators/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Add status check contexts\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks/contexts\n\nMethod: post"
  @spec add_status_check_contexts(GitHubEx.Client.t()) :: result
  @spec add_status_check_contexts(GitHubEx.Client.t(), map()) :: result
  def add_status_check_contexts(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :add_status_check_contexts},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template:
        "/repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks/contexts",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Add team access restrictions\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/restrictions/teams\n\nMethod: post"
  @spec add_team_access_restrictions(GitHubEx.Client.t()) :: result
  @spec add_team_access_restrictions(GitHubEx.Client.t(), map()) :: result
  def add_team_access_restrictions(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :add_team_access_restrictions},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/teams",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Add user access restrictions\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/restrictions/users\n\nMethod: post"
  @spec add_user_access_restrictions(GitHubEx.Client.t()) :: result
  @spec add_user_access_restrictions(GitHubEx.Client.t(), map()) :: result
  def add_user_access_restrictions(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :add_user_access_restrictions},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/users",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Cancel a GitHub Pages deployment\n\nPath: /repos/{owner}/{repo}/pages/deployments/{pages_deployment_id}/cancel\n\nMethod: post"
  @spec cancel_pages_deployment(GitHubEx.Client.t()) :: result
  @spec cancel_pages_deployment(GitHubEx.Client.t(), map()) :: result
  def cancel_pages_deployment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :cancel_pages_deployment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"pages_deployment_id", :pages_deployment_id}],
      path_template: "/repos/{owner}/{repo}/pages/deployments/{pages_deployment_id}/cancel",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Check if Dependabot security updates are enabled for a repository\n\nPath: /repos/{owner}/{repo}/automated-security-fixes\n\nMethod: get"
  @spec check_automated_security_fixes(GitHubEx.Client.t()) :: result
  @spec check_automated_security_fixes(GitHubEx.Client.t(), map()) :: result
  def check_automated_security_fixes(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :check_automated_security_fixes},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/automated-security-fixes",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Check if a user is a repository collaborator\n\nPath: /repos/{owner}/{repo}/collaborators/{username}\n\nMethod: get"
  @spec check_collaborator(GitHubEx.Client.t()) :: result
  @spec check_collaborator(GitHubEx.Client.t(), map()) :: result
  def check_collaborator(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :check_collaborator},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"username", :username}],
      path_template: "/repos/{owner}/{repo}/collaborators/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Check if immutable releases are enabled for a repository\n\nPath: /repos/{owner}/{repo}/immutable-releases\n\nMethod: get"
  @spec check_immutable_releases(GitHubEx.Client.t()) :: result
  @spec check_immutable_releases(GitHubEx.Client.t(), map()) :: result
  def check_immutable_releases(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :check_immutable_releases},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/immutable-releases",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Check if private vulnerability reporting is enabled for a repository\n\nPath: /repos/{owner}/{repo}/private-vulnerability-reporting\n\nMethod: get"
  @spec check_private_vulnerability_reporting(GitHubEx.Client.t()) :: result
  @spec check_private_vulnerability_reporting(GitHubEx.Client.t(), map()) :: result
  def check_private_vulnerability_reporting(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :check_private_vulnerability_reporting},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/private-vulnerability-reporting",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Check if vulnerability alerts are enabled for a repository\n\nPath: /repos/{owner}/{repo}/vulnerability-alerts\n\nMethod: get"
  @spec check_vulnerability_alerts(GitHubEx.Client.t()) :: result
  @spec check_vulnerability_alerts(GitHubEx.Client.t(), map()) :: result
  def check_vulnerability_alerts(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :check_vulnerability_alerts},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/vulnerability-alerts",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List CODEOWNERS errors\n\nPath: /repos/{owner}/{repo}/codeowners/errors\n\nMethod: get"
  @spec codeowners_errors(GitHubEx.Client.t()) :: result
  @spec codeowners_errors(GitHubEx.Client.t(), map()) :: result
  def codeowners_errors(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :codeowners_errors},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/codeowners/errors",
      query: [{"ref", :ref}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Compare two commits\n\nPath: /repos/{owner}/{repo}/compare/{basehead}\n\nMethod: get"
  @spec compare_commits(GitHubEx.Client.t()) :: result
  @spec compare_commits(GitHubEx.Client.t(), map()) :: result
  def compare_commits(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :compare_commits},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"basehead", :basehead}],
      path_template: "/repos/{owner}/{repo}/compare/{basehead}",
      query: [{"page", :page}, {"per_page", :per_page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Create an attestation\n\nPath: /repos/{owner}/{repo}/attestations\n\nMethod: post"
  @spec create_attestation(GitHubEx.Client.t()) :: result
  @spec create_attestation(GitHubEx.Client.t(), map()) :: result
  def create_attestation(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :create_attestation},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/attestations",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create an autolink reference for a repository\n\nPath: /repos/{owner}/{repo}/autolinks\n\nMethod: post"
  @spec create_autolink(GitHubEx.Client.t()) :: result
  @spec create_autolink(GitHubEx.Client.t(), map()) :: result
  def create_autolink(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :create_autolink},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/autolinks",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a commit comment\n\nPath: /repos/{owner}/{repo}/commits/{commit_sha}/comments\n\nMethod: post"
  @spec create_commit_comment(GitHubEx.Client.t()) :: result
  @spec create_commit_comment(GitHubEx.Client.t(), map()) :: result
  def create_commit_comment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :create_commit_comment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"commit_sha", :commit_sha}],
      path_template: "/repos/{owner}/{repo}/commits/{commit_sha}/comments",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create commit signature protection\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/required_signatures\n\nMethod: post"
  @spec create_commit_signature_protection(GitHubEx.Client.t()) :: result
  @spec create_commit_signature_protection(GitHubEx.Client.t(), map()) :: result
  def create_commit_signature_protection(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :create_commit_signature_protection},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/required_signatures",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a commit status\n\nPath: /repos/{owner}/{repo}/statuses/{sha}\n\nMethod: post"
  @spec create_commit_status(GitHubEx.Client.t()) :: result
  @spec create_commit_status(GitHubEx.Client.t(), map()) :: result
  def create_commit_status(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :create_commit_status},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"sha", :sha}],
      path_template: "/repos/{owner}/{repo}/statuses/{sha}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a deploy key\n\nPath: /repos/{owner}/{repo}/keys\n\nMethod: post"
  @spec create_deploy_key(GitHubEx.Client.t()) :: result
  @spec create_deploy_key(GitHubEx.Client.t(), map()) :: result
  def create_deploy_key(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :create_deploy_key},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/keys",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a deployment\n\nPath: /repos/{owner}/{repo}/deployments\n\nMethod: post"
  @spec create_deployment(GitHubEx.Client.t()) :: result
  @spec create_deployment(GitHubEx.Client.t(), map()) :: result
  def create_deployment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :create_deployment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/deployments",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a deployment branch policy\n\nPath: /repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies\n\nMethod: post"
  @spec create_deployment_branch_policy(GitHubEx.Client.t()) :: result
  @spec create_deployment_branch_policy(GitHubEx.Client.t(), map()) :: result
  def create_deployment_branch_policy(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :create_deployment_branch_policy},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"environment_name", :environment_name}],
      path_template:
        "/repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a custom deployment protection rule on an environment\n\nPath: /repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules\n\nMethod: post"
  @spec create_deployment_protection_rule(GitHubEx.Client.t()) :: result
  @spec create_deployment_protection_rule(GitHubEx.Client.t(), map()) :: result
  def create_deployment_protection_rule(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :create_deployment_protection_rule},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"environment_name", :environment_name}, {"repo", :repo}, {"owner", :owner}],
      path_template:
        "/repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a deployment status\n\nPath: /repos/{owner}/{repo}/deployments/{deployment_id}/statuses\n\nMethod: post"
  @spec create_deployment_status(GitHubEx.Client.t()) :: result
  @spec create_deployment_status(GitHubEx.Client.t(), map()) :: result
  def create_deployment_status(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :create_deployment_status},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"deployment_id", :deployment_id}],
      path_template: "/repos/{owner}/{repo}/deployments/{deployment_id}/statuses",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a repository dispatch event\n\nPath: /repos/{owner}/{repo}/dispatches\n\nMethod: post"
  @spec create_dispatch_event(GitHubEx.Client.t()) :: result
  @spec create_dispatch_event(GitHubEx.Client.t(), map()) :: result
  def create_dispatch_event(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :create_dispatch_event},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/dispatches",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a repository for the authenticated user\n\nPath: /user/repos\n\nMethod: post"
  @spec create_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec create_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def create_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :create_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [],
      path_template: "/user/repos",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a fork\n\nPath: /repos/{owner}/{repo}/forks\n\nMethod: post"
  @spec create_fork(GitHubEx.Client.t()) :: result
  @spec create_fork(GitHubEx.Client.t(), map()) :: result
  def create_fork(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :create_fork},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/forks",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create an organization repository\n\nPath: /orgs/{org}/repos\n\nMethod: post"
  @spec create_in_org(GitHubEx.Client.t()) :: result
  @spec create_in_org(GitHubEx.Client.t(), map()) :: result
  def create_in_org(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :create_in_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/repos",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create or update an environment\n\nPath: /repos/{owner}/{repo}/environments/{environment_name}\n\nMethod: put"
  @spec create_or_update_environment(GitHubEx.Client.t()) :: result
  @spec create_or_update_environment(GitHubEx.Client.t(), map()) :: result
  def create_or_update_environment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :create_or_update_environment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}, {"environment_name", :environment_name}],
      path_template: "/repos/{owner}/{repo}/environments/{environment_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create or update file contents\n\nPath: /repos/{owner}/{repo}/contents/{path}\n\nMethod: put"
  @spec create_or_update_file_contents(GitHubEx.Client.t()) :: result
  @spec create_or_update_file_contents(GitHubEx.Client.t(), map()) :: result
  def create_or_update_file_contents(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :create_or_update_file_contents},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}, {"path", :path}],
      path_template: "/repos/{owner}/{repo}/contents/{path}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create an organization repository ruleset\n\nPath: /orgs/{org}/rulesets\n\nMethod: post"
  @spec create_org_ruleset(GitHubEx.Client.t()) :: result
  @spec create_org_ruleset(GitHubEx.Client.t(), map()) :: result
  def create_org_ruleset(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :create_org_ruleset},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/rulesets",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a GitHub Pages deployment\n\nPath: /repos/{owner}/{repo}/pages/deployments\n\nMethod: post"
  @spec create_pages_deployment(GitHubEx.Client.t()) :: result
  @spec create_pages_deployment(GitHubEx.Client.t(), map()) :: result
  def create_pages_deployment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :create_pages_deployment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/pages/deployments",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a GitHub Pages site\n\nPath: /repos/{owner}/{repo}/pages\n\nMethod: post"
  @spec create_pages_site(GitHubEx.Client.t()) :: result
  @spec create_pages_site(GitHubEx.Client.t(), map()) :: result
  def create_pages_site(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :create_pages_site},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/pages",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a release\n\nPath: /repos/{owner}/{repo}/releases\n\nMethod: post"
  @spec create_release(GitHubEx.Client.t()) :: result
  @spec create_release(GitHubEx.Client.t(), map()) :: result
  def create_release(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :create_release},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/releases",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a repository ruleset\n\nPath: /repos/{owner}/{repo}/rulesets\n\nMethod: post"
  @spec create_repo_ruleset(GitHubEx.Client.t()) :: result
  @spec create_repo_ruleset(GitHubEx.Client.t(), map()) :: result
  def create_repo_ruleset(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :create_repo_ruleset},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/rulesets",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a repository using a template\n\nPath: /repos/{template_owner}/{template_repo}/generate\n\nMethod: post"
  @spec create_using_template(GitHubEx.Client.t()) :: result
  @spec create_using_template(GitHubEx.Client.t(), map()) :: result
  def create_using_template(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :create_using_template},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"template_owner", :template_owner}, {"template_repo", :template_repo}],
      path_template: "/repos/{template_owner}/{template_repo}/generate",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a repository webhook\n\nPath: /repos/{owner}/{repo}/hooks\n\nMethod: post"
  @spec create_webhook(GitHubEx.Client.t()) :: result
  @spec create_webhook(GitHubEx.Client.t(), map()) :: result
  def create_webhook(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :create_webhook},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/hooks",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create or update custom property values for a repository\n\nPath: /repos/{owner}/{repo}/properties/values\n\nMethod: patch"
  @spec custom_properties_for_repos_create_or_update_repository_values(GitHubEx.Client.t()) ::
          result
  @spec custom_properties_for_repos_create_or_update_repository_values(GitHubEx.Client.t(), map()) ::
          result
  def custom_properties_for_repos_create_or_update_repository_values(client, params \\ %{})
      when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :custom_properties_for_repos_create_or_update_repository_values},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/properties/values",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Get all custom property values for a repository\n\nPath: /repos/{owner}/{repo}/properties/values\n\nMethod: get"
  @spec custom_properties_for_repos_get_repository_values(GitHubEx.Client.t()) :: result
  @spec custom_properties_for_repos_get_repository_values(GitHubEx.Client.t(), map()) :: result
  def custom_properties_for_repos_get_repository_values(client, params \\ %{})
      when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :custom_properties_for_repos_get_repository_values},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/properties/values",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Decline a repository invitation\n\nPath: /user/repository_invitations/{invitation_id}\n\nMethod: delete"
  @spec decline_invitation_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec decline_invitation_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def decline_invitation_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :decline_invitation_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"invitation_id", :invitation_id}],
      path_template: "/user/repository_invitations/{invitation_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a repository\n\nPath: /repos/{owner}/{repo}\n\nMethod: delete"
  @spec delete(GitHubEx.Client.t()) :: result
  @spec delete(GitHubEx.Client.t(), map()) :: result
  def delete(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :delete},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete access restrictions\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/restrictions\n\nMethod: delete"
  @spec delete_access_restrictions(GitHubEx.Client.t()) :: result
  @spec delete_access_restrictions(GitHubEx.Client.t(), map()) :: result
  def delete_access_restrictions(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :delete_access_restrictions},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/restrictions",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete admin branch protection\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/enforce_admins\n\nMethod: delete"
  @spec delete_admin_branch_protection(GitHubEx.Client.t()) :: result
  @spec delete_admin_branch_protection(GitHubEx.Client.t(), map()) :: result
  def delete_admin_branch_protection(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :delete_admin_branch_protection},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/enforce_admins",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete an environment\n\nPath: /repos/{owner}/{repo}/environments/{environment_name}\n\nMethod: delete"
  @spec delete_an_environment(GitHubEx.Client.t()) :: result
  @spec delete_an_environment(GitHubEx.Client.t(), map()) :: result
  def delete_an_environment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :delete_an_environment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"environment_name", :environment_name}],
      path_template: "/repos/{owner}/{repo}/environments/{environment_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete an autolink reference from a repository\n\nPath: /repos/{owner}/{repo}/autolinks/{autolink_id}\n\nMethod: delete"
  @spec delete_autolink(GitHubEx.Client.t()) :: result
  @spec delete_autolink(GitHubEx.Client.t(), map()) :: result
  def delete_autolink(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :delete_autolink},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"autolink_id", :autolink_id}],
      path_template: "/repos/{owner}/{repo}/autolinks/{autolink_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete branch protection\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection\n\nMethod: delete"
  @spec delete_branch_protection(GitHubEx.Client.t()) :: result
  @spec delete_branch_protection(GitHubEx.Client.t(), map()) :: result
  def delete_branch_protection(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :delete_branch_protection},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a commit comment\n\nPath: /repos/{owner}/{repo}/comments/{comment_id}\n\nMethod: delete"
  @spec delete_commit_comment(GitHubEx.Client.t()) :: result
  @spec delete_commit_comment(GitHubEx.Client.t(), map()) :: result
  def delete_commit_comment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :delete_commit_comment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
      path_template: "/repos/{owner}/{repo}/comments/{comment_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete commit signature protection\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/required_signatures\n\nMethod: delete"
  @spec delete_commit_signature_protection(GitHubEx.Client.t()) :: result
  @spec delete_commit_signature_protection(GitHubEx.Client.t(), map()) :: result
  def delete_commit_signature_protection(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :delete_commit_signature_protection},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/required_signatures",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a deploy key\n\nPath: /repos/{owner}/{repo}/keys/{key_id}\n\nMethod: delete"
  @spec delete_deploy_key(GitHubEx.Client.t()) :: result
  @spec delete_deploy_key(GitHubEx.Client.t(), map()) :: result
  def delete_deploy_key(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :delete_deploy_key},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"key_id", :key_id}],
      path_template: "/repos/{owner}/{repo}/keys/{key_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a deployment\n\nPath: /repos/{owner}/{repo}/deployments/{deployment_id}\n\nMethod: delete"
  @spec delete_deployment(GitHubEx.Client.t()) :: result
  @spec delete_deployment(GitHubEx.Client.t(), map()) :: result
  def delete_deployment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :delete_deployment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"deployment_id", :deployment_id}],
      path_template: "/repos/{owner}/{repo}/deployments/{deployment_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a deployment branch policy\n\nPath: /repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies/{branch_policy_id}\n\nMethod: delete"
  @spec delete_deployment_branch_policy(GitHubEx.Client.t()) :: result
  @spec delete_deployment_branch_policy(GitHubEx.Client.t(), map()) :: result
  def delete_deployment_branch_policy(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :delete_deployment_branch_policy},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"environment_name", :environment_name},
        {"branch_policy_id", :branch_policy_id}
      ],
      path_template:
        "/repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies/{branch_policy_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a file\n\nPath: /repos/{owner}/{repo}/contents/{path}\n\nMethod: delete"
  @spec delete_file(GitHubEx.Client.t()) :: result
  @spec delete_file(GitHubEx.Client.t(), map()) :: result
  def delete_file(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :delete_file},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"path", :path}],
      path_template: "/repos/{owner}/{repo}/contents/{path}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a repository invitation\n\nPath: /repos/{owner}/{repo}/invitations/{invitation_id}\n\nMethod: delete"
  @spec delete_invitation(GitHubEx.Client.t()) :: result
  @spec delete_invitation(GitHubEx.Client.t(), map()) :: result
  def delete_invitation(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :delete_invitation},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"invitation_id", :invitation_id}],
      path_template: "/repos/{owner}/{repo}/invitations/{invitation_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete an organization repository ruleset\n\nPath: /orgs/{org}/rulesets/{ruleset_id}\n\nMethod: delete"
  @spec delete_org_ruleset(GitHubEx.Client.t()) :: result
  @spec delete_org_ruleset(GitHubEx.Client.t(), map()) :: result
  def delete_org_ruleset(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :delete_org_ruleset},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"ruleset_id", :ruleset_id}],
      path_template: "/orgs/{org}/rulesets/{ruleset_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a GitHub Pages site\n\nPath: /repos/{owner}/{repo}/pages\n\nMethod: delete"
  @spec delete_pages_site(GitHubEx.Client.t()) :: result
  @spec delete_pages_site(GitHubEx.Client.t(), map()) :: result
  def delete_pages_site(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :delete_pages_site},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/pages",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete pull request review protection\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/required_pull_request_reviews\n\nMethod: delete"
  @spec delete_pull_request_review_protection(GitHubEx.Client.t()) :: result
  @spec delete_pull_request_review_protection(GitHubEx.Client.t(), map()) :: result
  def delete_pull_request_review_protection(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :delete_pull_request_review_protection},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template:
        "/repos/{owner}/{repo}/branches/{branch}/protection/required_pull_request_reviews",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a release\n\nPath: /repos/{owner}/{repo}/releases/{release_id}\n\nMethod: delete"
  @spec delete_release(GitHubEx.Client.t()) :: result
  @spec delete_release(GitHubEx.Client.t(), map()) :: result
  def delete_release(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :delete_release},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"release_id", :release_id}],
      path_template: "/repos/{owner}/{repo}/releases/{release_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a release asset\n\nPath: /repos/{owner}/{repo}/releases/assets/{asset_id}\n\nMethod: delete"
  @spec delete_release_asset(GitHubEx.Client.t()) :: result
  @spec delete_release_asset(GitHubEx.Client.t(), map()) :: result
  def delete_release_asset(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :delete_release_asset},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"asset_id", :asset_id}],
      path_template: "/repos/{owner}/{repo}/releases/assets/{asset_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a repository ruleset\n\nPath: /repos/{owner}/{repo}/rulesets/{ruleset_id}\n\nMethod: delete"
  @spec delete_repo_ruleset(GitHubEx.Client.t()) :: result
  @spec delete_repo_ruleset(GitHubEx.Client.t(), map()) :: result
  def delete_repo_ruleset(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :delete_repo_ruleset},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"ruleset_id", :ruleset_id}],
      path_template: "/repos/{owner}/{repo}/rulesets/{ruleset_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a repository webhook\n\nPath: /repos/{owner}/{repo}/hooks/{hook_id}\n\nMethod: delete"
  @spec delete_webhook(GitHubEx.Client.t()) :: result
  @spec delete_webhook(GitHubEx.Client.t(), map()) :: result
  def delete_webhook(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :delete_webhook},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"hook_id", :hook_id}],
      path_template: "/repos/{owner}/{repo}/hooks/{hook_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Disable Dependabot security updates\n\nPath: /repos/{owner}/{repo}/automated-security-fixes\n\nMethod: delete"
  @spec disable_automated_security_fixes(GitHubEx.Client.t()) :: result
  @spec disable_automated_security_fixes(GitHubEx.Client.t(), map()) :: result
  def disable_automated_security_fixes(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :disable_automated_security_fixes},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/automated-security-fixes",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Disable a custom protection rule for an environment\n\nPath: /repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules/{protection_rule_id}\n\nMethod: delete"
  @spec disable_deployment_protection_rule(GitHubEx.Client.t()) :: result
  @spec disable_deployment_protection_rule(GitHubEx.Client.t(), map()) :: result
  def disable_deployment_protection_rule(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :disable_deployment_protection_rule},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [
        {"environment_name", :environment_name},
        {"repo", :repo},
        {"owner", :owner},
        {"protection_rule_id", :protection_rule_id}
      ],
      path_template:
        "/repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules/{protection_rule_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Disable immutable releases\n\nPath: /repos/{owner}/{repo}/immutable-releases\n\nMethod: delete"
  @spec disable_immutable_releases(GitHubEx.Client.t()) :: result
  @spec disable_immutable_releases(GitHubEx.Client.t(), map()) :: result
  def disable_immutable_releases(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :disable_immutable_releases},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/immutable-releases",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Disable private vulnerability reporting for a repository\n\nPath: /repos/{owner}/{repo}/private-vulnerability-reporting\n\nMethod: delete"
  @spec disable_private_vulnerability_reporting(GitHubEx.Client.t()) :: result
  @spec disable_private_vulnerability_reporting(GitHubEx.Client.t(), map()) :: result
  def disable_private_vulnerability_reporting(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :disable_private_vulnerability_reporting},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/private-vulnerability-reporting",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Disable vulnerability alerts\n\nPath: /repos/{owner}/{repo}/vulnerability-alerts\n\nMethod: delete"
  @spec disable_vulnerability_alerts(GitHubEx.Client.t()) :: result
  @spec disable_vulnerability_alerts(GitHubEx.Client.t(), map()) :: result
  def disable_vulnerability_alerts(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :disable_vulnerability_alerts},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/vulnerability-alerts",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Download a repository archive (tar)\n\nPath: /repos/{owner}/{repo}/tarball/{ref}\n\nMethod: get"
  @spec download_tarball_archive(GitHubEx.Client.t()) :: result
  @spec download_tarball_archive(GitHubEx.Client.t(), map()) :: result
  def download_tarball_archive(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :download_tarball_archive},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"ref", :ref}],
      path_template: "/repos/{owner}/{repo}/tarball/{ref}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Download a repository archive (zip)\n\nPath: /repos/{owner}/{repo}/zipball/{ref}\n\nMethod: get"
  @spec download_zipball_archive(GitHubEx.Client.t()) :: result
  @spec download_zipball_archive(GitHubEx.Client.t(), map()) :: result
  def download_zipball_archive(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :download_zipball_archive},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"ref", :ref}],
      path_template: "/repos/{owner}/{repo}/zipball/{ref}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Enable Dependabot security updates\n\nPath: /repos/{owner}/{repo}/automated-security-fixes\n\nMethod: put"
  @spec enable_automated_security_fixes(GitHubEx.Client.t()) :: result
  @spec enable_automated_security_fixes(GitHubEx.Client.t(), map()) :: result
  def enable_automated_security_fixes(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :enable_automated_security_fixes},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/automated-security-fixes",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Enable immutable releases\n\nPath: /repos/{owner}/{repo}/immutable-releases\n\nMethod: put"
  @spec enable_immutable_releases(GitHubEx.Client.t()) :: result
  @spec enable_immutable_releases(GitHubEx.Client.t(), map()) :: result
  def enable_immutable_releases(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :enable_immutable_releases},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/immutable-releases",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Enable private vulnerability reporting for a repository\n\nPath: /repos/{owner}/{repo}/private-vulnerability-reporting\n\nMethod: put"
  @spec enable_private_vulnerability_reporting(GitHubEx.Client.t()) :: result
  @spec enable_private_vulnerability_reporting(GitHubEx.Client.t(), map()) :: result
  def enable_private_vulnerability_reporting(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :enable_private_vulnerability_reporting},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/private-vulnerability-reporting",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Enable vulnerability alerts\n\nPath: /repos/{owner}/{repo}/vulnerability-alerts\n\nMethod: put"
  @spec enable_vulnerability_alerts(GitHubEx.Client.t()) :: result
  @spec enable_vulnerability_alerts(GitHubEx.Client.t(), map()) :: result
  def enable_vulnerability_alerts(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :enable_vulnerability_alerts},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/vulnerability-alerts",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Generate release notes content for a release\n\nPath: /repos/{owner}/{repo}/releases/generate-notes\n\nMethod: post"
  @spec generate_release_notes(GitHubEx.Client.t()) :: result
  @spec generate_release_notes(GitHubEx.Client.t(), map()) :: result
  def generate_release_notes(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :generate_release_notes},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/releases/generate-notes",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Get a repository\n\nPath: /repos/{owner}/{repo}\n\nMethod: get"
  @spec get(GitHubEx.Client.t()) :: result
  @spec get(GitHubEx.Client.t(), map()) :: result
  def get(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get access restrictions\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/restrictions\n\nMethod: get"
  @spec get_access_restrictions(GitHubEx.Client.t()) :: result
  @spec get_access_restrictions(GitHubEx.Client.t(), map()) :: result
  def get_access_restrictions(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_access_restrictions},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/restrictions",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get admin branch protection\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/enforce_admins\n\nMethod: get"
  @spec get_admin_branch_protection(GitHubEx.Client.t()) :: result
  @spec get_admin_branch_protection(GitHubEx.Client.t(), map()) :: result
  def get_admin_branch_protection(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_admin_branch_protection},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/enforce_admins",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get all deployment protection rules for an environment\n\nPath: /repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules\n\nMethod: get"
  @spec get_all_deployment_protection_rules(GitHubEx.Client.t()) :: result
  @spec get_all_deployment_protection_rules(GitHubEx.Client.t(), map()) :: result
  def get_all_deployment_protection_rules(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_all_deployment_protection_rules},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"environment_name", :environment_name}, {"repo", :repo}, {"owner", :owner}],
      path_template:
        "/repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List environments\n\nPath: /repos/{owner}/{repo}/environments\n\nMethod: get"
  @spec get_all_environments(GitHubEx.Client.t()) :: result
  @spec get_all_environments(GitHubEx.Client.t(), map()) :: result
  def get_all_environments(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_all_environments},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/environments",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get all status check contexts\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks/contexts\n\nMethod: get"
  @spec get_all_status_check_contexts(GitHubEx.Client.t()) :: result
  @spec get_all_status_check_contexts(GitHubEx.Client.t(), map()) :: result
  def get_all_status_check_contexts(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_all_status_check_contexts},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template:
        "/repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks/contexts",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get all repository topics\n\nPath: /repos/{owner}/{repo}/topics\n\nMethod: get"
  @spec get_all_topics(GitHubEx.Client.t()) :: result
  @spec get_all_topics(GitHubEx.Client.t(), map()) :: result
  def get_all_topics(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_all_topics},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/topics",
      query: [{"page", :page}, {"per_page", :per_page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get apps with access to the protected branch\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/restrictions/apps\n\nMethod: get"
  @spec get_apps_with_access_to_protected_branch(GitHubEx.Client.t()) :: result
  @spec get_apps_with_access_to_protected_branch(GitHubEx.Client.t(), map()) :: result
  def get_apps_with_access_to_protected_branch(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_apps_with_access_to_protected_branch},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/apps",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get an autolink reference of a repository\n\nPath: /repos/{owner}/{repo}/autolinks/{autolink_id}\n\nMethod: get"
  @spec get_autolink(GitHubEx.Client.t()) :: result
  @spec get_autolink(GitHubEx.Client.t(), map()) :: result
  def get_autolink(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_autolink},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"autolink_id", :autolink_id}],
      path_template: "/repos/{owner}/{repo}/autolinks/{autolink_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a branch\n\nPath: /repos/{owner}/{repo}/branches/{branch}\n\nMethod: get"
  @spec get_branch(GitHubEx.Client.t()) :: result
  @spec get_branch(GitHubEx.Client.t(), map()) :: result
  def get_branch(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_branch},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template: "/repos/{owner}/{repo}/branches/{branch}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get branch protection\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection\n\nMethod: get"
  @spec get_branch_protection(GitHubEx.Client.t()) :: result
  @spec get_branch_protection(GitHubEx.Client.t(), map()) :: result
  def get_branch_protection(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_branch_protection},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get rules for a branch\n\nPath: /repos/{owner}/{repo}/rules/branches/{branch}\n\nMethod: get"
  @spec get_branch_rules(GitHubEx.Client.t()) :: result
  @spec get_branch_rules(GitHubEx.Client.t(), map()) :: result
  def get_branch_rules(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_branch_rules},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template: "/repos/{owner}/{repo}/rules/branches/{branch}",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get repository clones\n\nPath: /repos/{owner}/{repo}/traffic/clones\n\nMethod: get"
  @spec get_clones(GitHubEx.Client.t()) :: result
  @spec get_clones(GitHubEx.Client.t(), map()) :: result
  def get_clones(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_clones},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/traffic/clones",
      query: [{"per", :per}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get the weekly commit activity\n\nPath: /repos/{owner}/{repo}/stats/code_frequency\n\nMethod: get"
  @spec get_code_frequency_stats(GitHubEx.Client.t()) :: result
  @spec get_code_frequency_stats(GitHubEx.Client.t(), map()) :: result
  def get_code_frequency_stats(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_code_frequency_stats},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/stats/code_frequency",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get repository permissions for a user\n\nPath: /repos/{owner}/{repo}/collaborators/{username}/permission\n\nMethod: get"
  @spec get_collaborator_permission_level(GitHubEx.Client.t()) :: result
  @spec get_collaborator_permission_level(GitHubEx.Client.t(), map()) :: result
  def get_collaborator_permission_level(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_collaborator_permission_level},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"username", :username}],
      path_template: "/repos/{owner}/{repo}/collaborators/{username}/permission",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get the combined status for a specific reference\n\nPath: /repos/{owner}/{repo}/commits/{ref}/status\n\nMethod: get"
  @spec get_combined_status_for_ref(GitHubEx.Client.t()) :: result
  @spec get_combined_status_for_ref(GitHubEx.Client.t(), map()) :: result
  def get_combined_status_for_ref(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_combined_status_for_ref},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"ref", :ref}],
      path_template: "/repos/{owner}/{repo}/commits/{ref}/status",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a commit\n\nPath: /repos/{owner}/{repo}/commits/{ref}\n\nMethod: get"
  @spec get_commit(GitHubEx.Client.t()) :: result
  @spec get_commit(GitHubEx.Client.t(), map()) :: result
  def get_commit(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_commit},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"ref", :ref}],
      path_template: "/repos/{owner}/{repo}/commits/{ref}",
      query: [{"page", :page}, {"per_page", :per_page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get the last year of commit activity\n\nPath: /repos/{owner}/{repo}/stats/commit_activity\n\nMethod: get"
  @spec get_commit_activity_stats(GitHubEx.Client.t()) :: result
  @spec get_commit_activity_stats(GitHubEx.Client.t(), map()) :: result
  def get_commit_activity_stats(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_commit_activity_stats},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/stats/commit_activity",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a commit comment\n\nPath: /repos/{owner}/{repo}/comments/{comment_id}\n\nMethod: get"
  @spec get_commit_comment(GitHubEx.Client.t()) :: result
  @spec get_commit_comment(GitHubEx.Client.t(), map()) :: result
  def get_commit_comment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_commit_comment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
      path_template: "/repos/{owner}/{repo}/comments/{comment_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get commit signature protection\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/required_signatures\n\nMethod: get"
  @spec get_commit_signature_protection(GitHubEx.Client.t()) :: result
  @spec get_commit_signature_protection(GitHubEx.Client.t(), map()) :: result
  def get_commit_signature_protection(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_commit_signature_protection},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/required_signatures",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get community profile metrics\n\nPath: /repos/{owner}/{repo}/community/profile\n\nMethod: get"
  @spec get_community_profile_metrics(GitHubEx.Client.t()) :: result
  @spec get_community_profile_metrics(GitHubEx.Client.t(), map()) :: result
  def get_community_profile_metrics(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_community_profile_metrics},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/community/profile",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get repository content\n\nPath: /repos/{owner}/{repo}/contents/{path}\n\nMethod: get"
  @spec get_content(GitHubEx.Client.t()) :: result
  @spec get_content(GitHubEx.Client.t(), map()) :: result
  def get_content(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: {:key, {"body", :body}},
      call: {GitHubEx.Repos, :get_content},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"path", :path}],
      path_template: "/repos/{owner}/{repo}/contents/{path}",
      query: [{"ref", :ref}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get all contributor commit activity\n\nPath: /repos/{owner}/{repo}/stats/contributors\n\nMethod: get"
  @spec get_contributors_stats(GitHubEx.Client.t()) :: result
  @spec get_contributors_stats(GitHubEx.Client.t(), map()) :: result
  def get_contributors_stats(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_contributors_stats},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/stats/contributors",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a custom deployment protection rule\n\nPath: /repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules/{protection_rule_id}\n\nMethod: get"
  @spec get_custom_deployment_protection_rule(GitHubEx.Client.t()) :: result
  @spec get_custom_deployment_protection_rule(GitHubEx.Client.t(), map()) :: result
  def get_custom_deployment_protection_rule(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_custom_deployment_protection_rule},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"environment_name", :environment_name},
        {"protection_rule_id", :protection_rule_id}
      ],
      path_template:
        "/repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules/{protection_rule_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a deploy key\n\nPath: /repos/{owner}/{repo}/keys/{key_id}\n\nMethod: get"
  @spec get_deploy_key(GitHubEx.Client.t()) :: result
  @spec get_deploy_key(GitHubEx.Client.t(), map()) :: result
  def get_deploy_key(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_deploy_key},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"key_id", :key_id}],
      path_template: "/repos/{owner}/{repo}/keys/{key_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a deployment\n\nPath: /repos/{owner}/{repo}/deployments/{deployment_id}\n\nMethod: get"
  @spec get_deployment(GitHubEx.Client.t()) :: result
  @spec get_deployment(GitHubEx.Client.t(), map()) :: result
  def get_deployment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_deployment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"deployment_id", :deployment_id}],
      path_template: "/repos/{owner}/{repo}/deployments/{deployment_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a deployment branch policy\n\nPath: /repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies/{branch_policy_id}\n\nMethod: get"
  @spec get_deployment_branch_policy(GitHubEx.Client.t()) :: result
  @spec get_deployment_branch_policy(GitHubEx.Client.t(), map()) :: result
  def get_deployment_branch_policy(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_deployment_branch_policy},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"environment_name", :environment_name},
        {"branch_policy_id", :branch_policy_id}
      ],
      path_template:
        "/repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies/{branch_policy_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a deployment status\n\nPath: /repos/{owner}/{repo}/deployments/{deployment_id}/statuses/{status_id}\n\nMethod: get"
  @spec get_deployment_status(GitHubEx.Client.t()) :: result
  @spec get_deployment_status(GitHubEx.Client.t(), map()) :: result
  def get_deployment_status(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_deployment_status},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"deployment_id", :deployment_id},
        {"status_id", :status_id}
      ],
      path_template: "/repos/{owner}/{repo}/deployments/{deployment_id}/statuses/{status_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get an environment\n\nPath: /repos/{owner}/{repo}/environments/{environment_name}\n\nMethod: get"
  @spec get_environment(GitHubEx.Client.t()) :: result
  @spec get_environment(GitHubEx.Client.t(), map()) :: result
  def get_environment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_environment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"environment_name", :environment_name}],
      path_template: "/repos/{owner}/{repo}/environments/{environment_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get latest Pages build\n\nPath: /repos/{owner}/{repo}/pages/builds/latest\n\nMethod: get"
  @spec get_latest_pages_build(GitHubEx.Client.t()) :: result
  @spec get_latest_pages_build(GitHubEx.Client.t(), map()) :: result
  def get_latest_pages_build(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_latest_pages_build},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/pages/builds/latest",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get the latest release\n\nPath: /repos/{owner}/{repo}/releases/latest\n\nMethod: get"
  @spec get_latest_release(GitHubEx.Client.t()) :: result
  @spec get_latest_release(GitHubEx.Client.t(), map()) :: result
  def get_latest_release(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_latest_release},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/releases/latest",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get an organization rule suite\n\nPath: /orgs/{org}/rulesets/rule-suites/{rule_suite_id}\n\nMethod: get"
  @spec get_org_rule_suite(GitHubEx.Client.t()) :: result
  @spec get_org_rule_suite(GitHubEx.Client.t(), map()) :: result
  def get_org_rule_suite(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_org_rule_suite},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"rule_suite_id", :rule_suite_id}],
      path_template: "/orgs/{org}/rulesets/rule-suites/{rule_suite_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List organization rule suites\n\nPath: /orgs/{org}/rulesets/rule-suites\n\nMethod: get"
  @spec get_org_rule_suites(GitHubEx.Client.t()) :: result
  @spec get_org_rule_suites(GitHubEx.Client.t(), map()) :: result
  def get_org_rule_suites(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_org_rule_suites},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/rulesets/rule-suites",
      query: [
        {"ref", :ref},
        {"repository_name", :repository_name},
        {"time_period", :time_period},
        {"actor_name", :actor_name},
        {"rule_suite_result", :rule_suite_result},
        {"per_page", :per_page},
        {"page", :page}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get an organization repository ruleset\n\nPath: /orgs/{org}/rulesets/{ruleset_id}\n\nMethod: get"
  @spec get_org_ruleset(GitHubEx.Client.t()) :: result
  @spec get_org_ruleset(GitHubEx.Client.t(), map()) :: result
  def get_org_ruleset(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_org_ruleset},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"ruleset_id", :ruleset_id}],
      path_template: "/orgs/{org}/rulesets/{ruleset_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get all organization repository rulesets\n\nPath: /orgs/{org}/rulesets\n\nMethod: get"
  @spec get_org_rulesets(GitHubEx.Client.t()) :: result
  @spec get_org_rulesets(GitHubEx.Client.t(), map()) :: result
  def get_org_rulesets(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_org_rulesets},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/rulesets",
      query: [{"per_page", :per_page}, {"page", :page}, {"targets", :targets}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a GitHub Pages site\n\nPath: /repos/{owner}/{repo}/pages\n\nMethod: get"
  @spec get_pages(GitHubEx.Client.t()) :: result
  @spec get_pages(GitHubEx.Client.t(), map()) :: result
  def get_pages(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_pages},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/pages",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get GitHub Pages build\n\nPath: /repos/{owner}/{repo}/pages/builds/{build_id}\n\nMethod: get"
  @spec get_pages_build(GitHubEx.Client.t()) :: result
  @spec get_pages_build(GitHubEx.Client.t(), map()) :: result
  def get_pages_build(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_pages_build},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"build_id", :build_id}],
      path_template: "/repos/{owner}/{repo}/pages/builds/{build_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get the status of a GitHub Pages deployment\n\nPath: /repos/{owner}/{repo}/pages/deployments/{pages_deployment_id}\n\nMethod: get"
  @spec get_pages_deployment(GitHubEx.Client.t()) :: result
  @spec get_pages_deployment(GitHubEx.Client.t(), map()) :: result
  def get_pages_deployment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_pages_deployment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"pages_deployment_id", :pages_deployment_id}],
      path_template: "/repos/{owner}/{repo}/pages/deployments/{pages_deployment_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a DNS health check for GitHub Pages\n\nPath: /repos/{owner}/{repo}/pages/health\n\nMethod: get"
  @spec get_pages_health_check(GitHubEx.Client.t()) :: result
  @spec get_pages_health_check(GitHubEx.Client.t(), map()) :: result
  def get_pages_health_check(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_pages_health_check},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/pages/health",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get the weekly commit count\n\nPath: /repos/{owner}/{repo}/stats/participation\n\nMethod: get"
  @spec get_participation_stats(GitHubEx.Client.t()) :: result
  @spec get_participation_stats(GitHubEx.Client.t(), map()) :: result
  def get_participation_stats(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_participation_stats},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/stats/participation",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get pull request review protection\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/required_pull_request_reviews\n\nMethod: get"
  @spec get_pull_request_review_protection(GitHubEx.Client.t()) :: result
  @spec get_pull_request_review_protection(GitHubEx.Client.t(), map()) :: result
  def get_pull_request_review_protection(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_pull_request_review_protection},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template:
        "/repos/{owner}/{repo}/branches/{branch}/protection/required_pull_request_reviews",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get the hourly commit count for each day\n\nPath: /repos/{owner}/{repo}/stats/punch_card\n\nMethod: get"
  @spec get_punch_card_stats(GitHubEx.Client.t()) :: result
  @spec get_punch_card_stats(GitHubEx.Client.t(), map()) :: result
  def get_punch_card_stats(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_punch_card_stats},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/stats/punch_card",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a repository README\n\nPath: /repos/{owner}/{repo}/readme\n\nMethod: get"
  @spec get_readme(GitHubEx.Client.t()) :: result
  @spec get_readme(GitHubEx.Client.t(), map()) :: result
  def get_readme(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_readme},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/readme",
      query: [{"ref", :ref}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a repository README for a directory\n\nPath: /repos/{owner}/{repo}/readme/{dir}\n\nMethod: get"
  @spec get_readme_in_directory(GitHubEx.Client.t()) :: result
  @spec get_readme_in_directory(GitHubEx.Client.t(), map()) :: result
  def get_readme_in_directory(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_readme_in_directory},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"dir", :dir}],
      path_template: "/repos/{owner}/{repo}/readme/{dir}",
      query: [{"ref", :ref}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a release\n\nPath: /repos/{owner}/{repo}/releases/{release_id}\n\nMethod: get"
  @spec get_release(GitHubEx.Client.t()) :: result
  @spec get_release(GitHubEx.Client.t(), map()) :: result
  def get_release(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_release},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"release_id", :release_id}],
      path_template: "/repos/{owner}/{repo}/releases/{release_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a release asset\n\nPath: /repos/{owner}/{repo}/releases/assets/{asset_id}\n\nMethod: get"
  @spec get_release_asset(GitHubEx.Client.t()) :: result
  @spec get_release_asset(GitHubEx.Client.t(), map()) :: result
  def get_release_asset(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_release_asset},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"asset_id", :asset_id}],
      path_template: "/repos/{owner}/{repo}/releases/assets/{asset_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a release by tag name\n\nPath: /repos/{owner}/{repo}/releases/tags/{tag}\n\nMethod: get"
  @spec get_release_by_tag(GitHubEx.Client.t()) :: result
  @spec get_release_by_tag(GitHubEx.Client.t(), map()) :: result
  def get_release_by_tag(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_release_by_tag},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"tag", :tag}],
      path_template: "/repos/{owner}/{repo}/releases/tags/{tag}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a repository rule suite\n\nPath: /repos/{owner}/{repo}/rulesets/rule-suites/{rule_suite_id}\n\nMethod: get"
  @spec get_repo_rule_suite(GitHubEx.Client.t()) :: result
  @spec get_repo_rule_suite(GitHubEx.Client.t(), map()) :: result
  def get_repo_rule_suite(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_repo_rule_suite},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"rule_suite_id", :rule_suite_id}],
      path_template: "/repos/{owner}/{repo}/rulesets/rule-suites/{rule_suite_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repository rule suites\n\nPath: /repos/{owner}/{repo}/rulesets/rule-suites\n\nMethod: get"
  @spec get_repo_rule_suites(GitHubEx.Client.t()) :: result
  @spec get_repo_rule_suites(GitHubEx.Client.t(), map()) :: result
  def get_repo_rule_suites(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_repo_rule_suites},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/rulesets/rule-suites",
      query: [
        {"ref", :ref},
        {"time_period", :time_period},
        {"actor_name", :actor_name},
        {"rule_suite_result", :rule_suite_result},
        {"per_page", :per_page},
        {"page", :page}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a repository ruleset\n\nPath: /repos/{owner}/{repo}/rulesets/{ruleset_id}\n\nMethod: get"
  @spec get_repo_ruleset(GitHubEx.Client.t()) :: result
  @spec get_repo_ruleset(GitHubEx.Client.t(), map()) :: result
  def get_repo_ruleset(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_repo_ruleset},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"ruleset_id", :ruleset_id}],
      path_template: "/repos/{owner}/{repo}/rulesets/{ruleset_id}",
      query: [{"includes_parents", :includes_parents}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get repository ruleset history\n\nPath: /repos/{owner}/{repo}/rulesets/{ruleset_id}/history\n\nMethod: get"
  @spec get_repo_ruleset_history(GitHubEx.Client.t()) :: result
  @spec get_repo_ruleset_history(GitHubEx.Client.t(), map()) :: result
  def get_repo_ruleset_history(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_repo_ruleset_history},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"ruleset_id", :ruleset_id}],
      path_template: "/repos/{owner}/{repo}/rulesets/{ruleset_id}/history",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get repository ruleset version\n\nPath: /repos/{owner}/{repo}/rulesets/{ruleset_id}/history/{version_id}\n\nMethod: get"
  @spec get_repo_ruleset_version(GitHubEx.Client.t()) :: result
  @spec get_repo_ruleset_version(GitHubEx.Client.t(), map()) :: result
  def get_repo_ruleset_version(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_repo_ruleset_version},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"ruleset_id", :ruleset_id},
        {"version_id", :version_id}
      ],
      path_template: "/repos/{owner}/{repo}/rulesets/{ruleset_id}/history/{version_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get all repository rulesets\n\nPath: /repos/{owner}/{repo}/rulesets\n\nMethod: get"
  @spec get_repo_rulesets(GitHubEx.Client.t()) :: result
  @spec get_repo_rulesets(GitHubEx.Client.t(), map()) :: result
  def get_repo_rulesets(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_repo_rulesets},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/rulesets",
      query: [
        {"per_page", :per_page},
        {"page", :page},
        {"includes_parents", :includes_parents},
        {"targets", :targets}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get status checks protection\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks\n\nMethod: get"
  @spec get_status_checks_protection(GitHubEx.Client.t()) :: result
  @spec get_status_checks_protection(GitHubEx.Client.t(), map()) :: result
  def get_status_checks_protection(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_status_checks_protection},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get teams with access to the protected branch\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/restrictions/teams\n\nMethod: get"
  @spec get_teams_with_access_to_protected_branch(GitHubEx.Client.t()) :: result
  @spec get_teams_with_access_to_protected_branch(GitHubEx.Client.t(), map()) :: result
  def get_teams_with_access_to_protected_branch(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_teams_with_access_to_protected_branch},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/teams",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get top referral paths\n\nPath: /repos/{owner}/{repo}/traffic/popular/paths\n\nMethod: get"
  @spec get_top_paths(GitHubEx.Client.t()) :: result
  @spec get_top_paths(GitHubEx.Client.t(), map()) :: result
  def get_top_paths(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_top_paths},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/traffic/popular/paths",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get top referral sources\n\nPath: /repos/{owner}/{repo}/traffic/popular/referrers\n\nMethod: get"
  @spec get_top_referrers(GitHubEx.Client.t()) :: result
  @spec get_top_referrers(GitHubEx.Client.t(), map()) :: result
  def get_top_referrers(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_top_referrers},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/traffic/popular/referrers",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get users with access to the protected branch\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/restrictions/users\n\nMethod: get"
  @spec get_users_with_access_to_protected_branch(GitHubEx.Client.t()) :: result
  @spec get_users_with_access_to_protected_branch(GitHubEx.Client.t(), map()) :: result
  def get_users_with_access_to_protected_branch(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_users_with_access_to_protected_branch},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/users",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get page views\n\nPath: /repos/{owner}/{repo}/traffic/views\n\nMethod: get"
  @spec get_views(GitHubEx.Client.t()) :: result
  @spec get_views(GitHubEx.Client.t(), map()) :: result
  def get_views(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_views},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/traffic/views",
      query: [{"per", :per}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a repository webhook\n\nPath: /repos/{owner}/{repo}/hooks/{hook_id}\n\nMethod: get"
  @spec get_webhook(GitHubEx.Client.t()) :: result
  @spec get_webhook(GitHubEx.Client.t(), map()) :: result
  def get_webhook(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_webhook},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"hook_id", :hook_id}],
      path_template: "/repos/{owner}/{repo}/hooks/{hook_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a webhook configuration for a repository\n\nPath: /repos/{owner}/{repo}/hooks/{hook_id}/config\n\nMethod: get"
  @spec get_webhook_config_for_repo(GitHubEx.Client.t()) :: result
  @spec get_webhook_config_for_repo(GitHubEx.Client.t(), map()) :: result
  def get_webhook_config_for_repo(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_webhook_config_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"hook_id", :hook_id}],
      path_template: "/repos/{owner}/{repo}/hooks/{hook_id}/config",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a delivery for a repository webhook\n\nPath: /repos/{owner}/{repo}/hooks/{hook_id}/deliveries/{delivery_id}\n\nMethod: get"
  @spec get_webhook_delivery(GitHubEx.Client.t()) :: result
  @spec get_webhook_delivery(GitHubEx.Client.t(), map()) :: result
  def get_webhook_delivery(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :get_webhook_delivery},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"hook_id", :hook_id},
        {"delivery_id", :delivery_id}
      ],
      path_template: "/repos/{owner}/{repo}/hooks/{hook_id}/deliveries/{delivery_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repository activities\n\nPath: /repos/{owner}/{repo}/activity\n\nMethod: get"
  @spec list_activities(GitHubEx.Client.t()) :: result
  @spec list_activities(GitHubEx.Client.t(), map()) :: result
  def list_activities(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_activities},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/activity",
      query: [
        {"direction", :direction},
        {"per_page", :per_page},
        {"before", :before},
        {"after", :after},
        {"ref", :ref},
        {"actor", :actor},
        {"time_period", :time_period},
        {"activity_type", :activity_type}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List attestations\n\nPath: /repos/{owner}/{repo}/attestations/{subject_digest}\n\nMethod: get"
  @spec list_attestations(GitHubEx.Client.t()) :: result
  @spec list_attestations(GitHubEx.Client.t(), map()) :: result
  def list_attestations(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_attestations},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"subject_digest", :subject_digest}],
      path_template: "/repos/{owner}/{repo}/attestations/{subject_digest}",
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

  @doc "Get all autolinks of a repository\n\nPath: /repos/{owner}/{repo}/autolinks\n\nMethod: get"
  @spec list_autolinks(GitHubEx.Client.t()) :: result
  @spec list_autolinks(GitHubEx.Client.t(), map()) :: result
  def list_autolinks(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_autolinks},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/autolinks",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List branches\n\nPath: /repos/{owner}/{repo}/branches\n\nMethod: get"
  @spec list_branches(GitHubEx.Client.t()) :: result
  @spec list_branches(GitHubEx.Client.t(), map()) :: result
  def list_branches(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_branches},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/branches",
      query: [{"protected", :protected}, {"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List branches for HEAD commit\n\nPath: /repos/{owner}/{repo}/commits/{commit_sha}/branches-where-head\n\nMethod: get"
  @spec list_branches_for_head_commit(GitHubEx.Client.t()) :: result
  @spec list_branches_for_head_commit(GitHubEx.Client.t(), map()) :: result
  def list_branches_for_head_commit(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_branches_for_head_commit},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"commit_sha", :commit_sha}],
      path_template: "/repos/{owner}/{repo}/commits/{commit_sha}/branches-where-head",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repository collaborators\n\nPath: /repos/{owner}/{repo}/collaborators\n\nMethod: get"
  @spec list_collaborators(GitHubEx.Client.t()) :: result
  @spec list_collaborators(GitHubEx.Client.t(), map()) :: result
  def list_collaborators(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_collaborators},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/collaborators",
      query: [
        {"affiliation", :affiliation},
        {"permission", :permission},
        {"per_page", :per_page},
        {"page", :page}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List commit comments\n\nPath: /repos/{owner}/{repo}/commits/{commit_sha}/comments\n\nMethod: get"
  @spec list_comments_for_commit(GitHubEx.Client.t()) :: result
  @spec list_comments_for_commit(GitHubEx.Client.t(), map()) :: result
  def list_comments_for_commit(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_comments_for_commit},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"commit_sha", :commit_sha}],
      path_template: "/repos/{owner}/{repo}/commits/{commit_sha}/comments",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List commit comments for a repository\n\nPath: /repos/{owner}/{repo}/comments\n\nMethod: get"
  @spec list_commit_comments_for_repo(GitHubEx.Client.t()) :: result
  @spec list_commit_comments_for_repo(GitHubEx.Client.t(), map()) :: result
  def list_commit_comments_for_repo(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_commit_comments_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/comments",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List commit statuses for a reference\n\nPath: /repos/{owner}/{repo}/commits/{ref}/statuses\n\nMethod: get"
  @spec list_commit_statuses_for_ref(GitHubEx.Client.t()) :: result
  @spec list_commit_statuses_for_ref(GitHubEx.Client.t(), map()) :: result
  def list_commit_statuses_for_ref(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_commit_statuses_for_ref},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"ref", :ref}],
      path_template: "/repos/{owner}/{repo}/commits/{ref}/statuses",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List commits\n\nPath: /repos/{owner}/{repo}/commits\n\nMethod: get"
  @spec list_commits(GitHubEx.Client.t()) :: result
  @spec list_commits(GitHubEx.Client.t(), map()) :: result
  def list_commits(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_commits},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/commits",
      query: [
        {"sha", :sha},
        {"path", :path},
        {"author", :author},
        {"committer", :committer},
        {"since", :since},
        {"until", :until},
        {"per_page", :per_page},
        {"page", :page}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repository contributors\n\nPath: /repos/{owner}/{repo}/contributors\n\nMethod: get"
  @spec list_contributors(GitHubEx.Client.t()) :: result
  @spec list_contributors(GitHubEx.Client.t(), map()) :: result
  def list_contributors(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_contributors},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/contributors",
      query: [{"anon", :anon}, {"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List custom deployment rule integrations available for an environment\n\nPath: /repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules/apps\n\nMethod: get"
  @spec list_custom_deployment_rule_integrations(GitHubEx.Client.t()) :: result
  @spec list_custom_deployment_rule_integrations(GitHubEx.Client.t(), map()) :: result
  def list_custom_deployment_rule_integrations(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_custom_deployment_rule_integrations},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"environment_name", :environment_name}, {"repo", :repo}, {"owner", :owner}],
      path_template:
        "/repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules/apps",
      query: [{"page", :page}, {"per_page", :per_page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List deploy keys\n\nPath: /repos/{owner}/{repo}/keys\n\nMethod: get"
  @spec list_deploy_keys(GitHubEx.Client.t()) :: result
  @spec list_deploy_keys(GitHubEx.Client.t(), map()) :: result
  def list_deploy_keys(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_deploy_keys},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/keys",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List deployment branch policies\n\nPath: /repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies\n\nMethod: get"
  @spec list_deployment_branch_policies(GitHubEx.Client.t()) :: result
  @spec list_deployment_branch_policies(GitHubEx.Client.t(), map()) :: result
  def list_deployment_branch_policies(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_deployment_branch_policies},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"environment_name", :environment_name}],
      path_template:
        "/repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List deployment statuses\n\nPath: /repos/{owner}/{repo}/deployments/{deployment_id}/statuses\n\nMethod: get"
  @spec list_deployment_statuses(GitHubEx.Client.t()) :: result
  @spec list_deployment_statuses(GitHubEx.Client.t(), map()) :: result
  def list_deployment_statuses(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_deployment_statuses},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"deployment_id", :deployment_id}],
      path_template: "/repos/{owner}/{repo}/deployments/{deployment_id}/statuses",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List deployments\n\nPath: /repos/{owner}/{repo}/deployments\n\nMethod: get"
  @spec list_deployments(GitHubEx.Client.t()) :: result
  @spec list_deployments(GitHubEx.Client.t(), map()) :: result
  def list_deployments(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_deployments},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/deployments",
      query: [
        {"sha", :sha},
        {"ref", :ref},
        {"task", :task},
        {"environment", :environment},
        {"per_page", :per_page},
        {"page", :page}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repositories for the authenticated user\n\nPath: /user/repos\n\nMethod: get"
  @spec list_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec list_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def list_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/user/repos",
      query: [
        {"visibility", :visibility},
        {"affiliation", :affiliation},
        {"type", :type},
        {"sort", :sort},
        {"direction", :direction},
        {"per_page", :per_page},
        {"page", :page},
        {"since", :since},
        {"before", :before}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List organization repositories\n\nPath: /orgs/{org}/repos\n\nMethod: get"
  @spec list_for_org(GitHubEx.Client.t()) :: result
  @spec list_for_org(GitHubEx.Client.t(), map()) :: result
  def list_for_org(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/repos",
      query: [
        {"type", :type},
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

  @doc "List repositories for a user\n\nPath: /users/{username}/repos\n\nMethod: get"
  @spec list_for_user(GitHubEx.Client.t()) :: result
  @spec list_for_user(GitHubEx.Client.t(), map()) :: result
  def list_for_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"username", :username}],
      path_template: "/users/{username}/repos",
      query: [
        {"type", :type},
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

  @doc "List forks\n\nPath: /repos/{owner}/{repo}/forks\n\nMethod: get"
  @spec list_forks(GitHubEx.Client.t()) :: result
  @spec list_forks(GitHubEx.Client.t(), map()) :: result
  def list_forks(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_forks},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/forks",
      query: [{"sort", :sort}, {"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repository invitations\n\nPath: /repos/{owner}/{repo}/invitations\n\nMethod: get"
  @spec list_invitations(GitHubEx.Client.t()) :: result
  @spec list_invitations(GitHubEx.Client.t(), map()) :: result
  def list_invitations(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_invitations},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/invitations",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repository invitations for the authenticated user\n\nPath: /user/repository_invitations\n\nMethod: get"
  @spec list_invitations_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec list_invitations_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def list_invitations_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_invitations_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/user/repository_invitations",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repository languages\n\nPath: /repos/{owner}/{repo}/languages\n\nMethod: get"
  @spec list_languages(GitHubEx.Client.t()) :: result
  @spec list_languages(GitHubEx.Client.t(), map()) :: result
  def list_languages(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_languages},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/languages",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List GitHub Pages builds\n\nPath: /repos/{owner}/{repo}/pages/builds\n\nMethod: get"
  @spec list_pages_builds(GitHubEx.Client.t()) :: result
  @spec list_pages_builds(GitHubEx.Client.t(), map()) :: result
  def list_pages_builds(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_pages_builds},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/pages/builds",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List public repositories\n\nPath: /repositories\n\nMethod: get"
  @spec list_public(GitHubEx.Client.t()) :: result
  @spec list_public(GitHubEx.Client.t(), map()) :: result
  def list_public(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_public},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/repositories",
      query: [{"since", :since}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List pull requests associated with a commit\n\nPath: /repos/{owner}/{repo}/commits/{commit_sha}/pulls\n\nMethod: get"
  @spec list_pull_requests_associated_with_commit(GitHubEx.Client.t()) :: result
  @spec list_pull_requests_associated_with_commit(GitHubEx.Client.t(), map()) :: result
  def list_pull_requests_associated_with_commit(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_pull_requests_associated_with_commit},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"commit_sha", :commit_sha}],
      path_template: "/repos/{owner}/{repo}/commits/{commit_sha}/pulls",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List release assets\n\nPath: /repos/{owner}/{repo}/releases/{release_id}/assets\n\nMethod: get"
  @spec list_release_assets(GitHubEx.Client.t()) :: result
  @spec list_release_assets(GitHubEx.Client.t(), map()) :: result
  def list_release_assets(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_release_assets},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"release_id", :release_id}],
      path_template: "/repos/{owner}/{repo}/releases/{release_id}/assets",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List releases\n\nPath: /repos/{owner}/{repo}/releases\n\nMethod: get"
  @spec list_releases(GitHubEx.Client.t()) :: result
  @spec list_releases(GitHubEx.Client.t(), map()) :: result
  def list_releases(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_releases},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/releases",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repository tags\n\nPath: /repos/{owner}/{repo}/tags\n\nMethod: get"
  @spec list_tags(GitHubEx.Client.t()) :: result
  @spec list_tags(GitHubEx.Client.t(), map()) :: result
  def list_tags(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_tags},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/tags",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repository teams\n\nPath: /repos/{owner}/{repo}/teams\n\nMethod: get"
  @spec list_teams(GitHubEx.Client.t()) :: result
  @spec list_teams(GitHubEx.Client.t(), map()) :: result
  def list_teams(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_teams},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/teams",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List deliveries for a repository webhook\n\nPath: /repos/{owner}/{repo}/hooks/{hook_id}/deliveries\n\nMethod: get"
  @spec list_webhook_deliveries(GitHubEx.Client.t()) :: result
  @spec list_webhook_deliveries(GitHubEx.Client.t(), map()) :: result
  def list_webhook_deliveries(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_webhook_deliveries},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"hook_id", :hook_id}],
      path_template: "/repos/{owner}/{repo}/hooks/{hook_id}/deliveries",
      query: [{"per_page", :per_page}, {"cursor", :cursor}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repository webhooks\n\nPath: /repos/{owner}/{repo}/hooks\n\nMethod: get"
  @spec list_webhooks(GitHubEx.Client.t()) :: result
  @spec list_webhooks(GitHubEx.Client.t(), map()) :: result
  def list_webhooks(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :list_webhooks},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/hooks",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Merge a branch\n\nPath: /repos/{owner}/{repo}/merges\n\nMethod: post"
  @spec merge(GitHubEx.Client.t()) :: result
  @spec merge(GitHubEx.Client.t(), map()) :: result
  def merge(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :merge},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/merges",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Sync a fork branch with the upstream repository\n\nPath: /repos/{owner}/{repo}/merge-upstream\n\nMethod: post"
  @spec merge_upstream(GitHubEx.Client.t()) :: result
  @spec merge_upstream(GitHubEx.Client.t(), map()) :: result
  def merge_upstream(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :merge_upstream},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/merge-upstream",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Ping a repository webhook\n\nPath: /repos/{owner}/{repo}/hooks/{hook_id}/pings\n\nMethod: post"
  @spec ping_webhook(GitHubEx.Client.t()) :: result
  @spec ping_webhook(GitHubEx.Client.t(), map()) :: result
  def ping_webhook(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :ping_webhook},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"hook_id", :hook_id}],
      path_template: "/repos/{owner}/{repo}/hooks/{hook_id}/pings",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Redeliver a delivery for a repository webhook\n\nPath: /repos/{owner}/{repo}/hooks/{hook_id}/deliveries/{delivery_id}/attempts\n\nMethod: post"
  @spec redeliver_webhook_delivery(GitHubEx.Client.t()) :: result
  @spec redeliver_webhook_delivery(GitHubEx.Client.t(), map()) :: result
  def redeliver_webhook_delivery(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :redeliver_webhook_delivery},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"hook_id", :hook_id},
        {"delivery_id", :delivery_id}
      ],
      path_template: "/repos/{owner}/{repo}/hooks/{hook_id}/deliveries/{delivery_id}/attempts",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Remove app access restrictions\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/restrictions/apps\n\nMethod: delete"
  @spec remove_app_access_restrictions(GitHubEx.Client.t()) :: result
  @spec remove_app_access_restrictions(GitHubEx.Client.t(), map()) :: result
  def remove_app_access_restrictions(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :remove_app_access_restrictions},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/apps",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove a repository collaborator\n\nPath: /repos/{owner}/{repo}/collaborators/{username}\n\nMethod: delete"
  @spec remove_collaborator(GitHubEx.Client.t()) :: result
  @spec remove_collaborator(GitHubEx.Client.t(), map()) :: result
  def remove_collaborator(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :remove_collaborator},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"username", :username}],
      path_template: "/repos/{owner}/{repo}/collaborators/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove status check contexts\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks/contexts\n\nMethod: delete"
  @spec remove_status_check_contexts(GitHubEx.Client.t()) :: result
  @spec remove_status_check_contexts(GitHubEx.Client.t(), map()) :: result
  def remove_status_check_contexts(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :remove_status_check_contexts},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template:
        "/repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks/contexts",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove status check protection\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks\n\nMethod: delete"
  @spec remove_status_check_protection(GitHubEx.Client.t()) :: result
  @spec remove_status_check_protection(GitHubEx.Client.t(), map()) :: result
  def remove_status_check_protection(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :remove_status_check_protection},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove team access restrictions\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/restrictions/teams\n\nMethod: delete"
  @spec remove_team_access_restrictions(GitHubEx.Client.t()) :: result
  @spec remove_team_access_restrictions(GitHubEx.Client.t(), map()) :: result
  def remove_team_access_restrictions(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :remove_team_access_restrictions},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/teams",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove user access restrictions\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/restrictions/users\n\nMethod: delete"
  @spec remove_user_access_restrictions(GitHubEx.Client.t()) :: result
  @spec remove_user_access_restrictions(GitHubEx.Client.t(), map()) :: result
  def remove_user_access_restrictions(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :remove_user_access_restrictions},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/users",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Rename a branch\n\nPath: /repos/{owner}/{repo}/branches/{branch}/rename\n\nMethod: post"
  @spec rename_branch(GitHubEx.Client.t()) :: result
  @spec rename_branch(GitHubEx.Client.t(), map()) :: result
  def rename_branch(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :rename_branch},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template: "/repos/{owner}/{repo}/branches/{branch}/rename",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Replace all repository topics\n\nPath: /repos/{owner}/{repo}/topics\n\nMethod: put"
  @spec replace_all_topics(GitHubEx.Client.t()) :: result
  @spec replace_all_topics(GitHubEx.Client.t(), map()) :: result
  def replace_all_topics(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :replace_all_topics},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/topics",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Request a GitHub Pages build\n\nPath: /repos/{owner}/{repo}/pages/builds\n\nMethod: post"
  @spec request_pages_build(GitHubEx.Client.t()) :: result
  @spec request_pages_build(GitHubEx.Client.t(), map()) :: result
  def request_pages_build(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :request_pages_build},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/pages/builds",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set admin branch protection\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/enforce_admins\n\nMethod: post"
  @spec set_admin_branch_protection(GitHubEx.Client.t()) :: result
  @spec set_admin_branch_protection(GitHubEx.Client.t(), map()) :: result
  def set_admin_branch_protection(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :set_admin_branch_protection},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/enforce_admins",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set app access restrictions\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/restrictions/apps\n\nMethod: put"
  @spec set_app_access_restrictions(GitHubEx.Client.t()) :: result
  @spec set_app_access_restrictions(GitHubEx.Client.t(), map()) :: result
  def set_app_access_restrictions(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :set_app_access_restrictions},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/apps",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set status check contexts\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks/contexts\n\nMethod: put"
  @spec set_status_check_contexts(GitHubEx.Client.t()) :: result
  @spec set_status_check_contexts(GitHubEx.Client.t(), map()) :: result
  def set_status_check_contexts(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :set_status_check_contexts},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template:
        "/repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks/contexts",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set team access restrictions\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/restrictions/teams\n\nMethod: put"
  @spec set_team_access_restrictions(GitHubEx.Client.t()) :: result
  @spec set_team_access_restrictions(GitHubEx.Client.t(), map()) :: result
  def set_team_access_restrictions(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :set_team_access_restrictions},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/teams",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set user access restrictions\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/restrictions/users\n\nMethod: put"
  @spec set_user_access_restrictions(GitHubEx.Client.t()) :: result
  @spec set_user_access_restrictions(GitHubEx.Client.t(), map()) :: result
  def set_user_access_restrictions(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :set_user_access_restrictions},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/restrictions/users",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Test the push repository webhook\n\nPath: /repos/{owner}/{repo}/hooks/{hook_id}/tests\n\nMethod: post"
  @spec test_push_webhook(GitHubEx.Client.t()) :: result
  @spec test_push_webhook(GitHubEx.Client.t(), map()) :: result
  def test_push_webhook(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Repos, :test_push_webhook},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"hook_id", :hook_id}],
      path_template: "/repos/{owner}/{repo}/hooks/{hook_id}/tests",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Transfer a repository\n\nPath: /repos/{owner}/{repo}/transfer\n\nMethod: post"
  @spec transfer(GitHubEx.Client.t()) :: result
  @spec transfer(GitHubEx.Client.t(), map()) :: result
  def transfer(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :transfer},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/transfer",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update a repository\n\nPath: /repos/{owner}/{repo}\n\nMethod: patch"
  @spec update(GitHubEx.Client.t()) :: result
  @spec update(GitHubEx.Client.t(), map()) :: result
  def update(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :update},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update branch protection\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection\n\nMethod: put"
  @spec update_branch_protection(GitHubEx.Client.t()) :: result
  @spec update_branch_protection(GitHubEx.Client.t(), map()) :: result
  def update_branch_protection(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :update_branch_protection},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update a commit comment\n\nPath: /repos/{owner}/{repo}/comments/{comment_id}\n\nMethod: patch"
  @spec update_commit_comment(GitHubEx.Client.t()) :: result
  @spec update_commit_comment(GitHubEx.Client.t(), map()) :: result
  def update_commit_comment(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :update_commit_comment},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"owner", :owner}, {"repo", :repo}, {"comment_id", :comment_id}],
      path_template: "/repos/{owner}/{repo}/comments/{comment_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update a deployment branch policy\n\nPath: /repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies/{branch_policy_id}\n\nMethod: put"
  @spec update_deployment_branch_policy(GitHubEx.Client.t()) :: result
  @spec update_deployment_branch_policy(GitHubEx.Client.t(), map()) :: result
  def update_deployment_branch_policy(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :update_deployment_branch_policy},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"environment_name", :environment_name},
        {"branch_policy_id", :branch_policy_id}
      ],
      path_template:
        "/repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies/{branch_policy_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update information about a GitHub Pages site\n\nPath: /repos/{owner}/{repo}/pages\n\nMethod: put"
  @spec update_information_about_pages_site(GitHubEx.Client.t()) :: result
  @spec update_information_about_pages_site(GitHubEx.Client.t(), map()) :: result
  def update_information_about_pages_site(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :update_information_about_pages_site},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/pages",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update a repository invitation\n\nPath: /repos/{owner}/{repo}/invitations/{invitation_id}\n\nMethod: patch"
  @spec update_invitation(GitHubEx.Client.t()) :: result
  @spec update_invitation(GitHubEx.Client.t(), map()) :: result
  def update_invitation(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :update_invitation},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"owner", :owner}, {"repo", :repo}, {"invitation_id", :invitation_id}],
      path_template: "/repos/{owner}/{repo}/invitations/{invitation_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update an organization repository ruleset\n\nPath: /orgs/{org}/rulesets/{ruleset_id}\n\nMethod: put"
  @spec update_org_ruleset(GitHubEx.Client.t()) :: result
  @spec update_org_ruleset(GitHubEx.Client.t(), map()) :: result
  def update_org_ruleset(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :update_org_ruleset},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"ruleset_id", :ruleset_id}],
      path_template: "/orgs/{org}/rulesets/{ruleset_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update pull request review protection\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/required_pull_request_reviews\n\nMethod: patch"
  @spec update_pull_request_review_protection(GitHubEx.Client.t()) :: result
  @spec update_pull_request_review_protection(GitHubEx.Client.t(), map()) :: result
  def update_pull_request_review_protection(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :update_pull_request_review_protection},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template:
        "/repos/{owner}/{repo}/branches/{branch}/protection/required_pull_request_reviews",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update a release\n\nPath: /repos/{owner}/{repo}/releases/{release_id}\n\nMethod: patch"
  @spec update_release(GitHubEx.Client.t()) :: result
  @spec update_release(GitHubEx.Client.t(), map()) :: result
  def update_release(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :update_release},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"owner", :owner}, {"repo", :repo}, {"release_id", :release_id}],
      path_template: "/repos/{owner}/{repo}/releases/{release_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update a release asset\n\nPath: /repos/{owner}/{repo}/releases/assets/{asset_id}\n\nMethod: patch"
  @spec update_release_asset(GitHubEx.Client.t()) :: result
  @spec update_release_asset(GitHubEx.Client.t(), map()) :: result
  def update_release_asset(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :update_release_asset},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"owner", :owner}, {"repo", :repo}, {"asset_id", :asset_id}],
      path_template: "/repos/{owner}/{repo}/releases/assets/{asset_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update a repository ruleset\n\nPath: /repos/{owner}/{repo}/rulesets/{ruleset_id}\n\nMethod: put"
  @spec update_repo_ruleset(GitHubEx.Client.t()) :: result
  @spec update_repo_ruleset(GitHubEx.Client.t(), map()) :: result
  def update_repo_ruleset(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :update_repo_ruleset},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}, {"ruleset_id", :ruleset_id}],
      path_template: "/repos/{owner}/{repo}/rulesets/{ruleset_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update status check protection\n\nPath: /repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks\n\nMethod: patch"
  @spec update_status_check_protection(GitHubEx.Client.t()) :: result
  @spec update_status_check_protection(GitHubEx.Client.t(), map()) :: result
  def update_status_check_protection(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :update_status_check_protection},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"owner", :owner}, {"repo", :repo}, {"branch", :branch}],
      path_template: "/repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update a repository webhook\n\nPath: /repos/{owner}/{repo}/hooks/{hook_id}\n\nMethod: patch"
  @spec update_webhook(GitHubEx.Client.t()) :: result
  @spec update_webhook(GitHubEx.Client.t(), map()) :: result
  def update_webhook(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :update_webhook},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"owner", :owner}, {"repo", :repo}, {"hook_id", :hook_id}],
      path_template: "/repos/{owner}/{repo}/hooks/{hook_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update a webhook configuration for a repository\n\nPath: /repos/{owner}/{repo}/hooks/{hook_id}/config\n\nMethod: patch"
  @spec update_webhook_config_for_repo(GitHubEx.Client.t()) :: result
  @spec update_webhook_config_for_repo(GitHubEx.Client.t(), map()) :: result
  def update_webhook_config_for_repo(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Repos, :update_webhook_config_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"owner", :owner}, {"repo", :repo}, {"hook_id", :hook_id}],
      path_template: "/repos/{owner}/{repo}/hooks/{hook_id}/config",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Upload a release asset\n\nPath: /repos/{owner}/{repo}/releases/{release_id}/assets\n\nMethod: post"
  @spec upload_release_asset(GitHubEx.Client.t()) :: result
  @spec upload_release_asset(GitHubEx.Client.t(), map()) :: result
  def upload_release_asset(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: {:key, {"body", :body}},
      call: {GitHubEx.Repos, :upload_release_asset},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"release_id", :release_id}],
      path_template: "/repos/{owner}/{repo}/releases/{release_id}/assets",
      query: [{"name", :name}, {"label", :label}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

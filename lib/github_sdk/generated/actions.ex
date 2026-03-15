defmodule GitHubSDK.Actions do
  @moduledoc """
  Generated GitHub REST operations for the `Actions` namespace.

  ## Operations

  * `actions/get-actions-cache-retention-limit-for-enterprise`
  * `actions/set-actions-cache-retention-limit-for-enterprise`
  * `actions/get-actions-cache-storage-limit-for-enterprise`
  * `actions/set-actions-cache-storage-limit-for-enterprise`
  * `actions/get-actions-cache-retention-limit-for-organization`
  * `actions/set-actions-cache-retention-limit-for-organization`
  * `actions/get-actions-cache-storage-limit-for-organization`
  * `actions/set-actions-cache-storage-limit-for-organization`
  * `actions/get-actions-cache-usage-for-org`
  * `actions/get-actions-cache-usage-by-repo-for-org`
  * `actions/create-hosted-runner-for-org`
  * `actions/list-hosted-runners-for-org`
  * `actions/list-custom-images-for-org`
  * `actions/delete-custom-image-from-org`
  * `actions/get-custom-image-for-org`
  * `actions/list-custom-image-versions-for-org`
  * `actions/delete-custom-image-version-from-org`
  * `actions/get-custom-image-version-for-org`
  * `actions/get-hosted-runners-github-owned-images-for-org`
  * `actions/get-hosted-runners-partner-images-for-org`
  * `actions/get-hosted-runners-limits-for-org`
  * `actions/get-hosted-runners-machine-specs-for-org`
  * `actions/get-hosted-runners-platforms-for-org`
  * `actions/delete-hosted-runner-for-org`
  * `actions/get-hosted-runner-for-org`
  * `actions/update-hosted-runner-for-org`
  * `actions/get-github-actions-permissions-organization`
  * `actions/set-github-actions-permissions-organization`
  * `actions/get-artifact-and-log-retention-settings-organization`
  * `actions/set-artifact-and-log-retention-settings-organization`
  * `actions/get-fork-pr-contributor-approval-permissions-organization`
  * `actions/set-fork-pr-contributor-approval-permissions-organization`
  * `actions/get-private-repo-fork-pr-workflows-settings-organization`
  * `actions/set-private-repo-fork-pr-workflows-settings-organization`
  * `actions/list-selected-repositories-enabled-github-actions-organization`
  * `actions/set-selected-repositories-enabled-github-actions-organization`
  * `actions/disable-selected-repository-github-actions-organization`
  * `actions/enable-selected-repository-github-actions-organization`
  * `actions/get-allowed-actions-organization`
  * `actions/set-allowed-actions-organization`
  * `actions/get-self-hosted-runners-permissions-organization`
  * `actions/set-self-hosted-runners-permissions-organization`
  * `actions/list-selected-repositories-self-hosted-runners-organization`
  * `actions/set-selected-repositories-self-hosted-runners-organization`
  * `actions/disable-selected-repository-self-hosted-runners-organization`
  * `actions/enable-selected-repository-self-hosted-runners-organization`
  * `actions/get-github-actions-default-workflow-permissions-organization`
  * `actions/set-github-actions-default-workflow-permissions-organization`
  * `actions/create-self-hosted-runner-group-for-org`
  * `actions/list-self-hosted-runner-groups-for-org`
  * `actions/delete-self-hosted-runner-group-from-org`
  * `actions/get-self-hosted-runner-group-for-org`
  * `actions/update-self-hosted-runner-group-for-org`
  * `actions/list-github-hosted-runners-in-group-for-org`
  * `actions/list-repo-access-to-self-hosted-runner-group-in-org`
  * `actions/set-repo-access-to-self-hosted-runner-group-in-org`
  * `actions/add-repo-access-to-self-hosted-runner-group-in-org`
  * `actions/remove-repo-access-to-self-hosted-runner-group-in-org`
  * `actions/list-self-hosted-runners-in-group-for-org`
  * `actions/set-self-hosted-runners-in-group-for-org`
  * `actions/add-self-hosted-runner-to-group-for-org`
  * `actions/remove-self-hosted-runner-from-group-for-org`
  * `actions/list-self-hosted-runners-for-org`
  * `actions/list-runner-applications-for-org`
  * `actions/generate-runner-jitconfig-for-org`
  * `actions/create-registration-token-for-org`
  * `actions/create-remove-token-for-org`
  * `actions/delete-self-hosted-runner-from-org`
  * `actions/get-self-hosted-runner-for-org`
  * `actions/add-custom-labels-to-self-hosted-runner-for-org`
  * `actions/list-labels-for-self-hosted-runner-for-org`
  * `actions/remove-all-custom-labels-from-self-hosted-runner-for-org`
  * `actions/set-custom-labels-for-self-hosted-runner-for-org`
  * `actions/remove-custom-label-from-self-hosted-runner-for-org`
  * `actions/list-org-secrets`
  * `actions/get-org-public-key`
  * `actions/create-or-update-org-secret`
  * `actions/delete-org-secret`
  * `actions/get-org-secret`
  * `actions/list-selected-repos-for-org-secret`
  * `actions/set-selected-repos-for-org-secret`
  * `actions/add-selected-repo-to-org-secret`
  * `actions/remove-selected-repo-from-org-secret`
  * `actions/create-org-variable`
  * `actions/list-org-variables`
  * `actions/delete-org-variable`
  * `actions/get-org-variable`
  * `actions/update-org-variable`
  * `actions/list-selected-repos-for-org-variable`
  * `actions/set-selected-repos-for-org-variable`
  * `actions/add-selected-repo-to-org-variable`
  * `actions/remove-selected-repo-from-org-variable`
  * `actions/list-artifacts-for-repo`
  * `actions/delete-artifact`
  * `actions/get-artifact`
  * `actions/download-artifact`
  * `actions/get-actions-cache-retention-limit-for-repository`
  * `actions/set-actions-cache-retention-limit-for-repository`
  * `actions/get-actions-cache-storage-limit-for-repository`
  * `actions/set-actions-cache-storage-limit-for-repository`
  * `actions/get-actions-cache-usage`
  * `actions/delete-actions-cache-by-key`
  * `actions/get-actions-cache-list`
  * `actions/delete-actions-cache-by-id`
  * `actions/get-job-for-workflow-run`
  * `actions/download-job-logs-for-workflow-run`
  * `actions/re-run-job-for-workflow-run`
  * `actions/get-custom-oidc-sub-claim-for-repo`
  * `actions/set-custom-oidc-sub-claim-for-repo`
  * `actions/list-repo-organization-secrets`
  * `actions/list-repo-organization-variables`
  * `actions/get-github-actions-permissions-repository`
  * `actions/set-github-actions-permissions-repository`
  * `actions/get-workflow-access-to-repository`
  * `actions/set-workflow-access-to-repository`
  * `actions/get-artifact-and-log-retention-settings-repository`
  * `actions/set-artifact-and-log-retention-settings-repository`
  * `actions/get-fork-pr-contributor-approval-permissions-repository`
  * `actions/set-fork-pr-contributor-approval-permissions-repository`
  * `actions/get-private-repo-fork-pr-workflows-settings-repository`
  * `actions/set-private-repo-fork-pr-workflows-settings-repository`
  * `actions/get-allowed-actions-repository`
  * `actions/set-allowed-actions-repository`
  * `actions/get-github-actions-default-workflow-permissions-repository`
  * `actions/set-github-actions-default-workflow-permissions-repository`
  * `actions/list-self-hosted-runners-for-repo`
  * `actions/list-runner-applications-for-repo`
  * `actions/generate-runner-jitconfig-for-repo`
  * `actions/create-registration-token-for-repo`
  * `actions/create-remove-token-for-repo`
  * `actions/delete-self-hosted-runner-from-repo`
  * `actions/get-self-hosted-runner-for-repo`
  * `actions/add-custom-labels-to-self-hosted-runner-for-repo`
  * `actions/list-labels-for-self-hosted-runner-for-repo`
  * `actions/remove-all-custom-labels-from-self-hosted-runner-for-repo`
  * `actions/set-custom-labels-for-self-hosted-runner-for-repo`
  * `actions/remove-custom-label-from-self-hosted-runner-for-repo`
  * `actions/list-workflow-runs-for-repo`
  * `actions/delete-workflow-run`
  * `actions/get-workflow-run`
  * `actions/get-reviews-for-run`
  * `actions/approve-workflow-run`
  * `actions/list-workflow-run-artifacts`
  * `actions/get-workflow-run-attempt`
  * `actions/list-jobs-for-workflow-run-attempt`
  * `actions/download-workflow-run-attempt-logs`
  * `actions/cancel-workflow-run`
  * `actions/review-custom-gates-for-run`
  * `actions/force-cancel-workflow-run`
  * `actions/list-jobs-for-workflow-run`
  * `actions/delete-workflow-run-logs`
  * `actions/download-workflow-run-logs`
  * `actions/get-pending-deployments-for-run`
  * `actions/review-pending-deployments-for-run`
  * `actions/re-run-workflow`
  * `actions/re-run-workflow-failed-jobs`
  * `actions/get-workflow-run-usage`
  * `actions/list-repo-secrets`
  * `actions/get-repo-public-key`
  * `actions/create-or-update-repo-secret`
  * `actions/delete-repo-secret`
  * `actions/get-repo-secret`
  * `actions/create-repo-variable`
  * `actions/list-repo-variables`
  * `actions/delete-repo-variable`
  * `actions/get-repo-variable`
  * `actions/update-repo-variable`
  * `actions/list-repo-workflows`
  * `actions/get-workflow`
  * `actions/disable-workflow`
  * `actions/create-workflow-dispatch`
  * `actions/enable-workflow`
  * `actions/list-workflow-runs`
  * `actions/get-workflow-usage`
  * `actions/list-environment-secrets`
  * `actions/get-environment-public-key`
  * `actions/create-or-update-environment-secret`
  * `actions/delete-environment-secret`
  * `actions/get-environment-secret`
  * `actions/create-environment-variable`
  * `actions/list-environment-variables`
  * `actions/delete-environment-variable`
  * `actions/get-environment-variable`
  * `actions/update-environment-variable`
  """

  @type result :: {:ok, term()} | {:error, GitHubSDK.Error.t()}

  @doc "Add custom labels to a self-hosted runner for an organization\n\nPath: /orgs/{org}/actions/runners/{runner_id}/labels\n\nMethod: post"
  @spec add_custom_labels_to_self_hosted_runner_for_org(GitHubSDK.Client.t()) :: result
  @spec add_custom_labels_to_self_hosted_runner_for_org(GitHubSDK.Client.t(), map()) :: result
  def add_custom_labels_to_self_hosted_runner_for_org(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :add_custom_labels_to_self_hosted_runner_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}, {"runner_id", :runner_id}],
      path_template: "/orgs/{org}/actions/runners/{runner_id}/labels",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Add custom labels to a self-hosted runner for a repository\n\nPath: /repos/{owner}/{repo}/actions/runners/{runner_id}/labels\n\nMethod: post"
  @spec add_custom_labels_to_self_hosted_runner_for_repo(GitHubSDK.Client.t()) :: result
  @spec add_custom_labels_to_self_hosted_runner_for_repo(GitHubSDK.Client.t(), map()) :: result
  def add_custom_labels_to_self_hosted_runner_for_repo(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :add_custom_labels_to_self_hosted_runner_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"runner_id", :runner_id}],
      path_template: "/repos/{owner}/{repo}/actions/runners/{runner_id}/labels",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Add repository access to a self-hosted runner group in an organization\n\nPath: /orgs/{org}/actions/runner-groups/{runner_group_id}/repositories/{repository_id}\n\nMethod: put"
  @spec add_repo_access_to_self_hosted_runner_group_in_org(GitHubSDK.Client.t()) :: result
  @spec add_repo_access_to_self_hosted_runner_group_in_org(GitHubSDK.Client.t(), map()) :: result
  def add_repo_access_to_self_hosted_runner_group_in_org(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :add_repo_access_to_self_hosted_runner_group_in_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [
        {"org", :org},
        {"runner_group_id", :runner_group_id},
        {"repository_id", :repository_id}
      ],
      path_template:
        "/orgs/{org}/actions/runner-groups/{runner_group_id}/repositories/{repository_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Add selected repository to an organization secret\n\nPath: /orgs/{org}/actions/secrets/{secret_name}/repositories/{repository_id}\n\nMethod: put"
  @spec add_selected_repo_to_org_secret(GitHubSDK.Client.t()) :: result
  @spec add_selected_repo_to_org_secret(GitHubSDK.Client.t(), map()) :: result
  def add_selected_repo_to_org_secret(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :add_selected_repo_to_org_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"secret_name", :secret_name}, {"repository_id", :repository_id}],
      path_template: "/orgs/{org}/actions/secrets/{secret_name}/repositories/{repository_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Add selected repository to an organization variable\n\nPath: /orgs/{org}/actions/variables/{name}/repositories/{repository_id}\n\nMethod: put"
  @spec add_selected_repo_to_org_variable(GitHubSDK.Client.t()) :: result
  @spec add_selected_repo_to_org_variable(GitHubSDK.Client.t(), map()) :: result
  def add_selected_repo_to_org_variable(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :add_selected_repo_to_org_variable},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"name", :name}, {"repository_id", :repository_id}],
      path_template: "/orgs/{org}/actions/variables/{name}/repositories/{repository_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Add a self-hosted runner to a group for an organization\n\nPath: /orgs/{org}/actions/runner-groups/{runner_group_id}/runners/{runner_id}\n\nMethod: put"
  @spec add_self_hosted_runner_to_group_for_org(GitHubSDK.Client.t()) :: result
  @spec add_self_hosted_runner_to_group_for_org(GitHubSDK.Client.t(), map()) :: result
  def add_self_hosted_runner_to_group_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :add_self_hosted_runner_to_group_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"runner_group_id", :runner_group_id}, {"runner_id", :runner_id}],
      path_template: "/orgs/{org}/actions/runner-groups/{runner_group_id}/runners/{runner_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Approve a workflow run for a fork pull request\n\nPath: /repos/{owner}/{repo}/actions/runs/{run_id}/approve\n\nMethod: post"
  @spec approve_workflow_run(GitHubSDK.Client.t()) :: result
  @spec approve_workflow_run(GitHubSDK.Client.t(), map()) :: result
  def approve_workflow_run(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :approve_workflow_run},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/approve",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Cancel a workflow run\n\nPath: /repos/{owner}/{repo}/actions/runs/{run_id}/cancel\n\nMethod: post"
  @spec cancel_workflow_run(GitHubSDK.Client.t()) :: result
  @spec cancel_workflow_run(GitHubSDK.Client.t(), map()) :: result
  def cancel_workflow_run(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :cancel_workflow_run},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/cancel",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create an environment variable\n\nPath: /repos/{owner}/{repo}/environments/{environment_name}/variables\n\nMethod: post"
  @spec create_environment_variable(GitHubSDK.Client.t()) :: result
  @spec create_environment_variable(GitHubSDK.Client.t(), map()) :: result
  def create_environment_variable(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :create_environment_variable},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"environment_name", :environment_name}],
      path_template: "/repos/{owner}/{repo}/environments/{environment_name}/variables",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a GitHub-hosted runner for an organization\n\nPath: /orgs/{org}/actions/hosted-runners\n\nMethod: post"
  @spec create_hosted_runner_for_org(GitHubSDK.Client.t()) :: result
  @spec create_hosted_runner_for_org(GitHubSDK.Client.t(), map()) :: result
  def create_hosted_runner_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :create_hosted_runner_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/hosted-runners",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create or update an environment secret\n\nPath: /repos/{owner}/{repo}/environments/{environment_name}/secrets/{secret_name}\n\nMethod: put"
  @spec create_or_update_environment_secret(GitHubSDK.Client.t()) :: result
  @spec create_or_update_environment_secret(GitHubSDK.Client.t(), map()) :: result
  def create_or_update_environment_secret(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :create_or_update_environment_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"environment_name", :environment_name},
        {"secret_name", :secret_name}
      ],
      path_template:
        "/repos/{owner}/{repo}/environments/{environment_name}/secrets/{secret_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create or update an organization secret\n\nPath: /orgs/{org}/actions/secrets/{secret_name}\n\nMethod: put"
  @spec create_or_update_org_secret(GitHubSDK.Client.t()) :: result
  @spec create_or_update_org_secret(GitHubSDK.Client.t(), map()) :: result
  def create_or_update_org_secret(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :create_or_update_org_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"secret_name", :secret_name}],
      path_template: "/orgs/{org}/actions/secrets/{secret_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create or update a repository secret\n\nPath: /repos/{owner}/{repo}/actions/secrets/{secret_name}\n\nMethod: put"
  @spec create_or_update_repo_secret(GitHubSDK.Client.t()) :: result
  @spec create_or_update_repo_secret(GitHubSDK.Client.t(), map()) :: result
  def create_or_update_repo_secret(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :create_or_update_repo_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}, {"secret_name", :secret_name}],
      path_template: "/repos/{owner}/{repo}/actions/secrets/{secret_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create an organization variable\n\nPath: /orgs/{org}/actions/variables\n\nMethod: post"
  @spec create_org_variable(GitHubSDK.Client.t()) :: result
  @spec create_org_variable(GitHubSDK.Client.t(), map()) :: result
  def create_org_variable(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :create_org_variable},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/variables",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a registration token for an organization\n\nPath: /orgs/{org}/actions/runners/registration-token\n\nMethod: post"
  @spec create_registration_token_for_org(GitHubSDK.Client.t()) :: result
  @spec create_registration_token_for_org(GitHubSDK.Client.t(), map()) :: result
  def create_registration_token_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :create_registration_token_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/runners/registration-token",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a registration token for a repository\n\nPath: /repos/{owner}/{repo}/actions/runners/registration-token\n\nMethod: post"
  @spec create_registration_token_for_repo(GitHubSDK.Client.t()) :: result
  @spec create_registration_token_for_repo(GitHubSDK.Client.t(), map()) :: result
  def create_registration_token_for_repo(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :create_registration_token_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/runners/registration-token",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a remove token for an organization\n\nPath: /orgs/{org}/actions/runners/remove-token\n\nMethod: post"
  @spec create_remove_token_for_org(GitHubSDK.Client.t()) :: result
  @spec create_remove_token_for_org(GitHubSDK.Client.t(), map()) :: result
  def create_remove_token_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :create_remove_token_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/runners/remove-token",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a remove token for a repository\n\nPath: /repos/{owner}/{repo}/actions/runners/remove-token\n\nMethod: post"
  @spec create_remove_token_for_repo(GitHubSDK.Client.t()) :: result
  @spec create_remove_token_for_repo(GitHubSDK.Client.t(), map()) :: result
  def create_remove_token_for_repo(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :create_remove_token_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/runners/remove-token",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a repository variable\n\nPath: /repos/{owner}/{repo}/actions/variables\n\nMethod: post"
  @spec create_repo_variable(GitHubSDK.Client.t()) :: result
  @spec create_repo_variable(GitHubSDK.Client.t(), map()) :: result
  def create_repo_variable(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :create_repo_variable},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/variables",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a self-hosted runner group for an organization\n\nPath: /orgs/{org}/actions/runner-groups\n\nMethod: post"
  @spec create_self_hosted_runner_group_for_org(GitHubSDK.Client.t()) :: result
  @spec create_self_hosted_runner_group_for_org(GitHubSDK.Client.t(), map()) :: result
  def create_self_hosted_runner_group_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :create_self_hosted_runner_group_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/runner-groups",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create a workflow dispatch event\n\nPath: /repos/{owner}/{repo}/actions/workflows/{workflow_id}/dispatches\n\nMethod: post"
  @spec create_workflow_dispatch(GitHubSDK.Client.t()) :: result
  @spec create_workflow_dispatch(GitHubSDK.Client.t(), map()) :: result
  def create_workflow_dispatch(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :create_workflow_dispatch},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"workflow_id", :workflow_id}],
      path_template: "/repos/{owner}/{repo}/actions/workflows/{workflow_id}/dispatches",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Delete a GitHub Actions cache for a repository (using a cache ID)\n\nPath: /repos/{owner}/{repo}/actions/caches/{cache_id}\n\nMethod: delete"
  @spec delete_actions_cache_by_id(GitHubSDK.Client.t()) :: result
  @spec delete_actions_cache_by_id(GitHubSDK.Client.t(), map()) :: result
  def delete_actions_cache_by_id(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :delete_actions_cache_by_id},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"cache_id", :cache_id}],
      path_template: "/repos/{owner}/{repo}/actions/caches/{cache_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete GitHub Actions caches for a repository (using a cache key)\n\nPath: /repos/{owner}/{repo}/actions/caches\n\nMethod: delete"
  @spec delete_actions_cache_by_key(GitHubSDK.Client.t()) :: result
  @spec delete_actions_cache_by_key(GitHubSDK.Client.t(), map()) :: result
  def delete_actions_cache_by_key(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :delete_actions_cache_by_key},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/caches",
      query: [{"key", :key}, {"ref", :ref}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete an artifact\n\nPath: /repos/{owner}/{repo}/actions/artifacts/{artifact_id}\n\nMethod: delete"
  @spec delete_artifact(GitHubSDK.Client.t()) :: result
  @spec delete_artifact(GitHubSDK.Client.t(), map()) :: result
  def delete_artifact(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :delete_artifact},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"artifact_id", :artifact_id}],
      path_template: "/repos/{owner}/{repo}/actions/artifacts/{artifact_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a custom image from the organization\n\nPath: /orgs/{org}/actions/hosted-runners/images/custom/{image_definition_id}\n\nMethod: delete"
  @spec delete_custom_image_from_org(GitHubSDK.Client.t()) :: result
  @spec delete_custom_image_from_org(GitHubSDK.Client.t(), map()) :: result
  def delete_custom_image_from_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :delete_custom_image_from_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"image_definition_id", :image_definition_id}],
      path_template: "/orgs/{org}/actions/hosted-runners/images/custom/{image_definition_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete an image version of custom image from the organization\n\nPath: /orgs/{org}/actions/hosted-runners/images/custom/{image_definition_id}/versions/{version}\n\nMethod: delete"
  @spec delete_custom_image_version_from_org(GitHubSDK.Client.t()) :: result
  @spec delete_custom_image_version_from_org(GitHubSDK.Client.t(), map()) :: result
  def delete_custom_image_version_from_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :delete_custom_image_version_from_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"image_definition_id", :image_definition_id}, {"version", :version}],
      path_template:
        "/orgs/{org}/actions/hosted-runners/images/custom/{image_definition_id}/versions/{version}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete an environment secret\n\nPath: /repos/{owner}/{repo}/environments/{environment_name}/secrets/{secret_name}\n\nMethod: delete"
  @spec delete_environment_secret(GitHubSDK.Client.t()) :: result
  @spec delete_environment_secret(GitHubSDK.Client.t(), map()) :: result
  def delete_environment_secret(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :delete_environment_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"environment_name", :environment_name},
        {"secret_name", :secret_name}
      ],
      path_template:
        "/repos/{owner}/{repo}/environments/{environment_name}/secrets/{secret_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete an environment variable\n\nPath: /repos/{owner}/{repo}/environments/{environment_name}/variables/{name}\n\nMethod: delete"
  @spec delete_environment_variable(GitHubSDK.Client.t()) :: result
  @spec delete_environment_variable(GitHubSDK.Client.t(), map()) :: result
  def delete_environment_variable(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :delete_environment_variable},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"name", :name},
        {"environment_name", :environment_name}
      ],
      path_template: "/repos/{owner}/{repo}/environments/{environment_name}/variables/{name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a GitHub-hosted runner for an organization\n\nPath: /orgs/{org}/actions/hosted-runners/{hosted_runner_id}\n\nMethod: delete"
  @spec delete_hosted_runner_for_org(GitHubSDK.Client.t()) :: result
  @spec delete_hosted_runner_for_org(GitHubSDK.Client.t(), map()) :: result
  def delete_hosted_runner_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :delete_hosted_runner_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"hosted_runner_id", :hosted_runner_id}],
      path_template: "/orgs/{org}/actions/hosted-runners/{hosted_runner_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete an organization secret\n\nPath: /orgs/{org}/actions/secrets/{secret_name}\n\nMethod: delete"
  @spec delete_org_secret(GitHubSDK.Client.t()) :: result
  @spec delete_org_secret(GitHubSDK.Client.t(), map()) :: result
  def delete_org_secret(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :delete_org_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"secret_name", :secret_name}],
      path_template: "/orgs/{org}/actions/secrets/{secret_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete an organization variable\n\nPath: /orgs/{org}/actions/variables/{name}\n\nMethod: delete"
  @spec delete_org_variable(GitHubSDK.Client.t()) :: result
  @spec delete_org_variable(GitHubSDK.Client.t(), map()) :: result
  def delete_org_variable(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :delete_org_variable},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"name", :name}],
      path_template: "/orgs/{org}/actions/variables/{name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a repository secret\n\nPath: /repos/{owner}/{repo}/actions/secrets/{secret_name}\n\nMethod: delete"
  @spec delete_repo_secret(GitHubSDK.Client.t()) :: result
  @spec delete_repo_secret(GitHubSDK.Client.t(), map()) :: result
  def delete_repo_secret(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :delete_repo_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"secret_name", :secret_name}],
      path_template: "/repos/{owner}/{repo}/actions/secrets/{secret_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a repository variable\n\nPath: /repos/{owner}/{repo}/actions/variables/{name}\n\nMethod: delete"
  @spec delete_repo_variable(GitHubSDK.Client.t()) :: result
  @spec delete_repo_variable(GitHubSDK.Client.t(), map()) :: result
  def delete_repo_variable(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :delete_repo_variable},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"name", :name}],
      path_template: "/repos/{owner}/{repo}/actions/variables/{name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a self-hosted runner from an organization\n\nPath: /orgs/{org}/actions/runners/{runner_id}\n\nMethod: delete"
  @spec delete_self_hosted_runner_from_org(GitHubSDK.Client.t()) :: result
  @spec delete_self_hosted_runner_from_org(GitHubSDK.Client.t(), map()) :: result
  def delete_self_hosted_runner_from_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :delete_self_hosted_runner_from_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"runner_id", :runner_id}],
      path_template: "/orgs/{org}/actions/runners/{runner_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a self-hosted runner from a repository\n\nPath: /repos/{owner}/{repo}/actions/runners/{runner_id}\n\nMethod: delete"
  @spec delete_self_hosted_runner_from_repo(GitHubSDK.Client.t()) :: result
  @spec delete_self_hosted_runner_from_repo(GitHubSDK.Client.t(), map()) :: result
  def delete_self_hosted_runner_from_repo(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :delete_self_hosted_runner_from_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"runner_id", :runner_id}],
      path_template: "/repos/{owner}/{repo}/actions/runners/{runner_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a self-hosted runner group from an organization\n\nPath: /orgs/{org}/actions/runner-groups/{runner_group_id}\n\nMethod: delete"
  @spec delete_self_hosted_runner_group_from_org(GitHubSDK.Client.t()) :: result
  @spec delete_self_hosted_runner_group_from_org(GitHubSDK.Client.t(), map()) :: result
  def delete_self_hosted_runner_group_from_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :delete_self_hosted_runner_group_from_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"runner_group_id", :runner_group_id}],
      path_template: "/orgs/{org}/actions/runner-groups/{runner_group_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete a workflow run\n\nPath: /repos/{owner}/{repo}/actions/runs/{run_id}\n\nMethod: delete"
  @spec delete_workflow_run(GitHubSDK.Client.t()) :: result
  @spec delete_workflow_run(GitHubSDK.Client.t(), map()) :: result
  def delete_workflow_run(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :delete_workflow_run},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete workflow run logs\n\nPath: /repos/{owner}/{repo}/actions/runs/{run_id}/logs\n\nMethod: delete"
  @spec delete_workflow_run_logs(GitHubSDK.Client.t()) :: result
  @spec delete_workflow_run_logs(GitHubSDK.Client.t(), map()) :: result
  def delete_workflow_run_logs(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :delete_workflow_run_logs},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/logs",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Disable a selected repository for GitHub Actions in an organization\n\nPath: /orgs/{org}/actions/permissions/repositories/{repository_id}\n\nMethod: delete"
  @spec disable_selected_repository_github_actions_organization(GitHubSDK.Client.t()) :: result
  @spec disable_selected_repository_github_actions_organization(GitHubSDK.Client.t(), map()) ::
          result
  def disable_selected_repository_github_actions_organization(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :disable_selected_repository_github_actions_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"repository_id", :repository_id}],
      path_template: "/orgs/{org}/actions/permissions/repositories/{repository_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove a repository from the list of repositories allowed to use self-hosted runners in an organization\n\nPath: /orgs/{org}/actions/permissions/self-hosted-runners/repositories/{repository_id}\n\nMethod: delete"
  @spec disable_selected_repository_self_hosted_runners_organization(GitHubSDK.Client.t()) ::
          result
  @spec disable_selected_repository_self_hosted_runners_organization(GitHubSDK.Client.t(), map()) ::
          result
  def disable_selected_repository_self_hosted_runners_organization(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :disable_selected_repository_self_hosted_runners_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"repository_id", :repository_id}],
      path_template:
        "/orgs/{org}/actions/permissions/self-hosted-runners/repositories/{repository_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Disable a workflow\n\nPath: /repos/{owner}/{repo}/actions/workflows/{workflow_id}/disable\n\nMethod: put"
  @spec disable_workflow(GitHubSDK.Client.t()) :: result
  @spec disable_workflow(GitHubSDK.Client.t(), map()) :: result
  def disable_workflow(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :disable_workflow},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}, {"workflow_id", :workflow_id}],
      path_template: "/repos/{owner}/{repo}/actions/workflows/{workflow_id}/disable",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Download an artifact\n\nPath: /repos/{owner}/{repo}/actions/artifacts/{artifact_id}/{archive_format}\n\nMethod: get"
  @spec download_artifact(GitHubSDK.Client.t()) :: result
  @spec download_artifact(GitHubSDK.Client.t(), map()) :: result
  def download_artifact(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :download_artifact},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"artifact_id", :artifact_id},
        {"archive_format", :archive_format}
      ],
      path_template: "/repos/{owner}/{repo}/actions/artifacts/{artifact_id}/{archive_format}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Download job logs for a workflow run\n\nPath: /repos/{owner}/{repo}/actions/jobs/{job_id}/logs\n\nMethod: get"
  @spec download_job_logs_for_workflow_run(GitHubSDK.Client.t()) :: result
  @spec download_job_logs_for_workflow_run(GitHubSDK.Client.t(), map()) :: result
  def download_job_logs_for_workflow_run(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :download_job_logs_for_workflow_run},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"job_id", :job_id}],
      path_template: "/repos/{owner}/{repo}/actions/jobs/{job_id}/logs",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Download workflow run attempt logs\n\nPath: /repos/{owner}/{repo}/actions/runs/{run_id}/attempts/{attempt_number}/logs\n\nMethod: get"
  @spec download_workflow_run_attempt_logs(GitHubSDK.Client.t()) :: result
  @spec download_workflow_run_attempt_logs(GitHubSDK.Client.t(), map()) :: result
  def download_workflow_run_attempt_logs(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :download_workflow_run_attempt_logs},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"run_id", :run_id},
        {"attempt_number", :attempt_number}
      ],
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/attempts/{attempt_number}/logs",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Download workflow run logs\n\nPath: /repos/{owner}/{repo}/actions/runs/{run_id}/logs\n\nMethod: get"
  @spec download_workflow_run_logs(GitHubSDK.Client.t()) :: result
  @spec download_workflow_run_logs(GitHubSDK.Client.t(), map()) :: result
  def download_workflow_run_logs(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :download_workflow_run_logs},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/logs",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Enable a selected repository for GitHub Actions in an organization\n\nPath: /orgs/{org}/actions/permissions/repositories/{repository_id}\n\nMethod: put"
  @spec enable_selected_repository_github_actions_organization(GitHubSDK.Client.t()) :: result
  @spec enable_selected_repository_github_actions_organization(GitHubSDK.Client.t(), map()) ::
          result
  def enable_selected_repository_github_actions_organization(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :enable_selected_repository_github_actions_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"repository_id", :repository_id}],
      path_template: "/orgs/{org}/actions/permissions/repositories/{repository_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Add a repository to the list of repositories allowed to use self-hosted runners in an organization\n\nPath: /orgs/{org}/actions/permissions/self-hosted-runners/repositories/{repository_id}\n\nMethod: put"
  @spec enable_selected_repository_self_hosted_runners_organization(GitHubSDK.Client.t()) ::
          result
  @spec enable_selected_repository_self_hosted_runners_organization(GitHubSDK.Client.t(), map()) ::
          result
  def enable_selected_repository_self_hosted_runners_organization(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :enable_selected_repository_self_hosted_runners_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"repository_id", :repository_id}],
      path_template:
        "/orgs/{org}/actions/permissions/self-hosted-runners/repositories/{repository_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Enable a workflow\n\nPath: /repos/{owner}/{repo}/actions/workflows/{workflow_id}/enable\n\nMethod: put"
  @spec enable_workflow(GitHubSDK.Client.t()) :: result
  @spec enable_workflow(GitHubSDK.Client.t(), map()) :: result
  def enable_workflow(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :enable_workflow},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}, {"workflow_id", :workflow_id}],
      path_template: "/repos/{owner}/{repo}/actions/workflows/{workflow_id}/enable",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Force cancel a workflow run\n\nPath: /repos/{owner}/{repo}/actions/runs/{run_id}/force-cancel\n\nMethod: post"
  @spec force_cancel_workflow_run(GitHubSDK.Client.t()) :: result
  @spec force_cancel_workflow_run(GitHubSDK.Client.t(), map()) :: result
  def force_cancel_workflow_run(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :force_cancel_workflow_run},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/force-cancel",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create configuration for a just-in-time runner for an organization\n\nPath: /orgs/{org}/actions/runners/generate-jitconfig\n\nMethod: post"
  @spec generate_runner_jitconfig_for_org(GitHubSDK.Client.t()) :: result
  @spec generate_runner_jitconfig_for_org(GitHubSDK.Client.t(), map()) :: result
  def generate_runner_jitconfig_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :generate_runner_jitconfig_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/runners/generate-jitconfig",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create configuration for a just-in-time runner for a repository\n\nPath: /repos/{owner}/{repo}/actions/runners/generate-jitconfig\n\nMethod: post"
  @spec generate_runner_jitconfig_for_repo(GitHubSDK.Client.t()) :: result
  @spec generate_runner_jitconfig_for_repo(GitHubSDK.Client.t(), map()) :: result
  def generate_runner_jitconfig_for_repo(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :generate_runner_jitconfig_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/runners/generate-jitconfig",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "List GitHub Actions caches for a repository\n\nPath: /repos/{owner}/{repo}/actions/caches\n\nMethod: get"
  @spec get_actions_cache_list(GitHubSDK.Client.t()) :: result
  @spec get_actions_cache_list(GitHubSDK.Client.t(), map()) :: result
  def get_actions_cache_list(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_actions_cache_list},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/caches",
      query: [
        {"per_page", :per_page},
        {"page", :page},
        {"ref", :ref},
        {"key", :key},
        {"sort", :sort},
        {"direction", :direction}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get GitHub Actions cache retention limit for an enterprise\n\nPath: /enterprises/{enterprise}/actions/cache/retention-limit\n\nMethod: get"
  @spec get_actions_cache_retention_limit_for_enterprise(GitHubSDK.Client.t()) :: result
  @spec get_actions_cache_retention_limit_for_enterprise(GitHubSDK.Client.t(), map()) :: result
  def get_actions_cache_retention_limit_for_enterprise(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_actions_cache_retention_limit_for_enterprise},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"enterprise", :enterprise}],
      path_template: "/enterprises/{enterprise}/actions/cache/retention-limit",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get GitHub Actions cache retention limit for an organization\n\nPath: /organizations/{org}/actions/cache/retention-limit\n\nMethod: get"
  @spec get_actions_cache_retention_limit_for_organization(GitHubSDK.Client.t()) :: result
  @spec get_actions_cache_retention_limit_for_organization(GitHubSDK.Client.t(), map()) :: result
  def get_actions_cache_retention_limit_for_organization(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_actions_cache_retention_limit_for_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/organizations/{org}/actions/cache/retention-limit",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get GitHub Actions cache retention limit for a repository\n\nPath: /repos/{owner}/{repo}/actions/cache/retention-limit\n\nMethod: get"
  @spec get_actions_cache_retention_limit_for_repository(GitHubSDK.Client.t()) :: result
  @spec get_actions_cache_retention_limit_for_repository(GitHubSDK.Client.t(), map()) :: result
  def get_actions_cache_retention_limit_for_repository(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_actions_cache_retention_limit_for_repository},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/cache/retention-limit",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get GitHub Actions cache storage limit for an enterprise\n\nPath: /enterprises/{enterprise}/actions/cache/storage-limit\n\nMethod: get"
  @spec get_actions_cache_storage_limit_for_enterprise(GitHubSDK.Client.t()) :: result
  @spec get_actions_cache_storage_limit_for_enterprise(GitHubSDK.Client.t(), map()) :: result
  def get_actions_cache_storage_limit_for_enterprise(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_actions_cache_storage_limit_for_enterprise},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"enterprise", :enterprise}],
      path_template: "/enterprises/{enterprise}/actions/cache/storage-limit",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get GitHub Actions cache storage limit for an organization\n\nPath: /organizations/{org}/actions/cache/storage-limit\n\nMethod: get"
  @spec get_actions_cache_storage_limit_for_organization(GitHubSDK.Client.t()) :: result
  @spec get_actions_cache_storage_limit_for_organization(GitHubSDK.Client.t(), map()) :: result
  def get_actions_cache_storage_limit_for_organization(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_actions_cache_storage_limit_for_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/organizations/{org}/actions/cache/storage-limit",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get GitHub Actions cache storage limit for a repository\n\nPath: /repos/{owner}/{repo}/actions/cache/storage-limit\n\nMethod: get"
  @spec get_actions_cache_storage_limit_for_repository(GitHubSDK.Client.t()) :: result
  @spec get_actions_cache_storage_limit_for_repository(GitHubSDK.Client.t(), map()) :: result
  def get_actions_cache_storage_limit_for_repository(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_actions_cache_storage_limit_for_repository},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/cache/storage-limit",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get GitHub Actions cache usage for a repository\n\nPath: /repos/{owner}/{repo}/actions/cache/usage\n\nMethod: get"
  @spec get_actions_cache_usage(GitHubSDK.Client.t()) :: result
  @spec get_actions_cache_usage(GitHubSDK.Client.t(), map()) :: result
  def get_actions_cache_usage(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_actions_cache_usage},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/cache/usage",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repositories with GitHub Actions cache usage for an organization\n\nPath: /orgs/{org}/actions/cache/usage-by-repository\n\nMethod: get"
  @spec get_actions_cache_usage_by_repo_for_org(GitHubSDK.Client.t()) :: result
  @spec get_actions_cache_usage_by_repo_for_org(GitHubSDK.Client.t(), map()) :: result
  def get_actions_cache_usage_by_repo_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_actions_cache_usage_by_repo_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/cache/usage-by-repository",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get GitHub Actions cache usage for an organization\n\nPath: /orgs/{org}/actions/cache/usage\n\nMethod: get"
  @spec get_actions_cache_usage_for_org(GitHubSDK.Client.t()) :: result
  @spec get_actions_cache_usage_for_org(GitHubSDK.Client.t(), map()) :: result
  def get_actions_cache_usage_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_actions_cache_usage_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/cache/usage",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get allowed actions and reusable workflows for an organization\n\nPath: /orgs/{org}/actions/permissions/selected-actions\n\nMethod: get"
  @spec get_allowed_actions_organization(GitHubSDK.Client.t()) :: result
  @spec get_allowed_actions_organization(GitHubSDK.Client.t(), map()) :: result
  def get_allowed_actions_organization(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_allowed_actions_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/permissions/selected-actions",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get allowed actions and reusable workflows for a repository\n\nPath: /repos/{owner}/{repo}/actions/permissions/selected-actions\n\nMethod: get"
  @spec get_allowed_actions_repository(GitHubSDK.Client.t()) :: result
  @spec get_allowed_actions_repository(GitHubSDK.Client.t(), map()) :: result
  def get_allowed_actions_repository(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_allowed_actions_repository},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/permissions/selected-actions",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get an artifact\n\nPath: /repos/{owner}/{repo}/actions/artifacts/{artifact_id}\n\nMethod: get"
  @spec get_artifact(GitHubSDK.Client.t()) :: result
  @spec get_artifact(GitHubSDK.Client.t(), map()) :: result
  def get_artifact(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_artifact},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"artifact_id", :artifact_id}],
      path_template: "/repos/{owner}/{repo}/actions/artifacts/{artifact_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get artifact and log retention settings for an organization\n\nPath: /orgs/{org}/actions/permissions/artifact-and-log-retention\n\nMethod: get"
  @spec get_artifact_and_log_retention_settings_organization(GitHubSDK.Client.t()) :: result
  @spec get_artifact_and_log_retention_settings_organization(GitHubSDK.Client.t(), map()) ::
          result
  def get_artifact_and_log_retention_settings_organization(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_artifact_and_log_retention_settings_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/permissions/artifact-and-log-retention",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get artifact and log retention settings for a repository\n\nPath: /repos/{owner}/{repo}/actions/permissions/artifact-and-log-retention\n\nMethod: get"
  @spec get_artifact_and_log_retention_settings_repository(GitHubSDK.Client.t()) :: result
  @spec get_artifact_and_log_retention_settings_repository(GitHubSDK.Client.t(), map()) :: result
  def get_artifact_and_log_retention_settings_repository(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_artifact_and_log_retention_settings_repository},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/permissions/artifact-and-log-retention",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a custom image definition for GitHub Actions Hosted Runners\n\nPath: /orgs/{org}/actions/hosted-runners/images/custom/{image_definition_id}\n\nMethod: get"
  @spec get_custom_image_for_org(GitHubSDK.Client.t()) :: result
  @spec get_custom_image_for_org(GitHubSDK.Client.t(), map()) :: result
  def get_custom_image_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_custom_image_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"image_definition_id", :image_definition_id}],
      path_template: "/orgs/{org}/actions/hosted-runners/images/custom/{image_definition_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get an image version of a custom image for GitHub Actions Hosted Runners\n\nPath: /orgs/{org}/actions/hosted-runners/images/custom/{image_definition_id}/versions/{version}\n\nMethod: get"
  @spec get_custom_image_version_for_org(GitHubSDK.Client.t()) :: result
  @spec get_custom_image_version_for_org(GitHubSDK.Client.t(), map()) :: result
  def get_custom_image_version_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_custom_image_version_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"image_definition_id", :image_definition_id}, {"version", :version}],
      path_template:
        "/orgs/{org}/actions/hosted-runners/images/custom/{image_definition_id}/versions/{version}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get the customization template for an OIDC subject claim for a repository\n\nPath: /repos/{owner}/{repo}/actions/oidc/customization/sub\n\nMethod: get"
  @spec get_custom_oidc_sub_claim_for_repo(GitHubSDK.Client.t()) :: result
  @spec get_custom_oidc_sub_claim_for_repo(GitHubSDK.Client.t(), map()) :: result
  def get_custom_oidc_sub_claim_for_repo(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_custom_oidc_sub_claim_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/oidc/customization/sub",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get an environment public key\n\nPath: /repos/{owner}/{repo}/environments/{environment_name}/secrets/public-key\n\nMethod: get"
  @spec get_environment_public_key(GitHubSDK.Client.t()) :: result
  @spec get_environment_public_key(GitHubSDK.Client.t(), map()) :: result
  def get_environment_public_key(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_environment_public_key},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"environment_name", :environment_name}],
      path_template: "/repos/{owner}/{repo}/environments/{environment_name}/secrets/public-key",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get an environment secret\n\nPath: /repos/{owner}/{repo}/environments/{environment_name}/secrets/{secret_name}\n\nMethod: get"
  @spec get_environment_secret(GitHubSDK.Client.t()) :: result
  @spec get_environment_secret(GitHubSDK.Client.t(), map()) :: result
  def get_environment_secret(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_environment_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"environment_name", :environment_name},
        {"secret_name", :secret_name}
      ],
      path_template:
        "/repos/{owner}/{repo}/environments/{environment_name}/secrets/{secret_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get an environment variable\n\nPath: /repos/{owner}/{repo}/environments/{environment_name}/variables/{name}\n\nMethod: get"
  @spec get_environment_variable(GitHubSDK.Client.t()) :: result
  @spec get_environment_variable(GitHubSDK.Client.t(), map()) :: result
  def get_environment_variable(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_environment_variable},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"environment_name", :environment_name},
        {"name", :name}
      ],
      path_template: "/repos/{owner}/{repo}/environments/{environment_name}/variables/{name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get fork PR contributor approval permissions for an organization\n\nPath: /orgs/{org}/actions/permissions/fork-pr-contributor-approval\n\nMethod: get"
  @spec get_fork_pr_contributor_approval_permissions_organization(GitHubSDK.Client.t()) :: result
  @spec get_fork_pr_contributor_approval_permissions_organization(GitHubSDK.Client.t(), map()) ::
          result
  def get_fork_pr_contributor_approval_permissions_organization(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_fork_pr_contributor_approval_permissions_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/permissions/fork-pr-contributor-approval",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get fork PR contributor approval permissions for a repository\n\nPath: /repos/{owner}/{repo}/actions/permissions/fork-pr-contributor-approval\n\nMethod: get"
  @spec get_fork_pr_contributor_approval_permissions_repository(GitHubSDK.Client.t()) :: result
  @spec get_fork_pr_contributor_approval_permissions_repository(GitHubSDK.Client.t(), map()) ::
          result
  def get_fork_pr_contributor_approval_permissions_repository(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_fork_pr_contributor_approval_permissions_repository},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/permissions/fork-pr-contributor-approval",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get default workflow permissions for an organization\n\nPath: /orgs/{org}/actions/permissions/workflow\n\nMethod: get"
  @spec get_github_actions_default_workflow_permissions_organization(GitHubSDK.Client.t()) ::
          result
  @spec get_github_actions_default_workflow_permissions_organization(GitHubSDK.Client.t(), map()) ::
          result
  def get_github_actions_default_workflow_permissions_organization(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_github_actions_default_workflow_permissions_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/permissions/workflow",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get default workflow permissions for a repository\n\nPath: /repos/{owner}/{repo}/actions/permissions/workflow\n\nMethod: get"
  @spec get_github_actions_default_workflow_permissions_repository(GitHubSDK.Client.t()) :: result
  @spec get_github_actions_default_workflow_permissions_repository(GitHubSDK.Client.t(), map()) ::
          result
  def get_github_actions_default_workflow_permissions_repository(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_github_actions_default_workflow_permissions_repository},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/permissions/workflow",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get GitHub Actions permissions for an organization\n\nPath: /orgs/{org}/actions/permissions\n\nMethod: get"
  @spec get_github_actions_permissions_organization(GitHubSDK.Client.t()) :: result
  @spec get_github_actions_permissions_organization(GitHubSDK.Client.t(), map()) :: result
  def get_github_actions_permissions_organization(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_github_actions_permissions_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/permissions",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get GitHub Actions permissions for a repository\n\nPath: /repos/{owner}/{repo}/actions/permissions\n\nMethod: get"
  @spec get_github_actions_permissions_repository(GitHubSDK.Client.t()) :: result
  @spec get_github_actions_permissions_repository(GitHubSDK.Client.t(), map()) :: result
  def get_github_actions_permissions_repository(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_github_actions_permissions_repository},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/permissions",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a GitHub-hosted runner for an organization\n\nPath: /orgs/{org}/actions/hosted-runners/{hosted_runner_id}\n\nMethod: get"
  @spec get_hosted_runner_for_org(GitHubSDK.Client.t()) :: result
  @spec get_hosted_runner_for_org(GitHubSDK.Client.t(), map()) :: result
  def get_hosted_runner_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_hosted_runner_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"hosted_runner_id", :hosted_runner_id}],
      path_template: "/orgs/{org}/actions/hosted-runners/{hosted_runner_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get GitHub-owned images for GitHub-hosted runners in an organization\n\nPath: /orgs/{org}/actions/hosted-runners/images/github-owned\n\nMethod: get"
  @spec get_hosted_runners_github_owned_images_for_org(GitHubSDK.Client.t()) :: result
  @spec get_hosted_runners_github_owned_images_for_org(GitHubSDK.Client.t(), map()) :: result
  def get_hosted_runners_github_owned_images_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_hosted_runners_github_owned_images_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/hosted-runners/images/github-owned",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get limits on GitHub-hosted runners for an organization\n\nPath: /orgs/{org}/actions/hosted-runners/limits\n\nMethod: get"
  @spec get_hosted_runners_limits_for_org(GitHubSDK.Client.t()) :: result
  @spec get_hosted_runners_limits_for_org(GitHubSDK.Client.t(), map()) :: result
  def get_hosted_runners_limits_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_hosted_runners_limits_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/hosted-runners/limits",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get GitHub-hosted runners machine specs for an organization\n\nPath: /orgs/{org}/actions/hosted-runners/machine-sizes\n\nMethod: get"
  @spec get_hosted_runners_machine_specs_for_org(GitHubSDK.Client.t()) :: result
  @spec get_hosted_runners_machine_specs_for_org(GitHubSDK.Client.t(), map()) :: result
  def get_hosted_runners_machine_specs_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_hosted_runners_machine_specs_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/hosted-runners/machine-sizes",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get partner images for GitHub-hosted runners in an organization\n\nPath: /orgs/{org}/actions/hosted-runners/images/partner\n\nMethod: get"
  @spec get_hosted_runners_partner_images_for_org(GitHubSDK.Client.t()) :: result
  @spec get_hosted_runners_partner_images_for_org(GitHubSDK.Client.t(), map()) :: result
  def get_hosted_runners_partner_images_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_hosted_runners_partner_images_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/hosted-runners/images/partner",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get platforms for GitHub-hosted runners in an organization\n\nPath: /orgs/{org}/actions/hosted-runners/platforms\n\nMethod: get"
  @spec get_hosted_runners_platforms_for_org(GitHubSDK.Client.t()) :: result
  @spec get_hosted_runners_platforms_for_org(GitHubSDK.Client.t(), map()) :: result
  def get_hosted_runners_platforms_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_hosted_runners_platforms_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/hosted-runners/platforms",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a job for a workflow run\n\nPath: /repos/{owner}/{repo}/actions/jobs/{job_id}\n\nMethod: get"
  @spec get_job_for_workflow_run(GitHubSDK.Client.t()) :: result
  @spec get_job_for_workflow_run(GitHubSDK.Client.t(), map()) :: result
  def get_job_for_workflow_run(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_job_for_workflow_run},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"job_id", :job_id}],
      path_template: "/repos/{owner}/{repo}/actions/jobs/{job_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get an organization public key\n\nPath: /orgs/{org}/actions/secrets/public-key\n\nMethod: get"
  @spec get_org_public_key(GitHubSDK.Client.t()) :: result
  @spec get_org_public_key(GitHubSDK.Client.t(), map()) :: result
  def get_org_public_key(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_org_public_key},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/secrets/public-key",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get an organization secret\n\nPath: /orgs/{org}/actions/secrets/{secret_name}\n\nMethod: get"
  @spec get_org_secret(GitHubSDK.Client.t()) :: result
  @spec get_org_secret(GitHubSDK.Client.t(), map()) :: result
  def get_org_secret(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_org_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"secret_name", :secret_name}],
      path_template: "/orgs/{org}/actions/secrets/{secret_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get an organization variable\n\nPath: /orgs/{org}/actions/variables/{name}\n\nMethod: get"
  @spec get_org_variable(GitHubSDK.Client.t()) :: result
  @spec get_org_variable(GitHubSDK.Client.t(), map()) :: result
  def get_org_variable(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_org_variable},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"name", :name}],
      path_template: "/orgs/{org}/actions/variables/{name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get pending deployments for a workflow run\n\nPath: /repos/{owner}/{repo}/actions/runs/{run_id}/pending_deployments\n\nMethod: get"
  @spec get_pending_deployments_for_run(GitHubSDK.Client.t()) :: result
  @spec get_pending_deployments_for_run(GitHubSDK.Client.t(), map()) :: result
  def get_pending_deployments_for_run(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_pending_deployments_for_run},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/pending_deployments",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get private repo fork PR workflow settings for an organization\n\nPath: /orgs/{org}/actions/permissions/fork-pr-workflows-private-repos\n\nMethod: get"
  @spec get_private_repo_fork_pr_workflows_settings_organization(GitHubSDK.Client.t()) :: result
  @spec get_private_repo_fork_pr_workflows_settings_organization(GitHubSDK.Client.t(), map()) ::
          result
  def get_private_repo_fork_pr_workflows_settings_organization(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_private_repo_fork_pr_workflows_settings_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/permissions/fork-pr-workflows-private-repos",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get private repo fork PR workflow settings for a repository\n\nPath: /repos/{owner}/{repo}/actions/permissions/fork-pr-workflows-private-repos\n\nMethod: get"
  @spec get_private_repo_fork_pr_workflows_settings_repository(GitHubSDK.Client.t()) :: result
  @spec get_private_repo_fork_pr_workflows_settings_repository(GitHubSDK.Client.t(), map()) ::
          result
  def get_private_repo_fork_pr_workflows_settings_repository(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_private_repo_fork_pr_workflows_settings_repository},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/permissions/fork-pr-workflows-private-repos",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a repository public key\n\nPath: /repos/{owner}/{repo}/actions/secrets/public-key\n\nMethod: get"
  @spec get_repo_public_key(GitHubSDK.Client.t()) :: result
  @spec get_repo_public_key(GitHubSDK.Client.t(), map()) :: result
  def get_repo_public_key(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_repo_public_key},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/secrets/public-key",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a repository secret\n\nPath: /repos/{owner}/{repo}/actions/secrets/{secret_name}\n\nMethod: get"
  @spec get_repo_secret(GitHubSDK.Client.t()) :: result
  @spec get_repo_secret(GitHubSDK.Client.t(), map()) :: result
  def get_repo_secret(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_repo_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"secret_name", :secret_name}],
      path_template: "/repos/{owner}/{repo}/actions/secrets/{secret_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a repository variable\n\nPath: /repos/{owner}/{repo}/actions/variables/{name}\n\nMethod: get"
  @spec get_repo_variable(GitHubSDK.Client.t()) :: result
  @spec get_repo_variable(GitHubSDK.Client.t(), map()) :: result
  def get_repo_variable(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_repo_variable},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"name", :name}],
      path_template: "/repos/{owner}/{repo}/actions/variables/{name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get the review history for a workflow run\n\nPath: /repos/{owner}/{repo}/actions/runs/{run_id}/approvals\n\nMethod: get"
  @spec get_reviews_for_run(GitHubSDK.Client.t()) :: result
  @spec get_reviews_for_run(GitHubSDK.Client.t(), map()) :: result
  def get_reviews_for_run(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_reviews_for_run},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/approvals",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a self-hosted runner for an organization\n\nPath: /orgs/{org}/actions/runners/{runner_id}\n\nMethod: get"
  @spec get_self_hosted_runner_for_org(GitHubSDK.Client.t()) :: result
  @spec get_self_hosted_runner_for_org(GitHubSDK.Client.t(), map()) :: result
  def get_self_hosted_runner_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_self_hosted_runner_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"runner_id", :runner_id}],
      path_template: "/orgs/{org}/actions/runners/{runner_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a self-hosted runner for a repository\n\nPath: /repos/{owner}/{repo}/actions/runners/{runner_id}\n\nMethod: get"
  @spec get_self_hosted_runner_for_repo(GitHubSDK.Client.t()) :: result
  @spec get_self_hosted_runner_for_repo(GitHubSDK.Client.t(), map()) :: result
  def get_self_hosted_runner_for_repo(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_self_hosted_runner_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"runner_id", :runner_id}],
      path_template: "/repos/{owner}/{repo}/actions/runners/{runner_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a self-hosted runner group for an organization\n\nPath: /orgs/{org}/actions/runner-groups/{runner_group_id}\n\nMethod: get"
  @spec get_self_hosted_runner_group_for_org(GitHubSDK.Client.t()) :: result
  @spec get_self_hosted_runner_group_for_org(GitHubSDK.Client.t(), map()) :: result
  def get_self_hosted_runner_group_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_self_hosted_runner_group_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"runner_group_id", :runner_group_id}],
      path_template: "/orgs/{org}/actions/runner-groups/{runner_group_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get self-hosted runners settings for an organization\n\nPath: /orgs/{org}/actions/permissions/self-hosted-runners\n\nMethod: get"
  @spec get_self_hosted_runners_permissions_organization(GitHubSDK.Client.t()) :: result
  @spec get_self_hosted_runners_permissions_organization(GitHubSDK.Client.t(), map()) :: result
  def get_self_hosted_runners_permissions_organization(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_self_hosted_runners_permissions_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/permissions/self-hosted-runners",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a workflow\n\nPath: /repos/{owner}/{repo}/actions/workflows/{workflow_id}\n\nMethod: get"
  @spec get_workflow(GitHubSDK.Client.t()) :: result
  @spec get_workflow(GitHubSDK.Client.t(), map()) :: result
  def get_workflow(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_workflow},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"workflow_id", :workflow_id}],
      path_template: "/repos/{owner}/{repo}/actions/workflows/{workflow_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get the level of access for workflows outside of the repository\n\nPath: /repos/{owner}/{repo}/actions/permissions/access\n\nMethod: get"
  @spec get_workflow_access_to_repository(GitHubSDK.Client.t()) :: result
  @spec get_workflow_access_to_repository(GitHubSDK.Client.t(), map()) :: result
  def get_workflow_access_to_repository(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_workflow_access_to_repository},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/permissions/access",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a workflow run\n\nPath: /repos/{owner}/{repo}/actions/runs/{run_id}\n\nMethod: get"
  @spec get_workflow_run(GitHubSDK.Client.t()) :: result
  @spec get_workflow_run(GitHubSDK.Client.t(), map()) :: result
  def get_workflow_run(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_workflow_run},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}",
      query: [{"exclude_pull_requests", :exclude_pull_requests}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a workflow run attempt\n\nPath: /repos/{owner}/{repo}/actions/runs/{run_id}/attempts/{attempt_number}\n\nMethod: get"
  @spec get_workflow_run_attempt(GitHubSDK.Client.t()) :: result
  @spec get_workflow_run_attempt(GitHubSDK.Client.t(), map()) :: result
  def get_workflow_run_attempt(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_workflow_run_attempt},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"run_id", :run_id},
        {"attempt_number", :attempt_number}
      ],
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/attempts/{attempt_number}",
      query: [{"exclude_pull_requests", :exclude_pull_requests}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get workflow run usage\n\nPath: /repos/{owner}/{repo}/actions/runs/{run_id}/timing\n\nMethod: get"
  @spec get_workflow_run_usage(GitHubSDK.Client.t()) :: result
  @spec get_workflow_run_usage(GitHubSDK.Client.t(), map()) :: result
  def get_workflow_run_usage(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_workflow_run_usage},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/timing",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get workflow usage\n\nPath: /repos/{owner}/{repo}/actions/workflows/{workflow_id}/timing\n\nMethod: get"
  @spec get_workflow_usage(GitHubSDK.Client.t()) :: result
  @spec get_workflow_usage(GitHubSDK.Client.t(), map()) :: result
  def get_workflow_usage(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :get_workflow_usage},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"workflow_id", :workflow_id}],
      path_template: "/repos/{owner}/{repo}/actions/workflows/{workflow_id}/timing",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List artifacts for a repository\n\nPath: /repos/{owner}/{repo}/actions/artifacts\n\nMethod: get"
  @spec list_artifacts_for_repo(GitHubSDK.Client.t()) :: result
  @spec list_artifacts_for_repo(GitHubSDK.Client.t(), map()) :: result
  def list_artifacts_for_repo(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_artifacts_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/artifacts",
      query: [{"per_page", :per_page}, {"page", :page}, {"name", :name}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List image versions of a custom image for an organization\n\nPath: /orgs/{org}/actions/hosted-runners/images/custom/{image_definition_id}/versions\n\nMethod: get"
  @spec list_custom_image_versions_for_org(GitHubSDK.Client.t()) :: result
  @spec list_custom_image_versions_for_org(GitHubSDK.Client.t(), map()) :: result
  def list_custom_image_versions_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_custom_image_versions_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"image_definition_id", :image_definition_id}, {"org", :org}],
      path_template:
        "/orgs/{org}/actions/hosted-runners/images/custom/{image_definition_id}/versions",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List custom images for an organization\n\nPath: /orgs/{org}/actions/hosted-runners/images/custom\n\nMethod: get"
  @spec list_custom_images_for_org(GitHubSDK.Client.t()) :: result
  @spec list_custom_images_for_org(GitHubSDK.Client.t(), map()) :: result
  def list_custom_images_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_custom_images_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/hosted-runners/images/custom",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List environment secrets\n\nPath: /repos/{owner}/{repo}/environments/{environment_name}/secrets\n\nMethod: get"
  @spec list_environment_secrets(GitHubSDK.Client.t()) :: result
  @spec list_environment_secrets(GitHubSDK.Client.t(), map()) :: result
  def list_environment_secrets(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_environment_secrets},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"environment_name", :environment_name}],
      path_template: "/repos/{owner}/{repo}/environments/{environment_name}/secrets",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List environment variables\n\nPath: /repos/{owner}/{repo}/environments/{environment_name}/variables\n\nMethod: get"
  @spec list_environment_variables(GitHubSDK.Client.t()) :: result
  @spec list_environment_variables(GitHubSDK.Client.t(), map()) :: result
  def list_environment_variables(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_environment_variables},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"environment_name", :environment_name}],
      path_template: "/repos/{owner}/{repo}/environments/{environment_name}/variables",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List GitHub-hosted runners in a group for an organization\n\nPath: /orgs/{org}/actions/runner-groups/{runner_group_id}/hosted-runners\n\nMethod: get"
  @spec list_github_hosted_runners_in_group_for_org(GitHubSDK.Client.t()) :: result
  @spec list_github_hosted_runners_in_group_for_org(GitHubSDK.Client.t(), map()) :: result
  def list_github_hosted_runners_in_group_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_github_hosted_runners_in_group_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"runner_group_id", :runner_group_id}],
      path_template: "/orgs/{org}/actions/runner-groups/{runner_group_id}/hosted-runners",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List GitHub-hosted runners for an organization\n\nPath: /orgs/{org}/actions/hosted-runners\n\nMethod: get"
  @spec list_hosted_runners_for_org(GitHubSDK.Client.t()) :: result
  @spec list_hosted_runners_for_org(GitHubSDK.Client.t(), map()) :: result
  def list_hosted_runners_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_hosted_runners_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/hosted-runners",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List jobs for a workflow run\n\nPath: /repos/{owner}/{repo}/actions/runs/{run_id}/jobs\n\nMethod: get"
  @spec list_jobs_for_workflow_run(GitHubSDK.Client.t()) :: result
  @spec list_jobs_for_workflow_run(GitHubSDK.Client.t(), map()) :: result
  def list_jobs_for_workflow_run(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_jobs_for_workflow_run},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/jobs",
      query: [{"filter", :filter}, {"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List jobs for a workflow run attempt\n\nPath: /repos/{owner}/{repo}/actions/runs/{run_id}/attempts/{attempt_number}/jobs\n\nMethod: get"
  @spec list_jobs_for_workflow_run_attempt(GitHubSDK.Client.t()) :: result
  @spec list_jobs_for_workflow_run_attempt(GitHubSDK.Client.t(), map()) :: result
  def list_jobs_for_workflow_run_attempt(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_jobs_for_workflow_run_attempt},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"run_id", :run_id},
        {"attempt_number", :attempt_number}
      ],
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/attempts/{attempt_number}/jobs",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List labels for a self-hosted runner for an organization\n\nPath: /orgs/{org}/actions/runners/{runner_id}/labels\n\nMethod: get"
  @spec list_labels_for_self_hosted_runner_for_org(GitHubSDK.Client.t()) :: result
  @spec list_labels_for_self_hosted_runner_for_org(GitHubSDK.Client.t(), map()) :: result
  def list_labels_for_self_hosted_runner_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_labels_for_self_hosted_runner_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"runner_id", :runner_id}],
      path_template: "/orgs/{org}/actions/runners/{runner_id}/labels",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List labels for a self-hosted runner for a repository\n\nPath: /repos/{owner}/{repo}/actions/runners/{runner_id}/labels\n\nMethod: get"
  @spec list_labels_for_self_hosted_runner_for_repo(GitHubSDK.Client.t()) :: result
  @spec list_labels_for_self_hosted_runner_for_repo(GitHubSDK.Client.t(), map()) :: result
  def list_labels_for_self_hosted_runner_for_repo(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_labels_for_self_hosted_runner_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"runner_id", :runner_id}],
      path_template: "/repos/{owner}/{repo}/actions/runners/{runner_id}/labels",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List organization secrets\n\nPath: /orgs/{org}/actions/secrets\n\nMethod: get"
  @spec list_org_secrets(GitHubSDK.Client.t()) :: result
  @spec list_org_secrets(GitHubSDK.Client.t(), map()) :: result
  def list_org_secrets(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_org_secrets},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/secrets",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List organization variables\n\nPath: /orgs/{org}/actions/variables\n\nMethod: get"
  @spec list_org_variables(GitHubSDK.Client.t()) :: result
  @spec list_org_variables(GitHubSDK.Client.t(), map()) :: result
  def list_org_variables(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_org_variables},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/variables",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repository access to a self-hosted runner group in an organization\n\nPath: /orgs/{org}/actions/runner-groups/{runner_group_id}/repositories\n\nMethod: get"
  @spec list_repo_access_to_self_hosted_runner_group_in_org(GitHubSDK.Client.t()) :: result
  @spec list_repo_access_to_self_hosted_runner_group_in_org(GitHubSDK.Client.t(), map()) :: result
  def list_repo_access_to_self_hosted_runner_group_in_org(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_repo_access_to_self_hosted_runner_group_in_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"runner_group_id", :runner_group_id}],
      path_template: "/orgs/{org}/actions/runner-groups/{runner_group_id}/repositories",
      query: [{"page", :page}, {"per_page", :per_page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repository organization secrets\n\nPath: /repos/{owner}/{repo}/actions/organization-secrets\n\nMethod: get"
  @spec list_repo_organization_secrets(GitHubSDK.Client.t()) :: result
  @spec list_repo_organization_secrets(GitHubSDK.Client.t(), map()) :: result
  def list_repo_organization_secrets(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_repo_organization_secrets},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/organization-secrets",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repository organization variables\n\nPath: /repos/{owner}/{repo}/actions/organization-variables\n\nMethod: get"
  @spec list_repo_organization_variables(GitHubSDK.Client.t()) :: result
  @spec list_repo_organization_variables(GitHubSDK.Client.t(), map()) :: result
  def list_repo_organization_variables(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_repo_organization_variables},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/organization-variables",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repository secrets\n\nPath: /repos/{owner}/{repo}/actions/secrets\n\nMethod: get"
  @spec list_repo_secrets(GitHubSDK.Client.t()) :: result
  @spec list_repo_secrets(GitHubSDK.Client.t(), map()) :: result
  def list_repo_secrets(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_repo_secrets},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/secrets",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repository variables\n\nPath: /repos/{owner}/{repo}/actions/variables\n\nMethod: get"
  @spec list_repo_variables(GitHubSDK.Client.t()) :: result
  @spec list_repo_variables(GitHubSDK.Client.t(), map()) :: result
  def list_repo_variables(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_repo_variables},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/variables",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repository workflows\n\nPath: /repos/{owner}/{repo}/actions/workflows\n\nMethod: get"
  @spec list_repo_workflows(GitHubSDK.Client.t()) :: result
  @spec list_repo_workflows(GitHubSDK.Client.t(), map()) :: result
  def list_repo_workflows(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_repo_workflows},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/workflows",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List runner applications for an organization\n\nPath: /orgs/{org}/actions/runners/downloads\n\nMethod: get"
  @spec list_runner_applications_for_org(GitHubSDK.Client.t()) :: result
  @spec list_runner_applications_for_org(GitHubSDK.Client.t(), map()) :: result
  def list_runner_applications_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_runner_applications_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/runners/downloads",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List runner applications for a repository\n\nPath: /repos/{owner}/{repo}/actions/runners/downloads\n\nMethod: get"
  @spec list_runner_applications_for_repo(GitHubSDK.Client.t()) :: result
  @spec list_runner_applications_for_repo(GitHubSDK.Client.t(), map()) :: result
  def list_runner_applications_for_repo(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_runner_applications_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/runners/downloads",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List selected repositories for an organization secret\n\nPath: /orgs/{org}/actions/secrets/{secret_name}/repositories\n\nMethod: get"
  @spec list_selected_repos_for_org_secret(GitHubSDK.Client.t()) :: result
  @spec list_selected_repos_for_org_secret(GitHubSDK.Client.t(), map()) :: result
  def list_selected_repos_for_org_secret(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_selected_repos_for_org_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"secret_name", :secret_name}],
      path_template: "/orgs/{org}/actions/secrets/{secret_name}/repositories",
      query: [{"page", :page}, {"per_page", :per_page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List selected repositories for an organization variable\n\nPath: /orgs/{org}/actions/variables/{name}/repositories\n\nMethod: get"
  @spec list_selected_repos_for_org_variable(GitHubSDK.Client.t()) :: result
  @spec list_selected_repos_for_org_variable(GitHubSDK.Client.t(), map()) :: result
  def list_selected_repos_for_org_variable(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_selected_repos_for_org_variable},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"name", :name}],
      path_template: "/orgs/{org}/actions/variables/{name}/repositories",
      query: [{"page", :page}, {"per_page", :per_page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List selected repositories enabled for GitHub Actions in an organization\n\nPath: /orgs/{org}/actions/permissions/repositories\n\nMethod: get"
  @spec list_selected_repositories_enabled_github_actions_organization(GitHubSDK.Client.t()) ::
          result
  @spec list_selected_repositories_enabled_github_actions_organization(
          GitHubSDK.Client.t(),
          map()
        ) :: result
  def list_selected_repositories_enabled_github_actions_organization(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_selected_repositories_enabled_github_actions_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/permissions/repositories",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repositories allowed to use self-hosted runners in an organization\n\nPath: /orgs/{org}/actions/permissions/self-hosted-runners/repositories\n\nMethod: get"
  @spec list_selected_repositories_self_hosted_runners_organization(GitHubSDK.Client.t()) ::
          result
  @spec list_selected_repositories_self_hosted_runners_organization(GitHubSDK.Client.t(), map()) ::
          result
  def list_selected_repositories_self_hosted_runners_organization(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_selected_repositories_self_hosted_runners_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/permissions/self-hosted-runners/repositories",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List self-hosted runner groups for an organization\n\nPath: /orgs/{org}/actions/runner-groups\n\nMethod: get"
  @spec list_self_hosted_runner_groups_for_org(GitHubSDK.Client.t()) :: result
  @spec list_self_hosted_runner_groups_for_org(GitHubSDK.Client.t(), map()) :: result
  def list_self_hosted_runner_groups_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_self_hosted_runner_groups_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/runner-groups",
      query: [
        {"per_page", :per_page},
        {"page", :page},
        {"visible_to_repository", :visible_to_repository}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List self-hosted runners for an organization\n\nPath: /orgs/{org}/actions/runners\n\nMethod: get"
  @spec list_self_hosted_runners_for_org(GitHubSDK.Client.t()) :: result
  @spec list_self_hosted_runners_for_org(GitHubSDK.Client.t(), map()) :: result
  def list_self_hosted_runners_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_self_hosted_runners_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/runners",
      query: [{"name", :name}, {"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List self-hosted runners for a repository\n\nPath: /repos/{owner}/{repo}/actions/runners\n\nMethod: get"
  @spec list_self_hosted_runners_for_repo(GitHubSDK.Client.t()) :: result
  @spec list_self_hosted_runners_for_repo(GitHubSDK.Client.t(), map()) :: result
  def list_self_hosted_runners_for_repo(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_self_hosted_runners_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/runners",
      query: [{"name", :name}, {"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List self-hosted runners in a group for an organization\n\nPath: /orgs/{org}/actions/runner-groups/{runner_group_id}/runners\n\nMethod: get"
  @spec list_self_hosted_runners_in_group_for_org(GitHubSDK.Client.t()) :: result
  @spec list_self_hosted_runners_in_group_for_org(GitHubSDK.Client.t(), map()) :: result
  def list_self_hosted_runners_in_group_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_self_hosted_runners_in_group_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"runner_group_id", :runner_group_id}],
      path_template: "/orgs/{org}/actions/runner-groups/{runner_group_id}/runners",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List workflow run artifacts\n\nPath: /repos/{owner}/{repo}/actions/runs/{run_id}/artifacts\n\nMethod: get"
  @spec list_workflow_run_artifacts(GitHubSDK.Client.t()) :: result
  @spec list_workflow_run_artifacts(GitHubSDK.Client.t(), map()) :: result
  def list_workflow_run_artifacts(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_workflow_run_artifacts},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/artifacts",
      query: [
        {"per_page", :per_page},
        {"page", :page},
        {"name", :name},
        {"direction", :direction}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List workflow runs for a workflow\n\nPath: /repos/{owner}/{repo}/actions/workflows/{workflow_id}/runs\n\nMethod: get"
  @spec list_workflow_runs(GitHubSDK.Client.t()) :: result
  @spec list_workflow_runs(GitHubSDK.Client.t(), map()) :: result
  def list_workflow_runs(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_workflow_runs},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}, {"workflow_id", :workflow_id}],
      path_template: "/repos/{owner}/{repo}/actions/workflows/{workflow_id}/runs",
      query: [
        {"actor", :actor},
        {"branch", :branch},
        {"event", :event},
        {"status", :status},
        {"per_page", :per_page},
        {"page", :page},
        {"created", :created},
        {"exclude_pull_requests", :exclude_pull_requests},
        {"check_suite_id", :check_suite_id},
        {"head_sha", :head_sha}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List workflow runs for a repository\n\nPath: /repos/{owner}/{repo}/actions/runs\n\nMethod: get"
  @spec list_workflow_runs_for_repo(GitHubSDK.Client.t()) :: result
  @spec list_workflow_runs_for_repo(GitHubSDK.Client.t(), map()) :: result
  def list_workflow_runs_for_repo(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :list_workflow_runs_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/runs",
      query: [
        {"actor", :actor},
        {"branch", :branch},
        {"event", :event},
        {"status", :status},
        {"per_page", :per_page},
        {"page", :page},
        {"created", :created},
        {"exclude_pull_requests", :exclude_pull_requests},
        {"check_suite_id", :check_suite_id},
        {"head_sha", :head_sha}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Re-run a job from a workflow run\n\nPath: /repos/{owner}/{repo}/actions/jobs/{job_id}/rerun\n\nMethod: post"
  @spec re_run_job_for_workflow_run(GitHubSDK.Client.t()) :: result
  @spec re_run_job_for_workflow_run(GitHubSDK.Client.t(), map()) :: result
  def re_run_job_for_workflow_run(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :re_run_job_for_workflow_run},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"job_id", :job_id}],
      path_template: "/repos/{owner}/{repo}/actions/jobs/{job_id}/rerun",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Re-run a workflow\n\nPath: /repos/{owner}/{repo}/actions/runs/{run_id}/rerun\n\nMethod: post"
  @spec re_run_workflow(GitHubSDK.Client.t()) :: result
  @spec re_run_workflow(GitHubSDK.Client.t(), map()) :: result
  def re_run_workflow(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :re_run_workflow},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/rerun",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Re-run failed jobs from a workflow run\n\nPath: /repos/{owner}/{repo}/actions/runs/{run_id}/rerun-failed-jobs\n\nMethod: post"
  @spec re_run_workflow_failed_jobs(GitHubSDK.Client.t()) :: result
  @spec re_run_workflow_failed_jobs(GitHubSDK.Client.t(), map()) :: result
  def re_run_workflow_failed_jobs(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :re_run_workflow_failed_jobs},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/rerun-failed-jobs",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Remove all custom labels from a self-hosted runner for an organization\n\nPath: /orgs/{org}/actions/runners/{runner_id}/labels\n\nMethod: delete"
  @spec remove_all_custom_labels_from_self_hosted_runner_for_org(GitHubSDK.Client.t()) :: result
  @spec remove_all_custom_labels_from_self_hosted_runner_for_org(GitHubSDK.Client.t(), map()) ::
          result
  def remove_all_custom_labels_from_self_hosted_runner_for_org(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :remove_all_custom_labels_from_self_hosted_runner_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"runner_id", :runner_id}],
      path_template: "/orgs/{org}/actions/runners/{runner_id}/labels",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove all custom labels from a self-hosted runner for a repository\n\nPath: /repos/{owner}/{repo}/actions/runners/{runner_id}/labels\n\nMethod: delete"
  @spec remove_all_custom_labels_from_self_hosted_runner_for_repo(GitHubSDK.Client.t()) :: result
  @spec remove_all_custom_labels_from_self_hosted_runner_for_repo(GitHubSDK.Client.t(), map()) ::
          result
  def remove_all_custom_labels_from_self_hosted_runner_for_repo(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :remove_all_custom_labels_from_self_hosted_runner_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"runner_id", :runner_id}],
      path_template: "/repos/{owner}/{repo}/actions/runners/{runner_id}/labels",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove a custom label from a self-hosted runner for an organization\n\nPath: /orgs/{org}/actions/runners/{runner_id}/labels/{name}\n\nMethod: delete"
  @spec remove_custom_label_from_self_hosted_runner_for_org(GitHubSDK.Client.t()) :: result
  @spec remove_custom_label_from_self_hosted_runner_for_org(GitHubSDK.Client.t(), map()) :: result
  def remove_custom_label_from_self_hosted_runner_for_org(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :remove_custom_label_from_self_hosted_runner_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"runner_id", :runner_id}, {"name", :name}],
      path_template: "/orgs/{org}/actions/runners/{runner_id}/labels/{name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove a custom label from a self-hosted runner for a repository\n\nPath: /repos/{owner}/{repo}/actions/runners/{runner_id}/labels/{name}\n\nMethod: delete"
  @spec remove_custom_label_from_self_hosted_runner_for_repo(GitHubSDK.Client.t()) :: result
  @spec remove_custom_label_from_self_hosted_runner_for_repo(GitHubSDK.Client.t(), map()) ::
          result
  def remove_custom_label_from_self_hosted_runner_for_repo(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :remove_custom_label_from_self_hosted_runner_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"owner", :owner}, {"repo", :repo}, {"runner_id", :runner_id}, {"name", :name}],
      path_template: "/repos/{owner}/{repo}/actions/runners/{runner_id}/labels/{name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove repository access to a self-hosted runner group in an organization\n\nPath: /orgs/{org}/actions/runner-groups/{runner_group_id}/repositories/{repository_id}\n\nMethod: delete"
  @spec remove_repo_access_to_self_hosted_runner_group_in_org(GitHubSDK.Client.t()) :: result
  @spec remove_repo_access_to_self_hosted_runner_group_in_org(GitHubSDK.Client.t(), map()) ::
          result
  def remove_repo_access_to_self_hosted_runner_group_in_org(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :remove_repo_access_to_self_hosted_runner_group_in_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [
        {"org", :org},
        {"runner_group_id", :runner_group_id},
        {"repository_id", :repository_id}
      ],
      path_template:
        "/orgs/{org}/actions/runner-groups/{runner_group_id}/repositories/{repository_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove selected repository from an organization secret\n\nPath: /orgs/{org}/actions/secrets/{secret_name}/repositories/{repository_id}\n\nMethod: delete"
  @spec remove_selected_repo_from_org_secret(GitHubSDK.Client.t()) :: result
  @spec remove_selected_repo_from_org_secret(GitHubSDK.Client.t(), map()) :: result
  def remove_selected_repo_from_org_secret(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :remove_selected_repo_from_org_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"secret_name", :secret_name}, {"repository_id", :repository_id}],
      path_template: "/orgs/{org}/actions/secrets/{secret_name}/repositories/{repository_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove selected repository from an organization variable\n\nPath: /orgs/{org}/actions/variables/{name}/repositories/{repository_id}\n\nMethod: delete"
  @spec remove_selected_repo_from_org_variable(GitHubSDK.Client.t()) :: result
  @spec remove_selected_repo_from_org_variable(GitHubSDK.Client.t(), map()) :: result
  def remove_selected_repo_from_org_variable(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :remove_selected_repo_from_org_variable},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"name", :name}, {"repository_id", :repository_id}],
      path_template: "/orgs/{org}/actions/variables/{name}/repositories/{repository_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove a self-hosted runner from a group for an organization\n\nPath: /orgs/{org}/actions/runner-groups/{runner_group_id}/runners/{runner_id}\n\nMethod: delete"
  @spec remove_self_hosted_runner_from_group_for_org(GitHubSDK.Client.t()) :: result
  @spec remove_self_hosted_runner_from_group_for_org(GitHubSDK.Client.t(), map()) :: result
  def remove_self_hosted_runner_from_group_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Actions, :remove_self_hosted_runner_from_group_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"runner_group_id", :runner_group_id}, {"runner_id", :runner_id}],
      path_template: "/orgs/{org}/actions/runner-groups/{runner_group_id}/runners/{runner_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Review custom deployment protection rules for a workflow run\n\nPath: /repos/{owner}/{repo}/actions/runs/{run_id}/deployment_protection_rule\n\nMethod: post"
  @spec review_custom_gates_for_run(GitHubSDK.Client.t()) :: result
  @spec review_custom_gates_for_run(GitHubSDK.Client.t(), map()) :: result
  def review_custom_gates_for_run(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :review_custom_gates_for_run},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/deployment_protection_rule",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Review pending deployments for a workflow run\n\nPath: /repos/{owner}/{repo}/actions/runs/{run_id}/pending_deployments\n\nMethod: post"
  @spec review_pending_deployments_for_run(GitHubSDK.Client.t()) :: result
  @spec review_pending_deployments_for_run(GitHubSDK.Client.t(), map()) :: result
  def review_pending_deployments_for_run(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :review_pending_deployments_for_run},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/pending_deployments",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set GitHub Actions cache retention limit for an enterprise\n\nPath: /enterprises/{enterprise}/actions/cache/retention-limit\n\nMethod: put"
  @spec set_actions_cache_retention_limit_for_enterprise(GitHubSDK.Client.t()) :: result
  @spec set_actions_cache_retention_limit_for_enterprise(GitHubSDK.Client.t(), map()) :: result
  def set_actions_cache_retention_limit_for_enterprise(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :set_actions_cache_retention_limit_for_enterprise},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"enterprise", :enterprise}],
      path_template: "/enterprises/{enterprise}/actions/cache/retention-limit",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set GitHub Actions cache retention limit for an organization\n\nPath: /organizations/{org}/actions/cache/retention-limit\n\nMethod: put"
  @spec set_actions_cache_retention_limit_for_organization(GitHubSDK.Client.t()) :: result
  @spec set_actions_cache_retention_limit_for_organization(GitHubSDK.Client.t(), map()) :: result
  def set_actions_cache_retention_limit_for_organization(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :set_actions_cache_retention_limit_for_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}],
      path_template: "/organizations/{org}/actions/cache/retention-limit",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set GitHub Actions cache retention limit for a repository\n\nPath: /repos/{owner}/{repo}/actions/cache/retention-limit\n\nMethod: put"
  @spec set_actions_cache_retention_limit_for_repository(GitHubSDK.Client.t()) :: result
  @spec set_actions_cache_retention_limit_for_repository(GitHubSDK.Client.t(), map()) :: result
  def set_actions_cache_retention_limit_for_repository(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :set_actions_cache_retention_limit_for_repository},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/cache/retention-limit",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set GitHub Actions cache storage limit for an enterprise\n\nPath: /enterprises/{enterprise}/actions/cache/storage-limit\n\nMethod: put"
  @spec set_actions_cache_storage_limit_for_enterprise(GitHubSDK.Client.t()) :: result
  @spec set_actions_cache_storage_limit_for_enterprise(GitHubSDK.Client.t(), map()) :: result
  def set_actions_cache_storage_limit_for_enterprise(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :set_actions_cache_storage_limit_for_enterprise},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"enterprise", :enterprise}],
      path_template: "/enterprises/{enterprise}/actions/cache/storage-limit",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set GitHub Actions cache storage limit for an organization\n\nPath: /organizations/{org}/actions/cache/storage-limit\n\nMethod: put"
  @spec set_actions_cache_storage_limit_for_organization(GitHubSDK.Client.t()) :: result
  @spec set_actions_cache_storage_limit_for_organization(GitHubSDK.Client.t(), map()) :: result
  def set_actions_cache_storage_limit_for_organization(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :set_actions_cache_storage_limit_for_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}],
      path_template: "/organizations/{org}/actions/cache/storage-limit",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set GitHub Actions cache storage limit for a repository\n\nPath: /repos/{owner}/{repo}/actions/cache/storage-limit\n\nMethod: put"
  @spec set_actions_cache_storage_limit_for_repository(GitHubSDK.Client.t()) :: result
  @spec set_actions_cache_storage_limit_for_repository(GitHubSDK.Client.t(), map()) :: result
  def set_actions_cache_storage_limit_for_repository(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :set_actions_cache_storage_limit_for_repository},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/cache/storage-limit",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set allowed actions and reusable workflows for an organization\n\nPath: /orgs/{org}/actions/permissions/selected-actions\n\nMethod: put"
  @spec set_allowed_actions_organization(GitHubSDK.Client.t()) :: result
  @spec set_allowed_actions_organization(GitHubSDK.Client.t(), map()) :: result
  def set_allowed_actions_organization(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :set_allowed_actions_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/permissions/selected-actions",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set allowed actions and reusable workflows for a repository\n\nPath: /repos/{owner}/{repo}/actions/permissions/selected-actions\n\nMethod: put"
  @spec set_allowed_actions_repository(GitHubSDK.Client.t()) :: result
  @spec set_allowed_actions_repository(GitHubSDK.Client.t(), map()) :: result
  def set_allowed_actions_repository(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :set_allowed_actions_repository},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/permissions/selected-actions",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set artifact and log retention settings for an organization\n\nPath: /orgs/{org}/actions/permissions/artifact-and-log-retention\n\nMethod: put"
  @spec set_artifact_and_log_retention_settings_organization(GitHubSDK.Client.t()) :: result
  @spec set_artifact_and_log_retention_settings_organization(GitHubSDK.Client.t(), map()) ::
          result
  def set_artifact_and_log_retention_settings_organization(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :set_artifact_and_log_retention_settings_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/permissions/artifact-and-log-retention",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set artifact and log retention settings for a repository\n\nPath: /repos/{owner}/{repo}/actions/permissions/artifact-and-log-retention\n\nMethod: put"
  @spec set_artifact_and_log_retention_settings_repository(GitHubSDK.Client.t()) :: result
  @spec set_artifact_and_log_retention_settings_repository(GitHubSDK.Client.t(), map()) :: result
  def set_artifact_and_log_retention_settings_repository(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :set_artifact_and_log_retention_settings_repository},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/permissions/artifact-and-log-retention",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set custom labels for a self-hosted runner for an organization\n\nPath: /orgs/{org}/actions/runners/{runner_id}/labels\n\nMethod: put"
  @spec set_custom_labels_for_self_hosted_runner_for_org(GitHubSDK.Client.t()) :: result
  @spec set_custom_labels_for_self_hosted_runner_for_org(GitHubSDK.Client.t(), map()) :: result
  def set_custom_labels_for_self_hosted_runner_for_org(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :set_custom_labels_for_self_hosted_runner_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"runner_id", :runner_id}],
      path_template: "/orgs/{org}/actions/runners/{runner_id}/labels",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set custom labels for a self-hosted runner for a repository\n\nPath: /repos/{owner}/{repo}/actions/runners/{runner_id}/labels\n\nMethod: put"
  @spec set_custom_labels_for_self_hosted_runner_for_repo(GitHubSDK.Client.t()) :: result
  @spec set_custom_labels_for_self_hosted_runner_for_repo(GitHubSDK.Client.t(), map()) :: result
  def set_custom_labels_for_self_hosted_runner_for_repo(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :set_custom_labels_for_self_hosted_runner_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}, {"runner_id", :runner_id}],
      path_template: "/repos/{owner}/{repo}/actions/runners/{runner_id}/labels",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set the customization template for an OIDC subject claim for a repository\n\nPath: /repos/{owner}/{repo}/actions/oidc/customization/sub\n\nMethod: put"
  @spec set_custom_oidc_sub_claim_for_repo(GitHubSDK.Client.t()) :: result
  @spec set_custom_oidc_sub_claim_for_repo(GitHubSDK.Client.t(), map()) :: result
  def set_custom_oidc_sub_claim_for_repo(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :set_custom_oidc_sub_claim_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/oidc/customization/sub",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set fork PR contributor approval permissions for an organization\n\nPath: /orgs/{org}/actions/permissions/fork-pr-contributor-approval\n\nMethod: put"
  @spec set_fork_pr_contributor_approval_permissions_organization(GitHubSDK.Client.t()) :: result
  @spec set_fork_pr_contributor_approval_permissions_organization(GitHubSDK.Client.t(), map()) ::
          result
  def set_fork_pr_contributor_approval_permissions_organization(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :set_fork_pr_contributor_approval_permissions_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/permissions/fork-pr-contributor-approval",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set fork PR contributor approval permissions for a repository\n\nPath: /repos/{owner}/{repo}/actions/permissions/fork-pr-contributor-approval\n\nMethod: put"
  @spec set_fork_pr_contributor_approval_permissions_repository(GitHubSDK.Client.t()) :: result
  @spec set_fork_pr_contributor_approval_permissions_repository(GitHubSDK.Client.t(), map()) ::
          result
  def set_fork_pr_contributor_approval_permissions_repository(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :set_fork_pr_contributor_approval_permissions_repository},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/permissions/fork-pr-contributor-approval",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set default workflow permissions for an organization\n\nPath: /orgs/{org}/actions/permissions/workflow\n\nMethod: put"
  @spec set_github_actions_default_workflow_permissions_organization(GitHubSDK.Client.t()) ::
          result
  @spec set_github_actions_default_workflow_permissions_organization(GitHubSDK.Client.t(), map()) ::
          result
  def set_github_actions_default_workflow_permissions_organization(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :set_github_actions_default_workflow_permissions_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/permissions/workflow",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set default workflow permissions for a repository\n\nPath: /repos/{owner}/{repo}/actions/permissions/workflow\n\nMethod: put"
  @spec set_github_actions_default_workflow_permissions_repository(GitHubSDK.Client.t()) :: result
  @spec set_github_actions_default_workflow_permissions_repository(GitHubSDK.Client.t(), map()) ::
          result
  def set_github_actions_default_workflow_permissions_repository(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :set_github_actions_default_workflow_permissions_repository},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/permissions/workflow",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set GitHub Actions permissions for an organization\n\nPath: /orgs/{org}/actions/permissions\n\nMethod: put"
  @spec set_github_actions_permissions_organization(GitHubSDK.Client.t()) :: result
  @spec set_github_actions_permissions_organization(GitHubSDK.Client.t(), map()) :: result
  def set_github_actions_permissions_organization(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :set_github_actions_permissions_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/permissions",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set GitHub Actions permissions for a repository\n\nPath: /repos/{owner}/{repo}/actions/permissions\n\nMethod: put"
  @spec set_github_actions_permissions_repository(GitHubSDK.Client.t()) :: result
  @spec set_github_actions_permissions_repository(GitHubSDK.Client.t(), map()) :: result
  def set_github_actions_permissions_repository(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :set_github_actions_permissions_repository},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/permissions",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set private repo fork PR workflow settings for an organization\n\nPath: /orgs/{org}/actions/permissions/fork-pr-workflows-private-repos\n\nMethod: put"
  @spec set_private_repo_fork_pr_workflows_settings_organization(GitHubSDK.Client.t()) :: result
  @spec set_private_repo_fork_pr_workflows_settings_organization(GitHubSDK.Client.t(), map()) ::
          result
  def set_private_repo_fork_pr_workflows_settings_organization(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :set_private_repo_fork_pr_workflows_settings_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/permissions/fork-pr-workflows-private-repos",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set private repo fork PR workflow settings for a repository\n\nPath: /repos/{owner}/{repo}/actions/permissions/fork-pr-workflows-private-repos\n\nMethod: put"
  @spec set_private_repo_fork_pr_workflows_settings_repository(GitHubSDK.Client.t()) :: result
  @spec set_private_repo_fork_pr_workflows_settings_repository(GitHubSDK.Client.t(), map()) ::
          result
  def set_private_repo_fork_pr_workflows_settings_repository(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :set_private_repo_fork_pr_workflows_settings_repository},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/permissions/fork-pr-workflows-private-repos",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set repository access for a self-hosted runner group in an organization\n\nPath: /orgs/{org}/actions/runner-groups/{runner_group_id}/repositories\n\nMethod: put"
  @spec set_repo_access_to_self_hosted_runner_group_in_org(GitHubSDK.Client.t()) :: result
  @spec set_repo_access_to_self_hosted_runner_group_in_org(GitHubSDK.Client.t(), map()) :: result
  def set_repo_access_to_self_hosted_runner_group_in_org(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :set_repo_access_to_self_hosted_runner_group_in_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"runner_group_id", :runner_group_id}],
      path_template: "/orgs/{org}/actions/runner-groups/{runner_group_id}/repositories",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set selected repositories for an organization secret\n\nPath: /orgs/{org}/actions/secrets/{secret_name}/repositories\n\nMethod: put"
  @spec set_selected_repos_for_org_secret(GitHubSDK.Client.t()) :: result
  @spec set_selected_repos_for_org_secret(GitHubSDK.Client.t(), map()) :: result
  def set_selected_repos_for_org_secret(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :set_selected_repos_for_org_secret},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"secret_name", :secret_name}],
      path_template: "/orgs/{org}/actions/secrets/{secret_name}/repositories",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set selected repositories for an organization variable\n\nPath: /orgs/{org}/actions/variables/{name}/repositories\n\nMethod: put"
  @spec set_selected_repos_for_org_variable(GitHubSDK.Client.t()) :: result
  @spec set_selected_repos_for_org_variable(GitHubSDK.Client.t(), map()) :: result
  def set_selected_repos_for_org_variable(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :set_selected_repos_for_org_variable},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"name", :name}],
      path_template: "/orgs/{org}/actions/variables/{name}/repositories",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set selected repositories enabled for GitHub Actions in an organization\n\nPath: /orgs/{org}/actions/permissions/repositories\n\nMethod: put"
  @spec set_selected_repositories_enabled_github_actions_organization(GitHubSDK.Client.t()) ::
          result
  @spec set_selected_repositories_enabled_github_actions_organization(GitHubSDK.Client.t(), map()) ::
          result
  def set_selected_repositories_enabled_github_actions_organization(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :set_selected_repositories_enabled_github_actions_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/permissions/repositories",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set repositories allowed to use self-hosted runners in an organization\n\nPath: /orgs/{org}/actions/permissions/self-hosted-runners/repositories\n\nMethod: put"
  @spec set_selected_repositories_self_hosted_runners_organization(GitHubSDK.Client.t()) :: result
  @spec set_selected_repositories_self_hosted_runners_organization(GitHubSDK.Client.t(), map()) ::
          result
  def set_selected_repositories_self_hosted_runners_organization(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :set_selected_repositories_self_hosted_runners_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/permissions/self-hosted-runners/repositories",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set self-hosted runners in a group for an organization\n\nPath: /orgs/{org}/actions/runner-groups/{runner_group_id}/runners\n\nMethod: put"
  @spec set_self_hosted_runners_in_group_for_org(GitHubSDK.Client.t()) :: result
  @spec set_self_hosted_runners_in_group_for_org(GitHubSDK.Client.t(), map()) :: result
  def set_self_hosted_runners_in_group_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :set_self_hosted_runners_in_group_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"runner_group_id", :runner_group_id}],
      path_template: "/orgs/{org}/actions/runner-groups/{runner_group_id}/runners",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set self-hosted runners settings for an organization\n\nPath: /orgs/{org}/actions/permissions/self-hosted-runners\n\nMethod: put"
  @spec set_self_hosted_runners_permissions_organization(GitHubSDK.Client.t()) :: result
  @spec set_self_hosted_runners_permissions_organization(GitHubSDK.Client.t(), map()) :: result
  def set_self_hosted_runners_permissions_organization(client, params \\ %{})
      when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :set_self_hosted_runners_permissions_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/actions/permissions/self-hosted-runners",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set the level of access for workflows outside of the repository\n\nPath: /repos/{owner}/{repo}/actions/permissions/access\n\nMethod: put"
  @spec set_workflow_access_to_repository(GitHubSDK.Client.t()) :: result
  @spec set_workflow_access_to_repository(GitHubSDK.Client.t(), map()) :: result
  def set_workflow_access_to_repository(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :set_workflow_access_to_repository},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/actions/permissions/access",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update an environment variable\n\nPath: /repos/{owner}/{repo}/environments/{environment_name}/variables/{name}\n\nMethod: patch"
  @spec update_environment_variable(GitHubSDK.Client.t()) :: result
  @spec update_environment_variable(GitHubSDK.Client.t(), map()) :: result
  def update_environment_variable(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :update_environment_variable},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [
        {"owner", :owner},
        {"repo", :repo},
        {"name", :name},
        {"environment_name", :environment_name}
      ],
      path_template: "/repos/{owner}/{repo}/environments/{environment_name}/variables/{name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update a GitHub-hosted runner for an organization\n\nPath: /orgs/{org}/actions/hosted-runners/{hosted_runner_id}\n\nMethod: patch"
  @spec update_hosted_runner_for_org(GitHubSDK.Client.t()) :: result
  @spec update_hosted_runner_for_org(GitHubSDK.Client.t(), map()) :: result
  def update_hosted_runner_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :update_hosted_runner_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"org", :org}, {"hosted_runner_id", :hosted_runner_id}],
      path_template: "/orgs/{org}/actions/hosted-runners/{hosted_runner_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update an organization variable\n\nPath: /orgs/{org}/actions/variables/{name}\n\nMethod: patch"
  @spec update_org_variable(GitHubSDK.Client.t()) :: result
  @spec update_org_variable(GitHubSDK.Client.t(), map()) :: result
  def update_org_variable(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :update_org_variable},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"org", :org}, {"name", :name}],
      path_template: "/orgs/{org}/actions/variables/{name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update a repository variable\n\nPath: /repos/{owner}/{repo}/actions/variables/{name}\n\nMethod: patch"
  @spec update_repo_variable(GitHubSDK.Client.t()) :: result
  @spec update_repo_variable(GitHubSDK.Client.t(), map()) :: result
  def update_repo_variable(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :update_repo_variable},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"owner", :owner}, {"repo", :repo}, {"name", :name}],
      path_template: "/repos/{owner}/{repo}/actions/variables/{name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update a self-hosted runner group for an organization\n\nPath: /orgs/{org}/actions/runner-groups/{runner_group_id}\n\nMethod: patch"
  @spec update_self_hosted_runner_group_for_org(GitHubSDK.Client.t()) :: result
  @spec update_self_hosted_runner_group_for_org(GitHubSDK.Client.t(), map()) :: result
  def update_self_hosted_runner_group_for_org(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Actions, :update_self_hosted_runner_group_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"org", :org}, {"runner_group_id", :runner_group_id}],
      path_template: "/orgs/{org}/actions/runner-groups/{runner_group_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

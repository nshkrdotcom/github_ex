# Endpoints available for GitHub App installation access tokens

<p>Your GitHub App can make requests to the following REST endpoints with an installation access token.</p>

## actions

* [`GET /enterprises/{enterprise}/actions/cache/retention-limit`](/en/rest/actions/cache#get-github-actions-cache-retention-limit-for-an-enterprise)

* [`PUT /enterprises/{enterprise}/actions/cache/retention-limit`](/en/rest/actions/cache#set-github-actions-cache-retention-limit-for-an-enterprise)

* [`GET /enterprises/{enterprise}/actions/cache/storage-limit`](/en/rest/actions/cache#get-github-actions-cache-storage-limit-for-an-enterprise)

* [`PUT /enterprises/{enterprise}/actions/cache/storage-limit`](/en/rest/actions/cache#set-github-actions-cache-storage-limit-for-an-enterprise)

* [`GET /enterprises/{enterprise}/actions/oidc/customization/properties/repo`](/en/rest/actions/oidc#list-oidc-custom-property-inclusions-for-an-enterprise)

* [`POST /enterprises/{enterprise}/actions/oidc/customization/properties/repo`](/en/rest/actions/oidc#create-an-oidc-custom-property-inclusion-for-an-enterprise)

* [`DELETE /enterprises/{enterprise}/actions/oidc/customization/properties/repo/{custom_property_name}`](/en/rest/actions/oidc#delete-an-oidc-custom-property-inclusion-for-an-enterprise)

* [`GET /organizations/{org}/actions/cache/retention-limit`](/en/rest/actions/cache#get-github-actions-cache-retention-limit-for-an-organization)

* [`PUT /organizations/{org}/actions/cache/retention-limit`](/en/rest/actions/cache#set-github-actions-cache-retention-limit-for-an-organization)

* [`GET /organizations/{org}/actions/cache/storage-limit`](/en/rest/actions/cache#get-github-actions-cache-storage-limit-for-an-organization)

* [`PUT /organizations/{org}/actions/cache/storage-limit`](/en/rest/actions/cache#set-github-actions-cache-storage-limit-for-an-organization)

* [`GET /orgs/{org}/actions/cache/usage`](/en/rest/actions/cache#get-github-actions-cache-usage-for-an-organization)

* [`GET /orgs/{org}/actions/cache/usage-by-repository`](/en/rest/actions/cache#list-repositories-with-github-actions-cache-usage-for-an-organization)

* [`GET /orgs/{org}/actions/hosted-runners`](/en/rest/actions/hosted-runners#list-github-hosted-runners-for-an-organization)

* [`POST /orgs/{org}/actions/hosted-runners`](/en/rest/actions/hosted-runners#create-a-github-hosted-runner-for-an-organization)

* [`GET /orgs/{org}/actions/hosted-runners/images/custom`](/en/rest/actions/hosted-runners#list-custom-images-for-an-organization)

* [`GET /orgs/{org}/actions/hosted-runners/images/custom/{image_definition_id}`](/en/rest/actions/hosted-runners#get-a-custom-image-definition-for-github-actions-hosted-runners)

* [`DELETE /orgs/{org}/actions/hosted-runners/images/custom/{image_definition_id}`](/en/rest/actions/hosted-runners#delete-a-custom-image-from-the-organization)

* [`GET /orgs/{org}/actions/hosted-runners/images/custom/{image_definition_id}/versions`](/en/rest/actions/hosted-runners#list-image-versions-of-a-custom-image-for-an-organization)

* [`GET /orgs/{org}/actions/hosted-runners/images/custom/{image_definition_id}/versions/{version}`](/en/rest/actions/hosted-runners#get-an-image-version-of-a-custom-image-for-github-actions-hosted-runners)

* [`DELETE /orgs/{org}/actions/hosted-runners/images/custom/{image_definition_id}/versions/{version}`](/en/rest/actions/hosted-runners#delete-an-image-version-of-custom-image-from-the-organization)

* [`GET /orgs/{org}/actions/hosted-runners/images/github-owned`](/en/rest/actions/hosted-runners#get-github-owned-images-for-github-hosted-runners-in-an-organization)

* [`GET /orgs/{org}/actions/hosted-runners/images/partner`](/en/rest/actions/hosted-runners#get-partner-images-for-github-hosted-runners-in-an-organization)

* [`GET /orgs/{org}/actions/hosted-runners/limits`](/en/rest/actions/hosted-runners#get-limits-on-github-hosted-runners-for-an-organization)

* [`GET /orgs/{org}/actions/hosted-runners/machine-sizes`](/en/rest/actions/hosted-runners#get-github-hosted-runners-machine-specs-for-an-organization)

* [`GET /orgs/{org}/actions/hosted-runners/platforms`](/en/rest/actions/hosted-runners#get-platforms-for-github-hosted-runners-in-an-organization)

* [`GET /orgs/{org}/actions/hosted-runners/{hosted_runner_id}`](/en/rest/actions/hosted-runners#get-a-github-hosted-runner-for-an-organization)

* [`PATCH /orgs/{org}/actions/hosted-runners/{hosted_runner_id}`](/en/rest/actions/hosted-runners#update-a-github-hosted-runner-for-an-organization)

* [`DELETE /orgs/{org}/actions/hosted-runners/{hosted_runner_id}`](/en/rest/actions/hosted-runners#delete-a-github-hosted-runner-for-an-organization)

* [`GET /orgs/{org}/actions/oidc/customization/properties/repo`](/en/rest/actions/oidc#list-oidc-custom-property-inclusions-for-an-organization)

* [`POST /orgs/{org}/actions/oidc/customization/properties/repo`](/en/rest/actions/oidc#create-an-oidc-custom-property-inclusion-for-an-organization)

* [`DELETE /orgs/{org}/actions/oidc/customization/properties/repo/{custom_property_name}`](/en/rest/actions/oidc#delete-an-oidc-custom-property-inclusion-for-an-organization)

* [`GET /orgs/{org}/actions/oidc/customization/sub`](/en/rest/actions/oidc#get-the-customization-template-for-an-oidc-subject-claim-for-an-organization)

* [`PUT /orgs/{org}/actions/oidc/customization/sub`](/en/rest/actions/oidc#set-the-customization-template-for-an-oidc-subject-claim-for-an-organization)

* [`GET /orgs/{org}/actions/permissions`](/en/rest/actions/permissions#get-github-actions-permissions-for-an-organization)

* [`PUT /orgs/{org}/actions/permissions`](/en/rest/actions/permissions#set-github-actions-permissions-for-an-organization)

* [`GET /orgs/{org}/actions/permissions/artifact-and-log-retention`](/en/rest/actions/permissions#get-artifact-and-log-retention-settings-for-an-organization)

* [`PUT /orgs/{org}/actions/permissions/artifact-and-log-retention`](/en/rest/actions/permissions#set-artifact-and-log-retention-settings-for-an-organization)

* [`GET /orgs/{org}/actions/permissions/fork-pr-contributor-approval`](/en/rest/actions/permissions#get-fork-pr-contributor-approval-permissions-for-an-organization)

* [`PUT /orgs/{org}/actions/permissions/fork-pr-contributor-approval`](/en/rest/actions/permissions#set-fork-pr-contributor-approval-permissions-for-an-organization)

* [`GET /orgs/{org}/actions/permissions/fork-pr-workflows-private-repos`](/en/rest/actions/permissions#get-private-repo-fork-pr-workflow-settings-for-an-organization)

* [`PUT /orgs/{org}/actions/permissions/fork-pr-workflows-private-repos`](/en/rest/actions/permissions#set-private-repo-fork-pr-workflow-settings-for-an-organization)

* [`GET /orgs/{org}/actions/permissions/repositories`](/en/rest/actions/permissions#list-selected-repositories-enabled-for-github-actions-in-an-organization)

* [`PUT /orgs/{org}/actions/permissions/repositories`](/en/rest/actions/permissions#set-selected-repositories-enabled-for-github-actions-in-an-organization)

* [`PUT /orgs/{org}/actions/permissions/repositories/{repository_id}`](/en/rest/actions/permissions#enable-a-selected-repository-for-github-actions-in-an-organization)

* [`DELETE /orgs/{org}/actions/permissions/repositories/{repository_id}`](/en/rest/actions/permissions#disable-a-selected-repository-for-github-actions-in-an-organization)

* [`GET /orgs/{org}/actions/permissions/selected-actions`](/en/rest/actions/permissions#get-allowed-actions-and-reusable-workflows-for-an-organization)

* [`PUT /orgs/{org}/actions/permissions/selected-actions`](/en/rest/actions/permissions#set-allowed-actions-and-reusable-workflows-for-an-organization)

* [`GET /orgs/{org}/actions/permissions/self-hosted-runners`](/en/rest/actions/permissions#get-self-hosted-runners-settings-for-an-organization)

* [`PUT /orgs/{org}/actions/permissions/self-hosted-runners`](/en/rest/actions/permissions#set-self-hosted-runners-settings-for-an-organization)

* [`GET /orgs/{org}/actions/permissions/self-hosted-runners/repositories`](/en/rest/actions/permissions#list-repositories-allowed-to-use-self-hosted-runners-in-an-organization)

* [`PUT /orgs/{org}/actions/permissions/self-hosted-runners/repositories`](/en/rest/actions/permissions#set-repositories-allowed-to-use-self-hosted-runners-in-an-organization)

* [`PUT /orgs/{org}/actions/permissions/self-hosted-runners/repositories/{repository_id}`](/en/rest/actions/permissions#add-a-repository-to-the-list-of-repositories-allowed-to-use-self-hosted-runners-in-an-organization)

* [`DELETE /orgs/{org}/actions/permissions/self-hosted-runners/repositories/{repository_id}`](/en/rest/actions/permissions#remove-a-repository-from-the-list-of-repositories-allowed-to-use-self-hosted-runners-in-an-organization)

* [`GET /orgs/{org}/actions/permissions/workflow`](/en/rest/actions/permissions#get-default-workflow-permissions-for-an-organization)

* [`PUT /orgs/{org}/actions/permissions/workflow`](/en/rest/actions/permissions#set-default-workflow-permissions-for-an-organization)

* [`GET /orgs/{org}/actions/runner-groups`](/en/rest/actions/self-hosted-runner-groups#list-self-hosted-runner-groups-for-an-organization)

* [`POST /orgs/{org}/actions/runner-groups`](/en/rest/actions/self-hosted-runner-groups#create-a-self-hosted-runner-group-for-an-organization)

* [`GET /orgs/{org}/actions/runner-groups/{runner_group_id}`](/en/rest/actions/self-hosted-runner-groups#get-a-self-hosted-runner-group-for-an-organization)

* [`PATCH /orgs/{org}/actions/runner-groups/{runner_group_id}`](/en/rest/actions/self-hosted-runner-groups#update-a-self-hosted-runner-group-for-an-organization)

* [`DELETE /orgs/{org}/actions/runner-groups/{runner_group_id}`](/en/rest/actions/self-hosted-runner-groups#delete-a-self-hosted-runner-group-from-an-organization)

* [`GET /orgs/{org}/actions/runner-groups/{runner_group_id}/hosted-runners`](/en/rest/actions/self-hosted-runner-groups#list-github-hosted-runners-in-a-group-for-an-organization)

* [`GET /orgs/{org}/actions/runner-groups/{runner_group_id}/repositories`](/en/rest/actions/self-hosted-runner-groups#list-repository-access-to-a-self-hosted-runner-group-in-an-organization)

* [`PUT /orgs/{org}/actions/runner-groups/{runner_group_id}/repositories`](/en/rest/actions/self-hosted-runner-groups#set-repository-access-for-a-self-hosted-runner-group-in-an-organization)

* [`PUT /orgs/{org}/actions/runner-groups/{runner_group_id}/repositories/{repository_id}`](/en/rest/actions/self-hosted-runner-groups#add-repository-access-to-a-self-hosted-runner-group-in-an-organization)

* [`DELETE /orgs/{org}/actions/runner-groups/{runner_group_id}/repositories/{repository_id}`](/en/rest/actions/self-hosted-runner-groups#remove-repository-access-to-a-self-hosted-runner-group-in-an-organization)

* [`GET /orgs/{org}/actions/runner-groups/{runner_group_id}/runners`](/en/rest/actions/self-hosted-runner-groups#list-self-hosted-runners-in-a-group-for-an-organization)

* [`PUT /orgs/{org}/actions/runner-groups/{runner_group_id}/runners`](/en/rest/actions/self-hosted-runner-groups#set-self-hosted-runners-in-a-group-for-an-organization)

* [`PUT /orgs/{org}/actions/runner-groups/{runner_group_id}/runners/{runner_id}`](/en/rest/actions/self-hosted-runner-groups#add-a-self-hosted-runner-to-a-group-for-an-organization)

* [`DELETE /orgs/{org}/actions/runner-groups/{runner_group_id}/runners/{runner_id}`](/en/rest/actions/self-hosted-runner-groups#remove-a-self-hosted-runner-from-a-group-for-an-organization)

* [`GET /orgs/{org}/actions/runners`](/en/rest/actions/self-hosted-runners#list-self-hosted-runners-for-an-organization)

* [`GET /orgs/{org}/actions/runners/downloads`](/en/rest/actions/self-hosted-runners#list-runner-applications-for-an-organization)

* [`POST /orgs/{org}/actions/runners/generate-jitconfig`](/en/rest/actions/self-hosted-runners#create-configuration-for-a-just-in-time-runner-for-an-organization)

* [`POST /orgs/{org}/actions/runners/registration-token`](/en/rest/actions/self-hosted-runners#create-a-registration-token-for-an-organization)

* [`POST /orgs/{org}/actions/runners/remove-token`](/en/rest/actions/self-hosted-runners#create-a-remove-token-for-an-organization)

* [`GET /orgs/{org}/actions/runners/{runner_id}`](/en/rest/actions/self-hosted-runners#get-a-self-hosted-runner-for-an-organization)

* [`DELETE /orgs/{org}/actions/runners/{runner_id}`](/en/rest/actions/self-hosted-runners#delete-a-self-hosted-runner-from-an-organization)

* [`GET /orgs/{org}/actions/runners/{runner_id}/labels`](/en/rest/actions/self-hosted-runners#list-labels-for-a-self-hosted-runner-for-an-organization)

* [`POST /orgs/{org}/actions/runners/{runner_id}/labels`](/en/rest/actions/self-hosted-runners#add-custom-labels-to-a-self-hosted-runner-for-an-organization)

* [`PUT /orgs/{org}/actions/runners/{runner_id}/labels`](/en/rest/actions/self-hosted-runners#set-custom-labels-for-a-self-hosted-runner-for-an-organization)

* [`DELETE /orgs/{org}/actions/runners/{runner_id}/labels`](/en/rest/actions/self-hosted-runners#remove-all-custom-labels-from-a-self-hosted-runner-for-an-organization)

* [`DELETE /orgs/{org}/actions/runners/{runner_id}/labels/{name}`](/en/rest/actions/self-hosted-runners#remove-a-custom-label-from-a-self-hosted-runner-for-an-organization)

* [`GET /orgs/{org}/actions/secrets`](/en/rest/actions/secrets#list-organization-secrets)

* [`GET /orgs/{org}/actions/secrets/public-key`](/en/rest/actions/secrets#get-an-organization-public-key)

* [`GET /orgs/{org}/actions/secrets/{secret_name}`](/en/rest/actions/secrets#get-an-organization-secret)

* [`PUT /orgs/{org}/actions/secrets/{secret_name}`](/en/rest/actions/secrets#create-or-update-an-organization-secret)

* [`DELETE /orgs/{org}/actions/secrets/{secret_name}`](/en/rest/actions/secrets#delete-an-organization-secret)

* [`GET /orgs/{org}/actions/secrets/{secret_name}/repositories`](/en/rest/actions/secrets#list-selected-repositories-for-an-organization-secret)

* [`PUT /orgs/{org}/actions/secrets/{secret_name}/repositories`](/en/rest/actions/secrets#set-selected-repositories-for-an-organization-secret)

* [`PUT /orgs/{org}/actions/secrets/{secret_name}/repositories/{repository_id}`](/en/rest/actions/secrets#add-selected-repository-to-an-organization-secret)

* [`DELETE /orgs/{org}/actions/secrets/{secret_name}/repositories/{repository_id}`](/en/rest/actions/secrets#remove-selected-repository-from-an-organization-secret)

* [`GET /orgs/{org}/actions/variables`](/en/rest/actions/variables#list-organization-variables)

* [`POST /orgs/{org}/actions/variables`](/en/rest/actions/variables#create-an-organization-variable)

* [`GET /orgs/{org}/actions/variables/{name}`](/en/rest/actions/variables#get-an-organization-variable)

* [`PATCH /orgs/{org}/actions/variables/{name}`](/en/rest/actions/variables#update-an-organization-variable)

* [`DELETE /orgs/{org}/actions/variables/{name}`](/en/rest/actions/variables#delete-an-organization-variable)

* [`GET /orgs/{org}/actions/variables/{name}/repositories`](/en/rest/actions/variables#list-selected-repositories-for-an-organization-variable)

* [`PUT /orgs/{org}/actions/variables/{name}/repositories`](/en/rest/actions/variables#set-selected-repositories-for-an-organization-variable)

* [`PUT /orgs/{org}/actions/variables/{name}/repositories/{repository_id}`](/en/rest/actions/variables#add-selected-repository-to-an-organization-variable)

* [`DELETE /orgs/{org}/actions/variables/{name}/repositories/{repository_id}`](/en/rest/actions/variables#remove-selected-repository-from-an-organization-variable)

* [`GET /repos/{owner}/{repo}/actions/artifacts`](/en/rest/actions/artifacts#list-artifacts-for-a-repository)

* [`GET /repos/{owner}/{repo}/actions/artifacts/{artifact_id}`](/en/rest/actions/artifacts#get-an-artifact)

* [`DELETE /repos/{owner}/{repo}/actions/artifacts/{artifact_id}`](/en/rest/actions/artifacts#delete-an-artifact)

* [`GET /repos/{owner}/{repo}/actions/artifacts/{artifact_id}/{archive_format}`](/en/rest/actions/artifacts#download-an-artifact)

* [`GET /repos/{owner}/{repo}/actions/cache/retention-limit`](/en/rest/actions/cache#get-github-actions-cache-retention-limit-for-a-repository)

* [`PUT /repos/{owner}/{repo}/actions/cache/retention-limit`](/en/rest/actions/cache#set-github-actions-cache-retention-limit-for-a-repository)

* [`GET /repos/{owner}/{repo}/actions/cache/storage-limit`](/en/rest/actions/cache#get-github-actions-cache-storage-limit-for-a-repository)

* [`PUT /repos/{owner}/{repo}/actions/cache/storage-limit`](/en/rest/actions/cache#set-github-actions-cache-storage-limit-for-a-repository)

* [`GET /repos/{owner}/{repo}/actions/cache/usage`](/en/rest/actions/cache#get-github-actions-cache-usage-for-a-repository)

* [`GET /repos/{owner}/{repo}/actions/caches`](/en/rest/actions/cache#list-github-actions-caches-for-a-repository)

* [`DELETE /repos/{owner}/{repo}/actions/caches`](/en/rest/actions/cache#delete-github-actions-caches-for-a-repository-using-a-cache-key)

* [`DELETE /repos/{owner}/{repo}/actions/caches/{cache_id}`](/en/rest/actions/cache#delete-a-github-actions-cache-for-a-repository-using-a-cache-id)

* [`GET /repos/{owner}/{repo}/actions/jobs/{job_id}`](/en/rest/actions/workflow-jobs#get-a-job-for-a-workflow-run)

* [`GET /repos/{owner}/{repo}/actions/jobs/{job_id}/logs`](/en/rest/actions/workflow-jobs#download-job-logs-for-a-workflow-run)

* [`POST /repos/{owner}/{repo}/actions/jobs/{job_id}/rerun`](/en/rest/actions/workflow-runs#re-run-a-job-from-a-workflow-run)

* [`GET /repos/{owner}/{repo}/actions/oidc/customization/sub`](/en/rest/actions/oidc#get-the-customization-template-for-an-oidc-subject-claim-for-a-repository)

* [`PUT /repos/{owner}/{repo}/actions/oidc/customization/sub`](/en/rest/actions/oidc#set-the-customization-template-for-an-oidc-subject-claim-for-a-repository)

* [`GET /repos/{owner}/{repo}/actions/organization-secrets`](/en/rest/actions/secrets#list-repository-organization-secrets)

* [`GET /repos/{owner}/{repo}/actions/organization-variables`](/en/rest/actions/variables#list-repository-organization-variables)

* [`GET /repos/{owner}/{repo}/actions/permissions`](/en/rest/actions/permissions#get-github-actions-permissions-for-a-repository)

* [`PUT /repos/{owner}/{repo}/actions/permissions`](/en/rest/actions/permissions#set-github-actions-permissions-for-a-repository)

* [`GET /repos/{owner}/{repo}/actions/permissions/access`](/en/rest/actions/permissions#get-the-level-of-access-for-workflows-outside-of-the-repository)

* [`PUT /repos/{owner}/{repo}/actions/permissions/access`](/en/rest/actions/permissions#set-the-level-of-access-for-workflows-outside-of-the-repository)

* [`GET /repos/{owner}/{repo}/actions/permissions/artifact-and-log-retention`](/en/rest/actions/permissions#get-artifact-and-log-retention-settings-for-a-repository)

* [`PUT /repos/{owner}/{repo}/actions/permissions/artifact-and-log-retention`](/en/rest/actions/permissions#set-artifact-and-log-retention-settings-for-a-repository)

* [`GET /repos/{owner}/{repo}/actions/permissions/fork-pr-contributor-approval`](/en/rest/actions/permissions#get-fork-pr-contributor-approval-permissions-for-a-repository)

* [`PUT /repos/{owner}/{repo}/actions/permissions/fork-pr-contributor-approval`](/en/rest/actions/permissions#set-fork-pr-contributor-approval-permissions-for-a-repository)

* [`GET /repos/{owner}/{repo}/actions/permissions/fork-pr-workflows-private-repos`](/en/rest/actions/permissions#get-private-repo-fork-pr-workflow-settings-for-a-repository)

* [`PUT /repos/{owner}/{repo}/actions/permissions/fork-pr-workflows-private-repos`](/en/rest/actions/permissions#set-private-repo-fork-pr-workflow-settings-for-a-repository)

* [`GET /repos/{owner}/{repo}/actions/permissions/selected-actions`](/en/rest/actions/permissions#get-allowed-actions-and-reusable-workflows-for-a-repository)

* [`PUT /repos/{owner}/{repo}/actions/permissions/selected-actions`](/en/rest/actions/permissions#set-allowed-actions-and-reusable-workflows-for-a-repository)

* [`GET /repos/{owner}/{repo}/actions/permissions/workflow`](/en/rest/actions/permissions#get-default-workflow-permissions-for-a-repository)

* [`PUT /repos/{owner}/{repo}/actions/permissions/workflow`](/en/rest/actions/permissions#set-default-workflow-permissions-for-a-repository)

* [`GET /repos/{owner}/{repo}/actions/runners`](/en/rest/actions/self-hosted-runners#list-self-hosted-runners-for-a-repository)

* [`GET /repos/{owner}/{repo}/actions/runners/downloads`](/en/rest/actions/self-hosted-runners#list-runner-applications-for-a-repository)

* [`POST /repos/{owner}/{repo}/actions/runners/generate-jitconfig`](/en/rest/actions/self-hosted-runners#create-configuration-for-a-just-in-time-runner-for-a-repository)

* [`POST /repos/{owner}/{repo}/actions/runners/registration-token`](/en/rest/actions/self-hosted-runners#create-a-registration-token-for-a-repository)

* [`POST /repos/{owner}/{repo}/actions/runners/remove-token`](/en/rest/actions/self-hosted-runners#create-a-remove-token-for-a-repository)

* [`GET /repos/{owner}/{repo}/actions/runners/{runner_id}`](/en/rest/actions/self-hosted-runners#get-a-self-hosted-runner-for-a-repository)

* [`DELETE /repos/{owner}/{repo}/actions/runners/{runner_id}`](/en/rest/actions/self-hosted-runners#delete-a-self-hosted-runner-from-a-repository)

* [`GET /repos/{owner}/{repo}/actions/runners/{runner_id}/labels`](/en/rest/actions/self-hosted-runners#list-labels-for-a-self-hosted-runner-for-a-repository)

* [`POST /repos/{owner}/{repo}/actions/runners/{runner_id}/labels`](/en/rest/actions/self-hosted-runners#add-custom-labels-to-a-self-hosted-runner-for-a-repository)

* [`PUT /repos/{owner}/{repo}/actions/runners/{runner_id}/labels`](/en/rest/actions/self-hosted-runners#set-custom-labels-for-a-self-hosted-runner-for-a-repository)

* [`DELETE /repos/{owner}/{repo}/actions/runners/{runner_id}/labels`](/en/rest/actions/self-hosted-runners#remove-all-custom-labels-from-a-self-hosted-runner-for-a-repository)

* [`DELETE /repos/{owner}/{repo}/actions/runners/{runner_id}/labels/{name}`](/en/rest/actions/self-hosted-runners#remove-a-custom-label-from-a-self-hosted-runner-for-a-repository)

* [`GET /repos/{owner}/{repo}/actions/runs`](/en/rest/actions/workflow-runs#list-workflow-runs-for-a-repository)

* [`GET /repos/{owner}/{repo}/actions/runs/{run_id}`](/en/rest/actions/workflow-runs#get-a-workflow-run)

* [`DELETE /repos/{owner}/{repo}/actions/runs/{run_id}`](/en/rest/actions/workflow-runs#delete-a-workflow-run)

* [`GET /repos/{owner}/{repo}/actions/runs/{run_id}/approvals`](/en/rest/actions/workflow-runs#get-the-review-history-for-a-workflow-run)

* [`POST /repos/{owner}/{repo}/actions/runs/{run_id}/approve`](/en/rest/actions/workflow-runs#approve-a-workflow-run-for-a-fork-pull-request)

* [`GET /repos/{owner}/{repo}/actions/runs/{run_id}/artifacts`](/en/rest/actions/artifacts#list-workflow-run-artifacts)

* [`GET /repos/{owner}/{repo}/actions/runs/{run_id}/attempts/{attempt_number}`](/en/rest/actions/workflow-runs#get-a-workflow-run-attempt)

* [`GET /repos/{owner}/{repo}/actions/runs/{run_id}/attempts/{attempt_number}/jobs`](/en/rest/actions/workflow-jobs#list-jobs-for-a-workflow-run-attempt)

* [`GET /repos/{owner}/{repo}/actions/runs/{run_id}/attempts/{attempt_number}/logs`](/en/rest/actions/workflow-runs#download-workflow-run-attempt-logs)

* [`POST /repos/{owner}/{repo}/actions/runs/{run_id}/cancel`](/en/rest/actions/workflow-runs#cancel-a-workflow-run)

* [`POST /repos/{owner}/{repo}/actions/runs/{run_id}/deployment_protection_rule`](/en/rest/actions/workflow-runs#review-custom-deployment-protection-rules-for-a-workflow-run)

* [`POST /repos/{owner}/{repo}/actions/runs/{run_id}/force-cancel`](/en/rest/actions/workflow-runs#force-cancel-a-workflow-run)

* [`GET /repos/{owner}/{repo}/actions/runs/{run_id}/jobs`](/en/rest/actions/workflow-jobs#list-jobs-for-a-workflow-run)

* [`GET /repos/{owner}/{repo}/actions/runs/{run_id}/logs`](/en/rest/actions/workflow-runs#download-workflow-run-logs)

* [`DELETE /repos/{owner}/{repo}/actions/runs/{run_id}/logs`](/en/rest/actions/workflow-runs#delete-workflow-run-logs)

* [`GET /repos/{owner}/{repo}/actions/runs/{run_id}/pending_deployments`](/en/rest/actions/workflow-runs#get-pending-deployments-for-a-workflow-run)

* [`POST /repos/{owner}/{repo}/actions/runs/{run_id}/pending_deployments`](/en/rest/actions/workflow-runs#review-pending-deployments-for-a-workflow-run)

* [`POST /repos/{owner}/{repo}/actions/runs/{run_id}/rerun`](/en/rest/actions/workflow-runs#re-run-a-workflow)

* [`POST /repos/{owner}/{repo}/actions/runs/{run_id}/rerun-failed-jobs`](/en/rest/actions/workflow-runs#re-run-failed-jobs-from-a-workflow-run)

* [`GET /repos/{owner}/{repo}/actions/runs/{run_id}/timing`](/en/rest/actions/workflow-runs#get-workflow-run-usage)

* [`GET /repos/{owner}/{repo}/actions/secrets`](/en/rest/actions/secrets#list-repository-secrets)

* [`GET /repos/{owner}/{repo}/actions/secrets/public-key`](/en/rest/actions/secrets#get-a-repository-public-key)

* [`GET /repos/{owner}/{repo}/actions/secrets/{secret_name}`](/en/rest/actions/secrets#get-a-repository-secret)

* [`PUT /repos/{owner}/{repo}/actions/secrets/{secret_name}`](/en/rest/actions/secrets#create-or-update-a-repository-secret)

* [`DELETE /repos/{owner}/{repo}/actions/secrets/{secret_name}`](/en/rest/actions/secrets#delete-a-repository-secret)

* [`GET /repos/{owner}/{repo}/actions/variables`](/en/rest/actions/variables#list-repository-variables)

* [`POST /repos/{owner}/{repo}/actions/variables`](/en/rest/actions/variables#create-a-repository-variable)

* [`GET /repos/{owner}/{repo}/actions/variables/{name}`](/en/rest/actions/variables#get-a-repository-variable)

* [`PATCH /repos/{owner}/{repo}/actions/variables/{name}`](/en/rest/actions/variables#update-a-repository-variable)

* [`DELETE /repos/{owner}/{repo}/actions/variables/{name}`](/en/rest/actions/variables#delete-a-repository-variable)

* [`GET /repos/{owner}/{repo}/actions/workflows`](/en/rest/actions/workflows#list-repository-workflows)

* [`GET /repos/{owner}/{repo}/actions/workflows/{workflow_id}`](/en/rest/actions/workflows#get-a-workflow)

* [`PUT /repos/{owner}/{repo}/actions/workflows/{workflow_id}/disable`](/en/rest/actions/workflows#disable-a-workflow)

* [`POST /repos/{owner}/{repo}/actions/workflows/{workflow_id}/dispatches`](/en/rest/actions/workflows#create-a-workflow-dispatch-event)

* [`PUT /repos/{owner}/{repo}/actions/workflows/{workflow_id}/enable`](/en/rest/actions/workflows#enable-a-workflow)

* [`GET /repos/{owner}/{repo}/actions/workflows/{workflow_id}/runs`](/en/rest/actions/workflow-runs#list-workflow-runs-for-a-workflow)

* [`GET /repos/{owner}/{repo}/actions/workflows/{workflow_id}/timing`](/en/rest/actions/workflows#get-workflow-usage)

* [`GET /repos/{owner}/{repo}/environments/{environment_name}/secrets`](/en/rest/actions/secrets#list-environment-secrets)

* [`GET /repos/{owner}/{repo}/environments/{environment_name}/secrets/public-key`](/en/rest/actions/secrets#get-an-environment-public-key)

* [`GET /repos/{owner}/{repo}/environments/{environment_name}/secrets/{secret_name}`](/en/rest/actions/secrets#get-an-environment-secret)

* [`PUT /repos/{owner}/{repo}/environments/{environment_name}/secrets/{secret_name}`](/en/rest/actions/secrets#create-or-update-an-environment-secret)

* [`DELETE /repos/{owner}/{repo}/environments/{environment_name}/secrets/{secret_name}`](/en/rest/actions/secrets#delete-an-environment-secret)

* [`GET /repos/{owner}/{repo}/environments/{environment_name}/variables`](/en/rest/actions/variables#list-environment-variables)

* [`POST /repos/{owner}/{repo}/environments/{environment_name}/variables`](/en/rest/actions/variables#create-an-environment-variable)

* [`GET /repos/{owner}/{repo}/environments/{environment_name}/variables/{name}`](/en/rest/actions/variables#get-an-environment-variable)

* [`PATCH /repos/{owner}/{repo}/environments/{environment_name}/variables/{name}`](/en/rest/actions/variables#update-an-environment-variable)

* [`DELETE /repos/{owner}/{repo}/environments/{environment_name}/variables/{name}`](/en/rest/actions/variables#delete-an-environment-variable)

## activity

* [`GET /events`](/en/rest/activity/events#list-public-events)

* [`GET /feeds`](/en/rest/activity/feeds#get-feeds)

* [`GET /networks/{owner}/{repo}/events`](/en/rest/activity/events#list-public-events-for-a-network-of-repositories)

* [`GET /orgs/{org}/events`](/en/rest/activity/events#list-public-organization-events)

* [`GET /repos/{owner}/{repo}/events`](/en/rest/activity/events#list-repository-events)

* [`GET /repos/{owner}/{repo}/stargazers`](/en/rest/activity/starring#list-stargazers)

* [`GET /repos/{owner}/{repo}/subscribers`](/en/rest/activity/watching#list-watchers)

* [`GET /users/{username}/events`](/en/rest/activity/events#list-events-for-the-authenticated-user)

* [`GET /users/{username}/events/public`](/en/rest/activity/events#list-public-events-for-a-user)

* [`GET /users/{username}/received_events`](/en/rest/activity/events#list-events-received-by-the-authenticated-user)

* [`GET /users/{username}/received_events/public`](/en/rest/activity/events#list-public-events-received-by-a-user)

* [`GET /users/{username}/starred`](/en/rest/activity/starring#list-repositories-starred-by-a-user)

* [`GET /users/{username}/subscriptions`](/en/rest/activity/watching#list-repositories-watched-by-a-user)

## apps

* [`GET /apps/{app_slug}`](/en/rest/apps/apps#get-an-app)

* [`GET /installation/repositories`](/en/rest/apps/installations#list-repositories-accessible-to-the-app-installation)

* [`DELETE /installation/token`](/en/rest/apps/installations#revoke-an-installation-access-token)

## billing

* [`GET /organizations/{org}/settings/billing/budgets`](/en/rest/billing/budgets#get-all-budgets-for-an-organization)

* [`GET /organizations/{org}/settings/billing/budgets/{budget_id}`](/en/rest/billing/budgets#get-a-budget-by-id-for-an-organization)

* [`PATCH /organizations/{org}/settings/billing/budgets/{budget_id}`](/en/rest/billing/budgets#update-a-budget-for-an-organization)

* [`DELETE /organizations/{org}/settings/billing/budgets/{budget_id}`](/en/rest/billing/budgets#delete-a-budget-for-an-organization)

* [`GET /organizations/{org}/settings/billing/premium_request/usage`](/en/rest/billing/usage#get-billing-premium-request-usage-report-for-an-organization)

* [`GET /organizations/{org}/settings/billing/usage`](/en/rest/billing/usage#get-billing-usage-report-for-an-organization)

* [`GET /organizations/{org}/settings/billing/usage/summary`](/en/rest/billing/usage#get-billing-usage-summary-for-an-organization)

## branches

* [`GET /repos/{owner}/{repo}/branches`](/en/rest/branches/branches#list-branches)

* [`GET /repos/{owner}/{repo}/branches/{branch}`](/en/rest/branches/branches#get-a-branch)

* [`GET /repos/{owner}/{repo}/branches/{branch}/protection`](/en/rest/branches/branch-protection#get-branch-protection)

* [`PUT /repos/{owner}/{repo}/branches/{branch}/protection`](/en/rest/branches/branch-protection#update-branch-protection)

* [`DELETE /repos/{owner}/{repo}/branches/{branch}/protection`](/en/rest/branches/branch-protection#delete-branch-protection)

* [`GET /repos/{owner}/{repo}/branches/{branch}/protection/enforce_admins`](/en/rest/branches/branch-protection#get-admin-branch-protection)

* [`POST /repos/{owner}/{repo}/branches/{branch}/protection/enforce_admins`](/en/rest/branches/branch-protection#set-admin-branch-protection)

* [`DELETE /repos/{owner}/{repo}/branches/{branch}/protection/enforce_admins`](/en/rest/branches/branch-protection#delete-admin-branch-protection)

* [`GET /repos/{owner}/{repo}/branches/{branch}/protection/required_pull_request_reviews`](/en/rest/branches/branch-protection#get-pull-request-review-protection)

* [`PATCH /repos/{owner}/{repo}/branches/{branch}/protection/required_pull_request_reviews`](/en/rest/branches/branch-protection#update-pull-request-review-protection)

* [`DELETE /repos/{owner}/{repo}/branches/{branch}/protection/required_pull_request_reviews`](/en/rest/branches/branch-protection#delete-pull-request-review-protection)

* [`GET /repos/{owner}/{repo}/branches/{branch}/protection/required_signatures`](/en/rest/branches/branch-protection#get-commit-signature-protection)

* [`POST /repos/{owner}/{repo}/branches/{branch}/protection/required_signatures`](/en/rest/branches/branch-protection#create-commit-signature-protection)

* [`DELETE /repos/{owner}/{repo}/branches/{branch}/protection/required_signatures`](/en/rest/branches/branch-protection#delete-commit-signature-protection)

* [`GET /repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks`](/en/rest/branches/branch-protection#get-status-checks-protection)

* [`PATCH /repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks`](/en/rest/branches/branch-protection#update-status-check-protection)

* [`DELETE /repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks`](/en/rest/branches/branch-protection#remove-status-check-protection)

* [`GET /repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks/contexts`](/en/rest/branches/branch-protection#get-all-status-check-contexts)

* [`POST /repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks/contexts`](/en/rest/branches/branch-protection#add-status-check-contexts)

* [`PUT /repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks/contexts`](/en/rest/branches/branch-protection#set-status-check-contexts)

* [`DELETE /repos/{owner}/{repo}/branches/{branch}/protection/required_status_checks/contexts`](/en/rest/branches/branch-protection#remove-status-check-contexts)

* [`GET /repos/{owner}/{repo}/branches/{branch}/protection/restrictions`](/en/rest/branches/branch-protection#get-access-restrictions)

* [`DELETE /repos/{owner}/{repo}/branches/{branch}/protection/restrictions`](/en/rest/branches/branch-protection#delete-access-restrictions)

* [`GET /repos/{owner}/{repo}/branches/{branch}/protection/restrictions/apps`](/en/rest/branches/branch-protection#get-apps-with-access-to-the-protected-branch)

* [`POST /repos/{owner}/{repo}/branches/{branch}/protection/restrictions/apps`](/en/rest/branches/branch-protection#add-app-access-restrictions)

* [`PUT /repos/{owner}/{repo}/branches/{branch}/protection/restrictions/apps`](/en/rest/branches/branch-protection#set-app-access-restrictions)

* [`DELETE /repos/{owner}/{repo}/branches/{branch}/protection/restrictions/apps`](/en/rest/branches/branch-protection#remove-app-access-restrictions)

* [`GET /repos/{owner}/{repo}/branches/{branch}/protection/restrictions/teams`](/en/rest/branches/branch-protection#get-teams-with-access-to-the-protected-branch)

* [`POST /repos/{owner}/{repo}/branches/{branch}/protection/restrictions/teams`](/en/rest/branches/branch-protection#add-team-access-restrictions)

* [`PUT /repos/{owner}/{repo}/branches/{branch}/protection/restrictions/teams`](/en/rest/branches/branch-protection#set-team-access-restrictions)

* [`DELETE /repos/{owner}/{repo}/branches/{branch}/protection/restrictions/teams`](/en/rest/branches/branch-protection#remove-team-access-restrictions)

* [`GET /repos/{owner}/{repo}/branches/{branch}/protection/restrictions/users`](/en/rest/branches/branch-protection#get-users-with-access-to-the-protected-branch)

* [`POST /repos/{owner}/{repo}/branches/{branch}/protection/restrictions/users`](/en/rest/branches/branch-protection#add-user-access-restrictions)

* [`PUT /repos/{owner}/{repo}/branches/{branch}/protection/restrictions/users`](/en/rest/branches/branch-protection#set-user-access-restrictions)

* [`DELETE /repos/{owner}/{repo}/branches/{branch}/protection/restrictions/users`](/en/rest/branches/branch-protection#remove-user-access-restrictions)

* [`POST /repos/{owner}/{repo}/branches/{branch}/rename`](/en/rest/branches/branches#rename-a-branch)

* [`POST /repos/{owner}/{repo}/merge-upstream`](/en/rest/branches/branches#sync-a-fork-branch-with-the-upstream-repository)

* [`POST /repos/{owner}/{repo}/merges`](/en/rest/branches/branches#merge-a-branch)

## campaigns

* [`GET /orgs/{org}/campaigns`](/en/rest/campaigns/campaigns#list-campaigns-for-an-organization)

* [`POST /orgs/{org}/campaigns`](/en/rest/campaigns/campaigns#create-a-campaign-for-an-organization)

* [`GET /orgs/{org}/campaigns/{campaign_number}`](/en/rest/campaigns/campaigns#get-a-campaign-for-an-organization)

* [`PATCH /orgs/{org}/campaigns/{campaign_number}`](/en/rest/campaigns/campaigns#update-a-campaign)

* [`DELETE /orgs/{org}/campaigns/{campaign_number}`](/en/rest/campaigns/campaigns#delete-a-campaign-for-an-organization)

## checks

* [`POST /repos/{owner}/{repo}/check-runs`](/en/rest/checks/runs#create-a-check-run)

* [`GET /repos/{owner}/{repo}/check-runs/{check_run_id}`](/en/rest/checks/runs#get-a-check-run)

* [`PATCH /repos/{owner}/{repo}/check-runs/{check_run_id}`](/en/rest/checks/runs#update-a-check-run)

* [`GET /repos/{owner}/{repo}/check-runs/{check_run_id}/annotations`](/en/rest/checks/runs#list-check-run-annotations)

* [`POST /repos/{owner}/{repo}/check-runs/{check_run_id}/rerequest`](/en/rest/checks/runs#rerequest-a-check-run)

* [`POST /repos/{owner}/{repo}/check-suites`](/en/rest/checks/suites#create-a-check-suite)

* [`PATCH /repos/{owner}/{repo}/check-suites/preferences`](/en/rest/checks/suites#update-repository-preferences-for-check-suites)

* [`GET /repos/{owner}/{repo}/check-suites/{check_suite_id}`](/en/rest/checks/suites#get-a-check-suite)

* [`GET /repos/{owner}/{repo}/check-suites/{check_suite_id}/check-runs`](/en/rest/checks/runs#list-check-runs-in-a-check-suite)

* [`POST /repos/{owner}/{repo}/check-suites/{check_suite_id}/rerequest`](/en/rest/checks/suites#rerequest-a-check-suite)

* [`GET /repos/{owner}/{repo}/commits/{ref}/check-runs`](/en/rest/checks/runs#list-check-runs-for-a-git-reference)

* [`GET /repos/{owner}/{repo}/commits/{ref}/check-suites`](/en/rest/checks/suites#list-check-suites-for-a-git-reference)

## code-scanning

* [`GET /orgs/{org}/code-scanning/alerts`](/en/rest/code-scanning/code-scanning#list-code-scanning-alerts-for-an-organization)

* [`GET /repos/{owner}/{repo}/code-scanning/alerts`](/en/rest/code-scanning/code-scanning#list-code-scanning-alerts-for-a-repository)

* [`GET /repos/{owner}/{repo}/code-scanning/alerts/{alert_number}`](/en/rest/code-scanning/code-scanning#get-a-code-scanning-alert)

* [`PATCH /repos/{owner}/{repo}/code-scanning/alerts/{alert_number}`](/en/rest/code-scanning/code-scanning#update-a-code-scanning-alert)

* [`GET /repos/{owner}/{repo}/code-scanning/alerts/{alert_number}/autofix`](/en/rest/code-scanning/code-scanning#get-the-status-of-an-autofix-for-a-code-scanning-alert)

* [`POST /repos/{owner}/{repo}/code-scanning/alerts/{alert_number}/autofix`](/en/rest/code-scanning/code-scanning#create-an-autofix-for-a-code-scanning-alert)

* [`POST /repos/{owner}/{repo}/code-scanning/alerts/{alert_number}/autofix/commits`](/en/rest/code-scanning/code-scanning#commit-an-autofix-for-a-code-scanning-alert)

* [`GET /repos/{owner}/{repo}/code-scanning/alerts/{alert_number}/instances`](/en/rest/code-scanning/code-scanning#list-instances-of-a-code-scanning-alert)

* [`GET /repos/{owner}/{repo}/code-scanning/analyses`](/en/rest/code-scanning/code-scanning#list-code-scanning-analyses-for-a-repository)

* [`GET /repos/{owner}/{repo}/code-scanning/analyses/{analysis_id}`](/en/rest/code-scanning/code-scanning#get-a-code-scanning-analysis-for-a-repository)

* [`DELETE /repos/{owner}/{repo}/code-scanning/analyses/{analysis_id}`](/en/rest/code-scanning/code-scanning#delete-a-code-scanning-analysis-from-a-repository)

* [`GET /repos/{owner}/{repo}/code-scanning/codeql/databases`](/en/rest/code-scanning/code-scanning#list-codeql-databases-for-a-repository)

* [`GET /repos/{owner}/{repo}/code-scanning/codeql/databases/{language}`](/en/rest/code-scanning/code-scanning#get-a-codeql-database-for-a-repository)

* [`DELETE /repos/{owner}/{repo}/code-scanning/codeql/databases/{language}`](/en/rest/code-scanning/code-scanning#delete-a-codeql-database)

* [`POST /repos/{owner}/{repo}/code-scanning/codeql/variant-analyses`](/en/rest/code-scanning/code-scanning#create-a-codeql-variant-analysis)

* [`GET /repos/{owner}/{repo}/code-scanning/codeql/variant-analyses/{codeql_variant_analysis_id}`](/en/rest/code-scanning/code-scanning#get-the-summary-of-a-codeql-variant-analysis)

* [`GET /repos/{owner}/{repo}/code-scanning/codeql/variant-analyses/{codeql_variant_analysis_id}/repos/{repo_owner}/{repo_name}`](/en/rest/code-scanning/code-scanning#get-the-analysis-status-of-a-repository-in-a-codeql-variant-analysis)

* [`GET /repos/{owner}/{repo}/code-scanning/default-setup`](/en/rest/code-scanning/code-scanning#get-a-code-scanning-default-setup-configuration)

* [`PATCH /repos/{owner}/{repo}/code-scanning/default-setup`](/en/rest/code-scanning/code-scanning#update-a-code-scanning-default-setup-configuration)

* [`POST /repos/{owner}/{repo}/code-scanning/sarifs`](/en/rest/code-scanning/code-scanning#upload-an-analysis-as-sarif-data)

* [`GET /repos/{owner}/{repo}/code-scanning/sarifs/{sarif_id}`](/en/rest/code-scanning/code-scanning#get-information-about-a-sarif-upload)

## code-security

* [`GET /orgs/{org}/code-security/configurations`](/en/rest/code-security/configurations#get-code-security-configurations-for-an-organization)

* [`POST /orgs/{org}/code-security/configurations`](/en/rest/code-security/configurations#create-a-code-security-configuration)

* [`GET /orgs/{org}/code-security/configurations/defaults`](/en/rest/code-security/configurations#get-default-code-security-configurations)

* [`DELETE /orgs/{org}/code-security/configurations/detach`](/en/rest/code-security/configurations#detach-configurations-from-repositories)

* [`GET /orgs/{org}/code-security/configurations/{configuration_id}`](/en/rest/code-security/configurations#get-a-code-security-configuration)

* [`PATCH /orgs/{org}/code-security/configurations/{configuration_id}`](/en/rest/code-security/configurations#update-a-code-security-configuration)

* [`DELETE /orgs/{org}/code-security/configurations/{configuration_id}`](/en/rest/code-security/configurations#delete-a-code-security-configuration)

* [`POST /orgs/{org}/code-security/configurations/{configuration_id}/attach`](/en/rest/code-security/configurations#attach-a-configuration-to-repositories)

* [`PUT /orgs/{org}/code-security/configurations/{configuration_id}/defaults`](/en/rest/code-security/configurations#set-a-code-security-configuration-as-a-default-for-an-organization)

* [`GET /orgs/{org}/code-security/configurations/{configuration_id}/repositories`](/en/rest/code-security/configurations#get-repositories-associated-with-a-code-security-configuration)

* [`GET /repos/{owner}/{repo}/code-security-configuration`](/en/rest/code-security/configurations#get-the-code-security-configuration-associated-with-a-repository)

## codes-of-conduct

* [`GET /codes_of_conduct`](/en/rest/codes-of-conduct/codes-of-conduct#get-all-codes-of-conduct)

* [`GET /codes_of_conduct/{key}`](/en/rest/codes-of-conduct/codes-of-conduct#get-a-code-of-conduct)

## codespaces

* [`GET /orgs/{org}/codespaces`](/en/rest/codespaces/organizations#list-codespaces-for-the-organization)

* [`PUT /orgs/{org}/codespaces/access`](/en/rest/codespaces/organizations#manage-access-control-for-organization-codespaces)

* [`POST /orgs/{org}/codespaces/access/selected_users`](/en/rest/codespaces/organizations#add-users-to-codespaces-access-for-an-organization)

* [`DELETE /orgs/{org}/codespaces/access/selected_users`](/en/rest/codespaces/organizations#remove-users-from-codespaces-access-for-an-organization)

* [`GET /orgs/{org}/codespaces/secrets`](/en/rest/codespaces/organization-secrets#list-organization-secrets)

* [`GET /orgs/{org}/codespaces/secrets/public-key`](/en/rest/codespaces/organization-secrets#get-an-organization-public-key)

* [`GET /orgs/{org}/codespaces/secrets/{secret_name}`](/en/rest/codespaces/organization-secrets#get-an-organization-secret)

* [`PUT /orgs/{org}/codespaces/secrets/{secret_name}`](/en/rest/codespaces/organization-secrets#create-or-update-an-organization-secret)

* [`DELETE /orgs/{org}/codespaces/secrets/{secret_name}`](/en/rest/codespaces/organization-secrets#delete-an-organization-secret)

* [`GET /orgs/{org}/codespaces/secrets/{secret_name}/repositories`](/en/rest/codespaces/organization-secrets#list-selected-repositories-for-an-organization-secret)

* [`PUT /orgs/{org}/codespaces/secrets/{secret_name}/repositories`](/en/rest/codespaces/organization-secrets#set-selected-repositories-for-an-organization-secret)

* [`PUT /orgs/{org}/codespaces/secrets/{secret_name}/repositories/{repository_id}`](/en/rest/codespaces/organization-secrets#add-selected-repository-to-an-organization-secret)

* [`DELETE /orgs/{org}/codespaces/secrets/{secret_name}/repositories/{repository_id}`](/en/rest/codespaces/organization-secrets#remove-selected-repository-from-an-organization-secret)

* [`GET /orgs/{org}/members/{username}/codespaces`](/en/rest/codespaces/organizations#list-codespaces-for-a-user-in-organization)

* [`DELETE /orgs/{org}/members/{username}/codespaces/{codespace_name}`](/en/rest/codespaces/organizations#delete-a-codespace-from-the-organization)

* [`POST /orgs/{org}/members/{username}/codespaces/{codespace_name}/stop`](/en/rest/codespaces/organizations#stop-a-codespace-for-an-organization-user)

* [`GET /repos/{owner}/{repo}/codespaces/devcontainers`](/en/rest/codespaces/codespaces#list-devcontainer-configurations-in-a-repository-for-the-authenticated-user)

* [`GET /repos/{owner}/{repo}/codespaces/machines`](/en/rest/codespaces/machines#list-available-machine-types-for-a-repository)

* [`GET /repos/{owner}/{repo}/codespaces/secrets`](/en/rest/codespaces/repository-secrets#list-repository-secrets)

* [`GET /repos/{owner}/{repo}/codespaces/secrets/public-key`](/en/rest/codespaces/repository-secrets#get-a-repository-public-key)

* [`GET /repos/{owner}/{repo}/codespaces/secrets/{secret_name}`](/en/rest/codespaces/repository-secrets#get-a-repository-secret)

* [`PUT /repos/{owner}/{repo}/codespaces/secrets/{secret_name}`](/en/rest/codespaces/repository-secrets#create-or-update-a-repository-secret)

* [`DELETE /repos/{owner}/{repo}/codespaces/secrets/{secret_name}`](/en/rest/codespaces/repository-secrets#delete-a-repository-secret)

## collaborators

* [`GET /repos/{owner}/{repo}/collaborators`](/en/rest/collaborators/collaborators#list-repository-collaborators)

* [`GET /repos/{owner}/{repo}/collaborators/{username}`](/en/rest/collaborators/collaborators#check-if-a-user-is-a-repository-collaborator)

* [`PUT /repos/{owner}/{repo}/collaborators/{username}`](/en/rest/collaborators/collaborators#add-a-repository-collaborator)

* [`DELETE /repos/{owner}/{repo}/collaborators/{username}`](/en/rest/collaborators/collaborators#remove-a-repository-collaborator)

* [`GET /repos/{owner}/{repo}/collaborators/{username}/permission`](/en/rest/collaborators/collaborators#get-repository-permissions-for-a-user)

* [`GET /repos/{owner}/{repo}/invitations`](/en/rest/collaborators/invitations#list-repository-invitations)

* [`PATCH /repos/{owner}/{repo}/invitations/{invitation_id}`](/en/rest/collaborators/invitations#update-a-repository-invitation)

* [`DELETE /repos/{owner}/{repo}/invitations/{invitation_id}`](/en/rest/collaborators/invitations#delete-a-repository-invitation)

## commits

* [`GET /repos/{owner}/{repo}/comments`](/en/rest/commits/comments#list-commit-comments-for-a-repository)

* [`GET /repos/{owner}/{repo}/comments/{comment_id}`](/en/rest/commits/comments#get-a-commit-comment)

* [`PATCH /repos/{owner}/{repo}/comments/{comment_id}`](/en/rest/commits/comments#update-a-commit-comment)

* [`DELETE /repos/{owner}/{repo}/comments/{comment_id}`](/en/rest/commits/comments#delete-a-commit-comment)

* [`GET /repos/{owner}/{repo}/commits`](/en/rest/commits/commits#list-commits)

* [`GET /repos/{owner}/{repo}/commits/{commit_sha}/branches-where-head`](/en/rest/commits/commits#list-branches-for-head-commit)

* [`GET /repos/{owner}/{repo}/commits/{commit_sha}/comments`](/en/rest/commits/comments#list-commit-comments)

* [`POST /repos/{owner}/{repo}/commits/{commit_sha}/comments`](/en/rest/commits/comments#create-a-commit-comment)

* [`GET /repos/{owner}/{repo}/commits/{commit_sha}/pulls`](/en/rest/commits/commits#list-pull-requests-associated-with-a-commit)

* [`GET /repos/{owner}/{repo}/commits/{ref}`](/en/rest/commits/commits#get-a-commit)

* [`GET /repos/{owner}/{repo}/commits/{ref}/status`](/en/rest/commits/statuses#get-the-combined-status-for-a-specific-reference)

* [`GET /repos/{owner}/{repo}/commits/{ref}/statuses`](/en/rest/commits/statuses#list-commit-statuses-for-a-reference)

* [`GET /repos/{owner}/{repo}/compare/{basehead}`](/en/rest/commits/commits#compare-two-commits)

* [`POST /repos/{owner}/{repo}/statuses/{sha}`](/en/rest/commits/statuses#create-a-commit-status)

## copilot

* [`GET /orgs/{org}/copilot/billing`](/en/rest/copilot/copilot-user-management#get-copilot-seat-information-and-settings-for-an-organization)

* [`GET /orgs/{org}/copilot/billing/seats`](/en/rest/copilot/copilot-user-management#list-all-copilot-seat-assignments-for-an-organization)

* [`POST /orgs/{org}/copilot/billing/selected_teams`](/en/rest/copilot/copilot-user-management#add-teams-to-the-copilot-subscription-for-an-organization)

* [`DELETE /orgs/{org}/copilot/billing/selected_teams`](/en/rest/copilot/copilot-user-management#remove-teams-from-the-copilot-subscription-for-an-organization)

* [`POST /orgs/{org}/copilot/billing/selected_users`](/en/rest/copilot/copilot-user-management#add-users-to-the-copilot-subscription-for-an-organization)

* [`DELETE /orgs/{org}/copilot/billing/selected_users`](/en/rest/copilot/copilot-user-management#remove-users-from-the-copilot-subscription-for-an-organization)

* [`GET /orgs/{org}/copilot/content_exclusion`](/en/rest/copilot/copilot-content-exclusion-management#get-copilot-content-exclusion-rules-for-an-organization)

* [`PUT /orgs/{org}/copilot/content_exclusion`](/en/rest/copilot/copilot-content-exclusion-management#set-copilot-content-exclusion-rules-for-an-organization)

* [`GET /orgs/{org}/copilot/metrics`](/en/rest/copilot/copilot-metrics#get-copilot-metrics-for-an-organization)

* [`GET /orgs/{org}/members/{username}/copilot`](/en/rest/copilot/copilot-user-management#get-copilot-seat-assignment-details-for-a-user)

* [`GET /orgs/{org}/team/{team_slug}/copilot/metrics`](/en/rest/copilot/copilot-metrics#get-copilot-metrics-for-a-team)

## credentials

* [`POST /credentials/revoke`](/en/rest/credentials/revoke#revoke-a-list-of-credentials)

## dependabot

* [`GET /organizations/{org}/dependabot/repository-access`](/en/rest/dependabot/repository-access#lists-the-repositories-dependabot-can-access-in-an-organization)

* [`PATCH /organizations/{org}/dependabot/repository-access`](/en/rest/dependabot/repository-access#updates-dependabots-repository-access-list-for-an-organization)

* [`PUT /organizations/{org}/dependabot/repository-access/default-level`](/en/rest/dependabot/repository-access#set-the-default-repository-access-level-for-dependabot)

* [`GET /orgs/{org}/dependabot/alerts`](/en/rest/dependabot/alerts#list-dependabot-alerts-for-an-organization)

* [`GET /orgs/{org}/dependabot/secrets`](/en/rest/dependabot/secrets#list-organization-secrets)

* [`GET /orgs/{org}/dependabot/secrets/public-key`](/en/rest/dependabot/secrets#get-an-organization-public-key)

* [`GET /orgs/{org}/dependabot/secrets/{secret_name}`](/en/rest/dependabot/secrets#get-an-organization-secret)

* [`PUT /orgs/{org}/dependabot/secrets/{secret_name}`](/en/rest/dependabot/secrets#create-or-update-an-organization-secret)

* [`DELETE /orgs/{org}/dependabot/secrets/{secret_name}`](/en/rest/dependabot/secrets#delete-an-organization-secret)

* [`GET /orgs/{org}/dependabot/secrets/{secret_name}/repositories`](/en/rest/dependabot/secrets#list-selected-repositories-for-an-organization-secret)

* [`PUT /orgs/{org}/dependabot/secrets/{secret_name}/repositories`](/en/rest/dependabot/secrets#set-selected-repositories-for-an-organization-secret)

* [`PUT /orgs/{org}/dependabot/secrets/{secret_name}/repositories/{repository_id}`](/en/rest/dependabot/secrets#add-selected-repository-to-an-organization-secret)

* [`DELETE /orgs/{org}/dependabot/secrets/{secret_name}/repositories/{repository_id}`](/en/rest/dependabot/secrets#remove-selected-repository-from-an-organization-secret)

* [`GET /repos/{owner}/{repo}/dependabot/alerts`](/en/rest/dependabot/alerts#list-dependabot-alerts-for-a-repository)

* [`GET /repos/{owner}/{repo}/dependabot/alerts/{alert_number}`](/en/rest/dependabot/alerts#get-a-dependabot-alert)

* [`PATCH /repos/{owner}/{repo}/dependabot/alerts/{alert_number}`](/en/rest/dependabot/alerts#update-a-dependabot-alert)

* [`GET /repos/{owner}/{repo}/dependabot/secrets`](/en/rest/dependabot/secrets#list-repository-secrets)

* [`GET /repos/{owner}/{repo}/dependabot/secrets/public-key`](/en/rest/dependabot/secrets#get-a-repository-public-key)

* [`GET /repos/{owner}/{repo}/dependabot/secrets/{secret_name}`](/en/rest/dependabot/secrets#get-a-repository-secret)

* [`PUT /repos/{owner}/{repo}/dependabot/secrets/{secret_name}`](/en/rest/dependabot/secrets#create-or-update-a-repository-secret)

* [`DELETE /repos/{owner}/{repo}/dependabot/secrets/{secret_name}`](/en/rest/dependabot/secrets#delete-a-repository-secret)

## dependency-graph

* [`GET /repos/{owner}/{repo}/dependency-graph/compare/{basehead}`](/en/rest/dependency-graph/dependency-review#get-a-diff-of-the-dependencies-between-commits)

* [`GET /repos/{owner}/{repo}/dependency-graph/sbom`](/en/rest/dependency-graph/sboms#export-a-software-bill-of-materials-sbom-for-a-repository)

* [`POST /repos/{owner}/{repo}/dependency-graph/snapshots`](/en/rest/dependency-graph/dependency-submission#create-a-snapshot-of-dependencies-for-a-repository)

## deploy-keys

* [`GET /repos/{owner}/{repo}/keys`](/en/rest/deploy-keys/deploy-keys#list-deploy-keys)

* [`POST /repos/{owner}/{repo}/keys`](/en/rest/deploy-keys/deploy-keys#create-a-deploy-key)

* [`GET /repos/{owner}/{repo}/keys/{key_id}`](/en/rest/deploy-keys/deploy-keys#get-a-deploy-key)

* [`DELETE /repos/{owner}/{repo}/keys/{key_id}`](/en/rest/deploy-keys/deploy-keys#delete-a-deploy-key)

## deployments

* [`GET /repos/{owner}/{repo}/deployments`](/en/rest/deployments/deployments#list-deployments)

* [`POST /repos/{owner}/{repo}/deployments`](/en/rest/deployments/deployments#create-a-deployment)

* [`GET /repos/{owner}/{repo}/deployments/{deployment_id}`](/en/rest/deployments/deployments#get-a-deployment)

* [`DELETE /repos/{owner}/{repo}/deployments/{deployment_id}`](/en/rest/deployments/deployments#delete-a-deployment)

* [`GET /repos/{owner}/{repo}/deployments/{deployment_id}/statuses`](/en/rest/deployments/statuses#list-deployment-statuses)

* [`POST /repos/{owner}/{repo}/deployments/{deployment_id}/statuses`](/en/rest/deployments/statuses#create-a-deployment-status)

* [`GET /repos/{owner}/{repo}/deployments/{deployment_id}/statuses/{status_id}`](/en/rest/deployments/statuses#get-a-deployment-status)

* [`GET /repos/{owner}/{repo}/environments`](/en/rest/deployments/environments#list-environments)

* [`GET /repos/{owner}/{repo}/environments/{environment_name}`](/en/rest/deployments/environments#get-an-environment)

* [`PUT /repos/{owner}/{repo}/environments/{environment_name}`](/en/rest/deployments/environments#create-or-update-an-environment)

* [`DELETE /repos/{owner}/{repo}/environments/{environment_name}`](/en/rest/deployments/environments#delete-an-environment)

* [`GET /repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies`](/en/rest/deployments/branch-policies#list-deployment-branch-policies)

* [`POST /repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies`](/en/rest/deployments/branch-policies#create-a-deployment-branch-policy)

* [`GET /repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies/{branch_policy_id}`](/en/rest/deployments/branch-policies#get-a-deployment-branch-policy)

* [`PUT /repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies/{branch_policy_id}`](/en/rest/deployments/branch-policies#update-a-deployment-branch-policy)

* [`DELETE /repos/{owner}/{repo}/environments/{environment_name}/deployment-branch-policies/{branch_policy_id}`](/en/rest/deployments/branch-policies#delete-a-deployment-branch-policy)

* [`GET /repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules`](/en/rest/deployments/protection-rules#get-all-deployment-protection-rules-for-an-environment)

* [`POST /repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules`](/en/rest/deployments/protection-rules#create-a-custom-deployment-protection-rule-on-an-environment)

* [`GET /repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules/apps`](/en/rest/deployments/protection-rules#list-custom-deployment-rule-integrations-available-for-an-environment)

* [`GET /repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules/{protection_rule_id}`](/en/rest/deployments/protection-rules#get-a-custom-deployment-protection-rule)

* [`DELETE /repos/{owner}/{repo}/environments/{environment_name}/deployment_protection_rules/{protection_rule_id}`](/en/rest/deployments/protection-rules#disable-a-custom-protection-rule-for-an-environment)

## emojis

* [`GET /emojis`](/en/rest/emojis/emojis#get-emojis)

## enterprise-teams

* [`GET /enterprises/{enterprise}/teams`](/en/rest/enterprise-teams/enterprise-teams#list-enterprise-teams)

* [`POST /enterprises/{enterprise}/teams`](/en/rest/enterprise-teams/enterprise-teams#create-an-enterprise-team)

* [`GET /enterprises/{enterprise}/teams/{enterprise-team}/memberships`](/en/rest/enterprise-teams/enterprise-team-members#list-members-in-an-enterprise-team)

* [`POST /enterprises/{enterprise}/teams/{enterprise-team}/memberships/add`](/en/rest/enterprise-teams/enterprise-team-members#bulk-add-team-members)

* [`POST /enterprises/{enterprise}/teams/{enterprise-team}/memberships/remove`](/en/rest/enterprise-teams/enterprise-team-members#bulk-remove-team-members)

* [`GET /enterprises/{enterprise}/teams/{enterprise-team}/memberships/{username}`](/en/rest/enterprise-teams/enterprise-team-members#get-enterprise-team-membership)

* [`PUT /enterprises/{enterprise}/teams/{enterprise-team}/memberships/{username}`](/en/rest/enterprise-teams/enterprise-team-members#add-team-member)

* [`DELETE /enterprises/{enterprise}/teams/{enterprise-team}/memberships/{username}`](/en/rest/enterprise-teams/enterprise-team-members#remove-team-membership)

* [`GET /enterprises/{enterprise}/teams/{enterprise-team}/organizations`](/en/rest/enterprise-teams/enterprise-team-organizations#get-organization-assignments)

* [`POST /enterprises/{enterprise}/teams/{enterprise-team}/organizations/add`](/en/rest/enterprise-teams/enterprise-team-organizations#add-organization-assignments)

* [`POST /enterprises/{enterprise}/teams/{enterprise-team}/organizations/remove`](/en/rest/enterprise-teams/enterprise-team-organizations#remove-organization-assignments)

* [`GET /enterprises/{enterprise}/teams/{enterprise-team}/organizations/{org}`](/en/rest/enterprise-teams/enterprise-team-organizations#get-organization-assignment)

* [`PUT /enterprises/{enterprise}/teams/{enterprise-team}/organizations/{org}`](/en/rest/enterprise-teams/enterprise-team-organizations#add-an-organization-assignment)

* [`DELETE /enterprises/{enterprise}/teams/{enterprise-team}/organizations/{org}`](/en/rest/enterprise-teams/enterprise-team-organizations#delete-an-organization-assignment)

* [`GET /enterprises/{enterprise}/teams/{team_slug}`](/en/rest/enterprise-teams/enterprise-teams#get-an-enterprise-team)

* [`PATCH /enterprises/{enterprise}/teams/{team_slug}`](/en/rest/enterprise-teams/enterprise-teams#update-an-enterprise-team)

* [`DELETE /enterprises/{enterprise}/teams/{team_slug}`](/en/rest/enterprise-teams/enterprise-teams#delete-an-enterprise-team)

## git

* [`POST /repos/{owner}/{repo}/git/blobs`](/en/rest/git/blobs#create-a-blob)

* [`GET /repos/{owner}/{repo}/git/blobs/{file_sha}`](/en/rest/git/blobs#get-a-blob)

* [`POST /repos/{owner}/{repo}/git/commits`](/en/rest/git/commits#create-a-commit)

* [`GET /repos/{owner}/{repo}/git/commits/{commit_sha}`](/en/rest/git/commits#get-a-commit-object)

* [`GET /repos/{owner}/{repo}/git/matching-refs/{ref}`](/en/rest/git/refs#list-matching-references)

* [`GET /repos/{owner}/{repo}/git/ref/{ref}`](/en/rest/git/refs#get-a-reference)

* [`POST /repos/{owner}/{repo}/git/refs`](/en/rest/git/refs#create-a-reference)

* [`PATCH /repos/{owner}/{repo}/git/refs/{ref}`](/en/rest/git/refs#update-a-reference)

* [`DELETE /repos/{owner}/{repo}/git/refs/{ref}`](/en/rest/git/refs#delete-a-reference)

* [`POST /repos/{owner}/{repo}/git/tags`](/en/rest/git/tags#create-a-tag-object)

* [`GET /repos/{owner}/{repo}/git/tags/{tag_sha}`](/en/rest/git/tags#get-a-tag)

* [`POST /repos/{owner}/{repo}/git/trees`](/en/rest/git/trees#create-a-tree)

* [`GET /repos/{owner}/{repo}/git/trees/{tree_sha}`](/en/rest/git/trees#get-a-tree)

## gitignore

* [`GET /gitignore/templates`](/en/rest/gitignore/gitignore#get-all-gitignore-templates)

* [`GET /gitignore/templates/{name}`](/en/rest/gitignore/gitignore#get-a-gitignore-template)

## interactions

* [`GET /orgs/{org}/interaction-limits`](/en/rest/interactions/orgs#get-interaction-restrictions-for-an-organization)

* [`PUT /orgs/{org}/interaction-limits`](/en/rest/interactions/orgs#set-interaction-restrictions-for-an-organization)

* [`DELETE /orgs/{org}/interaction-limits`](/en/rest/interactions/orgs#remove-interaction-restrictions-for-an-organization)

* [`GET /repos/{owner}/{repo}/interaction-limits`](/en/rest/interactions/repos#get-interaction-restrictions-for-a-repository)

* [`PUT /repos/{owner}/{repo}/interaction-limits`](/en/rest/interactions/repos#set-interaction-restrictions-for-a-repository)

* [`DELETE /repos/{owner}/{repo}/interaction-limits`](/en/rest/interactions/repos#remove-interaction-restrictions-for-a-repository)

## issues

* [`GET /repos/{owner}/{repo}/assignees`](/en/rest/issues/assignees#list-assignees)

* [`GET /repos/{owner}/{repo}/assignees/{assignee}`](/en/rest/issues/assignees#check-if-a-user-can-be-assigned)

* [`GET /repos/{owner}/{repo}/issues`](/en/rest/issues/issues#list-repository-issues)

* [`POST /repos/{owner}/{repo}/issues`](/en/rest/issues/issues#create-an-issue)

* [`GET /repos/{owner}/{repo}/issues/comments`](/en/rest/issues/comments#list-issue-comments-for-a-repository)

* [`GET /repos/{owner}/{repo}/issues/comments/{comment_id}`](/en/rest/issues/comments#get-an-issue-comment)

* [`PATCH /repos/{owner}/{repo}/issues/comments/{comment_id}`](/en/rest/issues/comments#update-an-issue-comment)

* [`DELETE /repos/{owner}/{repo}/issues/comments/{comment_id}`](/en/rest/issues/comments#delete-an-issue-comment)

* [`PUT /repos/{owner}/{repo}/issues/comments/{comment_id}/pin`](/en/rest/issues/comments#pin-an-issue-comment)

* [`DELETE /repos/{owner}/{repo}/issues/comments/{comment_id}/pin`](/en/rest/issues/comments#unpin-an-issue-comment)

* [`GET /repos/{owner}/{repo}/issues/events`](/en/rest/issues/events#list-issue-events-for-a-repository)

* [`GET /repos/{owner}/{repo}/issues/events/{event_id}`](/en/rest/issues/events#get-an-issue-event)

* [`GET /repos/{owner}/{repo}/issues/{issue_number}`](/en/rest/issues/issues#get-an-issue)

* [`PATCH /repos/{owner}/{repo}/issues/{issue_number}`](/en/rest/issues/issues#update-an-issue)

* [`POST /repos/{owner}/{repo}/issues/{issue_number}/assignees`](/en/rest/issues/assignees#add-assignees-to-an-issue)

* [`DELETE /repos/{owner}/{repo}/issues/{issue_number}/assignees`](/en/rest/issues/assignees#remove-assignees-from-an-issue)

* [`GET /repos/{owner}/{repo}/issues/{issue_number}/assignees/{assignee}`](/en/rest/issues/assignees#check-if-a-user-can-be-assigned-to-a-issue)

* [`GET /repos/{owner}/{repo}/issues/{issue_number}/comments`](/en/rest/issues/comments#list-issue-comments)

* [`POST /repos/{owner}/{repo}/issues/{issue_number}/comments`](/en/rest/issues/comments#create-an-issue-comment)

* [`GET /repos/{owner}/{repo}/issues/{issue_number}/dependencies/blocked_by`](/en/rest/issues/issue-dependencies#list-dependencies-an-issue-is-blocked-by)

* [`POST /repos/{owner}/{repo}/issues/{issue_number}/dependencies/blocked_by`](/en/rest/issues/issue-dependencies#add-a-dependency-an-issue-is-blocked-by)

* [`DELETE /repos/{owner}/{repo}/issues/{issue_number}/dependencies/blocked_by/{issue_id}`](/en/rest/issues/issue-dependencies#remove-dependency-an-issue-is-blocked-by)

* [`GET /repos/{owner}/{repo}/issues/{issue_number}/dependencies/blocking`](/en/rest/issues/issue-dependencies#list-dependencies-an-issue-is-blocking)

* [`GET /repos/{owner}/{repo}/issues/{issue_number}/events`](/en/rest/issues/events#list-issue-events)

* [`GET /repos/{owner}/{repo}/issues/{issue_number}/issue-field-values`](/en/rest/issues/issue-field-values#list-issue-field-values-for-an-issue)

* [`GET /repos/{owner}/{repo}/issues/{issue_number}/labels`](/en/rest/issues/labels#list-labels-for-an-issue)

* [`POST /repos/{owner}/{repo}/issues/{issue_number}/labels`](/en/rest/issues/labels#add-labels-to-an-issue)

* [`PUT /repos/{owner}/{repo}/issues/{issue_number}/labels`](/en/rest/issues/labels#set-labels-for-an-issue)

* [`DELETE /repos/{owner}/{repo}/issues/{issue_number}/labels`](/en/rest/issues/labels#remove-all-labels-from-an-issue)

* [`DELETE /repos/{owner}/{repo}/issues/{issue_number}/labels/{name}`](/en/rest/issues/labels#remove-a-label-from-an-issue)

* [`PUT /repos/{owner}/{repo}/issues/{issue_number}/lock`](/en/rest/issues/issues#lock-an-issue)

* [`DELETE /repos/{owner}/{repo}/issues/{issue_number}/lock`](/en/rest/issues/issues#unlock-an-issue)

* [`GET /repos/{owner}/{repo}/issues/{issue_number}/parent`](/en/rest/issues/sub-issues#get-parent-issue)

* [`DELETE /repos/{owner}/{repo}/issues/{issue_number}/sub_issue`](/en/rest/issues/sub-issues#remove-sub-issue)

* [`GET /repos/{owner}/{repo}/issues/{issue_number}/sub_issues`](/en/rest/issues/sub-issues#list-sub-issues)

* [`POST /repos/{owner}/{repo}/issues/{issue_number}/sub_issues`](/en/rest/issues/sub-issues#add-sub-issue)

* [`PATCH /repos/{owner}/{repo}/issues/{issue_number}/sub_issues/priority`](/en/rest/issues/sub-issues#reprioritize-sub-issue)

* [`GET /repos/{owner}/{repo}/issues/{issue_number}/timeline`](/en/rest/issues/timeline#list-timeline-events-for-an-issue)

* [`GET /repos/{owner}/{repo}/labels`](/en/rest/issues/labels#list-labels-for-a-repository)

* [`POST /repos/{owner}/{repo}/labels`](/en/rest/issues/labels#create-a-label)

* [`GET /repos/{owner}/{repo}/labels/{name}`](/en/rest/issues/labels#get-a-label)

* [`PATCH /repos/{owner}/{repo}/labels/{name}`](/en/rest/issues/labels#update-a-label)

* [`DELETE /repos/{owner}/{repo}/labels/{name}`](/en/rest/issues/labels#delete-a-label)

* [`GET /repos/{owner}/{repo}/milestones`](/en/rest/issues/milestones#list-milestones)

* [`POST /repos/{owner}/{repo}/milestones`](/en/rest/issues/milestones#create-a-milestone)

* [`GET /repos/{owner}/{repo}/milestones/{milestone_number}`](/en/rest/issues/milestones#get-a-milestone)

* [`PATCH /repos/{owner}/{repo}/milestones/{milestone_number}`](/en/rest/issues/milestones#update-a-milestone)

* [`DELETE /repos/{owner}/{repo}/milestones/{milestone_number}`](/en/rest/issues/milestones#delete-a-milestone)

* [`GET /repos/{owner}/{repo}/milestones/{milestone_number}/labels`](/en/rest/issues/labels#list-labels-for-issues-in-a-milestone)

* [`POST /repositories/{repository_id}/issues/{issue_number}/issue-field-values`](/en/rest/issues/issue-field-values#add-issue-field-values-to-an-issue)

* [`PUT /repositories/{repository_id}/issues/{issue_number}/issue-field-values`](/en/rest/issues/issue-field-values#set-issue-field-values-for-an-issue)

* [`DELETE /repositories/{repository_id}/issues/{issue_number}/issue-field-values/{issue_field_id}`](/en/rest/issues/issue-field-values#delete-an-issue-field-value-from-an-issue)

## licenses

* [`GET /licenses`](/en/rest/licenses/licenses#get-all-commonly-used-licenses)

* [`GET /licenses/{license}`](/en/rest/licenses/licenses#get-a-license)

* [`GET /repos/{owner}/{repo}/license`](/en/rest/licenses/licenses#get-the-license-for-a-repository)

## markdown

* [`POST /markdown`](/en/rest/markdown/markdown#render-a-markdown-document)

* [`POST /markdown/raw`](/en/rest/markdown/markdown#render-a-markdown-document-in-raw-mode)

## meta

* [`GET /`](/en/rest/meta/meta#github-api-root)

* [`GET /meta`](/en/rest/meta/meta#get-github-meta-information)

* [`GET /octocat`](/en/rest/meta/meta#get-octocat)

* [`GET /versions`](/en/rest/meta/meta#get-all-api-versions)

* [`GET /zen`](/en/rest/meta/meta#get-the-zen-of-github)

## metrics

* [`GET /repos/{owner}/{repo}/community/profile`](/en/rest/metrics/community#get-community-profile-metrics)

* [`GET /repos/{owner}/{repo}/stats/code_frequency`](/en/rest/metrics/statistics#get-the-weekly-commit-activity)

* [`GET /repos/{owner}/{repo}/stats/commit_activity`](/en/rest/metrics/statistics#get-the-last-year-of-commit-activity)

* [`GET /repos/{owner}/{repo}/stats/contributors`](/en/rest/metrics/statistics#get-all-contributor-commit-activity)

* [`GET /repos/{owner}/{repo}/stats/participation`](/en/rest/metrics/statistics#get-the-weekly-commit-count)

* [`GET /repos/{owner}/{repo}/stats/punch_card`](/en/rest/metrics/statistics#get-the-hourly-commit-count-for-each-day)

* [`GET /repos/{owner}/{repo}/traffic/clones`](/en/rest/metrics/traffic#get-repository-clones)

* [`GET /repos/{owner}/{repo}/traffic/popular/paths`](/en/rest/metrics/traffic#get-top-referral-paths)

* [`GET /repos/{owner}/{repo}/traffic/popular/referrers`](/en/rest/metrics/traffic#get-top-referral-sources)

* [`GET /repos/{owner}/{repo}/traffic/views`](/en/rest/metrics/traffic#get-page-views)

## orgs

* [`GET /organizations`](/en/rest/orgs/orgs#list-organizations)

* [`GET /orgs/{org}`](/en/rest/orgs/orgs#get-an-organization)

* [`PATCH /orgs/{org}`](/en/rest/orgs/orgs#update-an-organization)

* [`DELETE /orgs/{org}`](/en/rest/orgs/orgs#delete-an-organization)

* [`POST /orgs/{org}/artifacts/metadata/deployment-record`](/en/rest/orgs/artifact-metadata#create-an-artifact-deployment-record)

* [`POST /orgs/{org}/artifacts/metadata/deployment-record/cluster/{cluster}`](/en/rest/orgs/artifact-metadata#set-cluster-deployment-records)

* [`POST /orgs/{org}/artifacts/metadata/storage-record`](/en/rest/orgs/artifact-metadata#create-artifact-metadata-storage-record)

* [`GET /orgs/{org}/artifacts/{subject_digest}/metadata/deployment-records`](/en/rest/orgs/artifact-metadata#list-artifact-deployment-records)

* [`GET /orgs/{org}/artifacts/{subject_digest}/metadata/storage-records`](/en/rest/orgs/artifact-metadata#list-artifact-storage-records)

* [`POST /orgs/{org}/attestations/bulk-list`](/en/rest/orgs/attestations#list-attestations-by-bulk-subject-digests)

* [`POST /orgs/{org}/attestations/delete-request`](/en/rest/orgs/attestations#delete-attestations-in-bulk)

* [`DELETE /orgs/{org}/attestations/digest/{subject_digest}`](/en/rest/orgs/attestations#delete-attestations-by-subject-digest)

* [`GET /orgs/{org}/attestations/repositories`](/en/rest/orgs/attestations#list-attestation-repositories)

* [`DELETE /orgs/{org}/attestations/{attestation_id}`](/en/rest/orgs/attestations#delete-attestations-by-id)

* [`GET /orgs/{org}/attestations/{subject_digest}`](/en/rest/orgs/attestations#list-attestations)

* [`GET /orgs/{org}/blocks`](/en/rest/orgs/blocking#list-users-blocked-by-an-organization)

* [`GET /orgs/{org}/blocks/{username}`](/en/rest/orgs/blocking#check-if-a-user-is-blocked-by-an-organization)

* [`PUT /orgs/{org}/blocks/{username}`](/en/rest/orgs/blocking#block-a-user-from-an-organization)

* [`DELETE /orgs/{org}/blocks/{username}`](/en/rest/orgs/blocking#unblock-a-user-from-an-organization)

* [`GET /orgs/{org}/failed_invitations`](/en/rest/orgs/members#list-failed-organization-invitations)

* [`GET /orgs/{org}/hooks`](/en/rest/orgs/webhooks#list-organization-webhooks)

* [`POST /orgs/{org}/hooks`](/en/rest/orgs/webhooks#create-an-organization-webhook)

* [`GET /orgs/{org}/hooks/{hook_id}`](/en/rest/orgs/webhooks#get-an-organization-webhook)

* [`PATCH /orgs/{org}/hooks/{hook_id}`](/en/rest/orgs/webhooks#update-an-organization-webhook)

* [`DELETE /orgs/{org}/hooks/{hook_id}`](/en/rest/orgs/webhooks#delete-an-organization-webhook)

* [`GET /orgs/{org}/hooks/{hook_id}/config`](/en/rest/orgs/webhooks#get-a-webhook-configuration-for-an-organization)

* [`PATCH /orgs/{org}/hooks/{hook_id}/config`](/en/rest/orgs/webhooks#update-a-webhook-configuration-for-an-organization)

* [`GET /orgs/{org}/hooks/{hook_id}/deliveries`](/en/rest/orgs/webhooks#list-deliveries-for-an-organization-webhook)

* [`GET /orgs/{org}/hooks/{hook_id}/deliveries/{delivery_id}`](/en/rest/orgs/webhooks#get-a-webhook-delivery-for-an-organization-webhook)

* [`POST /orgs/{org}/hooks/{hook_id}/deliveries/{delivery_id}/attempts`](/en/rest/orgs/webhooks#redeliver-a-delivery-for-an-organization-webhook)

* [`POST /orgs/{org}/hooks/{hook_id}/pings`](/en/rest/orgs/webhooks#ping-an-organization-webhook)

* [`GET /orgs/{org}/insights/api/route-stats/{actor_type}/{actor_id}`](/en/rest/orgs/api-insights#get-route-stats-by-actor)

* [`GET /orgs/{org}/insights/api/subject-stats`](/en/rest/orgs/api-insights#get-subject-stats)

* [`GET /orgs/{org}/insights/api/summary-stats`](/en/rest/orgs/api-insights#get-summary-stats)

* [`GET /orgs/{org}/insights/api/summary-stats/users/{user_id}`](/en/rest/orgs/api-insights#get-summary-stats-by-user)

* [`GET /orgs/{org}/insights/api/summary-stats/{actor_type}/{actor_id}`](/en/rest/orgs/api-insights#get-summary-stats-by-actor)

* [`GET /orgs/{org}/insights/api/time-stats`](/en/rest/orgs/api-insights#get-time-stats)

* [`GET /orgs/{org}/insights/api/time-stats/users/{user_id}`](/en/rest/orgs/api-insights#get-time-stats-by-user)

* [`GET /orgs/{org}/insights/api/time-stats/{actor_type}/{actor_id}`](/en/rest/orgs/api-insights#get-time-stats-by-actor)

* [`GET /orgs/{org}/insights/api/user-stats/{user_id}`](/en/rest/orgs/api-insights#get-user-stats)

* [`GET /orgs/{org}/installations`](/en/rest/orgs/orgs#list-app-installations-for-an-organization)

* [`GET /orgs/{org}/invitations`](/en/rest/orgs/members#list-pending-organization-invitations)

* [`POST /orgs/{org}/invitations`](/en/rest/orgs/members#create-an-organization-invitation)

* [`DELETE /orgs/{org}/invitations/{invitation_id}`](/en/rest/orgs/members#cancel-an-organization-invitation)

* [`GET /orgs/{org}/invitations/{invitation_id}/teams`](/en/rest/orgs/members#list-organization-invitation-teams)

* [`GET /orgs/{org}/issue-fields`](/en/rest/orgs/issue-fields#list-issue-fields-for-an-organization)

* [`POST /orgs/{org}/issue-fields`](/en/rest/orgs/issue-fields#create-issue-field-for-an-organization)

* [`PATCH /orgs/{org}/issue-fields/{issue_field_id}`](/en/rest/orgs/issue-fields#update-issue-field-for-an-organization)

* [`DELETE /orgs/{org}/issue-fields/{issue_field_id}`](/en/rest/orgs/issue-fields#delete-issue-field-for-an-organization)

* [`GET /orgs/{org}/issue-types`](/en/rest/orgs/issue-types#list-issue-types-for-an-organization)

* [`POST /orgs/{org}/issue-types`](/en/rest/orgs/issue-types#create-issue-type-for-an-organization)

* [`PUT /orgs/{org}/issue-types/{issue_type_id}`](/en/rest/orgs/issue-types#update-issue-type-for-an-organization)

* [`DELETE /orgs/{org}/issue-types/{issue_type_id}`](/en/rest/orgs/issue-types#delete-issue-type-for-an-organization)

* [`GET /orgs/{org}/members`](/en/rest/orgs/members#list-organization-members)

* [`GET /orgs/{org}/members/{username}`](/en/rest/orgs/members#check-organization-membership-for-a-user)

* [`DELETE /orgs/{org}/members/{username}`](/en/rest/orgs/members#remove-an-organization-member)

* [`GET /orgs/{org}/memberships/{username}`](/en/rest/orgs/members#get-organization-membership-for-a-user)

* [`PUT /orgs/{org}/memberships/{username}`](/en/rest/orgs/members#set-organization-membership-for-a-user)

* [`DELETE /orgs/{org}/memberships/{username}`](/en/rest/orgs/members#remove-organization-membership-for-a-user)

* [`GET /orgs/{org}/organization-roles`](/en/rest/orgs/organization-roles#get-all-organization-roles-for-an-organization)

* [`DELETE /orgs/{org}/organization-roles/teams/{team_slug}`](/en/rest/orgs/organization-roles#remove-all-organization-roles-for-a-team)

* [`PUT /orgs/{org}/organization-roles/teams/{team_slug}/{role_id}`](/en/rest/orgs/organization-roles#assign-an-organization-role-to-a-team)

* [`DELETE /orgs/{org}/organization-roles/teams/{team_slug}/{role_id}`](/en/rest/orgs/organization-roles#remove-an-organization-role-from-a-team)

* [`DELETE /orgs/{org}/organization-roles/users/{username}`](/en/rest/orgs/organization-roles#remove-all-organization-roles-for-a-user)

* [`PUT /orgs/{org}/organization-roles/users/{username}/{role_id}`](/en/rest/orgs/organization-roles#assign-an-organization-role-to-a-user)

* [`DELETE /orgs/{org}/organization-roles/users/{username}/{role_id}`](/en/rest/orgs/organization-roles#remove-an-organization-role-from-a-user)

* [`GET /orgs/{org}/organization-roles/{role_id}`](/en/rest/orgs/organization-roles#get-an-organization-role)

* [`GET /orgs/{org}/organization-roles/{role_id}/teams`](/en/rest/orgs/organization-roles#list-teams-that-are-assigned-to-an-organization-role)

* [`GET /orgs/{org}/organization-roles/{role_id}/users`](/en/rest/orgs/organization-roles#list-users-that-are-assigned-to-an-organization-role)

* [`GET /orgs/{org}/outside_collaborators`](/en/rest/orgs/outside-collaborators#list-outside-collaborators-for-an-organization)

* [`PUT /orgs/{org}/outside_collaborators/{username}`](/en/rest/orgs/outside-collaborators#convert-an-organization-member-to-outside-collaborator)

* [`DELETE /orgs/{org}/outside_collaborators/{username}`](/en/rest/orgs/outside-collaborators#remove-outside-collaborator-from-an-organization)

* [`GET /orgs/{org}/personal-access-token-requests`](/en/rest/orgs/personal-access-tokens#list-requests-to-access-organization-resources-with-fine-grained-personal-access-tokens)

* [`POST /orgs/{org}/personal-access-token-requests`](/en/rest/orgs/personal-access-tokens#review-requests-to-access-organization-resources-with-fine-grained-personal-access-tokens)

* [`POST /orgs/{org}/personal-access-token-requests/{pat_request_id}`](/en/rest/orgs/personal-access-tokens#review-a-request-to-access-organization-resources-with-a-fine-grained-personal-access-token)

* [`GET /orgs/{org}/personal-access-token-requests/{pat_request_id}/repositories`](/en/rest/orgs/personal-access-tokens#list-repositories-requested-to-be-accessed-by-a-fine-grained-personal-access-token)

* [`GET /orgs/{org}/personal-access-tokens`](/en/rest/orgs/personal-access-tokens#list-fine-grained-personal-access-tokens-with-access-to-organization-resources)

* [`POST /orgs/{org}/personal-access-tokens`](/en/rest/orgs/personal-access-tokens#update-the-access-to-organization-resources-via-fine-grained-personal-access-tokens)

* [`POST /orgs/{org}/personal-access-tokens/{pat_id}`](/en/rest/orgs/personal-access-tokens#update-the-access-a-fine-grained-personal-access-token-has-to-organization-resources)

* [`GET /orgs/{org}/personal-access-tokens/{pat_id}/repositories`](/en/rest/orgs/personal-access-tokens#list-repositories-a-fine-grained-personal-access-token-has-access-to)

* [`GET /orgs/{org}/properties/schema`](/en/rest/orgs/custom-properties#get-all-custom-properties-for-an-organization)

* [`PATCH /orgs/{org}/properties/schema`](/en/rest/orgs/custom-properties#create-or-update-custom-properties-for-an-organization)

* [`GET /orgs/{org}/properties/schema/{custom_property_name}`](/en/rest/orgs/custom-properties#get-a-custom-property-for-an-organization)

* [`PUT /orgs/{org}/properties/schema/{custom_property_name}`](/en/rest/orgs/custom-properties#create-or-update-a-custom-property-for-an-organization)

* [`DELETE /orgs/{org}/properties/schema/{custom_property_name}`](/en/rest/orgs/custom-properties#remove-a-custom-property-for-an-organization)

* [`GET /orgs/{org}/properties/values`](/en/rest/orgs/custom-properties#list-custom-property-values-for-organization-repositories)

* [`PATCH /orgs/{org}/properties/values`](/en/rest/orgs/custom-properties#create-or-update-custom-property-values-for-organization-repositories)

* [`GET /orgs/{org}/public_members`](/en/rest/orgs/members#list-public-organization-members)

* [`GET /orgs/{org}/public_members/{username}`](/en/rest/orgs/members#check-public-organization-membership-for-a-user)

* [`GET /orgs/{org}/rulesets`](/en/rest/orgs/rules#get-all-organization-repository-rulesets)

* [`POST /orgs/{org}/rulesets`](/en/rest/orgs/rules#create-an-organization-repository-ruleset)

* [`GET /orgs/{org}/rulesets/rule-suites`](/en/rest/orgs/rule-suites#list-organization-rule-suites)

* [`GET /orgs/{org}/rulesets/rule-suites/{rule_suite_id}`](/en/rest/orgs/rule-suites#get-an-organization-rule-suite)

* [`GET /orgs/{org}/rulesets/{ruleset_id}`](/en/rest/orgs/rules#get-an-organization-repository-ruleset)

* [`PUT /orgs/{org}/rulesets/{ruleset_id}`](/en/rest/orgs/rules#update-an-organization-repository-ruleset)

* [`DELETE /orgs/{org}/rulesets/{ruleset_id}`](/en/rest/orgs/rules#delete-an-organization-repository-ruleset)

* [`GET /orgs/{org}/rulesets/{ruleset_id}/history`](/en/rest/orgs/rules#get-organization-ruleset-history)

* [`GET /orgs/{org}/rulesets/{ruleset_id}/history/{version_id}`](/en/rest/orgs/rules#get-organization-ruleset-version)

* [`GET /orgs/{org}/security-managers`](/en/rest/orgs/security-managers#list-security-manager-teams)

* [`PUT /orgs/{org}/security-managers/teams/{team_slug}`](/en/rest/orgs/security-managers#add-a-security-manager-team)

* [`DELETE /orgs/{org}/security-managers/teams/{team_slug}`](/en/rest/orgs/security-managers#remove-a-security-manager-team)

* [`GET /orgs/{org}/settings/immutable-releases`](/en/rest/orgs/orgs#get-immutable-releases-settings-for-an-organization)

* [`PUT /orgs/{org}/settings/immutable-releases`](/en/rest/orgs/orgs#set-immutable-releases-settings-for-an-organization)

* [`GET /orgs/{org}/settings/immutable-releases/repositories`](/en/rest/orgs/orgs#list-selected-repositories-for-immutable-releases-enforcement)

* [`PUT /orgs/{org}/settings/immutable-releases/repositories`](/en/rest/orgs/orgs#set-selected-repositories-for-immutable-releases-enforcement)

* [`PUT /orgs/{org}/settings/immutable-releases/repositories/{repository_id}`](/en/rest/orgs/orgs#enable-a-selected-repository-for-immutable-releases-in-an-organization)

* [`DELETE /orgs/{org}/settings/immutable-releases/repositories/{repository_id}`](/en/rest/orgs/orgs#disable-a-selected-repository-for-immutable-releases-in-an-organization)

* [`GET /orgs/{org}/settings/network-configurations`](/en/rest/orgs/network-configurations#list-hosted-compute-network-configurations-for-an-organization)

* [`POST /orgs/{org}/settings/network-configurations`](/en/rest/orgs/network-configurations#create-a-hosted-compute-network-configuration-for-an-organization)

* [`GET /orgs/{org}/settings/network-configurations/{network_configuration_id}`](/en/rest/orgs/network-configurations#get-a-hosted-compute-network-configuration-for-an-organization)

* [`PATCH /orgs/{org}/settings/network-configurations/{network_configuration_id}`](/en/rest/orgs/network-configurations#update-a-hosted-compute-network-configuration-for-an-organization)

* [`DELETE /orgs/{org}/settings/network-configurations/{network_configuration_id}`](/en/rest/orgs/network-configurations#delete-a-hosted-compute-network-configuration-from-an-organization)

* [`GET /orgs/{org}/settings/network-settings/{network_settings_id}`](/en/rest/orgs/network-configurations#get-a-hosted-compute-network-settings-resource-for-an-organization)

* [`POST /orgs/{org}/{security_product}/{enablement}`](/en/rest/orgs/orgs#enable-or-disable-a-security-feature-for-an-organization)

* [`GET /users/{username}/orgs`](/en/rest/orgs/orgs#list-organizations-for-a-user)

## packages

* [`GET /orgs/{org}/docker/conflicts`](/en/rest/packages/packages#get-list-of-conflicting-packages-during-docker-migration-for-organization)

* [`GET /orgs/{org}/packages`](/en/rest/packages/packages#list-packages-for-an-organization)

* [`GET /orgs/{org}/packages/{package_type}/{package_name}`](/en/rest/packages/packages#get-a-package-for-an-organization)

* [`DELETE /orgs/{org}/packages/{package_type}/{package_name}`](/en/rest/packages/packages#delete-a-package-for-an-organization)

* [`POST /orgs/{org}/packages/{package_type}/{package_name}/restore`](/en/rest/packages/packages#restore-a-package-for-an-organization)

* [`GET /orgs/{org}/packages/{package_type}/{package_name}/versions`](/en/rest/packages/packages#list-package-versions-for-a-package-owned-by-an-organization)

* [`GET /orgs/{org}/packages/{package_type}/{package_name}/versions/{package_version_id}`](/en/rest/packages/packages#get-a-package-version-for-an-organization)

* [`DELETE /orgs/{org}/packages/{package_type}/{package_name}/versions/{package_version_id}`](/en/rest/packages/packages#delete-package-version-for-an-organization)

* [`POST /orgs/{org}/packages/{package_type}/{package_name}/versions/{package_version_id}/restore`](/en/rest/packages/packages#restore-package-version-for-an-organization)

* [`GET /user/packages`](/en/rest/packages/packages#list-packages-for-the-authenticated-users-namespace)

* [`GET /user/packages/{package_type}/{package_name}`](/en/rest/packages/packages#get-a-package-for-the-authenticated-user)

* [`DELETE /user/packages/{package_type}/{package_name}`](/en/rest/packages/packages#delete-a-package-for-the-authenticated-user)

* [`POST /user/packages/{package_type}/{package_name}/restore`](/en/rest/packages/packages#restore-a-package-for-the-authenticated-user)

* [`GET /user/packages/{package_type}/{package_name}/versions`](/en/rest/packages/packages#list-package-versions-for-a-package-owned-by-the-authenticated-user)

* [`GET /user/packages/{package_type}/{package_name}/versions/{package_version_id}`](/en/rest/packages/packages#get-a-package-version-for-the-authenticated-user)

* [`DELETE /user/packages/{package_type}/{package_name}/versions/{package_version_id}`](/en/rest/packages/packages#delete-a-package-version-for-the-authenticated-user)

* [`POST /user/packages/{package_type}/{package_name}/versions/{package_version_id}/restore`](/en/rest/packages/packages#restore-a-package-version-for-the-authenticated-user)

* [`GET /users/{username}/docker/conflicts`](/en/rest/packages/packages#get-list-of-conflicting-packages-during-docker-migration-for-user)

* [`GET /users/{username}/packages`](/en/rest/packages/packages#list-packages-for-a-user)

* [`GET /users/{username}/packages/{package_type}/{package_name}`](/en/rest/packages/packages#get-a-package-for-a-user)

* [`DELETE /users/{username}/packages/{package_type}/{package_name}`](/en/rest/packages/packages#delete-a-package-for-a-user)

* [`POST /users/{username}/packages/{package_type}/{package_name}/restore`](/en/rest/packages/packages#restore-a-package-for-a-user)

* [`GET /users/{username}/packages/{package_type}/{package_name}/versions`](/en/rest/packages/packages#list-package-versions-for-a-package-owned-by-a-user)

* [`GET /users/{username}/packages/{package_type}/{package_name}/versions/{package_version_id}`](/en/rest/packages/packages#get-a-package-version-for-a-user)

* [`DELETE /users/{username}/packages/{package_type}/{package_name}/versions/{package_version_id}`](/en/rest/packages/packages#delete-package-version-for-a-user)

* [`POST /users/{username}/packages/{package_type}/{package_name}/versions/{package_version_id}/restore`](/en/rest/packages/packages#restore-package-version-for-a-user)

## pages

* [`GET /repos/{owner}/{repo}/pages`](/en/rest/pages/pages#get-a-github-pages-site)

* [`POST /repos/{owner}/{repo}/pages`](/en/rest/pages/pages#create-a-github-pages-site)

* [`PUT /repos/{owner}/{repo}/pages`](/en/rest/pages/pages#update-information-about-a-github-pages-site)

* [`DELETE /repos/{owner}/{repo}/pages`](/en/rest/pages/pages#delete-a-github-pages-site)

* [`GET /repos/{owner}/{repo}/pages/builds`](/en/rest/pages/pages#list-github-pages-builds)

* [`POST /repos/{owner}/{repo}/pages/builds`](/en/rest/pages/pages#request-a-github-pages-build)

* [`GET /repos/{owner}/{repo}/pages/builds/latest`](/en/rest/pages/pages#get-latest-pages-build)

* [`GET /repos/{owner}/{repo}/pages/builds/{build_id}`](/en/rest/pages/pages#get-github-pages-build)

* [`POST /repos/{owner}/{repo}/pages/deployments`](/en/rest/pages/pages#create-a-github-pages-deployment)

* [`GET /repos/{owner}/{repo}/pages/deployments/{pages_deployment_id}`](/en/rest/pages/pages#get-the-status-of-a-github-pages-deployment)

* [`POST /repos/{owner}/{repo}/pages/deployments/{pages_deployment_id}/cancel`](/en/rest/pages/pages#cancel-a-github-pages-deployment)

* [`GET /repos/{owner}/{repo}/pages/health`](/en/rest/pages/pages#get-a-dns-health-check-for-github-pages)

## private-registries

* [`GET /orgs/{org}/private-registries`](/en/rest/private-registries/organization-configurations#list-private-registries-for-an-organization)

* [`POST /orgs/{org}/private-registries`](/en/rest/private-registries/organization-configurations#create-a-private-registry-for-an-organization)

* [`GET /orgs/{org}/private-registries/public-key`](/en/rest/private-registries/organization-configurations#get-private-registries-public-key-for-an-organization)

* [`GET /orgs/{org}/private-registries/{secret_name}`](/en/rest/private-registries/organization-configurations#get-a-private-registry-for-an-organization)

* [`PATCH /orgs/{org}/private-registries/{secret_name}`](/en/rest/private-registries/organization-configurations#update-a-private-registry-for-an-organization)

* [`DELETE /orgs/{org}/private-registries/{secret_name}`](/en/rest/private-registries/organization-configurations#delete-a-private-registry-for-an-organization)

## projects

* [`GET /orgs/{org}/projectsV2`](/en/rest/projects/projects#list-projects-for-organization)

* [`GET /orgs/{org}/projectsV2/{project_number}`](/en/rest/projects/projects#get-project-for-organization)

* [`POST /orgs/{org}/projectsV2/{project_number}/drafts`](/en/rest/projects/drafts#create-draft-item-for-organization-owned-project)

* [`GET /orgs/{org}/projectsV2/{project_number}/fields`](/en/rest/projects/fields#list-project-fields-for-organization)

* [`POST /orgs/{org}/projectsV2/{project_number}/fields`](/en/rest/projects/fields#add-a-field-to-an-organization-owned-project)

* [`GET /orgs/{org}/projectsV2/{project_number}/fields/{field_id}`](/en/rest/projects/fields#get-project-field-for-organization)

* [`GET /orgs/{org}/projectsV2/{project_number}/items`](/en/rest/projects/items#list-items-for-an-organization-owned-project)

* [`POST /orgs/{org}/projectsV2/{project_number}/items`](/en/rest/projects/items#add-item-to-organization-owned-project)

* [`GET /orgs/{org}/projectsV2/{project_number}/items/{item_id}`](/en/rest/projects/items#get-an-item-for-an-organization-owned-project)

* [`PATCH /orgs/{org}/projectsV2/{project_number}/items/{item_id}`](/en/rest/projects/items#update-project-item-for-organization)

* [`DELETE /orgs/{org}/projectsV2/{project_number}/items/{item_id}`](/en/rest/projects/items#delete-project-item-for-organization)

* [`POST /orgs/{org}/projectsV2/{project_number}/views`](/en/rest/projects/views#create-a-view-for-an-organization-owned-project)

* [`GET /orgs/{org}/projectsV2/{project_number}/views/{view_number}/items`](/en/rest/projects/items#list-items-for-an-organization-project-view)

## pulls

* [`GET /repos/{owner}/{repo}/pulls`](/en/rest/pulls/pulls#list-pull-requests)

* [`POST /repos/{owner}/{repo}/pulls`](/en/rest/pulls/pulls#create-a-pull-request)

* [`GET /repos/{owner}/{repo}/pulls/comments`](/en/rest/pulls/comments#list-review-comments-in-a-repository)

* [`GET /repos/{owner}/{repo}/pulls/comments/{comment_id}`](/en/rest/pulls/comments#get-a-review-comment-for-a-pull-request)

* [`PATCH /repos/{owner}/{repo}/pulls/comments/{comment_id}`](/en/rest/pulls/comments#update-a-review-comment-for-a-pull-request)

* [`DELETE /repos/{owner}/{repo}/pulls/comments/{comment_id}`](/en/rest/pulls/comments#delete-a-review-comment-for-a-pull-request)

* [`GET /repos/{owner}/{repo}/pulls/{pull_number}`](/en/rest/pulls/pulls#get-a-pull-request)

* [`PATCH /repos/{owner}/{repo}/pulls/{pull_number}`](/en/rest/pulls/pulls#update-a-pull-request)

* [`GET /repos/{owner}/{repo}/pulls/{pull_number}/comments`](/en/rest/pulls/comments#list-review-comments-on-a-pull-request)

* [`POST /repos/{owner}/{repo}/pulls/{pull_number}/comments`](/en/rest/pulls/comments#create-a-review-comment-for-a-pull-request)

* [`POST /repos/{owner}/{repo}/pulls/{pull_number}/comments/{comment_id}/replies`](/en/rest/pulls/comments#create-a-reply-for-a-review-comment)

* [`GET /repos/{owner}/{repo}/pulls/{pull_number}/commits`](/en/rest/pulls/pulls#list-commits-on-a-pull-request)

* [`GET /repos/{owner}/{repo}/pulls/{pull_number}/files`](/en/rest/pulls/pulls#list-pull-requests-files)

* [`GET /repos/{owner}/{repo}/pulls/{pull_number}/merge`](/en/rest/pulls/pulls#check-if-a-pull-request-has-been-merged)

* [`PUT /repos/{owner}/{repo}/pulls/{pull_number}/merge`](/en/rest/pulls/pulls#merge-a-pull-request)

* [`GET /repos/{owner}/{repo}/pulls/{pull_number}/requested_reviewers`](/en/rest/pulls/review-requests#get-all-requested-reviewers-for-a-pull-request)

* [`POST /repos/{owner}/{repo}/pulls/{pull_number}/requested_reviewers`](/en/rest/pulls/review-requests#request-reviewers-for-a-pull-request)

* [`DELETE /repos/{owner}/{repo}/pulls/{pull_number}/requested_reviewers`](/en/rest/pulls/review-requests#remove-requested-reviewers-from-a-pull-request)

* [`GET /repos/{owner}/{repo}/pulls/{pull_number}/reviews`](/en/rest/pulls/reviews#list-reviews-for-a-pull-request)

* [`POST /repos/{owner}/{repo}/pulls/{pull_number}/reviews`](/en/rest/pulls/reviews#create-a-review-for-a-pull-request)

* [`GET /repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}`](/en/rest/pulls/reviews#get-a-review-for-a-pull-request)

* [`PUT /repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}`](/en/rest/pulls/reviews#update-a-review-for-a-pull-request)

* [`DELETE /repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}`](/en/rest/pulls/reviews#delete-a-pending-review-for-a-pull-request)

* [`GET /repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}/comments`](/en/rest/pulls/reviews#list-comments-for-a-pull-request-review)

* [`PUT /repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}/dismissals`](/en/rest/pulls/reviews#dismiss-a-review-for-a-pull-request)

* [`POST /repos/{owner}/{repo}/pulls/{pull_number}/reviews/{review_id}/events`](/en/rest/pulls/reviews#submit-a-review-for-a-pull-request)

* [`PUT /repos/{owner}/{repo}/pulls/{pull_number}/update-branch`](/en/rest/pulls/pulls#update-a-pull-request-branch)

## rate-limit

* [`GET /rate_limit`](/en/rest/rate-limit/rate-limit#get-rate-limit-status-for-the-authenticated-user)

## reactions

* [`GET /repos/{owner}/{repo}/comments/{comment_id}/reactions`](/en/rest/reactions/reactions#list-reactions-for-a-commit-comment)

* [`POST /repos/{owner}/{repo}/comments/{comment_id}/reactions`](/en/rest/reactions/reactions#create-reaction-for-a-commit-comment)

* [`DELETE /repos/{owner}/{repo}/comments/{comment_id}/reactions/{reaction_id}`](/en/rest/reactions/reactions#delete-a-commit-comment-reaction)

* [`GET /repos/{owner}/{repo}/issues/comments/{comment_id}/reactions`](/en/rest/reactions/reactions#list-reactions-for-an-issue-comment)

* [`POST /repos/{owner}/{repo}/issues/comments/{comment_id}/reactions`](/en/rest/reactions/reactions#create-reaction-for-an-issue-comment)

* [`DELETE /repos/{owner}/{repo}/issues/comments/{comment_id}/reactions/{reaction_id}`](/en/rest/reactions/reactions#delete-an-issue-comment-reaction)

* [`GET /repos/{owner}/{repo}/issues/{issue_number}/reactions`](/en/rest/reactions/reactions#list-reactions-for-an-issue)

* [`POST /repos/{owner}/{repo}/issues/{issue_number}/reactions`](/en/rest/reactions/reactions#create-reaction-for-an-issue)

* [`DELETE /repos/{owner}/{repo}/issues/{issue_number}/reactions/{reaction_id}`](/en/rest/reactions/reactions#delete-an-issue-reaction)

* [`GET /repos/{owner}/{repo}/pulls/comments/{comment_id}/reactions`](/en/rest/reactions/reactions#list-reactions-for-a-pull-request-review-comment)

* [`POST /repos/{owner}/{repo}/pulls/comments/{comment_id}/reactions`](/en/rest/reactions/reactions#create-reaction-for-a-pull-request-review-comment)

* [`DELETE /repos/{owner}/{repo}/pulls/comments/{comment_id}/reactions/{reaction_id}`](/en/rest/reactions/reactions#delete-a-pull-request-comment-reaction)

* [`GET /repos/{owner}/{repo}/releases/{release_id}/reactions`](/en/rest/reactions/reactions#list-reactions-for-a-release)

* [`POST /repos/{owner}/{repo}/releases/{release_id}/reactions`](/en/rest/reactions/reactions#create-reaction-for-a-release)

* [`DELETE /repos/{owner}/{repo}/releases/{release_id}/reactions/{reaction_id}`](/en/rest/reactions/reactions#delete-a-release-reaction)

## releases

* [`GET /repos/{owner}/{repo}/releases`](/en/rest/releases/releases#list-releases)

* [`POST /repos/{owner}/{repo}/releases`](/en/rest/releases/releases#create-a-release)

* [`GET /repos/{owner}/{repo}/releases/assets/{asset_id}`](/en/rest/releases/assets#get-a-release-asset)

* [`PATCH /repos/{owner}/{repo}/releases/assets/{asset_id}`](/en/rest/releases/assets#update-a-release-asset)

* [`DELETE /repos/{owner}/{repo}/releases/assets/{asset_id}`](/en/rest/releases/assets#delete-a-release-asset)

* [`POST /repos/{owner}/{repo}/releases/generate-notes`](/en/rest/releases/releases#generate-release-notes-content-for-a-release)

* [`GET /repos/{owner}/{repo}/releases/latest`](/en/rest/releases/releases#get-the-latest-release)

* [`GET /repos/{owner}/{repo}/releases/tags/{tag}`](/en/rest/releases/releases#get-a-release-by-tag-name)

* [`GET /repos/{owner}/{repo}/releases/{release_id}`](/en/rest/releases/releases#get-a-release)

* [`PATCH /repos/{owner}/{repo}/releases/{release_id}`](/en/rest/releases/releases#update-a-release)

* [`DELETE /repos/{owner}/{repo}/releases/{release_id}`](/en/rest/releases/releases#delete-a-release)

* [`GET /repos/{owner}/{repo}/releases/{release_id}/assets`](/en/rest/releases/assets#list-release-assets)

## repos

* [`GET /orgs/{org}/repos`](/en/rest/repos/repos#list-organization-repositories)

* [`POST /orgs/{org}/repos`](/en/rest/repos/repos#create-an-organization-repository)

* [`GET /repos/{owner}/{repo}`](/en/rest/repos/repos#get-a-repository)

* [`PATCH /repos/{owner}/{repo}`](/en/rest/repos/repos#update-a-repository)

* [`DELETE /repos/{owner}/{repo}`](/en/rest/repos/repos#delete-a-repository)

* [`GET /repos/{owner}/{repo}/activity`](/en/rest/repos/repos#list-repository-activities)

* [`POST /repos/{owner}/{repo}/attestations`](/en/rest/repos/attestations#create-an-attestation)

* [`GET /repos/{owner}/{repo}/attestations/{subject_digest}`](/en/rest/repos/attestations#list-attestations)

* [`GET /repos/{owner}/{repo}/autolinks`](/en/rest/repos/autolinks#get-all-autolinks-of-a-repository)

* [`POST /repos/{owner}/{repo}/autolinks`](/en/rest/repos/autolinks#create-an-autolink-reference-for-a-repository)

* [`GET /repos/{owner}/{repo}/autolinks/{autolink_id}`](/en/rest/repos/autolinks#get-an-autolink-reference-of-a-repository)

* [`DELETE /repos/{owner}/{repo}/autolinks/{autolink_id}`](/en/rest/repos/autolinks#delete-an-autolink-reference-from-a-repository)

* [`GET /repos/{owner}/{repo}/automated-security-fixes`](/en/rest/repos/repos#check-if-dependabot-security-updates-are-enabled-for-a-repository)

* [`PUT /repos/{owner}/{repo}/automated-security-fixes`](/en/rest/repos/repos#enable-dependabot-security-updates)

* [`DELETE /repos/{owner}/{repo}/automated-security-fixes`](/en/rest/repos/repos#disable-dependabot-security-updates)

* [`GET /repos/{owner}/{repo}/codeowners/errors`](/en/rest/repos/repos#list-codeowners-errors)

* [`GET /repos/{owner}/{repo}/contents/{path}`](/en/rest/repos/contents#get-repository-content)

* [`PUT /repos/{owner}/{repo}/contents/{path}`](/en/rest/repos/contents#create-or-update-file-contents)

* [`DELETE /repos/{owner}/{repo}/contents/{path}`](/en/rest/repos/contents#delete-a-file)

* [`GET /repos/{owner}/{repo}/contributors`](/en/rest/repos/repos#list-repository-contributors)

* [`POST /repos/{owner}/{repo}/dispatches`](/en/rest/repos/repos#create-a-repository-dispatch-event)

* [`GET /repos/{owner}/{repo}/forks`](/en/rest/repos/forks#list-forks)

* [`POST /repos/{owner}/{repo}/forks`](/en/rest/repos/forks#create-a-fork)

* [`GET /repos/{owner}/{repo}/hooks`](/en/rest/repos/webhooks#list-repository-webhooks)

* [`POST /repos/{owner}/{repo}/hooks`](/en/rest/repos/webhooks#create-a-repository-webhook)

* [`GET /repos/{owner}/{repo}/hooks/{hook_id}`](/en/rest/repos/webhooks#get-a-repository-webhook)

* [`PATCH /repos/{owner}/{repo}/hooks/{hook_id}`](/en/rest/repos/webhooks#update-a-repository-webhook)

* [`DELETE /repos/{owner}/{repo}/hooks/{hook_id}`](/en/rest/repos/webhooks#delete-a-repository-webhook)

* [`GET /repos/{owner}/{repo}/hooks/{hook_id}/config`](/en/rest/repos/webhooks#get-a-webhook-configuration-for-a-repository)

* [`PATCH /repos/{owner}/{repo}/hooks/{hook_id}/config`](/en/rest/repos/webhooks#update-a-webhook-configuration-for-a-repository)

* [`GET /repos/{owner}/{repo}/hooks/{hook_id}/deliveries`](/en/rest/repos/webhooks#list-deliveries-for-a-repository-webhook)

* [`GET /repos/{owner}/{repo}/hooks/{hook_id}/deliveries/{delivery_id}`](/en/rest/repos/webhooks#get-a-delivery-for-a-repository-webhook)

* [`POST /repos/{owner}/{repo}/hooks/{hook_id}/deliveries/{delivery_id}/attempts`](/en/rest/repos/webhooks#redeliver-a-delivery-for-a-repository-webhook)

* [`POST /repos/{owner}/{repo}/hooks/{hook_id}/pings`](/en/rest/repos/webhooks#ping-a-repository-webhook)

* [`POST /repos/{owner}/{repo}/hooks/{hook_id}/tests`](/en/rest/repos/webhooks#test-the-push-repository-webhook)

* [`GET /repos/{owner}/{repo}/immutable-releases`](/en/rest/repos/repos#check-if-immutable-releases-are-enabled-for-a-repository)

* [`PUT /repos/{owner}/{repo}/immutable-releases`](/en/rest/repos/repos#enable-immutable-releases)

* [`DELETE /repos/{owner}/{repo}/immutable-releases`](/en/rest/repos/repos#disable-immutable-releases)

* [`GET /repos/{owner}/{repo}/languages`](/en/rest/repos/repos#list-repository-languages)

* [`GET /repos/{owner}/{repo}/private-vulnerability-reporting`](/en/rest/repos/repos#check-if-private-vulnerability-reporting-is-enabled-for-a-repository)

* [`PUT /repos/{owner}/{repo}/private-vulnerability-reporting`](/en/rest/repos/repos#enable-private-vulnerability-reporting-for-a-repository)

* [`DELETE /repos/{owner}/{repo}/private-vulnerability-reporting`](/en/rest/repos/repos#disable-private-vulnerability-reporting-for-a-repository)

* [`GET /repos/{owner}/{repo}/properties/values`](/en/rest/repos/custom-properties#get-all-custom-property-values-for-a-repository)

* [`PATCH /repos/{owner}/{repo}/properties/values`](/en/rest/repos/custom-properties#create-or-update-custom-property-values-for-a-repository)

* [`GET /repos/{owner}/{repo}/readme`](/en/rest/repos/contents#get-a-repository-readme)

* [`GET /repos/{owner}/{repo}/readme/{dir}`](/en/rest/repos/contents#get-a-repository-readme-for-a-directory)

* [`GET /repos/{owner}/{repo}/rules/branches/{branch}`](/en/rest/repos/rules#get-rules-for-a-branch)

* [`GET /repos/{owner}/{repo}/rulesets`](/en/rest/repos/rules#get-all-repository-rulesets)

* [`POST /repos/{owner}/{repo}/rulesets`](/en/rest/repos/rules#create-a-repository-ruleset)

* [`GET /repos/{owner}/{repo}/rulesets/rule-suites`](/en/rest/repos/rule-suites#list-repository-rule-suites)

* [`GET /repos/{owner}/{repo}/rulesets/rule-suites/{rule_suite_id}`](/en/rest/repos/rule-suites#get-a-repository-rule-suite)

* [`GET /repos/{owner}/{repo}/rulesets/{ruleset_id}`](/en/rest/repos/rules#get-a-repository-ruleset)

* [`PUT /repos/{owner}/{repo}/rulesets/{ruleset_id}`](/en/rest/repos/rules#update-a-repository-ruleset)

* [`DELETE /repos/{owner}/{repo}/rulesets/{ruleset_id}`](/en/rest/repos/rules#delete-a-repository-ruleset)

* [`GET /repos/{owner}/{repo}/rulesets/{ruleset_id}/history`](/en/rest/repos/rules#get-repository-ruleset-history)

* [`GET /repos/{owner}/{repo}/rulesets/{ruleset_id}/history/{version_id}`](/en/rest/repos/rules#get-repository-ruleset-version)

* [`GET /repos/{owner}/{repo}/tags`](/en/rest/repos/repos#list-repository-tags)

* [`GET /repos/{owner}/{repo}/tarball/{ref}`](/en/rest/repos/contents#download-a-repository-archive-tar)

* [`GET /repos/{owner}/{repo}/teams`](/en/rest/repos/repos#list-repository-teams)

* [`GET /repos/{owner}/{repo}/topics`](/en/rest/repos/repos#get-all-repository-topics)

* [`PUT /repos/{owner}/{repo}/topics`](/en/rest/repos/repos#replace-all-repository-topics)

* [`GET /repos/{owner}/{repo}/vulnerability-alerts`](/en/rest/repos/repos#check-if-vulnerability-alerts-are-enabled-for-a-repository)

* [`PUT /repos/{owner}/{repo}/vulnerability-alerts`](/en/rest/repos/repos#enable-vulnerability-alerts)

* [`DELETE /repos/{owner}/{repo}/vulnerability-alerts`](/en/rest/repos/repos#disable-vulnerability-alerts)

* [`GET /repos/{owner}/{repo}/zipball/{ref}`](/en/rest/repos/contents#download-a-repository-archive-zip)

* [`POST /repos/{template_owner}/{template_repo}/generate`](/en/rest/repos/repos#create-a-repository-using-a-template)

* [`GET /repositories`](/en/rest/repos/repos#list-public-repositories)

* [`GET /users/{username}/repos`](/en/rest/repos/repos#list-repositories-for-a-user)

## search

* [`GET /search/code`](/en/rest/search/search#search-code)

* [`GET /search/commits`](/en/rest/search/search#search-commits)

* [`GET /search/issues`](/en/rest/search/search#search-issues-and-pull-requests)

* [`GET /search/labels`](/en/rest/search/search#search-labels)

* [`GET /search/repositories`](/en/rest/search/search#search-repositories)

* [`GET /search/topics`](/en/rest/search/search#search-topics)

* [`GET /search/users`](/en/rest/search/search#search-users)

## secret-scanning

* [`GET /orgs/{org}/secret-scanning/alerts`](/en/rest/secret-scanning/secret-scanning#list-secret-scanning-alerts-for-an-organization)

* [`GET /orgs/{org}/secret-scanning/pattern-configurations`](/en/rest/secret-scanning/push-protection#list-organization-pattern-configurations)

* [`PATCH /orgs/{org}/secret-scanning/pattern-configurations`](/en/rest/secret-scanning/push-protection#update-organization-pattern-configurations)

* [`GET /repos/{owner}/{repo}/secret-scanning/alerts`](/en/rest/secret-scanning/secret-scanning#list-secret-scanning-alerts-for-a-repository)

* [`GET /repos/{owner}/{repo}/secret-scanning/alerts/{alert_number}`](/en/rest/secret-scanning/secret-scanning#get-a-secret-scanning-alert)

* [`PATCH /repos/{owner}/{repo}/secret-scanning/alerts/{alert_number}`](/en/rest/secret-scanning/secret-scanning#update-a-secret-scanning-alert)

* [`GET /repos/{owner}/{repo}/secret-scanning/alerts/{alert_number}/locations`](/en/rest/secret-scanning/secret-scanning#list-locations-for-a-secret-scanning-alert)

* [`GET /repos/{owner}/{repo}/secret-scanning/scan-history`](/en/rest/secret-scanning/secret-scanning#get-secret-scanning-scan-history-for-a-repository)

## security-advisories

* [`GET /advisories`](/en/rest/security-advisories/global-advisories#list-global-security-advisories)

* [`GET /advisories/{ghsa_id}`](/en/rest/security-advisories/global-advisories#get-a-global-security-advisory)

* [`GET /orgs/{org}/security-advisories`](/en/rest/security-advisories/repository-advisories#list-repository-security-advisories-for-an-organization)

* [`GET /repos/{owner}/{repo}/security-advisories`](/en/rest/security-advisories/repository-advisories#list-repository-security-advisories)

* [`POST /repos/{owner}/{repo}/security-advisories`](/en/rest/security-advisories/repository-advisories#create-a-repository-security-advisory)

* [`POST /repos/{owner}/{repo}/security-advisories/reports`](/en/rest/security-advisories/repository-advisories#privately-report-a-security-vulnerability)

* [`GET /repos/{owner}/{repo}/security-advisories/{ghsa_id}`](/en/rest/security-advisories/repository-advisories#get-a-repository-security-advisory)

* [`PATCH /repos/{owner}/{repo}/security-advisories/{ghsa_id}`](/en/rest/security-advisories/repository-advisories#update-a-repository-security-advisory)

* [`POST /repos/{owner}/{repo}/security-advisories/{ghsa_id}/cve`](/en/rest/security-advisories/repository-advisories#request-a-cve-for-a-repository-security-advisory)

* [`POST /repos/{owner}/{repo}/security-advisories/{ghsa_id}/forks`](/en/rest/security-advisories/repository-advisories#create-a-temporary-private-fork)

## teams

* [`GET /orgs/{org}/teams`](/en/rest/teams/teams#list-teams)

* [`POST /orgs/{org}/teams`](/en/rest/teams/teams#create-a-team)

* [`GET /orgs/{org}/teams/{team_slug}`](/en/rest/teams/teams#get-a-team-by-name)

* [`PATCH /orgs/{org}/teams/{team_slug}`](/en/rest/teams/teams#update-a-team)

* [`DELETE /orgs/{org}/teams/{team_slug}`](/en/rest/teams/teams#delete-a-team)

* [`GET /orgs/{org}/teams/{team_slug}/invitations`](/en/rest/teams/members#list-pending-team-invitations)

* [`GET /orgs/{org}/teams/{team_slug}/members`](/en/rest/teams/members#list-team-members)

* [`GET /orgs/{org}/teams/{team_slug}/memberships/{username}`](/en/rest/teams/members#get-team-membership-for-a-user)

* [`PUT /orgs/{org}/teams/{team_slug}/memberships/{username}`](/en/rest/teams/members#add-or-update-team-membership-for-a-user)

* [`DELETE /orgs/{org}/teams/{team_slug}/memberships/{username}`](/en/rest/teams/members#remove-team-membership-for-a-user)

* [`GET /orgs/{org}/teams/{team_slug}/repos`](/en/rest/teams/teams#list-team-repositories)

* [`GET /orgs/{org}/teams/{team_slug}/repos/{owner}/{repo}`](/en/rest/teams/teams#check-team-permissions-for-a-repository)

* [`PUT /orgs/{org}/teams/{team_slug}/repos/{owner}/{repo}`](/en/rest/teams/teams#add-or-update-team-repository-permissions)

* [`DELETE /orgs/{org}/teams/{team_slug}/repos/{owner}/{repo}`](/en/rest/teams/teams#remove-a-repository-from-a-team)

* [`GET /orgs/{org}/teams/{team_slug}/teams`](/en/rest/teams/teams#list-child-teams)

* [`GET /teams/{team_id}`](/en/rest/teams/teams#get-a-team-legacy)

* [`PATCH /teams/{team_id}`](/en/rest/teams/teams#update-a-team-legacy)

* [`DELETE /teams/{team_id}`](/en/rest/teams/teams#delete-a-team-legacy)

* [`GET /teams/{team_id}/invitations`](/en/rest/teams/members#list-pending-team-invitations-legacy)

* [`GET /teams/{team_id}/members`](/en/rest/teams/members#list-team-members-legacy)

* [`GET /teams/{team_id}/members/{username}`](/en/rest/teams/members#get-team-member-legacy)

* [`PUT /teams/{team_id}/members/{username}`](/en/rest/teams/members#add-team-member-legacy)

* [`DELETE /teams/{team_id}/members/{username}`](/en/rest/teams/members#remove-team-member-legacy)

* [`GET /teams/{team_id}/memberships/{username}`](/en/rest/teams/members#get-team-membership-for-a-user-legacy)

* [`PUT /teams/{team_id}/memberships/{username}`](/en/rest/teams/members#add-or-update-team-membership-for-a-user-legacy)

* [`DELETE /teams/{team_id}/memberships/{username}`](/en/rest/teams/members#remove-team-membership-for-a-user-legacy)

* [`GET /teams/{team_id}/repos`](/en/rest/teams/teams#list-team-repositories-legacy)

* [`GET /teams/{team_id}/repos/{owner}/{repo}`](/en/rest/teams/teams#check-team-permissions-for-a-repository-legacy)

* [`PUT /teams/{team_id}/repos/{owner}/{repo}`](/en/rest/teams/teams#add-or-update-team-repository-permissions-legacy)

* [`DELETE /teams/{team_id}/repos/{owner}/{repo}`](/en/rest/teams/teams#remove-a-repository-from-a-team-legacy)

* [`GET /teams/{team_id}/teams`](/en/rest/teams/teams#list-child-teams-legacy)

## users

* [`GET /user/{account_id}`](/en/rest/users/users#get-a-user-using-their-id)

* [`GET /users`](/en/rest/users/users#list-users)

* [`GET /users/{username}`](/en/rest/users/users#get-a-user)

* [`POST /users/{username}/attestations/bulk-list`](/en/rest/users/attestations#list-attestations-by-bulk-subject-digests)

* [`POST /users/{username}/attestations/delete-request`](/en/rest/users/attestations#delete-attestations-in-bulk)

* [`DELETE /users/{username}/attestations/digest/{subject_digest}`](/en/rest/users/attestations#delete-attestations-by-subject-digest)

* [`DELETE /users/{username}/attestations/{attestation_id}`](/en/rest/users/attestations#delete-attestations-by-id)

* [`GET /users/{username}/attestations/{subject_digest}`](/en/rest/users/attestations#list-attestations)

* [`GET /users/{username}/followers`](/en/rest/users/followers#list-followers-of-a-user)

* [`GET /users/{username}/following`](/en/rest/users/followers#list-the-people-a-user-follows)

* [`GET /users/{username}/following/{target_user}`](/en/rest/users/followers#check-if-a-user-follows-another-user)

* [`GET /users/{username}/gpg_keys`](/en/rest/users/gpg-keys#list-gpg-keys-for-a-user)

* [`GET /users/{username}/keys`](/en/rest/users/keys#list-public-keys-for-a-user)

* [`GET /users/{username}/social_accounts`](/en/rest/users/social-accounts#list-social-accounts-for-a-user)

* [`GET /users/{username}/ssh_signing_keys`](/en/rest/users/ssh-signing-keys#list-ssh-signing-keys-for-a-user)
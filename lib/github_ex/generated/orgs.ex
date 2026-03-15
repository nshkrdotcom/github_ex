defmodule GitHubEx.Orgs do
  @moduledoc """
  Generated GitHub REST operations for the `Orgs` namespace.

  ## Operations

  * `orgs/list`
  * `orgs/delete`
  * `orgs/get`
  * `orgs/update`
  * `orgs/create-artifact-deployment-record`
  * `orgs/set-cluster-deployment-records`
  * `orgs/create-artifact-storage-record`
  * `orgs/list-artifact-deployment-records`
  * `orgs/list-artifact-storage-records`
  * `orgs/list-attestations-bulk`
  * `orgs/delete-attestations-bulk`
  * `orgs/delete-attestations-by-subject-digest`
  * `orgs/list-attestation-repositories`
  * `orgs/delete-attestations-by-id`
  * `orgs/list-attestations`
  * `orgs/list-blocked-users`
  * `orgs/block-user`
  * `orgs/check-blocked-user`
  * `orgs/unblock-user`
  * `orgs/list-failed-invitations`
  * `orgs/create-webhook`
  * `orgs/list-webhooks`
  * `orgs/delete-webhook`
  * `orgs/get-webhook`
  * `orgs/update-webhook`
  * `orgs/get-webhook-config-for-org`
  * `orgs/update-webhook-config-for-org`
  * `orgs/list-webhook-deliveries`
  * `orgs/get-webhook-delivery`
  * `orgs/redeliver-webhook-delivery`
  * `orgs/ping-webhook`
  * `api-insights/get-route-stats-by-actor`
  * `api-insights/get-subject-stats`
  * `api-insights/get-summary-stats`
  * `api-insights/get-summary-stats-by-user`
  * `api-insights/get-summary-stats-by-actor`
  * `api-insights/get-time-stats`
  * `api-insights/get-time-stats-by-user`
  * `api-insights/get-time-stats-by-actor`
  * `api-insights/get-user-stats`
  * `orgs/list-app-installations`
  * `orgs/create-invitation`
  * `orgs/list-pending-invitations`
  * `orgs/cancel-invitation`
  * `orgs/list-invitation-teams`
  * `orgs/create-issue-field`
  * `orgs/list-issue-fields`
  * `orgs/delete-issue-field`
  * `orgs/update-issue-field`
  * `orgs/create-issue-type`
  * `orgs/list-issue-types`
  * `orgs/delete-issue-type`
  * `orgs/update-issue-type`
  * `orgs/list-members`
  * `orgs/check-membership-for-user`
  * `orgs/remove-member`
  * `orgs/get-membership-for-user`
  * `orgs/remove-membership-for-user`
  * `orgs/set-membership-for-user`
  * `orgs/list-org-roles`
  * `orgs/revoke-all-org-roles-team`
  * `orgs/assign-team-to-org-role`
  * `orgs/revoke-org-role-team`
  * `orgs/revoke-all-org-roles-user`
  * `orgs/assign-user-to-org-role`
  * `orgs/revoke-org-role-user`
  * `orgs/get-org-role`
  * `orgs/list-org-role-teams`
  * `orgs/list-org-role-users`
  * `orgs/list-outside-collaborators`
  * `orgs/convert-member-to-outside-collaborator`
  * `orgs/remove-outside-collaborator`
  * `orgs/list-pat-grant-requests`
  * `orgs/review-pat-grant-requests-in-bulk`
  * `orgs/review-pat-grant-request`
  * `orgs/list-pat-grant-request-repositories`
  * `orgs/list-pat-grants`
  * `orgs/update-pat-accesses`
  * `orgs/update-pat-access`
  * `orgs/list-pat-grant-repositories`
  * `orgs/custom-properties-for-repos-create-or-update-organization-definitions`
  * `orgs/custom-properties-for-repos-get-organization-definitions`
  * `orgs/custom-properties-for-repos-create-or-update-organization-definition`
  * `orgs/custom-properties-for-repos-delete-organization-definition`
  * `orgs/custom-properties-for-repos-get-organization-definition`
  * `orgs/custom-properties-for-repos-create-or-update-organization-values`
  * `orgs/custom-properties-for-repos-get-organization-values`
  * `orgs/list-public-members`
  * `orgs/check-public-membership-for-user`
  * `orgs/remove-public-membership-for-authenticated-user`
  * `orgs/set-public-membership-for-authenticated-user`
  * `orgs/get-org-ruleset-history`
  * `orgs/get-org-ruleset-version`
  * `orgs/list-security-manager-teams`
  * `orgs/add-security-manager-team`
  * `orgs/remove-security-manager-team`
  * `orgs/get-immutable-releases-settings`
  * `orgs/set-immutable-releases-settings`
  * `orgs/get-immutable-releases-settings-repositories`
  * `orgs/set-immutable-releases-settings-repositories`
  * `orgs/disable-selected-repository-immutable-releases-organization`
  * `orgs/enable-selected-repository-immutable-releases-organization`
  * `orgs/enable-or-disable-security-product-on-all-org-repos`
  * `orgs/list-memberships-for-authenticated-user`
  * `orgs/get-membership-for-authenticated-user`
  * `orgs/update-membership-for-authenticated-user`
  * `orgs/list-for-authenticated-user`
  * `orgs/list-for-user`
  """

  @type result :: {:ok, term()} | {:error, GitHubEx.Error.t()}

  @doc "Add a security manager team\n\nPath: /orgs/{org}/security-managers/teams/{team_slug}\n\nMethod: put"
  @spec add_security_manager_team(GitHubEx.Client.t()) :: result
  @spec add_security_manager_team(GitHubEx.Client.t(), map()) :: result
  def add_security_manager_team(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :add_security_manager_team},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"team_slug", :team_slug}],
      path_template: "/orgs/{org}/security-managers/teams/{team_slug}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Assign an organization role to a team\n\nPath: /orgs/{org}/organization-roles/teams/{team_slug}/{role_id}\n\nMethod: put"
  @spec assign_team_to_org_role(GitHubEx.Client.t()) :: result
  @spec assign_team_to_org_role(GitHubEx.Client.t(), map()) :: result
  def assign_team_to_org_role(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :assign_team_to_org_role},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"team_slug", :team_slug}, {"role_id", :role_id}],
      path_template: "/orgs/{org}/organization-roles/teams/{team_slug}/{role_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Assign an organization role to a user\n\nPath: /orgs/{org}/organization-roles/users/{username}/{role_id}\n\nMethod: put"
  @spec assign_user_to_org_role(GitHubEx.Client.t()) :: result
  @spec assign_user_to_org_role(GitHubEx.Client.t(), map()) :: result
  def assign_user_to_org_role(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :assign_user_to_org_role},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"username", :username}, {"role_id", :role_id}],
      path_template: "/orgs/{org}/organization-roles/users/{username}/{role_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Block a user from an organization\n\nPath: /orgs/{org}/blocks/{username}\n\nMethod: put"
  @spec block_user(GitHubEx.Client.t()) :: result
  @spec block_user(GitHubEx.Client.t(), map()) :: result
  def block_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :block_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"username", :username}],
      path_template: "/orgs/{org}/blocks/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Cancel an organization invitation\n\nPath: /orgs/{org}/invitations/{invitation_id}\n\nMethod: delete"
  @spec cancel_invitation(GitHubEx.Client.t()) :: result
  @spec cancel_invitation(GitHubEx.Client.t(), map()) :: result
  def cancel_invitation(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :cancel_invitation},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"invitation_id", :invitation_id}],
      path_template: "/orgs/{org}/invitations/{invitation_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Check if a user is blocked by an organization\n\nPath: /orgs/{org}/blocks/{username}\n\nMethod: get"
  @spec check_blocked_user(GitHubEx.Client.t()) :: result
  @spec check_blocked_user(GitHubEx.Client.t(), map()) :: result
  def check_blocked_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :check_blocked_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"username", :username}],
      path_template: "/orgs/{org}/blocks/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Check organization membership for a user\n\nPath: /orgs/{org}/members/{username}\n\nMethod: get"
  @spec check_membership_for_user(GitHubEx.Client.t()) :: result
  @spec check_membership_for_user(GitHubEx.Client.t(), map()) :: result
  def check_membership_for_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :check_membership_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"username", :username}],
      path_template: "/orgs/{org}/members/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Check public organization membership for a user\n\nPath: /orgs/{org}/public_members/{username}\n\nMethod: get"
  @spec check_public_membership_for_user(GitHubEx.Client.t()) :: result
  @spec check_public_membership_for_user(GitHubEx.Client.t(), map()) :: result
  def check_public_membership_for_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :check_public_membership_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"username", :username}],
      path_template: "/orgs/{org}/public_members/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Convert an organization member to outside collaborator\n\nPath: /orgs/{org}/outside_collaborators/{username}\n\nMethod: put"
  @spec convert_member_to_outside_collaborator(GitHubEx.Client.t()) :: result
  @spec convert_member_to_outside_collaborator(GitHubEx.Client.t(), map()) :: result
  def convert_member_to_outside_collaborator(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Orgs, :convert_member_to_outside_collaborator},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"username", :username}],
      path_template: "/orgs/{org}/outside_collaborators/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create an artifact deployment record\n\nPath: /orgs/{org}/artifacts/metadata/deployment-record\n\nMethod: post"
  @spec create_artifact_deployment_record(GitHubEx.Client.t()) :: result
  @spec create_artifact_deployment_record(GitHubEx.Client.t(), map()) :: result
  def create_artifact_deployment_record(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Orgs, :create_artifact_deployment_record},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/artifacts/metadata/deployment-record",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create artifact metadata storage record\n\nPath: /orgs/{org}/artifacts/metadata/storage-record\n\nMethod: post"
  @spec create_artifact_storage_record(GitHubEx.Client.t()) :: result
  @spec create_artifact_storage_record(GitHubEx.Client.t(), map()) :: result
  def create_artifact_storage_record(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Orgs, :create_artifact_storage_record},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/artifacts/metadata/storage-record",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create an organization invitation\n\nPath: /orgs/{org}/invitations\n\nMethod: post"
  @spec create_invitation(GitHubEx.Client.t()) :: result
  @spec create_invitation(GitHubEx.Client.t(), map()) :: result
  def create_invitation(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Orgs, :create_invitation},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/invitations",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create issue field for an organization\n\nPath: /orgs/{org}/issue-fields\n\nMethod: post"
  @spec create_issue_field(GitHubEx.Client.t()) :: result
  @spec create_issue_field(GitHubEx.Client.t(), map()) :: result
  def create_issue_field(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Orgs, :create_issue_field},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/issue-fields",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create issue type for an organization\n\nPath: /orgs/{org}/issue-types\n\nMethod: post"
  @spec create_issue_type(GitHubEx.Client.t()) :: result
  @spec create_issue_type(GitHubEx.Client.t(), map()) :: result
  def create_issue_type(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Orgs, :create_issue_type},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/issue-types",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create an organization webhook\n\nPath: /orgs/{org}/hooks\n\nMethod: post"
  @spec create_webhook(GitHubEx.Client.t()) :: result
  @spec create_webhook(GitHubEx.Client.t(), map()) :: result
  def create_webhook(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Orgs, :create_webhook},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/hooks",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create or update a custom property for an organization\n\nPath: /orgs/{org}/properties/schema/{custom_property_name}\n\nMethod: put"
  @spec custom_properties_for_repos_create_or_update_organization_definition(GitHubEx.Client.t()) ::
          result
  @spec custom_properties_for_repos_create_or_update_organization_definition(
          GitHubEx.Client.t(),
          map()
        ) :: result
  def custom_properties_for_repos_create_or_update_organization_definition(client, params \\ %{})
      when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call:
        {GitHubEx.Orgs, :custom_properties_for_repos_create_or_update_organization_definition},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"custom_property_name", :custom_property_name}],
      path_template: "/orgs/{org}/properties/schema/{custom_property_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create or update custom properties for an organization\n\nPath: /orgs/{org}/properties/schema\n\nMethod: patch"
  @spec custom_properties_for_repos_create_or_update_organization_definitions(GitHubEx.Client.t()) ::
          result
  @spec custom_properties_for_repos_create_or_update_organization_definitions(
          GitHubEx.Client.t(),
          map()
        ) :: result
  def custom_properties_for_repos_create_or_update_organization_definitions(client, params \\ %{})
      when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call:
        {GitHubEx.Orgs, :custom_properties_for_repos_create_or_update_organization_definitions},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/properties/schema",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Create or update custom property values for organization repositories\n\nPath: /orgs/{org}/properties/values\n\nMethod: patch"
  @spec custom_properties_for_repos_create_or_update_organization_values(GitHubEx.Client.t()) ::
          result
  @spec custom_properties_for_repos_create_or_update_organization_values(
          GitHubEx.Client.t(),
          map()
        ) :: result
  def custom_properties_for_repos_create_or_update_organization_values(client, params \\ %{})
      when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Orgs, :custom_properties_for_repos_create_or_update_organization_values},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/properties/values",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Remove a custom property for an organization\n\nPath: /orgs/{org}/properties/schema/{custom_property_name}\n\nMethod: delete"
  @spec custom_properties_for_repos_delete_organization_definition(GitHubEx.Client.t()) :: result
  @spec custom_properties_for_repos_delete_organization_definition(GitHubEx.Client.t(), map()) ::
          result
  def custom_properties_for_repos_delete_organization_definition(client, params \\ %{})
      when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :custom_properties_for_repos_delete_organization_definition},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"custom_property_name", :custom_property_name}],
      path_template: "/orgs/{org}/properties/schema/{custom_property_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Get a custom property for an organization\n\nPath: /orgs/{org}/properties/schema/{custom_property_name}\n\nMethod: get"
  @spec custom_properties_for_repos_get_organization_definition(GitHubEx.Client.t()) :: result
  @spec custom_properties_for_repos_get_organization_definition(GitHubEx.Client.t(), map()) ::
          result
  def custom_properties_for_repos_get_organization_definition(client, params \\ %{})
      when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :custom_properties_for_repos_get_organization_definition},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"custom_property_name", :custom_property_name}],
      path_template: "/orgs/{org}/properties/schema/{custom_property_name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get all custom properties for an organization\n\nPath: /orgs/{org}/properties/schema\n\nMethod: get"
  @spec custom_properties_for_repos_get_organization_definitions(GitHubEx.Client.t()) :: result
  @spec custom_properties_for_repos_get_organization_definitions(GitHubEx.Client.t(), map()) ::
          result
  def custom_properties_for_repos_get_organization_definitions(client, params \\ %{})
      when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :custom_properties_for_repos_get_organization_definitions},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/properties/schema",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List custom property values for organization repositories\n\nPath: /orgs/{org}/properties/values\n\nMethod: get"
  @spec custom_properties_for_repos_get_organization_values(GitHubEx.Client.t()) :: result
  @spec custom_properties_for_repos_get_organization_values(GitHubEx.Client.t(), map()) :: result
  def custom_properties_for_repos_get_organization_values(client, params \\ %{})
      when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :custom_properties_for_repos_get_organization_values},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/properties/values",
      query: [{"per_page", :per_page}, {"page", :page}, {"repository_query", :repository_query}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Delete an organization\n\nPath: /orgs/{org}\n\nMethod: delete"
  @spec delete(GitHubEx.Client.t()) :: result
  @spec delete(GitHubEx.Client.t(), map()) :: result
  def delete(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :delete},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}],
      path_template: "/orgs/{org}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete attestations in bulk\n\nPath: /orgs/{org}/attestations/delete-request\n\nMethod: post"
  @spec delete_attestations_bulk(GitHubEx.Client.t()) :: result
  @spec delete_attestations_bulk(GitHubEx.Client.t(), map()) :: result
  def delete_attestations_bulk(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Orgs, :delete_attestations_bulk},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/attestations/delete-request",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Delete attestations by ID\n\nPath: /orgs/{org}/attestations/{attestation_id}\n\nMethod: delete"
  @spec delete_attestations_by_id(GitHubEx.Client.t()) :: result
  @spec delete_attestations_by_id(GitHubEx.Client.t(), map()) :: result
  def delete_attestations_by_id(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :delete_attestations_by_id},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"attestation_id", :attestation_id}],
      path_template: "/orgs/{org}/attestations/{attestation_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete attestations by subject digest\n\nPath: /orgs/{org}/attestations/digest/{subject_digest}\n\nMethod: delete"
  @spec delete_attestations_by_subject_digest(GitHubEx.Client.t()) :: result
  @spec delete_attestations_by_subject_digest(GitHubEx.Client.t(), map()) :: result
  def delete_attestations_by_subject_digest(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :delete_attestations_by_subject_digest},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"subject_digest", :subject_digest}],
      path_template: "/orgs/{org}/attestations/digest/{subject_digest}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete issue field for an organization\n\nPath: /orgs/{org}/issue-fields/{issue_field_id}\n\nMethod: delete"
  @spec delete_issue_field(GitHubEx.Client.t()) :: result
  @spec delete_issue_field(GitHubEx.Client.t(), map()) :: result
  def delete_issue_field(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :delete_issue_field},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"issue_field_id", :issue_field_id}],
      path_template: "/orgs/{org}/issue-fields/{issue_field_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete issue type for an organization\n\nPath: /orgs/{org}/issue-types/{issue_type_id}\n\nMethod: delete"
  @spec delete_issue_type(GitHubEx.Client.t()) :: result
  @spec delete_issue_type(GitHubEx.Client.t(), map()) :: result
  def delete_issue_type(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :delete_issue_type},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"issue_type_id", :issue_type_id}],
      path_template: "/orgs/{org}/issue-types/{issue_type_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Delete an organization webhook\n\nPath: /orgs/{org}/hooks/{hook_id}\n\nMethod: delete"
  @spec delete_webhook(GitHubEx.Client.t()) :: result
  @spec delete_webhook(GitHubEx.Client.t(), map()) :: result
  def delete_webhook(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :delete_webhook},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"hook_id", :hook_id}],
      path_template: "/orgs/{org}/hooks/{hook_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Disable a selected repository for immutable releases in an organization\n\nPath: /orgs/{org}/settings/immutable-releases/repositories/{repository_id}\n\nMethod: delete"
  @spec disable_selected_repository_immutable_releases_organization(GitHubEx.Client.t()) :: result
  @spec disable_selected_repository_immutable_releases_organization(GitHubEx.Client.t(), map()) ::
          result
  def disable_selected_repository_immutable_releases_organization(client, params \\ %{})
      when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :disable_selected_repository_immutable_releases_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"repository_id", :repository_id}],
      path_template: "/orgs/{org}/settings/immutable-releases/repositories/{repository_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Enable or disable a security feature for an organization\n\nPath: /orgs/{org}/{security_product}/{enablement}\n\nMethod: post"
  @spec enable_or_disable_security_product_on_all_org_repos(GitHubEx.Client.t()) :: result
  @spec enable_or_disable_security_product_on_all_org_repos(GitHubEx.Client.t(), map()) :: result
  def enable_or_disable_security_product_on_all_org_repos(client, params \\ %{})
      when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Orgs, :enable_or_disable_security_product_on_all_org_repos},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}, {"security_product", :security_product}, {"enablement", :enablement}],
      path_template: "/orgs/{org}/{security_product}/{enablement}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Enable a selected repository for immutable releases in an organization\n\nPath: /orgs/{org}/settings/immutable-releases/repositories/{repository_id}\n\nMethod: put"
  @spec enable_selected_repository_immutable_releases_organization(GitHubEx.Client.t()) :: result
  @spec enable_selected_repository_immutable_releases_organization(GitHubEx.Client.t(), map()) ::
          result
  def enable_selected_repository_immutable_releases_organization(client, params \\ %{})
      when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :enable_selected_repository_immutable_releases_organization},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"repository_id", :repository_id}],
      path_template: "/orgs/{org}/settings/immutable-releases/repositories/{repository_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Get an organization\n\nPath: /orgs/{org}\n\nMethod: get"
  @spec get(GitHubEx.Client.t()) :: result
  @spec get(GitHubEx.Client.t(), map()) :: result
  def get(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :get},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get immutable releases settings for an organization\n\nPath: /orgs/{org}/settings/immutable-releases\n\nMethod: get"
  @spec get_immutable_releases_settings(GitHubEx.Client.t()) :: result
  @spec get_immutable_releases_settings(GitHubEx.Client.t(), map()) :: result
  def get_immutable_releases_settings(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :get_immutable_releases_settings},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/settings/immutable-releases",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List selected repositories for immutable releases enforcement\n\nPath: /orgs/{org}/settings/immutable-releases/repositories\n\nMethod: get"
  @spec get_immutable_releases_settings_repositories(GitHubEx.Client.t()) :: result
  @spec get_immutable_releases_settings_repositories(GitHubEx.Client.t(), map()) :: result
  def get_immutable_releases_settings_repositories(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :get_immutable_releases_settings_repositories},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/settings/immutable-releases/repositories",
      query: [{"page", :page}, {"per_page", :per_page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get an organization membership for the authenticated user\n\nPath: /user/memberships/orgs/{org}\n\nMethod: get"
  @spec get_membership_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec get_membership_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def get_membership_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :get_membership_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/user/memberships/orgs/{org}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get organization membership for a user\n\nPath: /orgs/{org}/memberships/{username}\n\nMethod: get"
  @spec get_membership_for_user(GitHubEx.Client.t()) :: result
  @spec get_membership_for_user(GitHubEx.Client.t(), map()) :: result
  def get_membership_for_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :get_membership_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"username", :username}],
      path_template: "/orgs/{org}/memberships/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get an organization role\n\nPath: /orgs/{org}/organization-roles/{role_id}\n\nMethod: get"
  @spec get_org_role(GitHubEx.Client.t()) :: result
  @spec get_org_role(GitHubEx.Client.t(), map()) :: result
  def get_org_role(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :get_org_role},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"role_id", :role_id}],
      path_template: "/orgs/{org}/organization-roles/{role_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get organization ruleset history\n\nPath: /orgs/{org}/rulesets/{ruleset_id}/history\n\nMethod: get"
  @spec get_org_ruleset_history(GitHubEx.Client.t()) :: result
  @spec get_org_ruleset_history(GitHubEx.Client.t(), map()) :: result
  def get_org_ruleset_history(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :get_org_ruleset_history},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"ruleset_id", :ruleset_id}],
      path_template: "/orgs/{org}/rulesets/{ruleset_id}/history",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get organization ruleset version\n\nPath: /orgs/{org}/rulesets/{ruleset_id}/history/{version_id}\n\nMethod: get"
  @spec get_org_ruleset_version(GitHubEx.Client.t()) :: result
  @spec get_org_ruleset_version(GitHubEx.Client.t(), map()) :: result
  def get_org_ruleset_version(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :get_org_ruleset_version},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"ruleset_id", :ruleset_id}, {"version_id", :version_id}],
      path_template: "/orgs/{org}/rulesets/{ruleset_id}/history/{version_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get route stats by actor\n\nPath: /orgs/{org}/insights/api/route-stats/{actor_type}/{actor_id}\n\nMethod: get"
  @spec get_route_stats_by_actor(GitHubEx.Client.t()) :: result
  @spec get_route_stats_by_actor(GitHubEx.Client.t(), map()) :: result
  def get_route_stats_by_actor(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :get_route_stats_by_actor},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"actor_type", :actor_type}, {"actor_id", :actor_id}],
      path_template: "/orgs/{org}/insights/api/route-stats/{actor_type}/{actor_id}",
      query: [
        {"min_timestamp", :min_timestamp},
        {"max_timestamp", :max_timestamp},
        {"page", :page},
        {"per_page", :per_page},
        {"direction", :direction},
        {"sort", :sort},
        {"api_route_substring", :api_route_substring}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get subject stats\n\nPath: /orgs/{org}/insights/api/subject-stats\n\nMethod: get"
  @spec get_subject_stats(GitHubEx.Client.t()) :: result
  @spec get_subject_stats(GitHubEx.Client.t(), map()) :: result
  def get_subject_stats(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :get_subject_stats},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/insights/api/subject-stats",
      query: [
        {"min_timestamp", :min_timestamp},
        {"max_timestamp", :max_timestamp},
        {"page", :page},
        {"per_page", :per_page},
        {"direction", :direction},
        {"sort", :sort},
        {"subject_name_substring", :subject_name_substring}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get summary stats\n\nPath: /orgs/{org}/insights/api/summary-stats\n\nMethod: get"
  @spec get_summary_stats(GitHubEx.Client.t()) :: result
  @spec get_summary_stats(GitHubEx.Client.t(), map()) :: result
  def get_summary_stats(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :get_summary_stats},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/insights/api/summary-stats",
      query: [{"min_timestamp", :min_timestamp}, {"max_timestamp", :max_timestamp}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get summary stats by actor\n\nPath: /orgs/{org}/insights/api/summary-stats/{actor_type}/{actor_id}\n\nMethod: get"
  @spec get_summary_stats_by_actor(GitHubEx.Client.t()) :: result
  @spec get_summary_stats_by_actor(GitHubEx.Client.t(), map()) :: result
  def get_summary_stats_by_actor(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :get_summary_stats_by_actor},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"actor_type", :actor_type}, {"actor_id", :actor_id}],
      path_template: "/orgs/{org}/insights/api/summary-stats/{actor_type}/{actor_id}",
      query: [{"min_timestamp", :min_timestamp}, {"max_timestamp", :max_timestamp}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get summary stats by user\n\nPath: /orgs/{org}/insights/api/summary-stats/users/{user_id}\n\nMethod: get"
  @spec get_summary_stats_by_user(GitHubEx.Client.t()) :: result
  @spec get_summary_stats_by_user(GitHubEx.Client.t(), map()) :: result
  def get_summary_stats_by_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :get_summary_stats_by_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"user_id", :user_id}],
      path_template: "/orgs/{org}/insights/api/summary-stats/users/{user_id}",
      query: [{"min_timestamp", :min_timestamp}, {"max_timestamp", :max_timestamp}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get time stats\n\nPath: /orgs/{org}/insights/api/time-stats\n\nMethod: get"
  @spec get_time_stats(GitHubEx.Client.t()) :: result
  @spec get_time_stats(GitHubEx.Client.t(), map()) :: result
  def get_time_stats(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :get_time_stats},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/insights/api/time-stats",
      query: [
        {"min_timestamp", :min_timestamp},
        {"max_timestamp", :max_timestamp},
        {"timestamp_increment", :timestamp_increment}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get time stats by actor\n\nPath: /orgs/{org}/insights/api/time-stats/{actor_type}/{actor_id}\n\nMethod: get"
  @spec get_time_stats_by_actor(GitHubEx.Client.t()) :: result
  @spec get_time_stats_by_actor(GitHubEx.Client.t(), map()) :: result
  def get_time_stats_by_actor(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :get_time_stats_by_actor},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"actor_type", :actor_type}, {"actor_id", :actor_id}],
      path_template: "/orgs/{org}/insights/api/time-stats/{actor_type}/{actor_id}",
      query: [
        {"min_timestamp", :min_timestamp},
        {"max_timestamp", :max_timestamp},
        {"timestamp_increment", :timestamp_increment}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get time stats by user\n\nPath: /orgs/{org}/insights/api/time-stats/users/{user_id}\n\nMethod: get"
  @spec get_time_stats_by_user(GitHubEx.Client.t()) :: result
  @spec get_time_stats_by_user(GitHubEx.Client.t(), map()) :: result
  def get_time_stats_by_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :get_time_stats_by_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"user_id", :user_id}],
      path_template: "/orgs/{org}/insights/api/time-stats/users/{user_id}",
      query: [
        {"min_timestamp", :min_timestamp},
        {"max_timestamp", :max_timestamp},
        {"timestamp_increment", :timestamp_increment}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get user stats\n\nPath: /orgs/{org}/insights/api/user-stats/{user_id}\n\nMethod: get"
  @spec get_user_stats(GitHubEx.Client.t()) :: result
  @spec get_user_stats(GitHubEx.Client.t(), map()) :: result
  def get_user_stats(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :get_user_stats},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"user_id", :user_id}],
      path_template: "/orgs/{org}/insights/api/user-stats/{user_id}",
      query: [
        {"min_timestamp", :min_timestamp},
        {"max_timestamp", :max_timestamp},
        {"page", :page},
        {"per_page", :per_page},
        {"direction", :direction},
        {"sort", :sort},
        {"actor_name_substring", :actor_name_substring}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get an organization webhook\n\nPath: /orgs/{org}/hooks/{hook_id}\n\nMethod: get"
  @spec get_webhook(GitHubEx.Client.t()) :: result
  @spec get_webhook(GitHubEx.Client.t(), map()) :: result
  def get_webhook(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :get_webhook},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"hook_id", :hook_id}],
      path_template: "/orgs/{org}/hooks/{hook_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a webhook configuration for an organization\n\nPath: /orgs/{org}/hooks/{hook_id}/config\n\nMethod: get"
  @spec get_webhook_config_for_org(GitHubEx.Client.t()) :: result
  @spec get_webhook_config_for_org(GitHubEx.Client.t(), map()) :: result
  def get_webhook_config_for_org(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :get_webhook_config_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"hook_id", :hook_id}],
      path_template: "/orgs/{org}/hooks/{hook_id}/config",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a webhook delivery for an organization webhook\n\nPath: /orgs/{org}/hooks/{hook_id}/deliveries/{delivery_id}\n\nMethod: get"
  @spec get_webhook_delivery(GitHubEx.Client.t()) :: result
  @spec get_webhook_delivery(GitHubEx.Client.t(), map()) :: result
  def get_webhook_delivery(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :get_webhook_delivery},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"hook_id", :hook_id}, {"delivery_id", :delivery_id}],
      path_template: "/orgs/{org}/hooks/{hook_id}/deliveries/{delivery_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List organizations\n\nPath: /organizations\n\nMethod: get"
  @spec list(GitHubEx.Client.t()) :: result
  @spec list(GitHubEx.Client.t(), map()) :: result
  def list(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :list},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/organizations",
      query: [{"since", :since}, {"per_page", :per_page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List app installations for an organization\n\nPath: /orgs/{org}/installations\n\nMethod: get"
  @spec list_app_installations(GitHubEx.Client.t()) :: result
  @spec list_app_installations(GitHubEx.Client.t(), map()) :: result
  def list_app_installations(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :list_app_installations},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/installations",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List artifact deployment records\n\nPath: /orgs/{org}/artifacts/{subject_digest}/metadata/deployment-records\n\nMethod: get"
  @spec list_artifact_deployment_records(GitHubEx.Client.t()) :: result
  @spec list_artifact_deployment_records(GitHubEx.Client.t(), map()) :: result
  def list_artifact_deployment_records(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :list_artifact_deployment_records},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"subject_digest", :subject_digest}],
      path_template: "/orgs/{org}/artifacts/{subject_digest}/metadata/deployment-records",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List artifact storage records\n\nPath: /orgs/{org}/artifacts/{subject_digest}/metadata/storage-records\n\nMethod: get"
  @spec list_artifact_storage_records(GitHubEx.Client.t()) :: result
  @spec list_artifact_storage_records(GitHubEx.Client.t(), map()) :: result
  def list_artifact_storage_records(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :list_artifact_storage_records},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"subject_digest", :subject_digest}],
      path_template: "/orgs/{org}/artifacts/{subject_digest}/metadata/storage-records",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List attestation repositories\n\nPath: /orgs/{org}/attestations/repositories\n\nMethod: get"
  @spec list_attestation_repositories(GitHubEx.Client.t()) :: result
  @spec list_attestation_repositories(GitHubEx.Client.t(), map()) :: result
  def list_attestation_repositories(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :list_attestation_repositories},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/attestations/repositories",
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

  @doc "List attestations\n\nPath: /orgs/{org}/attestations/{subject_digest}\n\nMethod: get"
  @spec list_attestations(GitHubEx.Client.t()) :: result
  @spec list_attestations(GitHubEx.Client.t(), map()) :: result
  def list_attestations(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :list_attestations},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"subject_digest", :subject_digest}],
      path_template: "/orgs/{org}/attestations/{subject_digest}",
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

  @doc "List attestations by bulk subject digests\n\nPath: /orgs/{org}/attestations/bulk-list\n\nMethod: post"
  @spec list_attestations_bulk(GitHubEx.Client.t()) :: result
  @spec list_attestations_bulk(GitHubEx.Client.t(), map()) :: result
  def list_attestations_bulk(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Orgs, :list_attestations_bulk},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/attestations/bulk-list",
      query: [{"per_page", :per_page}, {"before", :before}, {"after", :after}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "List users blocked by an organization\n\nPath: /orgs/{org}/blocks\n\nMethod: get"
  @spec list_blocked_users(GitHubEx.Client.t()) :: result
  @spec list_blocked_users(GitHubEx.Client.t(), map()) :: result
  def list_blocked_users(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :list_blocked_users},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/blocks",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List failed organization invitations\n\nPath: /orgs/{org}/failed_invitations\n\nMethod: get"
  @spec list_failed_invitations(GitHubEx.Client.t()) :: result
  @spec list_failed_invitations(GitHubEx.Client.t(), map()) :: result
  def list_failed_invitations(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :list_failed_invitations},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/failed_invitations",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List organizations for the authenticated user\n\nPath: /user/orgs\n\nMethod: get"
  @spec list_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec list_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def list_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :list_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/user/orgs",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List organizations for a user\n\nPath: /users/{username}/orgs\n\nMethod: get"
  @spec list_for_user(GitHubEx.Client.t()) :: result
  @spec list_for_user(GitHubEx.Client.t(), map()) :: result
  def list_for_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :list_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"username", :username}],
      path_template: "/users/{username}/orgs",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List organization invitation teams\n\nPath: /orgs/{org}/invitations/{invitation_id}/teams\n\nMethod: get"
  @spec list_invitation_teams(GitHubEx.Client.t()) :: result
  @spec list_invitation_teams(GitHubEx.Client.t(), map()) :: result
  def list_invitation_teams(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :list_invitation_teams},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"invitation_id", :invitation_id}],
      path_template: "/orgs/{org}/invitations/{invitation_id}/teams",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List issue fields for an organization\n\nPath: /orgs/{org}/issue-fields\n\nMethod: get"
  @spec list_issue_fields(GitHubEx.Client.t()) :: result
  @spec list_issue_fields(GitHubEx.Client.t(), map()) :: result
  def list_issue_fields(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :list_issue_fields},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/issue-fields",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List issue types for an organization\n\nPath: /orgs/{org}/issue-types\n\nMethod: get"
  @spec list_issue_types(GitHubEx.Client.t()) :: result
  @spec list_issue_types(GitHubEx.Client.t(), map()) :: result
  def list_issue_types(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :list_issue_types},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/issue-types",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List organization members\n\nPath: /orgs/{org}/members\n\nMethod: get"
  @spec list_members(GitHubEx.Client.t()) :: result
  @spec list_members(GitHubEx.Client.t(), map()) :: result
  def list_members(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :list_members},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/members",
      query: [{"filter", :filter}, {"role", :role}, {"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List organization memberships for the authenticated user\n\nPath: /user/memberships/orgs\n\nMethod: get"
  @spec list_memberships_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec list_memberships_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def list_memberships_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :list_memberships_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/user/memberships/orgs",
      query: [{"state", :state}, {"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List teams that are assigned to an organization role\n\nPath: /orgs/{org}/organization-roles/{role_id}/teams\n\nMethod: get"
  @spec list_org_role_teams(GitHubEx.Client.t()) :: result
  @spec list_org_role_teams(GitHubEx.Client.t(), map()) :: result
  def list_org_role_teams(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :list_org_role_teams},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"role_id", :role_id}],
      path_template: "/orgs/{org}/organization-roles/{role_id}/teams",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List users that are assigned to an organization role\n\nPath: /orgs/{org}/organization-roles/{role_id}/users\n\nMethod: get"
  @spec list_org_role_users(GitHubEx.Client.t()) :: result
  @spec list_org_role_users(GitHubEx.Client.t(), map()) :: result
  def list_org_role_users(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :list_org_role_users},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"role_id", :role_id}],
      path_template: "/orgs/{org}/organization-roles/{role_id}/users",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get all organization roles for an organization\n\nPath: /orgs/{org}/organization-roles\n\nMethod: get"
  @spec list_org_roles(GitHubEx.Client.t()) :: result
  @spec list_org_roles(GitHubEx.Client.t(), map()) :: result
  def list_org_roles(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :list_org_roles},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/organization-roles",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List outside collaborators for an organization\n\nPath: /orgs/{org}/outside_collaborators\n\nMethod: get"
  @spec list_outside_collaborators(GitHubEx.Client.t()) :: result
  @spec list_outside_collaborators(GitHubEx.Client.t(), map()) :: result
  def list_outside_collaborators(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :list_outside_collaborators},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/outside_collaborators",
      query: [{"filter", :filter}, {"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repositories a fine-grained personal access token has access to\n\nPath: /orgs/{org}/personal-access-tokens/{pat_id}/repositories\n\nMethod: get"
  @spec list_pat_grant_repositories(GitHubEx.Client.t()) :: result
  @spec list_pat_grant_repositories(GitHubEx.Client.t(), map()) :: result
  def list_pat_grant_repositories(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :list_pat_grant_repositories},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"pat_id", :pat_id}],
      path_template: "/orgs/{org}/personal-access-tokens/{pat_id}/repositories",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List repositories requested to be accessed by a fine-grained personal access token\n\nPath: /orgs/{org}/personal-access-token-requests/{pat_request_id}/repositories\n\nMethod: get"
  @spec list_pat_grant_request_repositories(GitHubEx.Client.t()) :: result
  @spec list_pat_grant_request_repositories(GitHubEx.Client.t(), map()) :: result
  def list_pat_grant_request_repositories(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :list_pat_grant_request_repositories},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"pat_request_id", :pat_request_id}],
      path_template: "/orgs/{org}/personal-access-token-requests/{pat_request_id}/repositories",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List requests to access organization resources with fine-grained personal access tokens\n\nPath: /orgs/{org}/personal-access-token-requests\n\nMethod: get"
  @spec list_pat_grant_requests(GitHubEx.Client.t()) :: result
  @spec list_pat_grant_requests(GitHubEx.Client.t(), map()) :: result
  def list_pat_grant_requests(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :list_pat_grant_requests},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/personal-access-token-requests",
      query: [
        {"per_page", :per_page},
        {"page", :page},
        {"sort", :sort},
        {"direction", :direction},
        {"owner", :owner},
        {"repository", :repository},
        {"permission", :permission},
        {"last_used_before", :last_used_before},
        {"last_used_after", :last_used_after},
        {"token_id", :token_id}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List fine-grained personal access tokens with access to organization resources\n\nPath: /orgs/{org}/personal-access-tokens\n\nMethod: get"
  @spec list_pat_grants(GitHubEx.Client.t()) :: result
  @spec list_pat_grants(GitHubEx.Client.t(), map()) :: result
  def list_pat_grants(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :list_pat_grants},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/personal-access-tokens",
      query: [
        {"per_page", :per_page},
        {"page", :page},
        {"sort", :sort},
        {"direction", :direction},
        {"owner", :owner},
        {"repository", :repository},
        {"permission", :permission},
        {"last_used_before", :last_used_before},
        {"last_used_after", :last_used_after},
        {"token_id", :token_id}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List pending organization invitations\n\nPath: /orgs/{org}/invitations\n\nMethod: get"
  @spec list_pending_invitations(GitHubEx.Client.t()) :: result
  @spec list_pending_invitations(GitHubEx.Client.t(), map()) :: result
  def list_pending_invitations(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :list_pending_invitations},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/invitations",
      query: [
        {"per_page", :per_page},
        {"page", :page},
        {"role", :role},
        {"invitation_source", :invitation_source}
      ],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List public organization members\n\nPath: /orgs/{org}/public_members\n\nMethod: get"
  @spec list_public_members(GitHubEx.Client.t()) :: result
  @spec list_public_members(GitHubEx.Client.t(), map()) :: result
  def list_public_members(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :list_public_members},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/public_members",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List security manager teams\n\nPath: /orgs/{org}/security-managers\n\nMethod: get"
  @spec list_security_manager_teams(GitHubEx.Client.t()) :: result
  @spec list_security_manager_teams(GitHubEx.Client.t(), map()) :: result
  def list_security_manager_teams(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :list_security_manager_teams},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/security-managers",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List deliveries for an organization webhook\n\nPath: /orgs/{org}/hooks/{hook_id}/deliveries\n\nMethod: get"
  @spec list_webhook_deliveries(GitHubEx.Client.t()) :: result
  @spec list_webhook_deliveries(GitHubEx.Client.t(), map()) :: result
  def list_webhook_deliveries(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :list_webhook_deliveries},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}, {"hook_id", :hook_id}],
      path_template: "/orgs/{org}/hooks/{hook_id}/deliveries",
      query: [{"per_page", :per_page}, {"cursor", :cursor}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "List organization webhooks\n\nPath: /orgs/{org}/hooks\n\nMethod: get"
  @spec list_webhooks(GitHubEx.Client.t()) :: result
  @spec list_webhooks(GitHubEx.Client.t(), map()) :: result
  def list_webhooks(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :list_webhooks},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/hooks",
      query: [{"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Ping an organization webhook\n\nPath: /orgs/{org}/hooks/{hook_id}/pings\n\nMethod: post"
  @spec ping_webhook(GitHubEx.Client.t()) :: result
  @spec ping_webhook(GitHubEx.Client.t(), map()) :: result
  def ping_webhook(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :ping_webhook},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}, {"hook_id", :hook_id}],
      path_template: "/orgs/{org}/hooks/{hook_id}/pings",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Redeliver a delivery for an organization webhook\n\nPath: /orgs/{org}/hooks/{hook_id}/deliveries/{delivery_id}/attempts\n\nMethod: post"
  @spec redeliver_webhook_delivery(GitHubEx.Client.t()) :: result
  @spec redeliver_webhook_delivery(GitHubEx.Client.t(), map()) :: result
  def redeliver_webhook_delivery(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :redeliver_webhook_delivery},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}, {"hook_id", :hook_id}, {"delivery_id", :delivery_id}],
      path_template: "/orgs/{org}/hooks/{hook_id}/deliveries/{delivery_id}/attempts",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Remove an organization member\n\nPath: /orgs/{org}/members/{username}\n\nMethod: delete"
  @spec remove_member(GitHubEx.Client.t()) :: result
  @spec remove_member(GitHubEx.Client.t(), map()) :: result
  def remove_member(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :remove_member},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"username", :username}],
      path_template: "/orgs/{org}/members/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove organization membership for a user\n\nPath: /orgs/{org}/memberships/{username}\n\nMethod: delete"
  @spec remove_membership_for_user(GitHubEx.Client.t()) :: result
  @spec remove_membership_for_user(GitHubEx.Client.t(), map()) :: result
  def remove_membership_for_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :remove_membership_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"username", :username}],
      path_template: "/orgs/{org}/memberships/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove outside collaborator from an organization\n\nPath: /orgs/{org}/outside_collaborators/{username}\n\nMethod: delete"
  @spec remove_outside_collaborator(GitHubEx.Client.t()) :: result
  @spec remove_outside_collaborator(GitHubEx.Client.t(), map()) :: result
  def remove_outside_collaborator(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :remove_outside_collaborator},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"username", :username}],
      path_template: "/orgs/{org}/outside_collaborators/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove public organization membership for the authenticated user\n\nPath: /orgs/{org}/public_members/{username}\n\nMethod: delete"
  @spec remove_public_membership_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec remove_public_membership_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def remove_public_membership_for_authenticated_user(client, params \\ %{})
      when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :remove_public_membership_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"username", :username}],
      path_template: "/orgs/{org}/public_members/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove a security manager team\n\nPath: /orgs/{org}/security-managers/teams/{team_slug}\n\nMethod: delete"
  @spec remove_security_manager_team(GitHubEx.Client.t()) :: result
  @spec remove_security_manager_team(GitHubEx.Client.t(), map()) :: result
  def remove_security_manager_team(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :remove_security_manager_team},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"team_slug", :team_slug}],
      path_template: "/orgs/{org}/security-managers/teams/{team_slug}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Review a request to access organization resources with a fine-grained personal access token\n\nPath: /orgs/{org}/personal-access-token-requests/{pat_request_id}\n\nMethod: post"
  @spec review_pat_grant_request(GitHubEx.Client.t()) :: result
  @spec review_pat_grant_request(GitHubEx.Client.t(), map()) :: result
  def review_pat_grant_request(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Orgs, :review_pat_grant_request},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}, {"pat_request_id", :pat_request_id}],
      path_template: "/orgs/{org}/personal-access-token-requests/{pat_request_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Review requests to access organization resources with fine-grained personal access tokens\n\nPath: /orgs/{org}/personal-access-token-requests\n\nMethod: post"
  @spec review_pat_grant_requests_in_bulk(GitHubEx.Client.t()) :: result
  @spec review_pat_grant_requests_in_bulk(GitHubEx.Client.t(), map()) :: result
  def review_pat_grant_requests_in_bulk(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Orgs, :review_pat_grant_requests_in_bulk},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/personal-access-token-requests",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Remove all organization roles for a team\n\nPath: /orgs/{org}/organization-roles/teams/{team_slug}\n\nMethod: delete"
  @spec revoke_all_org_roles_team(GitHubEx.Client.t()) :: result
  @spec revoke_all_org_roles_team(GitHubEx.Client.t(), map()) :: result
  def revoke_all_org_roles_team(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :revoke_all_org_roles_team},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"team_slug", :team_slug}],
      path_template: "/orgs/{org}/organization-roles/teams/{team_slug}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove all organization roles for a user\n\nPath: /orgs/{org}/organization-roles/users/{username}\n\nMethod: delete"
  @spec revoke_all_org_roles_user(GitHubEx.Client.t()) :: result
  @spec revoke_all_org_roles_user(GitHubEx.Client.t(), map()) :: result
  def revoke_all_org_roles_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :revoke_all_org_roles_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"username", :username}],
      path_template: "/orgs/{org}/organization-roles/users/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove an organization role from a team\n\nPath: /orgs/{org}/organization-roles/teams/{team_slug}/{role_id}\n\nMethod: delete"
  @spec revoke_org_role_team(GitHubEx.Client.t()) :: result
  @spec revoke_org_role_team(GitHubEx.Client.t(), map()) :: result
  def revoke_org_role_team(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :revoke_org_role_team},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"team_slug", :team_slug}, {"role_id", :role_id}],
      path_template: "/orgs/{org}/organization-roles/teams/{team_slug}/{role_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Remove an organization role from a user\n\nPath: /orgs/{org}/organization-roles/users/{username}/{role_id}\n\nMethod: delete"
  @spec revoke_org_role_user(GitHubEx.Client.t()) :: result
  @spec revoke_org_role_user(GitHubEx.Client.t(), map()) :: result
  def revoke_org_role_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :revoke_org_role_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"username", :username}, {"role_id", :role_id}],
      path_template: "/orgs/{org}/organization-roles/users/{username}/{role_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Set cluster deployment records\n\nPath: /orgs/{org}/artifacts/metadata/deployment-record/cluster/{cluster}\n\nMethod: post"
  @spec set_cluster_deployment_records(GitHubEx.Client.t()) :: result
  @spec set_cluster_deployment_records(GitHubEx.Client.t(), map()) :: result
  def set_cluster_deployment_records(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Orgs, :set_cluster_deployment_records},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}, {"cluster", :cluster}],
      path_template: "/orgs/{org}/artifacts/metadata/deployment-record/cluster/{cluster}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set immutable releases settings for an organization\n\nPath: /orgs/{org}/settings/immutable-releases\n\nMethod: put"
  @spec set_immutable_releases_settings(GitHubEx.Client.t()) :: result
  @spec set_immutable_releases_settings(GitHubEx.Client.t(), map()) :: result
  def set_immutable_releases_settings(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Orgs, :set_immutable_releases_settings},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/settings/immutable-releases",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set selected repositories for immutable releases enforcement\n\nPath: /orgs/{org}/settings/immutable-releases/repositories\n\nMethod: put"
  @spec set_immutable_releases_settings_repositories(GitHubEx.Client.t()) :: result
  @spec set_immutable_releases_settings_repositories(GitHubEx.Client.t(), map()) :: result
  def set_immutable_releases_settings_repositories(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Orgs, :set_immutable_releases_settings_repositories},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/settings/immutable-releases/repositories",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set organization membership for a user\n\nPath: /orgs/{org}/memberships/{username}\n\nMethod: put"
  @spec set_membership_for_user(GitHubEx.Client.t()) :: result
  @spec set_membership_for_user(GitHubEx.Client.t(), map()) :: result
  def set_membership_for_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Orgs, :set_membership_for_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"username", :username}],
      path_template: "/orgs/{org}/memberships/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Set public organization membership for the authenticated user\n\nPath: /orgs/{org}/public_members/{username}\n\nMethod: put"
  @spec set_public_membership_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec set_public_membership_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def set_public_membership_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :set_public_membership_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"username", :username}],
      path_template: "/orgs/{org}/public_members/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Unblock a user from an organization\n\nPath: /orgs/{org}/blocks/{username}\n\nMethod: delete"
  @spec unblock_user(GitHubEx.Client.t()) :: result
  @spec unblock_user(GitHubEx.Client.t(), map()) :: result
  def unblock_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Orgs, :unblock_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :delete,
      path: [{"org", :org}, {"username", :username}],
      path_template: "/orgs/{org}/blocks/{username}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.delete",
      use_default_auth: true
    })
  end

  @doc "Update an organization\n\nPath: /orgs/{org}\n\nMethod: patch"
  @spec update(GitHubEx.Client.t()) :: result
  @spec update(GitHubEx.Client.t(), map()) :: result
  def update(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Orgs, :update},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"org", :org}],
      path_template: "/orgs/{org}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update issue field for an organization\n\nPath: /orgs/{org}/issue-fields/{issue_field_id}\n\nMethod: patch"
  @spec update_issue_field(GitHubEx.Client.t()) :: result
  @spec update_issue_field(GitHubEx.Client.t(), map()) :: result
  def update_issue_field(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Orgs, :update_issue_field},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"org", :org}, {"issue_field_id", :issue_field_id}],
      path_template: "/orgs/{org}/issue-fields/{issue_field_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update issue type for an organization\n\nPath: /orgs/{org}/issue-types/{issue_type_id}\n\nMethod: put"
  @spec update_issue_type(GitHubEx.Client.t()) :: result
  @spec update_issue_type(GitHubEx.Client.t(), map()) :: result
  def update_issue_type(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Orgs, :update_issue_type},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :put,
      path: [{"org", :org}, {"issue_type_id", :issue_type_id}],
      path_template: "/orgs/{org}/issue-types/{issue_type_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update an organization membership for the authenticated user\n\nPath: /user/memberships/orgs/{org}\n\nMethod: patch"
  @spec update_membership_for_authenticated_user(GitHubEx.Client.t()) :: result
  @spec update_membership_for_authenticated_user(GitHubEx.Client.t(), map()) :: result
  def update_membership_for_authenticated_user(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Orgs, :update_membership_for_authenticated_user},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"org", :org}],
      path_template: "/user/memberships/orgs/{org}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update the access a fine-grained personal access token has to organization resources\n\nPath: /orgs/{org}/personal-access-tokens/{pat_id}\n\nMethod: post"
  @spec update_pat_access(GitHubEx.Client.t()) :: result
  @spec update_pat_access(GitHubEx.Client.t(), map()) :: result
  def update_pat_access(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Orgs, :update_pat_access},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}, {"pat_id", :pat_id}],
      path_template: "/orgs/{org}/personal-access-tokens/{pat_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update the access to organization resources via fine-grained personal access tokens\n\nPath: /orgs/{org}/personal-access-tokens\n\nMethod: post"
  @spec update_pat_accesses(GitHubEx.Client.t()) :: result
  @spec update_pat_accesses(GitHubEx.Client.t(), map()) :: result
  def update_pat_accesses(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Orgs, :update_pat_accesses},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [{"org", :org}],
      path_template: "/orgs/{org}/personal-access-tokens",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update an organization webhook\n\nPath: /orgs/{org}/hooks/{hook_id}\n\nMethod: patch"
  @spec update_webhook(GitHubEx.Client.t()) :: result
  @spec update_webhook(GitHubEx.Client.t(), map()) :: result
  def update_webhook(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Orgs, :update_webhook},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"org", :org}, {"hook_id", :hook_id}],
      path_template: "/orgs/{org}/hooks/{hook_id}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Update a webhook configuration for an organization\n\nPath: /orgs/{org}/hooks/{hook_id}/config\n\nMethod: patch"
  @spec update_webhook_config_for_org(GitHubEx.Client.t()) :: result
  @spec update_webhook_config_for_org(GitHubEx.Client.t(), map()) :: result
  def update_webhook_config_for_org(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Orgs, :update_webhook_config_for_org},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :patch,
      path: [{"org", :org}, {"hook_id", :hook_id}],
      path_template: "/orgs/{org}/hooks/{hook_id}/config",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

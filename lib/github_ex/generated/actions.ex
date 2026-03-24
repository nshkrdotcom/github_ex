defmodule GitHubEx.Actions do
  @moduledoc """
  Generated Github Ex operations for actions.
  """

  alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient

  @add_custom_labels_to_self_hosted_runner_for_org_partition_spec %{
    path: [{"org", :org}, {"runner_id", :runner_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add custom labels to a self-hosted runner for an organization\n\nAdds custom labels to a self-hosted runner configured in an organization.\n\nAuthenticated users must have admin access to the organization to use this endpoint.\n\nOAuth tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec add_custom_labels_to_self_hosted_runner_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def add_custom_labels_to_self_hosted_runner_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_add_custom_labels_to_self_hosted_runner_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_custom_labels_to_self_hosted_runner_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @add_custom_labels_to_self_hosted_runner_for_org_partition_spec
      )

    %{
      id: "actions/add-custom-labels-to-self-hosted-runner-for-org",
      args: params,
      call: {__MODULE__, :add_custom_labels_to_self_hosted_runner_for_org},
      opts: opts,
      method: :post,
      path_template: "/orgs/{org}/actions/runners/{runner_id}/labels",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :add_custom_labels_to_self_hosted_runner_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @add_custom_labels_to_self_hosted_runner_for_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"runner_id", :runner_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add custom labels to a self-hosted runner for a repository\n\nAdds custom labels to a self-hosted runner configured in a repository.\n\nAuthenticated users must have admin access to the organization to use this endpoint.\n\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec add_custom_labels_to_self_hosted_runner_for_repo(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def add_custom_labels_to_self_hosted_runner_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_add_custom_labels_to_self_hosted_runner_for_repo_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_custom_labels_to_self_hosted_runner_for_repo_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @add_custom_labels_to_self_hosted_runner_for_repo_partition_spec
      )

    %{
      id: "actions/add-custom-labels-to-self-hosted-runner-for-repo",
      args: params,
      call: {__MODULE__, :add_custom_labels_to_self_hosted_runner_for_repo},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/actions/runners/{runner_id}/labels",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :add_custom_labels_to_self_hosted_runner_for_repo],
      timeout: nil,
      pagination: nil
    }
  end

  @add_repo_access_to_self_hosted_runner_group_in_org_partition_spec %{
    path: [
      {"org", :org},
      {"runner_group_id", :runner_group_id},
      {"repository_id", :repository_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add repository access to a self-hosted runner group in an organization\n\nAdds a repository to the list of repositories that can access a self-hosted runner group. The runner group must have `visibility` set to `selected`. For more information, see \"[Create a self-hosted runner group for an organization](#create-a-self-hosted-runner-group-for-an-organization).\"\n\nOAuth tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec add_repo_access_to_self_hosted_runner_group_in_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def add_repo_access_to_self_hosted_runner_group_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_add_repo_access_to_self_hosted_runner_group_in_org_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_repo_access_to_self_hosted_runner_group_in_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @add_repo_access_to_self_hosted_runner_group_in_org_partition_spec
      )

    %{
      id: "actions/add-repo-access-to-self-hosted-runner-group-in-org",
      args: params,
      call: {__MODULE__, :add_repo_access_to_self_hosted_runner_group_in_org},
      opts: opts,
      method: :put,
      path_template:
        "/orgs/{org}/actions/runner-groups/{runner_group_id}/repositories/{repository_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :add_repo_access_to_self_hosted_runner_group_in_org],
      timeout: nil,
      pagination: nil
    }
  end

  @add_selected_repo_to_org_secret_partition_spec %{
    path: [
      {"org", :org},
      {"secret_name", :secret_name},
      {"repository_id", :repository_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add selected repository to an organization secret\n\nAdds a repository to an organization secret when the `visibility` for\nrepository access is set to `selected`. For more information about setting the visibility, see [Create or\nupdate an organization secret](https://docs.github.com/rest/actions/secrets#create-or-update-an-organization-secret).\n\nAuthenticated users must have collaborator access to a repository to create, update, or read secrets.\n\nOAuth tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint. If the repository is private, OAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec add_selected_repo_to_org_secret(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def add_selected_repo_to_org_secret(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_add_selected_repo_to_org_secret_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_selected_repo_to_org_secret_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @add_selected_repo_to_org_secret_partition_spec)

    %{
      id: "actions/add-selected-repo-to-org-secret",
      args: params,
      call: {__MODULE__, :add_selected_repo_to_org_secret},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/actions/secrets/{secret_name}/repositories/{repository_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :add_selected_repo_to_org_secret],
      timeout: nil,
      pagination: nil
    }
  end

  @add_selected_repo_to_org_variable_partition_spec %{
    path: [{"org", :org}, {"name", :name}, {"repository_id", :repository_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add selected repository to an organization variable\n\nAdds a repository to an organization variable that is available to selected repositories.\nOrganization variables that are available to selected repositories have their `visibility` field set to `selected`.\n\nAuthenticated users must have collaborator access to a repository to create, update, or read secrets.\n\nOAuth tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint. If the repository is private, OAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec add_selected_repo_to_org_variable(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def add_selected_repo_to_org_variable(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_add_selected_repo_to_org_variable_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_selected_repo_to_org_variable_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @add_selected_repo_to_org_variable_partition_spec)

    %{
      id: "actions/add-selected-repo-to-org-variable",
      args: params,
      call: {__MODULE__, :add_selected_repo_to_org_variable},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/actions/variables/{name}/repositories/{repository_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :add_selected_repo_to_org_variable],
      timeout: nil,
      pagination: nil
    }
  end

  @add_self_hosted_runner_to_group_for_org_partition_spec %{
    path: [
      {"org", :org},
      {"runner_group_id", :runner_group_id},
      {"runner_id", :runner_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add a self-hosted runner to a group for an organization\n\nAdds a self-hosted runner to a runner group configured in an organization.\n\nOAuth tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec add_self_hosted_runner_to_group_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def add_self_hosted_runner_to_group_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_add_self_hosted_runner_to_group_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_add_self_hosted_runner_to_group_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @add_self_hosted_runner_to_group_for_org_partition_spec)

    %{
      id: "actions/add-self-hosted-runner-to-group-for-org",
      args: params,
      call: {__MODULE__, :add_self_hosted_runner_to_group_for_org},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/actions/runner-groups/{runner_group_id}/runners/{runner_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :add_self_hosted_runner_to_group_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @approve_workflow_run_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Approve a workflow run for a fork pull request\n\nApproves a workflow run for a pull request from a public fork of a first time contributor. For more information, see [\"Approving workflow runs from public forks](https://docs.github.com/actions/managing-workflow-runs/approving-workflow-runs-from-public-forks).\"\n\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec approve_workflow_run(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def approve_workflow_run(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_approve_workflow_run_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_approve_workflow_run_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @approve_workflow_run_partition_spec)

    %{
      id: "actions/approve-workflow-run",
      args: params,
      call: {__MODULE__, :approve_workflow_run},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/approve",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :approve_workflow_run],
      timeout: nil,
      pagination: nil
    }
  end

  @cancel_workflow_run_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Cancel a workflow run\n\nCancels a workflow run using its `id`.\n\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec cancel_workflow_run(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def cancel_workflow_run(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_cancel_workflow_run_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_cancel_workflow_run_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @cancel_workflow_run_partition_spec)

    %{
      id: "actions/cancel-workflow-run",
      args: params,
      call: {__MODULE__, :cancel_workflow_run},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/cancel",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :cancel_workflow_run],
      timeout: nil,
      pagination: nil
    }
  end

  @create_environment_variable_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"environment_name", :environment_name}
    ],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create an environment variable\n\nCreate an environment variable that you can reference in a GitHub Actions workflow.\n\nAuthenticated users must have collaborator access to a repository to create, update, or read variables.\n\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec create_environment_variable(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_environment_variable(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_environment_variable_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_environment_variable_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_environment_variable_partition_spec)

    %{
      id: "actions/create-environment-variable",
      args: params,
      call: {__MODULE__, :create_environment_variable},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/environments/{environment_name}/variables",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :create_environment_variable],
      timeout: nil,
      pagination: nil
    }
  end

  @create_hosted_runner_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a GitHub-hosted runner for an organization\n\nCreates a GitHub-hosted runner for an organization.\nOAuth tokens and personal access tokens (classic) need the `manage_runners:org` scope to use this endpoint."
  @spec create_hosted_runner_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_hosted_runner_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_hosted_runner_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_hosted_runner_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_hosted_runner_for_org_partition_spec)

    %{
      id: "actions/create-hosted-runner-for-org",
      args: params,
      call: {__MODULE__, :create_hosted_runner_for_org},
      opts: opts,
      method: :post,
      path_template: "/orgs/{org}/actions/hosted-runners",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :create_hosted_runner_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @create_or_update_environment_secret_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"environment_name", :environment_name},
      {"secret_name", :secret_name}
    ],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create or update an environment secret\n\nCreates or updates an environment secret with an encrypted value. Encrypt your secret using\n[LibSodium](https://libsodium.gitbook.io/doc/bindings_for_other_languages). For more information, see \"[Encrypting secrets for the REST API](https://docs.github.com/rest/guides/encrypting-secrets-for-the-rest-api).\"\n\nAuthenticated users must have collaborator access to a repository to create, update, or read secrets.\n\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec create_or_update_environment_secret(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def create_or_update_environment_secret(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_or_update_environment_secret_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_or_update_environment_secret_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @create_or_update_environment_secret_partition_spec)

    %{
      id: "actions/create-or-update-environment-secret",
      args: params,
      call: {__MODULE__, :create_or_update_environment_secret},
      opts: opts,
      method: :put,
      path_template:
        "/repos/{owner}/{repo}/environments/{environment_name}/secrets/{secret_name}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :create_or_update_environment_secret],
      timeout: nil,
      pagination: nil
    }
  end

  @create_or_update_org_secret_partition_spec %{
    path: [{"org", :org}, {"secret_name", :secret_name}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create or update an organization secret\n\nCreates or updates an organization secret with an encrypted value. Encrypt your secret using\n[LibSodium](https://libsodium.gitbook.io/doc/bindings_for_other_languages). For more information, see \"[Encrypting secrets for the REST API](https://docs.github.com/rest/guides/encrypting-secrets-for-the-rest-api).\"\n\nAuthenticated users must have collaborator access to a repository to create, update, or read secrets.\n\nOAuth tokens and personal access tokens (classic) need the`admin:org` scope to use this endpoint. If the repository is private, OAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec create_or_update_org_secret(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_or_update_org_secret(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_or_update_org_secret_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_or_update_org_secret_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_or_update_org_secret_partition_spec)

    %{
      id: "actions/create-or-update-org-secret",
      args: params,
      call: {__MODULE__, :create_or_update_org_secret},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/actions/secrets/{secret_name}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :create_or_update_org_secret],
      timeout: nil,
      pagination: nil
    }
  end

  @create_or_update_repo_secret_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"secret_name", :secret_name}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create or update a repository secret\n\nCreates or updates a repository secret with an encrypted value. Encrypt your secret using\n[LibSodium](https://libsodium.gitbook.io/doc/bindings_for_other_languages). For more information, see \"[Encrypting secrets for the REST API](https://docs.github.com/rest/guides/encrypting-secrets-for-the-rest-api).\"\n\nAuthenticated users must have collaborator access to a repository to create, update, or read secrets.\n\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec create_or_update_repo_secret(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_or_update_repo_secret(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_or_update_repo_secret_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_or_update_repo_secret_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_or_update_repo_secret_partition_spec)

    %{
      id: "actions/create-or-update-repo-secret",
      args: params,
      call: {__MODULE__, :create_or_update_repo_secret},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/actions/secrets/{secret_name}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :create_or_update_repo_secret],
      timeout: nil,
      pagination: nil
    }
  end

  @create_org_variable_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create an organization variable\n\nCreates an organization variable that you can reference in a GitHub Actions workflow.\n\nAuthenticated users must have collaborator access to a repository to create, update, or read variables.\n\nOAuth tokens and personal access tokens (classic) need the`admin:org` scope to use this endpoint. If the repository is private, OAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec create_org_variable(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_org_variable(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_org_variable_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_org_variable_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_org_variable_partition_spec)

    %{
      id: "actions/create-org-variable",
      args: params,
      call: {__MODULE__, :create_org_variable},
      opts: opts,
      method: :post,
      path_template: "/orgs/{org}/actions/variables",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :create_org_variable],
      timeout: nil,
      pagination: nil
    }
  end

  @create_registration_token_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a registration token for an organization\n\nReturns a token that you can pass to the `config` script. The token expires after one hour.\n\nFor example, you can replace `TOKEN` in the following example with the registration token provided by this endpoint to configure your self-hosted runner:\n\n```\n./config.sh --url https://github.com/octo-org --token TOKEN\n```\n\nAuthenticated users must have admin access to the organization to use this endpoint.\n\nOAuth tokens and personal access tokens (classic) need the`admin:org` scope to use this endpoint. If the repository is private, OAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec create_registration_token_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def create_registration_token_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_registration_token_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_registration_token_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_registration_token_for_org_partition_spec)

    %{
      id: "actions/create-registration-token-for-org",
      args: params,
      call: {__MODULE__, :create_registration_token_for_org},
      opts: opts,
      method: :post,
      path_template: "/orgs/{org}/actions/runners/registration-token",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :create_registration_token_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @create_registration_token_for_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a registration token for a repository\n\nReturns a token that you can pass to the `config` script. The token expires after one hour.\n\nFor example, you can replace `TOKEN` in the following example with the registration token provided by this endpoint to configure your self-hosted runner:\n\n```\n./config.sh --url https://github.com/octo-org --token TOKEN\n```\n\nAuthenticated users must have admin access to the repository to use this endpoint.\n\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec create_registration_token_for_repo(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def create_registration_token_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_registration_token_for_repo_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_registration_token_for_repo_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @create_registration_token_for_repo_partition_spec)

    %{
      id: "actions/create-registration-token-for-repo",
      args: params,
      call: {__MODULE__, :create_registration_token_for_repo},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/actions/runners/registration-token",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :create_registration_token_for_repo],
      timeout: nil,
      pagination: nil
    }
  end

  @create_remove_token_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a remove token for an organization\n\nReturns a token that you can pass to the `config` script to remove a self-hosted runner from an organization. The token expires after one hour.\n\nFor example, you can replace `TOKEN` in the following example with the registration token provided by this endpoint to remove your self-hosted runner from an organization:\n\n```\n./config.sh remove --token TOKEN\n```\n\nAuthenticated users must have admin access to the organization to use this endpoint.\n\nOAuth tokens and personal access tokens (classic) need the`admin:org` scope to use this endpoint. If the repository is private, OAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec create_remove_token_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_remove_token_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_remove_token_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_remove_token_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_remove_token_for_org_partition_spec)

    %{
      id: "actions/create-remove-token-for-org",
      args: params,
      call: {__MODULE__, :create_remove_token_for_org},
      opts: opts,
      method: :post,
      path_template: "/orgs/{org}/actions/runners/remove-token",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :create_remove_token_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @create_remove_token_for_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a remove token for a repository\n\nReturns a token that you can pass to the `config` script to remove a self-hosted runner from an repository. The token expires after one hour.\n\nFor example, you can replace `TOKEN` in the following example with the registration token provided by this endpoint to remove your self-hosted runner from an organization:\n\n```\n./config.sh remove --token TOKEN\n```\n\nAuthenticated users must have admin access to the repository to use this endpoint.\n\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec create_remove_token_for_repo(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_remove_token_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_remove_token_for_repo_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_remove_token_for_repo_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_remove_token_for_repo_partition_spec)

    %{
      id: "actions/create-remove-token-for-repo",
      args: params,
      call: {__MODULE__, :create_remove_token_for_repo},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/actions/runners/remove-token",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :create_remove_token_for_repo],
      timeout: nil,
      pagination: nil
    }
  end

  @create_repo_variable_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a repository variable\n\nCreates a repository variable that you can reference in a GitHub Actions workflow.\n\nAuthenticated users must have collaborator access to a repository to create, update, or read variables.\n\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec create_repo_variable(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_repo_variable(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_repo_variable_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_repo_variable_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_repo_variable_partition_spec)

    %{
      id: "actions/create-repo-variable",
      args: params,
      call: {__MODULE__, :create_repo_variable},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/actions/variables",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :create_repo_variable],
      timeout: nil,
      pagination: nil
    }
  end

  @create_self_hosted_runner_group_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a self-hosted runner group for an organization\n\nCreates a new self-hosted runner group for an organization.\n\nOAuth tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec create_self_hosted_runner_group_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def create_self_hosted_runner_group_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_self_hosted_runner_group_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_self_hosted_runner_group_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @create_self_hosted_runner_group_for_org_partition_spec)

    %{
      id: "actions/create-self-hosted-runner-group-for-org",
      args: params,
      call: {__MODULE__, :create_self_hosted_runner_group_for_org},
      opts: opts,
      method: :post,
      path_template: "/orgs/{org}/actions/runner-groups",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :create_self_hosted_runner_group_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @create_workflow_dispatch_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"workflow_id", :workflow_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create a workflow dispatch event\n\nYou can use this endpoint to manually trigger a GitHub Actions workflow run. You can replace `workflow_id` with the workflow file name. For example, you could use `main.yaml`.\n\nYou must configure your GitHub Actions workflow to run when the [`workflow_dispatch` webhook](https://docs.github.com/developers/webhooks-and-events/webhook-events-and-payloads#workflow_dispatch) event occurs. The `inputs` are configured in the workflow file. For more information about how to configure the `workflow_dispatch` event in the workflow file, see \"[Events that trigger workflows](https://docs.github.com/actions/reference/events-that-trigger-workflows#workflow_dispatch).\"\n\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec create_workflow_dispatch(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_workflow_dispatch(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_workflow_dispatch_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_workflow_dispatch_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @create_workflow_dispatch_partition_spec)

    %{
      id: "actions/create-workflow-dispatch",
      args: params,
      call: {__MODULE__, :create_workflow_dispatch},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/actions/workflows/{workflow_id}/dispatches",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :create_workflow_dispatch],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_actions_cache_by_id_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"cache_id", :cache_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a GitHub Actions cache for a repository (using a cache ID)\n\nDeletes a GitHub Actions cache for a repository, using a cache ID.\n\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec delete_actions_cache_by_id(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_actions_cache_by_id(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_actions_cache_by_id_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_actions_cache_by_id_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_actions_cache_by_id_partition_spec)

    %{
      id: "actions/delete-actions-cache-by-id",
      args: params,
      call: {__MODULE__, :delete_actions_cache_by_id},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/actions/caches/{cache_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :delete_actions_cache_by_id],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_actions_cache_by_key_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"key", :key}, {"ref", :ref}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete GitHub Actions caches for a repository (using a cache key)\n\nDeletes one or more GitHub Actions caches for a repository, using a complete cache key. By default, all caches that match the provided key are deleted, but you can optionally provide a Git ref to restrict deletions to caches that match both the provided key and the Git ref.\n\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec delete_actions_cache_by_key(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_actions_cache_by_key(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_actions_cache_by_key_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_actions_cache_by_key_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_actions_cache_by_key_partition_spec)

    %{
      id: "actions/delete-actions-cache-by-key",
      args: params,
      call: {__MODULE__, :delete_actions_cache_by_key},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/actions/caches",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :delete_actions_cache_by_key],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_artifact_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"artifact_id", :artifact_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete an artifact\n\nDeletes an artifact for a workflow run.\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec delete_artifact(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_artifact(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_artifact_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_artifact_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_artifact_partition_spec)

    %{
      id: "actions/delete-artifact",
      args: params,
      call: {__MODULE__, :delete_artifact},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/actions/artifacts/{artifact_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :delete_artifact],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_custom_image_from_org_partition_spec %{
    path: [{"org", :org}, {"image_definition_id", :image_definition_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a custom image from the organization\n\nDelete a custom image from the organization.\n\nOAuth tokens and personal access tokens (classic) need the `manage_runners:org` scope to use this endpoint."
  @spec delete_custom_image_from_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_custom_image_from_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_custom_image_from_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_custom_image_from_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_custom_image_from_org_partition_spec)

    %{
      id: "actions/delete-custom-image-from-org",
      args: params,
      call: {__MODULE__, :delete_custom_image_from_org},
      opts: opts,
      method: :delete,
      path_template: "/orgs/{org}/actions/hosted-runners/images/custom/{image_definition_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :delete_custom_image_from_org],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_custom_image_version_from_org_partition_spec %{
    path: [
      {"org", :org},
      {"image_definition_id", :image_definition_id},
      {"version", :version}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete an image version of custom image from the organization\n\nDelete an image version of custom image from the organization.\n\nOAuth tokens and personal access tokens (classic) need the `manage_runners:org` scope to use this endpoint."
  @spec delete_custom_image_version_from_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def delete_custom_image_version_from_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_custom_image_version_from_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_custom_image_version_from_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @delete_custom_image_version_from_org_partition_spec)

    %{
      id: "actions/delete-custom-image-version-from-org",
      args: params,
      call: {__MODULE__, :delete_custom_image_version_from_org},
      opts: opts,
      method: :delete,
      path_template:
        "/orgs/{org}/actions/hosted-runners/images/custom/{image_definition_id}/versions/{version}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :delete_custom_image_version_from_org],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_environment_secret_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"environment_name", :environment_name},
      {"secret_name", :secret_name}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete an environment secret\n\nDeletes a secret in an environment using the secret name.\n\nAuthenticated users must have collaborator access to a repository to create, update, or read secrets.\n\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec delete_environment_secret(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_environment_secret(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_environment_secret_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_environment_secret_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_environment_secret_partition_spec)

    %{
      id: "actions/delete-environment-secret",
      args: params,
      call: {__MODULE__, :delete_environment_secret},
      opts: opts,
      method: :delete,
      path_template:
        "/repos/{owner}/{repo}/environments/{environment_name}/secrets/{secret_name}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :delete_environment_secret],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_environment_variable_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"name", :name},
      {"environment_name", :environment_name}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete an environment variable\n\nDeletes an environment variable using the variable name.\n\nAuthenticated users must have collaborator access to a repository to create, update, or read variables.\n\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec delete_environment_variable(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_environment_variable(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_environment_variable_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_environment_variable_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_environment_variable_partition_spec)

    %{
      id: "actions/delete-environment-variable",
      args: params,
      call: {__MODULE__, :delete_environment_variable},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/environments/{environment_name}/variables/{name}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :delete_environment_variable],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_hosted_runner_for_org_partition_spec %{
    path: [{"org", :org}, {"hosted_runner_id", :hosted_runner_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a GitHub-hosted runner for an organization\n\nDeletes a GitHub-hosted runner for an organization."
  @spec delete_hosted_runner_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_hosted_runner_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_hosted_runner_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_hosted_runner_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_hosted_runner_for_org_partition_spec)

    %{
      id: "actions/delete-hosted-runner-for-org",
      args: params,
      call: {__MODULE__, :delete_hosted_runner_for_org},
      opts: opts,
      method: :delete,
      path_template: "/orgs/{org}/actions/hosted-runners/{hosted_runner_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :delete_hosted_runner_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_org_secret_partition_spec %{
    path: [{"org", :org}, {"secret_name", :secret_name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete an organization secret\n\nDeletes a secret in an organization using the secret name.\n\nAuthenticated users must have collaborator access to a repository to create, update, or read secrets.\n\nOAuth tokens and personal access tokens (classic) need the`admin:org` scope to use this endpoint. If the repository is private, OAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec delete_org_secret(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_org_secret(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_org_secret_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_org_secret_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_org_secret_partition_spec)

    %{
      id: "actions/delete-org-secret",
      args: params,
      call: {__MODULE__, :delete_org_secret},
      opts: opts,
      method: :delete,
      path_template: "/orgs/{org}/actions/secrets/{secret_name}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :delete_org_secret],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_org_variable_partition_spec %{
    path: [{"org", :org}, {"name", :name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete an organization variable\n\nDeletes an organization variable using the variable name.\n\nAuthenticated users must have collaborator access to a repository to create, update, or read variables.\n\nOAuth tokens and personal access tokens (classic) need the`admin:org` scope to use this endpoint. If the repository is private, OAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec delete_org_variable(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_org_variable(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_org_variable_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_org_variable_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_org_variable_partition_spec)

    %{
      id: "actions/delete-org-variable",
      args: params,
      call: {__MODULE__, :delete_org_variable},
      opts: opts,
      method: :delete,
      path_template: "/orgs/{org}/actions/variables/{name}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :delete_org_variable],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_repo_secret_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"secret_name", :secret_name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a repository secret\n\nDeletes a secret in a repository using the secret name.\n\nAuthenticated users must have collaborator access to a repository to create, update, or read secrets.\n\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec delete_repo_secret(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_repo_secret(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_repo_secret_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_repo_secret_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_repo_secret_partition_spec)

    %{
      id: "actions/delete-repo-secret",
      args: params,
      call: {__MODULE__, :delete_repo_secret},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/actions/secrets/{secret_name}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :delete_repo_secret],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_repo_variable_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"name", :name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a repository variable\n\nDeletes a repository variable using the variable name.\n\nAuthenticated users must have collaborator access to a repository to create, update, or read variables.\n\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec delete_repo_variable(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_repo_variable(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_repo_variable_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_repo_variable_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_repo_variable_partition_spec)

    %{
      id: "actions/delete-repo-variable",
      args: params,
      call: {__MODULE__, :delete_repo_variable},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/actions/variables/{name}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :delete_repo_variable],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_self_hosted_runner_from_org_partition_spec %{
    path: [{"org", :org}, {"runner_id", :runner_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a self-hosted runner from an organization\n\nForces the removal of a self-hosted runner from an organization. You can use this endpoint to completely remove the runner when the machine you were using no longer exists.\n\nAuthenticated users must have admin access to the organization to use this endpoint.\n\nOAuth tokens and personal access tokens (classic) need the`admin:org` scope to use this endpoint. If the repository is private, OAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec delete_self_hosted_runner_from_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def delete_self_hosted_runner_from_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_self_hosted_runner_from_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_self_hosted_runner_from_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @delete_self_hosted_runner_from_org_partition_spec)

    %{
      id: "actions/delete-self-hosted-runner-from-org",
      args: params,
      call: {__MODULE__, :delete_self_hosted_runner_from_org},
      opts: opts,
      method: :delete,
      path_template: "/orgs/{org}/actions/runners/{runner_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :delete_self_hosted_runner_from_org],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_self_hosted_runner_from_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"runner_id", :runner_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a self-hosted runner from a repository\n\nForces the removal of a self-hosted runner from a repository. You can use this endpoint to completely remove the runner when the machine you were using no longer exists.\n\nAuthenticated users must have admin access to the repository to use this endpoint.\n\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec delete_self_hosted_runner_from_repo(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def delete_self_hosted_runner_from_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_self_hosted_runner_from_repo_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_self_hosted_runner_from_repo_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @delete_self_hosted_runner_from_repo_partition_spec)

    %{
      id: "actions/delete-self-hosted-runner-from-repo",
      args: params,
      call: {__MODULE__, :delete_self_hosted_runner_from_repo},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/actions/runners/{runner_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :delete_self_hosted_runner_from_repo],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_self_hosted_runner_group_from_org_partition_spec %{
    path: [{"org", :org}, {"runner_group_id", :runner_group_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a self-hosted runner group from an organization\n\nDeletes a self-hosted runner group for an organization.\n\nOAuth tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec delete_self_hosted_runner_group_from_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def delete_self_hosted_runner_group_from_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_self_hosted_runner_group_from_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_self_hosted_runner_group_from_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @delete_self_hosted_runner_group_from_org_partition_spec)

    %{
      id: "actions/delete-self-hosted-runner-group-from-org",
      args: params,
      call: {__MODULE__, :delete_self_hosted_runner_group_from_org},
      opts: opts,
      method: :delete,
      path_template: "/orgs/{org}/actions/runner-groups/{runner_group_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :delete_self_hosted_runner_group_from_org],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_workflow_run_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a workflow run\n\nDeletes a specific workflow run.\n\nAnyone with write access to the repository can use this endpoint.\n\nIf the repository is private, OAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec delete_workflow_run(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_workflow_run(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_workflow_run_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_workflow_run_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_workflow_run_partition_spec)

    %{
      id: "actions/delete-workflow-run",
      args: params,
      call: {__MODULE__, :delete_workflow_run},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :delete_workflow_run],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_workflow_run_logs_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete workflow run logs\n\nDeletes all logs for a workflow run.\n\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec delete_workflow_run_logs(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_workflow_run_logs(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_workflow_run_logs_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_workflow_run_logs_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_workflow_run_logs_partition_spec)

    %{
      id: "actions/delete-workflow-run-logs",
      args: params,
      call: {__MODULE__, :delete_workflow_run_logs},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/logs",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :delete_workflow_run_logs],
      timeout: nil,
      pagination: nil
    }
  end

  @disable_selected_repository_github_actions_organization_partition_spec %{
    path: [{"org", :org}, {"repository_id", :repository_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Disable a selected repository for GitHub Actions in an organization\n\nRemoves a repository from the list of selected repositories that are enabled for GitHub Actions in an organization. To use this endpoint, the organization permission policy for `enabled_repositories` must be configured to `selected`. For more information, see \"[Set GitHub Actions permissions for an organization](#set-github-actions-permissions-for-an-organization).\"\n\nOAuth tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec disable_selected_repository_github_actions_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def disable_selected_repository_github_actions_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_disable_selected_repository_github_actions_organization_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_disable_selected_repository_github_actions_organization_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @disable_selected_repository_github_actions_organization_partition_spec
      )

    %{
      id: "actions/disable-selected-repository-github-actions-organization",
      args: params,
      call: {__MODULE__, :disable_selected_repository_github_actions_organization},
      opts: opts,
      method: :delete,
      path_template: "/orgs/{org}/actions/permissions/repositories/{repository_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :disable_selected_repository_github_actions_organization],
      timeout: nil,
      pagination: nil
    }
  end

  @disable_selected_repository_self_hosted_runners_organization_partition_spec %{
    path: [{"org", :org}, {"repository_id", :repository_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove a repository from the list of repositories allowed to use self-hosted runners in an organization\n\nRemoves a repository from the list of repositories that are allowed to use self-hosted runners in an organization.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope or the \"Actions policies\" fine-grained permission to use this endpoint."
  @spec disable_selected_repository_self_hosted_runners_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def disable_selected_repository_self_hosted_runners_organization(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_disable_selected_repository_self_hosted_runners_organization_request(
        client,
        params,
        opts
      )

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_disable_selected_repository_self_hosted_runners_organization_request(
         client,
         params,
         opts
       )
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @disable_selected_repository_self_hosted_runners_organization_partition_spec
      )

    %{
      id: "actions/disable-selected-repository-self-hosted-runners-organization",
      args: params,
      call: {__MODULE__, :disable_selected_repository_self_hosted_runners_organization},
      opts: opts,
      method: :delete,
      path_template:
        "/orgs/{org}/actions/permissions/self-hosted-runners/repositories/{repository_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [
        :github_ex,
        :actions,
        :disable_selected_repository_self_hosted_runners_organization
      ],
      timeout: nil,
      pagination: nil
    }
  end

  @disable_workflow_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"workflow_id", :workflow_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Disable a workflow\n\nDisables a workflow and sets the `state` of the workflow to `disabled_manually`. You can replace `workflow_id` with the workflow file name. For example, you could use `main.yaml`.\n\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec disable_workflow(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def disable_workflow(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_disable_workflow_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_disable_workflow_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @disable_workflow_partition_spec)

    %{
      id: "actions/disable-workflow",
      args: params,
      call: {__MODULE__, :disable_workflow},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/actions/workflows/{workflow_id}/disable",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :disable_workflow],
      timeout: nil,
      pagination: nil
    }
  end

  @download_artifact_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"artifact_id", :artifact_id},
      {"archive_format", :archive_format}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Download an artifact\n\nGets a redirect URL to download an archive for a repository. This URL expires after 1 minute. Look for `Location:` in\nthe response header to find the URL for the download. The `:archive_format` must be `zip`.\n\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec download_artifact(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def download_artifact(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_download_artifact_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_download_artifact_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @download_artifact_partition_spec)

    %{
      id: "actions/download-artifact",
      args: params,
      call: {__MODULE__, :download_artifact},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/artifacts/{artifact_id}/{archive_format}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :download_artifact],
      timeout: nil,
      pagination: nil
    }
  end

  @download_job_logs_for_workflow_run_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"job_id", :job_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Download job logs for a workflow run\n\nGets a redirect URL to download a plain text file of logs for a workflow job. This link expires after 1 minute. Look\nfor `Location:` in the response header to find the URL for the download.\n\nAnyone with read access to the repository can use this endpoint.\n\nIf the repository is private, OAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec download_job_logs_for_workflow_run(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def download_job_logs_for_workflow_run(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_download_job_logs_for_workflow_run_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_download_job_logs_for_workflow_run_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @download_job_logs_for_workflow_run_partition_spec)

    %{
      id: "actions/download-job-logs-for-workflow-run",
      args: params,
      call: {__MODULE__, :download_job_logs_for_workflow_run},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/jobs/{job_id}/logs",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :download_job_logs_for_workflow_run],
      timeout: nil,
      pagination: nil
    }
  end

  @download_workflow_run_attempt_logs_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"run_id", :run_id},
      {"attempt_number", :attempt_number}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Download workflow run attempt logs\n\nGets a redirect URL to download an archive of log files for a specific workflow run attempt. This link expires after\n1 minute. Look for `Location:` in the response header to find the URL for the download.\n\nAnyone with read access to the repository can use this endpoint.\n\nIf the repository is private, OAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec download_workflow_run_attempt_logs(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def download_workflow_run_attempt_logs(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_download_workflow_run_attempt_logs_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_download_workflow_run_attempt_logs_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @download_workflow_run_attempt_logs_partition_spec)

    %{
      id: "actions/download-workflow-run-attempt-logs",
      args: params,
      call: {__MODULE__, :download_workflow_run_attempt_logs},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/attempts/{attempt_number}/logs",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :download_workflow_run_attempt_logs],
      timeout: nil,
      pagination: nil
    }
  end

  @download_workflow_run_logs_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Download workflow run logs\n\nGets a redirect URL to download an archive of log files for a workflow run. This link expires after 1 minute. Look for\n`Location:` in the response header to find the URL for the download.\n\nAnyone with read access to the repository can use this endpoint.\n\nIf the repository is private, OAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec download_workflow_run_logs(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def download_workflow_run_logs(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_download_workflow_run_logs_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_download_workflow_run_logs_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @download_workflow_run_logs_partition_spec)

    %{
      id: "actions/download-workflow-run-logs",
      args: params,
      call: {__MODULE__, :download_workflow_run_logs},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/logs",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :download_workflow_run_logs],
      timeout: nil,
      pagination: nil
    }
  end

  @enable_selected_repository_github_actions_organization_partition_spec %{
    path: [{"org", :org}, {"repository_id", :repository_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Enable a selected repository for GitHub Actions in an organization\n\nAdds a repository to the list of selected repositories that are enabled for GitHub Actions in an organization. To use this endpoint, the organization permission policy for `enabled_repositories` must be must be configured to `selected`. For more information, see \"[Set GitHub Actions permissions for an organization](#set-github-actions-permissions-for-an-organization).\"\n\nOAuth tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec enable_selected_repository_github_actions_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def enable_selected_repository_github_actions_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_enable_selected_repository_github_actions_organization_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_enable_selected_repository_github_actions_organization_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @enable_selected_repository_github_actions_organization_partition_spec
      )

    %{
      id: "actions/enable-selected-repository-github-actions-organization",
      args: params,
      call: {__MODULE__, :enable_selected_repository_github_actions_organization},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/actions/permissions/repositories/{repository_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :enable_selected_repository_github_actions_organization],
      timeout: nil,
      pagination: nil
    }
  end

  @enable_selected_repository_self_hosted_runners_organization_partition_spec %{
    path: [{"org", :org}, {"repository_id", :repository_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Add a repository to the list of repositories allowed to use self-hosted runners in an organization\n\nAdds a repository to the list of repositories that are allowed to use self-hosted runners in an organization.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope or the \"Actions policies\" fine-grained permission to use this endpoint."
  @spec enable_selected_repository_self_hosted_runners_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def enable_selected_repository_self_hosted_runners_organization(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_enable_selected_repository_self_hosted_runners_organization_request(
        client,
        params,
        opts
      )

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_enable_selected_repository_self_hosted_runners_organization_request(
         client,
         params,
         opts
       )
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @enable_selected_repository_self_hosted_runners_organization_partition_spec
      )

    %{
      id: "actions/enable-selected-repository-self-hosted-runners-organization",
      args: params,
      call: {__MODULE__, :enable_selected_repository_self_hosted_runners_organization},
      opts: opts,
      method: :put,
      path_template:
        "/orgs/{org}/actions/permissions/self-hosted-runners/repositories/{repository_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [
        :github_ex,
        :actions,
        :enable_selected_repository_self_hosted_runners_organization
      ],
      timeout: nil,
      pagination: nil
    }
  end

  @enable_workflow_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"workflow_id", :workflow_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Enable a workflow\n\nEnables a workflow and sets the `state` of the workflow to `active`. You can replace `workflow_id` with the workflow file name. For example, you could use `main.yaml`.\n\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec enable_workflow(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def enable_workflow(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_enable_workflow_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_enable_workflow_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @enable_workflow_partition_spec)

    %{
      id: "actions/enable-workflow",
      args: params,
      call: {__MODULE__, :enable_workflow},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/actions/workflows/{workflow_id}/enable",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :enable_workflow],
      timeout: nil,
      pagination: nil
    }
  end

  @force_cancel_workflow_run_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Force cancel a workflow run\n\nCancels a workflow run and bypasses conditions that would otherwise cause a workflow execution to continue, such as an `always()` condition on a job.\nYou should only use this endpoint to cancel a workflow run when the workflow run is not responding to [`POST /repos/{owner}/{repo}/actions/runs/{run_id}/cancel`](https://docs.github.com/rest/actions/workflow-runs#cancel-a-workflow-run).\n\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec force_cancel_workflow_run(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def force_cancel_workflow_run(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_force_cancel_workflow_run_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_force_cancel_workflow_run_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @force_cancel_workflow_run_partition_spec)

    %{
      id: "actions/force-cancel-workflow-run",
      args: params,
      call: {__MODULE__, :force_cancel_workflow_run},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/force-cancel",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :force_cancel_workflow_run],
      timeout: nil,
      pagination: nil
    }
  end

  @generate_runner_jitconfig_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create configuration for a just-in-time runner for an organization\n\nGenerates a configuration that can be passed to the runner application at startup.\n\nThe authenticated user must have admin access to the organization.\n\nOAuth tokens and personal access tokens (classic) need the`admin:org` scope to use this endpoint. If the repository is private, OAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec generate_runner_jitconfig_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def generate_runner_jitconfig_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_generate_runner_jitconfig_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_generate_runner_jitconfig_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @generate_runner_jitconfig_for_org_partition_spec)

    %{
      id: "actions/generate-runner-jitconfig-for-org",
      args: params,
      call: {__MODULE__, :generate_runner_jitconfig_for_org},
      opts: opts,
      method: :post,
      path_template: "/orgs/{org}/actions/runners/generate-jitconfig",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :generate_runner_jitconfig_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @generate_runner_jitconfig_for_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create configuration for a just-in-time runner for a repository\n\nGenerates a configuration that can be passed to the runner application at startup.\n\nThe authenticated user must have admin access to the repository.\n\nOAuth tokens and personal access tokens (classic) need the`repo` scope to use this endpoint."
  @spec generate_runner_jitconfig_for_repo(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def generate_runner_jitconfig_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_generate_runner_jitconfig_for_repo_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_generate_runner_jitconfig_for_repo_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @generate_runner_jitconfig_for_repo_partition_spec)

    %{
      id: "actions/generate-runner-jitconfig-for-repo",
      args: params,
      call: {__MODULE__, :generate_runner_jitconfig_for_repo},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/actions/runners/generate-jitconfig",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :generate_runner_jitconfig_for_repo],
      timeout: nil,
      pagination: nil
    }
  end

  @get_actions_cache_list_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"per_page", :per_page},
      {"page", :page},
      {"ref", :ref},
      {"key", :key},
      {"sort", :sort},
      {"direction", :direction}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List GitHub Actions caches for a repository\n\nLists the GitHub Actions caches for a repository.\n\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_actions_cache_list(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_actions_cache_list(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_actions_cache_list_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_get_actions_cache_list(term(), map(), keyword()) :: Enumerable.t()
  def stream_get_actions_cache_list(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_get_actions_cache_list_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_get_actions_cache_list_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_actions_cache_list_partition_spec)

    %{
      id: "actions/get-actions-cache-list",
      args: params,
      call: {__MODULE__, :get_actions_cache_list},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/caches",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_actions_cache_list],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["actions_caches"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @get_actions_cache_retention_limit_for_enterprise_partition_spec %{
    path: [{"enterprise", :enterprise}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get GitHub Actions cache retention limit for an enterprise\n\nGets GitHub Actions cache retention limit for an enterprise. All organizations and repositories under this\nenterprise may not set a higher cache retention limit.\n\nOAuth tokens and personal access tokens (classic) need the `admin:enterprise` scope to use this endpoint."
  @spec get_actions_cache_retention_limit_for_enterprise(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_actions_cache_retention_limit_for_enterprise(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_actions_cache_retention_limit_for_enterprise_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_actions_cache_retention_limit_for_enterprise_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @get_actions_cache_retention_limit_for_enterprise_partition_spec
      )

    %{
      id: "actions/get-actions-cache-retention-limit-for-enterprise",
      args: params,
      call: {__MODULE__, :get_actions_cache_retention_limit_for_enterprise},
      opts: opts,
      method: :get,
      path_template: "/enterprises/{enterprise}/actions/cache/retention-limit",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_actions_cache_retention_limit_for_enterprise],
      timeout: nil,
      pagination: nil
    }
  end

  @get_actions_cache_retention_limit_for_organization_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get GitHub Actions cache retention limit for an organization\n\nGets GitHub Actions cache retention limit for an organization. All repositories under this\norganization may not set a higher cache retention limit.\n\nOAuth tokens and personal access tokens (classic) need the `admin:organization` scope to use this endpoint."
  @spec get_actions_cache_retention_limit_for_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_actions_cache_retention_limit_for_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_get_actions_cache_retention_limit_for_organization_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_actions_cache_retention_limit_for_organization_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @get_actions_cache_retention_limit_for_organization_partition_spec
      )

    %{
      id: "actions/get-actions-cache-retention-limit-for-organization",
      args: params,
      call: {__MODULE__, :get_actions_cache_retention_limit_for_organization},
      opts: opts,
      method: :get,
      path_template: "/organizations/{org}/actions/cache/retention-limit",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_actions_cache_retention_limit_for_organization],
      timeout: nil,
      pagination: nil
    }
  end

  @get_actions_cache_retention_limit_for_repository_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get GitHub Actions cache retention limit for a repository\n\nGets GitHub Actions cache retention limit for a repository. This determines how long caches will be retained for, if\nnot manually removed or evicted due to size constraints.\n\nOAuth tokens and personal access tokens (classic) need the `admin:repository` scope to use this endpoint."
  @spec get_actions_cache_retention_limit_for_repository(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_actions_cache_retention_limit_for_repository(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_actions_cache_retention_limit_for_repository_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_actions_cache_retention_limit_for_repository_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @get_actions_cache_retention_limit_for_repository_partition_spec
      )

    %{
      id: "actions/get-actions-cache-retention-limit-for-repository",
      args: params,
      call: {__MODULE__, :get_actions_cache_retention_limit_for_repository},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/cache/retention-limit",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_actions_cache_retention_limit_for_repository],
      timeout: nil,
      pagination: nil
    }
  end

  @get_actions_cache_storage_limit_for_enterprise_partition_spec %{
    path: [{"enterprise", :enterprise}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get GitHub Actions cache storage limit for an enterprise\n\nGets GitHub Actions cache storage limit for an enterprise. All organizations and repositories under this\nenterprise may not set a higher cache storage limit.\n\nOAuth tokens and personal access tokens (classic) need the `admin:enterprise` scope to use this endpoint."
  @spec get_actions_cache_storage_limit_for_enterprise(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_actions_cache_storage_limit_for_enterprise(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_actions_cache_storage_limit_for_enterprise_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_actions_cache_storage_limit_for_enterprise_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @get_actions_cache_storage_limit_for_enterprise_partition_spec
      )

    %{
      id: "actions/get-actions-cache-storage-limit-for-enterprise",
      args: params,
      call: {__MODULE__, :get_actions_cache_storage_limit_for_enterprise},
      opts: opts,
      method: :get,
      path_template: "/enterprises/{enterprise}/actions/cache/storage-limit",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_actions_cache_storage_limit_for_enterprise],
      timeout: nil,
      pagination: nil
    }
  end

  @get_actions_cache_storage_limit_for_organization_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get GitHub Actions cache storage limit for an organization\n\nGets GitHub Actions cache storage limit for an organization. All repositories under this\norganization may not set a higher cache storage limit.\n\nOAuth tokens and personal access tokens (classic) need the `admin:organization` scope to use this endpoint."
  @spec get_actions_cache_storage_limit_for_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_actions_cache_storage_limit_for_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_actions_cache_storage_limit_for_organization_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_actions_cache_storage_limit_for_organization_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @get_actions_cache_storage_limit_for_organization_partition_spec
      )

    %{
      id: "actions/get-actions-cache-storage-limit-for-organization",
      args: params,
      call: {__MODULE__, :get_actions_cache_storage_limit_for_organization},
      opts: opts,
      method: :get,
      path_template: "/organizations/{org}/actions/cache/storage-limit",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_actions_cache_storage_limit_for_organization],
      timeout: nil,
      pagination: nil
    }
  end

  @get_actions_cache_storage_limit_for_repository_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get GitHub Actions cache storage limit for a repository\n\nGets GitHub Actions cache storage limit for a repository. This determines the maximum size of caches that can be\nstored before eviction occurs.\n\nOAuth tokens and personal access tokens (classic) need the `admin:repository` scope to use this endpoint."
  @spec get_actions_cache_storage_limit_for_repository(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_actions_cache_storage_limit_for_repository(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_actions_cache_storage_limit_for_repository_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_actions_cache_storage_limit_for_repository_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @get_actions_cache_storage_limit_for_repository_partition_spec
      )

    %{
      id: "actions/get-actions-cache-storage-limit-for-repository",
      args: params,
      call: {__MODULE__, :get_actions_cache_storage_limit_for_repository},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/cache/storage-limit",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_actions_cache_storage_limit_for_repository],
      timeout: nil,
      pagination: nil
    }
  end

  @get_actions_cache_usage_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get GitHub Actions cache usage for a repository\n\nGets GitHub Actions cache usage for a repository.\nThe data fetched using this API is refreshed approximately every 5 minutes, so values returned from this endpoint may take at least 5 minutes to get updated.\n\nAnyone with read access to the repository can use this endpoint.\n\nIf the repository is private, OAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_actions_cache_usage(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_actions_cache_usage(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_actions_cache_usage_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_actions_cache_usage_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_actions_cache_usage_partition_spec)

    %{
      id: "actions/get-actions-cache-usage",
      args: params,
      call: {__MODULE__, :get_actions_cache_usage},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/cache/usage",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_actions_cache_usage],
      timeout: nil,
      pagination: nil
    }
  end

  @get_actions_cache_usage_by_repo_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List repositories with GitHub Actions cache usage for an organization\n\nLists repositories and their GitHub Actions cache usage for an organization.\nThe data fetched using this API is refreshed approximately every 5 minutes, so values returned from this endpoint may take at least 5 minutes to get updated.\n\nOAuth tokens and personal access tokens (classic) need the `read:org` scope to use this endpoint."
  @spec get_actions_cache_usage_by_repo_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_actions_cache_usage_by_repo_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_actions_cache_usage_by_repo_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_get_actions_cache_usage_by_repo_for_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_get_actions_cache_usage_by_repo_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_get_actions_cache_usage_by_repo_for_org_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_get_actions_cache_usage_by_repo_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @get_actions_cache_usage_by_repo_for_org_partition_spec)

    %{
      id: "actions/get-actions-cache-usage-by-repo-for-org",
      args: params,
      call: {__MODULE__, :get_actions_cache_usage_by_repo_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/cache/usage-by-repository",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_actions_cache_usage_by_repo_for_org],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["repository_cache_usages"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @get_actions_cache_usage_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get GitHub Actions cache usage for an organization\n\nGets the total GitHub Actions cache usage for an organization.\nThe data fetched using this API is refreshed approximately every 5 minutes, so values returned from this endpoint may take at least 5 minutes to get updated.\n\nOAuth tokens and personal access tokens (classic) need the `read:org` scope to use this endpoint."
  @spec get_actions_cache_usage_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_actions_cache_usage_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_actions_cache_usage_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_actions_cache_usage_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_actions_cache_usage_for_org_partition_spec)

    %{
      id: "actions/get-actions-cache-usage-for-org",
      args: params,
      call: {__MODULE__, :get_actions_cache_usage_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/cache/usage",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_actions_cache_usage_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @get_allowed_actions_organization_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get allowed actions and reusable workflows for an organization\n\nGets the selected actions and reusable workflows that are allowed in an organization. To use this endpoint, the organization permission policy for `allowed_actions` must be configured to `selected`. For more information, see \"[Set GitHub Actions permissions for an organization](#set-github-actions-permissions-for-an-organization).\"\n\nOAuth tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec get_allowed_actions_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_allowed_actions_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_allowed_actions_organization_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_allowed_actions_organization_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_allowed_actions_organization_partition_spec)

    %{
      id: "actions/get-allowed-actions-organization",
      args: params,
      call: {__MODULE__, :get_allowed_actions_organization},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/permissions/selected-actions",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_allowed_actions_organization],
      timeout: nil,
      pagination: nil
    }
  end

  @get_allowed_actions_repository_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get allowed actions and reusable workflows for a repository\n\nGets the settings for selected actions and reusable workflows that are allowed in a repository. To use this endpoint, the repository policy for `allowed_actions` must be configured to `selected`. For more information, see \"[Set GitHub Actions permissions for a repository](#set-github-actions-permissions-for-a-repository).\"\n\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_allowed_actions_repository(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_allowed_actions_repository(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_allowed_actions_repository_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_allowed_actions_repository_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_allowed_actions_repository_partition_spec)

    %{
      id: "actions/get-allowed-actions-repository",
      args: params,
      call: {__MODULE__, :get_allowed_actions_repository},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/permissions/selected-actions",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_allowed_actions_repository],
      timeout: nil,
      pagination: nil
    }
  end

  @get_artifact_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"artifact_id", :artifact_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get an artifact\n\nGets a specific artifact for a workflow run.\n\nAnyone with read access to the repository can use this endpoint.\n\nIf the repository is private, OAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_artifact(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_artifact(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_artifact_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_artifact_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_artifact_partition_spec)

    %{
      id: "actions/get-artifact",
      args: params,
      call: {__MODULE__, :get_artifact},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/artifacts/{artifact_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_artifact],
      timeout: nil,
      pagination: nil
    }
  end

  @get_artifact_and_log_retention_settings_organization_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get artifact and log retention settings for an organization\n\nGets artifact and log retention settings for an organization.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope or the \"Actions policies\" fine-grained permission to use this endpoint."
  @spec get_artifact_and_log_retention_settings_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_artifact_and_log_retention_settings_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_get_artifact_and_log_retention_settings_organization_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_artifact_and_log_retention_settings_organization_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @get_artifact_and_log_retention_settings_organization_partition_spec
      )

    %{
      id: "actions/get-artifact-and-log-retention-settings-organization",
      args: params,
      call: {__MODULE__, :get_artifact_and_log_retention_settings_organization},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/permissions/artifact-and-log-retention",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_artifact_and_log_retention_settings_organization],
      timeout: nil,
      pagination: nil
    }
  end

  @get_artifact_and_log_retention_settings_repository_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get artifact and log retention settings for a repository\n\nGets artifact and log retention settings for a repository.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_artifact_and_log_retention_settings_repository(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_artifact_and_log_retention_settings_repository(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_get_artifact_and_log_retention_settings_repository_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_artifact_and_log_retention_settings_repository_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @get_artifact_and_log_retention_settings_repository_partition_spec
      )

    %{
      id: "actions/get-artifact-and-log-retention-settings-repository",
      args: params,
      call: {__MODULE__, :get_artifact_and_log_retention_settings_repository},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/permissions/artifact-and-log-retention",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_artifact_and_log_retention_settings_repository],
      timeout: nil,
      pagination: nil
    }
  end

  @get_custom_image_for_org_partition_spec %{
    path: [{"org", :org}, {"image_definition_id", :image_definition_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a custom image definition for GitHub Actions Hosted Runners\n\nGet a custom image definition for GitHub Actions Hosted Runners.\n\nOAuth tokens and personal access tokens (classic) need the `manage_runners:org` scope to use this endpoint."
  @spec get_custom_image_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_custom_image_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_custom_image_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_custom_image_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_custom_image_for_org_partition_spec)

    %{
      id: "actions/get-custom-image-for-org",
      args: params,
      call: {__MODULE__, :get_custom_image_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/hosted-runners/images/custom/{image_definition_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_custom_image_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @get_custom_image_version_for_org_partition_spec %{
    path: [
      {"org", :org},
      {"image_definition_id", :image_definition_id},
      {"version", :version}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get an image version of a custom image for GitHub Actions Hosted Runners\n\nGet an image version of a custom image for GitHub Actions Hosted Runners.\n\nOAuth tokens and personal access tokens (classic) need the `manage_runners:org` scope to use this endpoint."
  @spec get_custom_image_version_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_custom_image_version_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_custom_image_version_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_custom_image_version_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_custom_image_version_for_org_partition_spec)

    %{
      id: "actions/get-custom-image-version-for-org",
      args: params,
      call: {__MODULE__, :get_custom_image_version_for_org},
      opts: opts,
      method: :get,
      path_template:
        "/orgs/{org}/actions/hosted-runners/images/custom/{image_definition_id}/versions/{version}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_custom_image_version_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @get_custom_oidc_sub_claim_for_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get the customization template for an OIDC subject claim for a repository\n\nGets the customization template for an OpenID Connect (OIDC) subject claim.\n\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_custom_oidc_sub_claim_for_repo(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_custom_oidc_sub_claim_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_custom_oidc_sub_claim_for_repo_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_custom_oidc_sub_claim_for_repo_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @get_custom_oidc_sub_claim_for_repo_partition_spec)

    %{
      id: "actions/get-custom-oidc-sub-claim-for-repo",
      args: params,
      call: {__MODULE__, :get_custom_oidc_sub_claim_for_repo},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/oidc/customization/sub",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_custom_oidc_sub_claim_for_repo],
      timeout: nil,
      pagination: nil
    }
  end

  @get_environment_public_key_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"environment_name", :environment_name}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get an environment public key\n\nGet the public key for an environment, which you need to encrypt environment\nsecrets. You need to encrypt a secret before you can create or update secrets.\n\nAnyone with read access to the repository can use this endpoint.\n\nIf the repository is private, OAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_environment_public_key(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_environment_public_key(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_environment_public_key_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_environment_public_key_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_environment_public_key_partition_spec)

    %{
      id: "actions/get-environment-public-key",
      args: params,
      call: {__MODULE__, :get_environment_public_key},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/environments/{environment_name}/secrets/public-key",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_environment_public_key],
      timeout: nil,
      pagination: nil
    }
  end

  @get_environment_secret_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"environment_name", :environment_name},
      {"secret_name", :secret_name}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get an environment secret\n\nGets a single environment secret without revealing its encrypted value.\n\nAuthenticated users must have collaborator access to a repository to create, update, or read secrets.\n\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_environment_secret(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_environment_secret(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_environment_secret_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_environment_secret_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_environment_secret_partition_spec)

    %{
      id: "actions/get-environment-secret",
      args: params,
      call: {__MODULE__, :get_environment_secret},
      opts: opts,
      method: :get,
      path_template:
        "/repos/{owner}/{repo}/environments/{environment_name}/secrets/{secret_name}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_environment_secret],
      timeout: nil,
      pagination: nil
    }
  end

  @get_environment_variable_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"environment_name", :environment_name},
      {"name", :name}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get an environment variable\n\nGets a specific variable in an environment.\n\nAuthenticated users must have collaborator access to a repository to create, update, or read variables.\n\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_environment_variable(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_environment_variable(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_environment_variable_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_environment_variable_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_environment_variable_partition_spec)

    %{
      id: "actions/get-environment-variable",
      args: params,
      call: {__MODULE__, :get_environment_variable},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/environments/{environment_name}/variables/{name}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_environment_variable],
      timeout: nil,
      pagination: nil
    }
  end

  @get_fork_pr_contributor_approval_permissions_organization_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get fork PR contributor approval permissions for an organization\n\nGets the fork PR contributor approval policy for an organization.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope or the \"Actions policies\" fine-grained permission to use this endpoint."
  @spec get_fork_pr_contributor_approval_permissions_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_fork_pr_contributor_approval_permissions_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_get_fork_pr_contributor_approval_permissions_organization_request(
        client,
        params,
        opts
      )

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_fork_pr_contributor_approval_permissions_organization_request(
         client,
         params,
         opts
       )
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @get_fork_pr_contributor_approval_permissions_organization_partition_spec
      )

    %{
      id: "actions/get-fork-pr-contributor-approval-permissions-organization",
      args: params,
      call: {__MODULE__, :get_fork_pr_contributor_approval_permissions_organization},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/permissions/fork-pr-contributor-approval",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [
        :github_ex,
        :actions,
        :get_fork_pr_contributor_approval_permissions_organization
      ],
      timeout: nil,
      pagination: nil
    }
  end

  @get_fork_pr_contributor_approval_permissions_repository_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get fork PR contributor approval permissions for a repository\n\nGets the fork PR contributor approval policy for a repository.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_fork_pr_contributor_approval_permissions_repository(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_fork_pr_contributor_approval_permissions_repository(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_get_fork_pr_contributor_approval_permissions_repository_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_fork_pr_contributor_approval_permissions_repository_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @get_fork_pr_contributor_approval_permissions_repository_partition_spec
      )

    %{
      id: "actions/get-fork-pr-contributor-approval-permissions-repository",
      args: params,
      call: {__MODULE__, :get_fork_pr_contributor_approval_permissions_repository},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/permissions/fork-pr-contributor-approval",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_fork_pr_contributor_approval_permissions_repository],
      timeout: nil,
      pagination: nil
    }
  end

  @get_github_actions_default_workflow_permissions_organization_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get default workflow permissions for an organization\n\nGets the default workflow permissions granted to the `GITHUB_TOKEN` when running workflows in an organization,\nas well as whether GitHub Actions can submit approving pull request reviews. For more information, see\n\"[Setting the permissions of the GITHUB_TOKEN for your organization](https://docs.github.com/organizations/managing-organization-settings/disabling-or-limiting-github-actions-for-your-organization#setting-the-permissions-of-the-github_token-for-your-organization).\"\n\nOAuth tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec get_github_actions_default_workflow_permissions_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_github_actions_default_workflow_permissions_organization(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_get_github_actions_default_workflow_permissions_organization_request(
        client,
        params,
        opts
      )

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_github_actions_default_workflow_permissions_organization_request(
         client,
         params,
         opts
       )
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @get_github_actions_default_workflow_permissions_organization_partition_spec
      )

    %{
      id: "actions/get-github-actions-default-workflow-permissions-organization",
      args: params,
      call: {__MODULE__, :get_github_actions_default_workflow_permissions_organization},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/permissions/workflow",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [
        :github_ex,
        :actions,
        :get_github_actions_default_workflow_permissions_organization
      ],
      timeout: nil,
      pagination: nil
    }
  end

  @get_github_actions_default_workflow_permissions_repository_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get default workflow permissions for a repository\n\nGets the default workflow permissions granted to the `GITHUB_TOKEN` when running workflows in a repository,\nas well as if GitHub Actions can submit approving pull request reviews.\nFor more information, see \"[Setting the permissions of the GITHUB_TOKEN for your repository](https://docs.github.com/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-github-actions-settings-for-a-repository#setting-the-permissions-of-the-github_token-for-your-repository).\"\n\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_github_actions_default_workflow_permissions_repository(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_github_actions_default_workflow_permissions_repository(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_get_github_actions_default_workflow_permissions_repository_request(
        client,
        params,
        opts
      )

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_github_actions_default_workflow_permissions_repository_request(
         client,
         params,
         opts
       )
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @get_github_actions_default_workflow_permissions_repository_partition_spec
      )

    %{
      id: "actions/get-github-actions-default-workflow-permissions-repository",
      args: params,
      call: {__MODULE__, :get_github_actions_default_workflow_permissions_repository},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/permissions/workflow",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [
        :github_ex,
        :actions,
        :get_github_actions_default_workflow_permissions_repository
      ],
      timeout: nil,
      pagination: nil
    }
  end

  @get_github_actions_permissions_organization_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get GitHub Actions permissions for an organization\n\nGets the GitHub Actions permissions policy for repositories and allowed actions and reusable workflows in an organization.\n\nOAuth tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec get_github_actions_permissions_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_github_actions_permissions_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_github_actions_permissions_organization_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_github_actions_permissions_organization_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @get_github_actions_permissions_organization_partition_spec)

    %{
      id: "actions/get-github-actions-permissions-organization",
      args: params,
      call: {__MODULE__, :get_github_actions_permissions_organization},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/permissions",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_github_actions_permissions_organization],
      timeout: nil,
      pagination: nil
    }
  end

  @get_github_actions_permissions_repository_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get GitHub Actions permissions for a repository\n\nGets the GitHub Actions permissions policy for a repository, including whether GitHub Actions is enabled and the actions and reusable workflows allowed to run in the repository.\n\nOAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_github_actions_permissions_repository(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_github_actions_permissions_repository(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_github_actions_permissions_repository_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_github_actions_permissions_repository_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @get_github_actions_permissions_repository_partition_spec)

    %{
      id: "actions/get-github-actions-permissions-repository",
      args: params,
      call: {__MODULE__, :get_github_actions_permissions_repository},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/permissions",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_github_actions_permissions_repository],
      timeout: nil,
      pagination: nil
    }
  end

  @get_hosted_runner_for_org_partition_spec %{
    path: [{"org", :org}, {"hosted_runner_id", :hosted_runner_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a GitHub-hosted runner for an organization\n\nGets a GitHub-hosted runner configured in an organization.\n\nOAuth app tokens and personal access tokens (classic) need the `manage_runners:org` scope to use this endpoint."
  @spec get_hosted_runner_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_hosted_runner_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_hosted_runner_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_hosted_runner_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_hosted_runner_for_org_partition_spec)

    %{
      id: "actions/get-hosted-runner-for-org",
      args: params,
      call: {__MODULE__, :get_hosted_runner_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/hosted-runners/{hosted_runner_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_hosted_runner_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @get_hosted_runners_github_owned_images_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get GitHub-owned images for GitHub-hosted runners in an organization\n\nGet the list of GitHub-owned images available for GitHub-hosted runners for an organization."
  @spec get_hosted_runners_github_owned_images_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_hosted_runners_github_owned_images_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_hosted_runners_github_owned_images_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_hosted_runners_github_owned_images_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @get_hosted_runners_github_owned_images_for_org_partition_spec
      )

    %{
      id: "actions/get-hosted-runners-github-owned-images-for-org",
      args: params,
      call: {__MODULE__, :get_hosted_runners_github_owned_images_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/hosted-runners/images/github-owned",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_hosted_runners_github_owned_images_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @get_hosted_runners_limits_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get limits on GitHub-hosted runners for an organization\n\nGet the GitHub-hosted runners limits for an organization."
  @spec get_hosted_runners_limits_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_hosted_runners_limits_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_hosted_runners_limits_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_hosted_runners_limits_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_hosted_runners_limits_for_org_partition_spec)

    %{
      id: "actions/get-hosted-runners-limits-for-org",
      args: params,
      call: {__MODULE__, :get_hosted_runners_limits_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/hosted-runners/limits",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_hosted_runners_limits_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @get_hosted_runners_machine_specs_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get GitHub-hosted runners machine specs for an organization\n\nGet the list of machine specs available for GitHub-hosted runners for an organization."
  @spec get_hosted_runners_machine_specs_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_hosted_runners_machine_specs_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_hosted_runners_machine_specs_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_hosted_runners_machine_specs_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @get_hosted_runners_machine_specs_for_org_partition_spec)

    %{
      id: "actions/get-hosted-runners-machine-specs-for-org",
      args: params,
      call: {__MODULE__, :get_hosted_runners_machine_specs_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/hosted-runners/machine-sizes",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_hosted_runners_machine_specs_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @get_hosted_runners_partner_images_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get partner images for GitHub-hosted runners in an organization\n\nGet the list of partner images available for GitHub-hosted runners for an organization."
  @spec get_hosted_runners_partner_images_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_hosted_runners_partner_images_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_hosted_runners_partner_images_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_hosted_runners_partner_images_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @get_hosted_runners_partner_images_for_org_partition_spec)

    %{
      id: "actions/get-hosted-runners-partner-images-for-org",
      args: params,
      call: {__MODULE__, :get_hosted_runners_partner_images_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/hosted-runners/images/partner",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_hosted_runners_partner_images_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @get_hosted_runners_platforms_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get platforms for GitHub-hosted runners in an organization\n\nGet the list of platforms available for GitHub-hosted runners for an organization."
  @spec get_hosted_runners_platforms_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_hosted_runners_platforms_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_hosted_runners_platforms_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_hosted_runners_platforms_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @get_hosted_runners_platforms_for_org_partition_spec)

    %{
      id: "actions/get-hosted-runners-platforms-for-org",
      args: params,
      call: {__MODULE__, :get_hosted_runners_platforms_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/hosted-runners/platforms",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_hosted_runners_platforms_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @get_job_for_workflow_run_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"job_id", :job_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a job for a workflow run\n\nGets a specific job in a workflow run.\n\nAnyone with read access to the repository can use this endpoint.\n\nIf the repository is private, OAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_job_for_workflow_run(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_job_for_workflow_run(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_job_for_workflow_run_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_job_for_workflow_run_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_job_for_workflow_run_partition_spec)

    %{
      id: "actions/get-job-for-workflow-run",
      args: params,
      call: {__MODULE__, :get_job_for_workflow_run},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/jobs/{job_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_job_for_workflow_run],
      timeout: nil,
      pagination: nil
    }
  end

  @get_org_public_key_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get an organization public key\n\nGets your public key, which you need to encrypt secrets. You need to\nencrypt a secret before you can create or update secrets.\n\nThe authenticated user must have collaborator access to a repository to create, update, or read secrets.\n\nOAuth tokens and personal access tokens (classic) need the`admin:org` scope to use this endpoint. If the repository is private, OAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_org_public_key(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_org_public_key(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_org_public_key_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_org_public_key_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_org_public_key_partition_spec)

    %{
      id: "actions/get-org-public-key",
      args: params,
      call: {__MODULE__, :get_org_public_key},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/secrets/public-key",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_org_public_key],
      timeout: nil,
      pagination: nil
    }
  end

  @get_org_secret_partition_spec %{
    path: [{"org", :org}, {"secret_name", :secret_name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get an organization secret\n\nGets a single organization secret without revealing its encrypted value.\n\nThe authenticated user must have collaborator access to a repository to create, update, or read secrets\n\nOAuth tokens and personal access tokens (classic) need the`admin:org` scope to use this endpoint. If the repository is private, OAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_org_secret(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_org_secret(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_org_secret_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_org_secret_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_org_secret_partition_spec)

    %{
      id: "actions/get-org-secret",
      args: params,
      call: {__MODULE__, :get_org_secret},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/secrets/{secret_name}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_org_secret],
      timeout: nil,
      pagination: nil
    }
  end

  @get_org_variable_partition_spec %{
    path: [{"org", :org}, {"name", :name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get an organization variable\n\nGets a specific variable in an organization.\n\nThe authenticated user must have collaborator access to a repository to create, update, or read variables.\n\nOAuth tokens and personal access tokens (classic) need the`admin:org` scope to use this endpoint. If the repository is private, OAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_org_variable(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_org_variable(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_org_variable_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_org_variable_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_org_variable_partition_spec)

    %{
      id: "actions/get-org-variable",
      args: params,
      call: {__MODULE__, :get_org_variable},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/variables/{name}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_org_variable],
      timeout: nil,
      pagination: nil
    }
  end

  @get_pending_deployments_for_run_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get pending deployments for a workflow run\n\nGet all deployment environments for a workflow run that are waiting for protection rules to pass.\n\nAnyone with read access to the repository can use this endpoint.\n\nIf the repository is private, OAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_pending_deployments_for_run(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_pending_deployments_for_run(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_pending_deployments_for_run_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_pending_deployments_for_run_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_pending_deployments_for_run_partition_spec)

    %{
      id: "actions/get-pending-deployments-for-run",
      args: params,
      call: {__MODULE__, :get_pending_deployments_for_run},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/pending_deployments",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_pending_deployments_for_run],
      timeout: nil,
      pagination: nil
    }
  end

  @get_private_repo_fork_pr_workflows_settings_organization_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get private repo fork PR workflow settings for an organization\n\nGets the settings for whether workflows from fork pull requests can run on private repositories in an organization."
  @spec get_private_repo_fork_pr_workflows_settings_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_private_repo_fork_pr_workflows_settings_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_get_private_repo_fork_pr_workflows_settings_organization_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_private_repo_fork_pr_workflows_settings_organization_request(
         client,
         params,
         opts
       )
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @get_private_repo_fork_pr_workflows_settings_organization_partition_spec
      )

    %{
      id: "actions/get-private-repo-fork-pr-workflows-settings-organization",
      args: params,
      call: {__MODULE__, :get_private_repo_fork_pr_workflows_settings_organization},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/permissions/fork-pr-workflows-private-repos",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_private_repo_fork_pr_workflows_settings_organization],
      timeout: nil,
      pagination: nil
    }
  end

  @get_private_repo_fork_pr_workflows_settings_repository_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get private repo fork PR workflow settings for a repository\n\nGets the settings for whether workflows from fork pull requests can run on a private repository.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_private_repo_fork_pr_workflows_settings_repository(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_private_repo_fork_pr_workflows_settings_repository(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_get_private_repo_fork_pr_workflows_settings_repository_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_private_repo_fork_pr_workflows_settings_repository_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @get_private_repo_fork_pr_workflows_settings_repository_partition_spec
      )

    %{
      id: "actions/get-private-repo-fork-pr-workflows-settings-repository",
      args: params,
      call: {__MODULE__, :get_private_repo_fork_pr_workflows_settings_repository},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/permissions/fork-pr-workflows-private-repos",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_private_repo_fork_pr_workflows_settings_repository],
      timeout: nil,
      pagination: nil
    }
  end

  @get_repo_public_key_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a repository public key\n\nGets your public key, which you need to encrypt secrets. You need to\nencrypt a secret before you can create or update secrets.\n\nAnyone with read access to the repository can use this endpoint.\n\nIf the repository is private, OAuth tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_repo_public_key(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_repo_public_key(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_repo_public_key_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_repo_public_key_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_repo_public_key_partition_spec)

    %{
      id: "actions/get-repo-public-key",
      args: params,
      call: {__MODULE__, :get_repo_public_key},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/secrets/public-key",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_repo_public_key],
      timeout: nil,
      pagination: nil
    }
  end

  @get_repo_secret_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"secret_name", :secret_name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a repository secret\n\nGets a single repository secret without revealing its encrypted value.\n\nThe authenticated user must have collaborator access to the repository to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_repo_secret(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_repo_secret(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_repo_secret_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_repo_secret_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_repo_secret_partition_spec)

    %{
      id: "actions/get-repo-secret",
      args: params,
      call: {__MODULE__, :get_repo_secret},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/secrets/{secret_name}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_repo_secret],
      timeout: nil,
      pagination: nil
    }
  end

  @get_repo_variable_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"name", :name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a repository variable\n\nGets a specific variable in a repository.\n\nThe authenticated user must have collaborator access to the repository to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_repo_variable(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_repo_variable(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_repo_variable_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_repo_variable_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_repo_variable_partition_spec)

    %{
      id: "actions/get-repo-variable",
      args: params,
      call: {__MODULE__, :get_repo_variable},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/variables/{name}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_repo_variable],
      timeout: nil,
      pagination: nil
    }
  end

  @get_reviews_for_run_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get the review history for a workflow run\n\nAnyone with read access to the repository can use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with a private repository."
  @spec get_reviews_for_run(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_reviews_for_run(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_reviews_for_run_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_reviews_for_run_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_reviews_for_run_partition_spec)

    %{
      id: "actions/get-reviews-for-run",
      args: params,
      call: {__MODULE__, :get_reviews_for_run},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/approvals",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_reviews_for_run],
      timeout: nil,
      pagination: nil
    }
  end

  @get_self_hosted_runner_for_org_partition_spec %{
    path: [{"org", :org}, {"runner_id", :runner_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a self-hosted runner for an organization\n\nGets a specific self-hosted runner configured in an organization.\n\nAuthenticated users must have admin access to the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint. If the repository is private, the `repo` scope is also required."
  @spec get_self_hosted_runner_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_self_hosted_runner_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_self_hosted_runner_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_self_hosted_runner_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_self_hosted_runner_for_org_partition_spec)

    %{
      id: "actions/get-self-hosted-runner-for-org",
      args: params,
      call: {__MODULE__, :get_self_hosted_runner_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/runners/{runner_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_self_hosted_runner_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @get_self_hosted_runner_for_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"runner_id", :runner_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a self-hosted runner for a repository\n\nGets a specific self-hosted runner configured in a repository.\n\nAuthenticated users must have admin access to the repository to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_self_hosted_runner_for_repo(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_self_hosted_runner_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_self_hosted_runner_for_repo_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_self_hosted_runner_for_repo_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_self_hosted_runner_for_repo_partition_spec)

    %{
      id: "actions/get-self-hosted-runner-for-repo",
      args: params,
      call: {__MODULE__, :get_self_hosted_runner_for_repo},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/runners/{runner_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_self_hosted_runner_for_repo],
      timeout: nil,
      pagination: nil
    }
  end

  @get_self_hosted_runner_group_for_org_partition_spec %{
    path: [{"org", :org}, {"runner_group_id", :runner_group_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a self-hosted runner group for an organization\n\nGets a specific self-hosted runner group for an organization.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec get_self_hosted_runner_group_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_self_hosted_runner_group_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_self_hosted_runner_group_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_self_hosted_runner_group_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @get_self_hosted_runner_group_for_org_partition_spec)

    %{
      id: "actions/get-self-hosted-runner-group-for-org",
      args: params,
      call: {__MODULE__, :get_self_hosted_runner_group_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/runner-groups/{runner_group_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_self_hosted_runner_group_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @get_self_hosted_runners_permissions_organization_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get self-hosted runners settings for an organization\n\nGets the settings for self-hosted runners for an organization.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope or the \"Actions policies\" fine-grained permission to use this endpoint."
  @spec get_self_hosted_runners_permissions_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_self_hosted_runners_permissions_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_self_hosted_runners_permissions_organization_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_self_hosted_runners_permissions_organization_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @get_self_hosted_runners_permissions_organization_partition_spec
      )

    %{
      id: "actions/get-self-hosted-runners-permissions-organization",
      args: params,
      call: {__MODULE__, :get_self_hosted_runners_permissions_organization},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/permissions/self-hosted-runners",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_self_hosted_runners_permissions_organization],
      timeout: nil,
      pagination: nil
    }
  end

  @get_workflow_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"workflow_id", :workflow_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a workflow\n\nGets a specific workflow. You can replace `workflow_id` with the workflow\nfile name. For example, you could use `main.yaml`.\n\nAnyone with read access to the repository can use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with a private repository."
  @spec get_workflow(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_workflow(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_workflow_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_workflow_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_workflow_partition_spec)

    %{
      id: "actions/get-workflow",
      args: params,
      call: {__MODULE__, :get_workflow},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/workflows/{workflow_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_workflow],
      timeout: nil,
      pagination: nil
    }
  end

  @get_workflow_access_to_repository_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get the level of access for workflows outside of the repository\n\nGets the level of access that workflows outside of the repository have to actions and reusable workflows in the repository.\nThis endpoint only applies to private repositories.\nFor more information, see \"[Allowing access to components in a private repository](https://docs.github.com/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-github-actions-settings-for-a-repository#allowing-access-to-components-in-a-private-repository).\"\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec get_workflow_access_to_repository(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_workflow_access_to_repository(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_workflow_access_to_repository_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_workflow_access_to_repository_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_workflow_access_to_repository_partition_spec)

    %{
      id: "actions/get-workflow-access-to-repository",
      args: params,
      call: {__MODULE__, :get_workflow_access_to_repository},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/permissions/access",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_workflow_access_to_repository],
      timeout: nil,
      pagination: nil
    }
  end

  @get_workflow_run_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"exclude_pull_requests", :exclude_pull_requests}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a workflow run\n\nGets a specific workflow run.\n\nAnyone with read access to the repository can use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with a private repository."
  @spec get_workflow_run(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_workflow_run(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_workflow_run_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_workflow_run_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_workflow_run_partition_spec)

    %{
      id: "actions/get-workflow-run",
      args: params,
      call: {__MODULE__, :get_workflow_run},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_workflow_run],
      timeout: nil,
      pagination: nil
    }
  end

  @get_workflow_run_attempt_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"run_id", :run_id},
      {"attempt_number", :attempt_number}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"exclude_pull_requests", :exclude_pull_requests}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a workflow run attempt\n\nGets a specific workflow run attempt.\n\nAnyone with read access to the repository can use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with a private repository."
  @spec get_workflow_run_attempt(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_workflow_run_attempt(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_workflow_run_attempt_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_workflow_run_attempt_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_workflow_run_attempt_partition_spec)

    %{
      id: "actions/get-workflow-run-attempt",
      args: params,
      call: {__MODULE__, :get_workflow_run_attempt},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/attempts/{attempt_number}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_workflow_run_attempt],
      timeout: nil,
      pagination: nil
    }
  end

  @get_workflow_run_usage_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Get workflow run usage

       > [!WARNING]  
       > This endpoint is in the process of closing down. Refer to "[Actions Get workflow usage and Get workflow run usage endpoints closing down](https://github.blog/changelog/2025-02-02-actions-get-workflow-usage-and-get-workflow-run-usage-endpoints-closing-down/)" for more information.

       Gets the number of billable minutes and total run time for a specific workflow run. Billable minutes only apply to workflows in private repositories that use GitHub-hosted runners. Usage is listed for each GitHub-hosted runner operating system in milliseconds. Any job re-runs are also included in the usage. The usage does not include the multiplier for macOS and Windows runners and is not rounded up to the nearest whole minute. For more information, see "[Managing billing for GitHub Actions](https://docs.github.com/github/setting-up-and-managing-billing-and-payments-on-github/managing-billing-for-github-actions)".

       Anyone with read access to the repository can use this endpoint.

       OAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with a private repository.
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec get_workflow_run_usage(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_workflow_run_usage(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_workflow_run_usage_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_workflow_run_usage_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_workflow_run_usage_partition_spec)

    %{
      id: "actions/get-workflow-run-usage",
      args: params,
      call: {__MODULE__, :get_workflow_run_usage},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/timing",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_workflow_run_usage],
      timeout: nil,
      pagination: nil
    }
  end

  @get_workflow_usage_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"workflow_id", :workflow_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc ~S"""
       Get workflow usage

       > [!WARNING]  
       > This endpoint is in the process of closing down. Refer to "[Actions Get workflow usage and Get workflow run usage endpoints closing down](https://github.blog/changelog/2025-02-02-actions-get-workflow-usage-and-get-workflow-run-usage-endpoints-closing-down/)" for more information.

       Gets the number of billable minutes used by a specific workflow during the current billing cycle. Billable minutes only apply to workflows in private repositories that use GitHub-hosted runners. Usage is listed for each GitHub-hosted runner operating system in milliseconds. Any job re-runs are also included in the usage. The usage does not include the multiplier for macOS and Windows runners and is not rounded up to the nearest whole minute. For more information, see "[Managing billing for GitHub Actions](https://docs.github.com/github/setting-up-and-managing-billing-and-payments-on-github/managing-billing-for-github-actions)".

       You can replace `workflow_id` with the workflow file name. For example, you could use `main.yaml`.

       Anyone with read access to the repository can use this endpoint.

       OAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with a private repository.
       """
       |> String.trim_leading("\n")
       |> String.trim_trailing("\n")
  @spec get_workflow_usage(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_workflow_usage(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_workflow_usage_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_workflow_usage_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_workflow_usage_partition_spec)

    %{
      id: "actions/get-workflow-usage",
      args: params,
      call: {__MODULE__, :get_workflow_usage},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/workflows/{workflow_id}/timing",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :get_workflow_usage],
      timeout: nil,
      pagination: nil
    }
  end

  @list_artifacts_for_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}, {"name", :name}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List artifacts for a repository\n\nLists all artifacts for a repository.\n\nAnyone with read access to the repository can use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with a private repository."
  @spec list_artifacts_for_repo(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_artifacts_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_artifacts_for_repo_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_artifacts_for_repo(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_artifacts_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_artifacts_for_repo_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_artifacts_for_repo_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_artifacts_for_repo_partition_spec)

    %{
      id: "actions/list-artifacts-for-repo",
      args: params,
      call: {__MODULE__, :list_artifacts_for_repo},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/artifacts",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_artifacts_for_repo],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["artifacts"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_custom_image_versions_for_org_partition_spec %{
    path: [{"image_definition_id", :image_definition_id}, {"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List image versions of a custom image for an organization\n\nList image versions of a custom image for an organization.\n\nOAuth tokens and personal access tokens (classic) need the `manage_runners:org` scope to use this endpoint."
  @spec list_custom_image_versions_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_custom_image_versions_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_custom_image_versions_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_custom_image_versions_for_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_custom_image_versions_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_custom_image_versions_for_org_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_custom_image_versions_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @list_custom_image_versions_for_org_partition_spec)

    %{
      id: "actions/list-custom-image-versions-for-org",
      args: params,
      call: {__MODULE__, :list_custom_image_versions_for_org},
      opts: opts,
      method: :get,
      path_template:
        "/orgs/{org}/actions/hosted-runners/images/custom/{image_definition_id}/versions",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_custom_image_versions_for_org],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["image_versions"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_custom_images_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List custom images for an organization\n\nList custom images for an organization.\n\nOAuth tokens and personal access tokens (classic) need the `manage_runners:org` scope to use this endpoint."
  @spec list_custom_images_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_custom_images_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_custom_images_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_custom_images_for_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_custom_images_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_custom_images_for_org_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_custom_images_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_custom_images_for_org_partition_spec)

    %{
      id: "actions/list-custom-images-for-org",
      args: params,
      call: {__MODULE__, :list_custom_images_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/hosted-runners/images/custom",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_custom_images_for_org],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["images"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_environment_secrets_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"environment_name", :environment_name}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List environment secrets\n\nLists all secrets available in an environment without revealing their\nencrypted values.\n\nAuthenticated users must have collaborator access to a repository to create, update, or read secrets.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec list_environment_secrets(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_environment_secrets(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_environment_secrets_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_environment_secrets(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_environment_secrets(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_environment_secrets_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_environment_secrets_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_environment_secrets_partition_spec)

    %{
      id: "actions/list-environment-secrets",
      args: params,
      call: {__MODULE__, :list_environment_secrets},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/environments/{environment_name}/secrets",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_environment_secrets],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["secrets"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_environment_variables_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"environment_name", :environment_name}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List environment variables\n\nLists all environment variables.\n\nAuthenticated users must have collaborator access to a repository to create, update, or read variables.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec list_environment_variables(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_environment_variables(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_environment_variables_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_environment_variables(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_environment_variables(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_environment_variables_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_environment_variables_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_environment_variables_partition_spec)

    %{
      id: "actions/list-environment-variables",
      args: params,
      call: {__MODULE__, :list_environment_variables},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/environments/{environment_name}/variables",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_environment_variables],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["variables"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_github_hosted_runners_in_group_for_org_partition_spec %{
    path: [{"org", :org}, {"runner_group_id", :runner_group_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List GitHub-hosted runners in a group for an organization\n\nLists the GitHub-hosted runners in an organization group.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec list_github_hosted_runners_in_group_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_github_hosted_runners_in_group_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_github_hosted_runners_in_group_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_github_hosted_runners_in_group_for_org(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_list_github_hosted_runners_in_group_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_github_hosted_runners_in_group_for_org_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_github_hosted_runners_in_group_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @list_github_hosted_runners_in_group_for_org_partition_spec)

    %{
      id: "actions/list-github-hosted-runners-in-group-for-org",
      args: params,
      call: {__MODULE__, :list_github_hosted_runners_in_group_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/runner-groups/{runner_group_id}/hosted-runners",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_github_hosted_runners_in_group_for_org],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["runners"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_hosted_runners_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List GitHub-hosted runners for an organization\n\nLists all GitHub-hosted runners configured in an organization.\n\nOAuth app tokens and personal access tokens (classic) need the `manage_runner:org` scope to use this endpoint."
  @spec list_hosted_runners_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_hosted_runners_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_hosted_runners_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_hosted_runners_for_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_hosted_runners_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_hosted_runners_for_org_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_hosted_runners_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_hosted_runners_for_org_partition_spec)

    %{
      id: "actions/list-hosted-runners-for-org",
      args: params,
      call: {__MODULE__, :list_hosted_runners_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/hosted-runners",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_hosted_runners_for_org],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["runners"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_jobs_for_workflow_run_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"filter", :filter}, {"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List jobs for a workflow run\n\nLists jobs for a workflow run. You can use parameters to narrow the list of results. For more information\nabout using parameters, see [Parameters](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#parameters).\n\nAnyone with read access to the repository can use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with a private repository."
  @spec list_jobs_for_workflow_run(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_jobs_for_workflow_run(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_jobs_for_workflow_run_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_jobs_for_workflow_run(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_jobs_for_workflow_run(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_jobs_for_workflow_run_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_jobs_for_workflow_run_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_jobs_for_workflow_run_partition_spec)

    %{
      id: "actions/list-jobs-for-workflow-run",
      args: params,
      call: {__MODULE__, :list_jobs_for_workflow_run},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/jobs",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_jobs_for_workflow_run],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["jobs"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_jobs_for_workflow_run_attempt_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"run_id", :run_id},
      {"attempt_number", :attempt_number}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List jobs for a workflow run attempt\n\nLists jobs for a specific workflow run attempt. You can use parameters to narrow the list of results. For more information\nabout using parameters, see [Parameters](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#parameters).\n\nAnyone with read access to the repository can use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint  with a private repository."
  @spec list_jobs_for_workflow_run_attempt(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_jobs_for_workflow_run_attempt(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_jobs_for_workflow_run_attempt_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_jobs_for_workflow_run_attempt(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_jobs_for_workflow_run_attempt(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_jobs_for_workflow_run_attempt_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_jobs_for_workflow_run_attempt_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @list_jobs_for_workflow_run_attempt_partition_spec)

    %{
      id: "actions/list-jobs-for-workflow-run-attempt",
      args: params,
      call: {__MODULE__, :list_jobs_for_workflow_run_attempt},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/attempts/{attempt_number}/jobs",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_jobs_for_workflow_run_attempt],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["jobs"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_labels_for_self_hosted_runner_for_org_partition_spec %{
    path: [{"org", :org}, {"runner_id", :runner_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List labels for a self-hosted runner for an organization\n\nLists all labels for a self-hosted runner configured in an organization.\n\nAuthenticated users must have admin access to the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint. If the repository is private, the `repo` scope is also required."
  @spec list_labels_for_self_hosted_runner_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_labels_for_self_hosted_runner_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_labels_for_self_hosted_runner_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_labels_for_self_hosted_runner_for_org(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_list_labels_for_self_hosted_runner_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_labels_for_self_hosted_runner_for_org_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_labels_for_self_hosted_runner_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @list_labels_for_self_hosted_runner_for_org_partition_spec)

    %{
      id: "actions/list-labels-for-self-hosted-runner-for-org",
      args: params,
      call: {__MODULE__, :list_labels_for_self_hosted_runner_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/runners/{runner_id}/labels",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_labels_for_self_hosted_runner_for_org],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["labels"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_labels_for_self_hosted_runner_for_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"runner_id", :runner_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List labels for a self-hosted runner for a repository\n\nLists all labels for a self-hosted runner configured in a repository.\n\nAuthenticated users must have admin access to the repository to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec list_labels_for_self_hosted_runner_for_repo(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_labels_for_self_hosted_runner_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_labels_for_self_hosted_runner_for_repo_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_labels_for_self_hosted_runner_for_repo(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_list_labels_for_self_hosted_runner_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_labels_for_self_hosted_runner_for_repo_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_labels_for_self_hosted_runner_for_repo_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @list_labels_for_self_hosted_runner_for_repo_partition_spec)

    %{
      id: "actions/list-labels-for-self-hosted-runner-for-repo",
      args: params,
      call: {__MODULE__, :list_labels_for_self_hosted_runner_for_repo},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/runners/{runner_id}/labels",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_labels_for_self_hosted_runner_for_repo],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["labels"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_org_secrets_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List organization secrets\n\nLists all secrets available in an organization without revealing their\nencrypted values.\n\nAuthenticated users must have collaborator access to a repository to create, update, or read secrets.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint. If the repository is private, the `repo` scope is also required."
  @spec list_org_secrets(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_org_secrets(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_org_secrets_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_org_secrets(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_org_secrets(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_org_secrets_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_org_secrets_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_org_secrets_partition_spec)

    %{
      id: "actions/list-org-secrets",
      args: params,
      call: {__MODULE__, :list_org_secrets},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/secrets",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_org_secrets],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["secrets"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_org_variables_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List organization variables\n\nLists all organization variables.\n\nAuthenticated users must have collaborator access to a repository to create, update, or read variables.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint. If the repository is private, the `repo` scope is also required."
  @spec list_org_variables(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_org_variables(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_org_variables_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_org_variables(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_org_variables(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_org_variables_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_org_variables_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_org_variables_partition_spec)

    %{
      id: "actions/list-org-variables",
      args: params,
      call: {__MODULE__, :list_org_variables},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/variables",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_org_variables],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["variables"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_repo_access_to_self_hosted_runner_group_in_org_partition_spec %{
    path: [{"org", :org}, {"runner_group_id", :runner_group_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"page", :page}, {"per_page", :per_page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List repository access to a self-hosted runner group in an organization\n\nLists the repositories with access to a self-hosted runner group configured in an organization.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec list_repo_access_to_self_hosted_runner_group_in_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_repo_access_to_self_hosted_runner_group_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_list_repo_access_to_self_hosted_runner_group_in_org_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_repo_access_to_self_hosted_runner_group_in_org(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_list_repo_access_to_self_hosted_runner_group_in_org(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn ->
        build_list_repo_access_to_self_hosted_runner_group_in_org_request(client, params, opts)
      end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_repo_access_to_self_hosted_runner_group_in_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @list_repo_access_to_self_hosted_runner_group_in_org_partition_spec
      )

    %{
      id: "actions/list-repo-access-to-self-hosted-runner-group-in-org",
      args: params,
      call: {__MODULE__, :list_repo_access_to_self_hosted_runner_group_in_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/runner-groups/{runner_group_id}/repositories",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_repo_access_to_self_hosted_runner_group_in_org],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["repositories"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_repo_organization_secrets_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List repository organization secrets\n\nLists all organization secrets shared with a repository without revealing their encrypted\nvalues.\n\nAuthenticated users must have collaborator access to a repository to create, update, or read secrets.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec list_repo_organization_secrets(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_repo_organization_secrets(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_repo_organization_secrets_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_repo_organization_secrets(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_repo_organization_secrets(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_repo_organization_secrets_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_repo_organization_secrets_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_repo_organization_secrets_partition_spec)

    %{
      id: "actions/list-repo-organization-secrets",
      args: params,
      call: {__MODULE__, :list_repo_organization_secrets},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/organization-secrets",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_repo_organization_secrets],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["secrets"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_repo_organization_variables_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List repository organization variables\n\nLists all organization variables shared with a repository.\n\nAuthenticated users must have collaborator access to a repository to create, update, or read variables.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec list_repo_organization_variables(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_repo_organization_variables(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_repo_organization_variables_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_repo_organization_variables(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_repo_organization_variables(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_repo_organization_variables_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_repo_organization_variables_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_repo_organization_variables_partition_spec)

    %{
      id: "actions/list-repo-organization-variables",
      args: params,
      call: {__MODULE__, :list_repo_organization_variables},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/organization-variables",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_repo_organization_variables],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["variables"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_repo_secrets_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List repository secrets\n\nLists all secrets available in a repository without revealing their encrypted\nvalues.\n\nAuthenticated users must have collaborator access to a repository to create, update, or read secrets.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec list_repo_secrets(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_repo_secrets(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_repo_secrets_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_repo_secrets(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_repo_secrets(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_repo_secrets_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_repo_secrets_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_repo_secrets_partition_spec)

    %{
      id: "actions/list-repo-secrets",
      args: params,
      call: {__MODULE__, :list_repo_secrets},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/secrets",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_repo_secrets],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["secrets"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_repo_variables_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List repository variables\n\nLists all repository variables.\n\nAuthenticated users must have collaborator access to a repository to create, update, or read variables.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec list_repo_variables(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_repo_variables(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_repo_variables_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_repo_variables(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_repo_variables(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_repo_variables_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_repo_variables_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_repo_variables_partition_spec)

    %{
      id: "actions/list-repo-variables",
      args: params,
      call: {__MODULE__, :list_repo_variables},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/variables",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_repo_variables],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["variables"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_repo_workflows_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List repository workflows\n\nLists the workflows in a repository.\n\nAnyone with read access to the repository can use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with a private repository."
  @spec list_repo_workflows(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_repo_workflows(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_repo_workflows_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_repo_workflows(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_repo_workflows(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_repo_workflows_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_repo_workflows_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_repo_workflows_partition_spec)

    %{
      id: "actions/list-repo-workflows",
      args: params,
      call: {__MODULE__, :list_repo_workflows},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/workflows",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_repo_workflows],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["workflows"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_runner_applications_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List runner applications for an organization\n\nLists binaries for the runner application that you can download and run.\n\nAuthenticated users must have admin access to the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint.  If the repository is private, the `repo` scope is also required."
  @spec list_runner_applications_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_runner_applications_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_runner_applications_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_runner_applications_for_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_runner_applications_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_runner_applications_for_org_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_runner_applications_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_runner_applications_for_org_partition_spec)

    %{
      id: "actions/list-runner-applications-for-org",
      args: params,
      call: {__MODULE__, :list_runner_applications_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/runners/downloads",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_runner_applications_for_org],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: nil,
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_runner_applications_for_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List runner applications for a repository\n\nLists binaries for the runner application that you can download and run.\n\nAuthenticated users must have admin access to the repository to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec list_runner_applications_for_repo(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_runner_applications_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_runner_applications_for_repo_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_runner_applications_for_repo(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_runner_applications_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_runner_applications_for_repo_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_runner_applications_for_repo_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_runner_applications_for_repo_partition_spec)

    %{
      id: "actions/list-runner-applications-for-repo",
      args: params,
      call: {__MODULE__, :list_runner_applications_for_repo},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/runners/downloads",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_runner_applications_for_repo],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: nil,
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_selected_repos_for_org_secret_partition_spec %{
    path: [{"org", :org}, {"secret_name", :secret_name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"page", :page}, {"per_page", :per_page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List selected repositories for an organization secret\n\nLists all repositories that have been selected when the `visibility`\nfor repository access to a secret is set to `selected`.\n\nAuthenticated users must have collaborator access to a repository to create, update, or read secrets.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint. If the repository is private, the `repo` scope is also required."
  @spec list_selected_repos_for_org_secret(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_selected_repos_for_org_secret(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_selected_repos_for_org_secret_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_selected_repos_for_org_secret(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_selected_repos_for_org_secret(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_selected_repos_for_org_secret_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_selected_repos_for_org_secret_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @list_selected_repos_for_org_secret_partition_spec)

    %{
      id: "actions/list-selected-repos-for-org-secret",
      args: params,
      call: {__MODULE__, :list_selected_repos_for_org_secret},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/secrets/{secret_name}/repositories",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_selected_repos_for_org_secret],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["repositories"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_selected_repos_for_org_variable_partition_spec %{
    path: [{"org", :org}, {"name", :name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"page", :page}, {"per_page", :per_page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List selected repositories for an organization variable\n\nLists all repositories that can access an organization variable\nthat is available to selected repositories.\n\nAuthenticated users must have collaborator access to a repository to create, update, or read variables.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint. If the repository is private, the `repo` scope is also required."
  @spec list_selected_repos_for_org_variable(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_selected_repos_for_org_variable(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_selected_repos_for_org_variable_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_selected_repos_for_org_variable(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_selected_repos_for_org_variable(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_selected_repos_for_org_variable_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_selected_repos_for_org_variable_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @list_selected_repos_for_org_variable_partition_spec)

    %{
      id: "actions/list-selected-repos-for-org-variable",
      args: params,
      call: {__MODULE__, :list_selected_repos_for_org_variable},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/variables/{name}/repositories",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_selected_repos_for_org_variable],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["repositories"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_selected_repositories_enabled_github_actions_organization_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List selected repositories enabled for GitHub Actions in an organization\n\nLists the selected repositories that are enabled for GitHub Actions in an organization. To use this endpoint, the organization permission policy for `enabled_repositories` must be configured to `selected`. For more information, see \"[Set GitHub Actions permissions for an organization](#set-github-actions-permissions-for-an-organization).\"\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec list_selected_repositories_enabled_github_actions_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_selected_repositories_enabled_github_actions_organization(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_list_selected_repositories_enabled_github_actions_organization_request(
        client,
        params,
        opts
      )

    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_selected_repositories_enabled_github_actions_organization(
          term(),
          map(),
          keyword()
        ) :: Enumerable.t()
  def stream_list_selected_repositories_enabled_github_actions_organization(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn ->
        build_list_selected_repositories_enabled_github_actions_organization_request(
          client,
          params,
          opts
        )
      end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_selected_repositories_enabled_github_actions_organization_request(
         client,
         params,
         opts
       )
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @list_selected_repositories_enabled_github_actions_organization_partition_spec
      )

    %{
      id: "actions/list-selected-repositories-enabled-github-actions-organization",
      args: params,
      call: {__MODULE__, :list_selected_repositories_enabled_github_actions_organization},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/permissions/repositories",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [
        :github_ex,
        :actions,
        :list_selected_repositories_enabled_github_actions_organization
      ],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["repositories"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_selected_repositories_self_hosted_runners_organization_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List repositories allowed to use self-hosted runners in an organization\n\nLists repositories that are allowed to use self-hosted runners in an organization.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope or the \"Actions policies\" fine-grained permission to use this endpoint."
  @spec list_selected_repositories_self_hosted_runners_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_selected_repositories_self_hosted_runners_organization(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_list_selected_repositories_self_hosted_runners_organization_request(
        client,
        params,
        opts
      )

    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_selected_repositories_self_hosted_runners_organization(
          term(),
          map(),
          keyword()
        ) :: Enumerable.t()
  def stream_list_selected_repositories_self_hosted_runners_organization(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn ->
        build_list_selected_repositories_self_hosted_runners_organization_request(
          client,
          params,
          opts
        )
      end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_selected_repositories_self_hosted_runners_organization_request(
         client,
         params,
         opts
       )
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @list_selected_repositories_self_hosted_runners_organization_partition_spec
      )

    %{
      id: "actions/list-selected-repositories-self-hosted-runners-organization",
      args: params,
      call: {__MODULE__, :list_selected_repositories_self_hosted_runners_organization},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/permissions/self-hosted-runners/repositories",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [
        :github_ex,
        :actions,
        :list_selected_repositories_self_hosted_runners_organization
      ],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["repositories"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_self_hosted_runner_groups_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"per_page", :per_page},
      {"page", :page},
      {"visible_to_repository", :visible_to_repository}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List self-hosted runner groups for an organization\n\nLists all self-hosted runner groups configured in an organization and inherited from an enterprise.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec list_self_hosted_runner_groups_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_self_hosted_runner_groups_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_self_hosted_runner_groups_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_self_hosted_runner_groups_for_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_self_hosted_runner_groups_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_self_hosted_runner_groups_for_org_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_self_hosted_runner_groups_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @list_self_hosted_runner_groups_for_org_partition_spec)

    %{
      id: "actions/list-self-hosted-runner-groups-for-org",
      args: params,
      call: {__MODULE__, :list_self_hosted_runner_groups_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/runner-groups",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_self_hosted_runner_groups_for_org],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["runner_groups"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_self_hosted_runners_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"name", :name}, {"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List self-hosted runners for an organization\n\nLists all self-hosted runners configured in an organization.\n\nAuthenticated users must have admin access to the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint. If the repository is private, the `repo` scope is also required."
  @spec list_self_hosted_runners_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_self_hosted_runners_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_self_hosted_runners_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_self_hosted_runners_for_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_self_hosted_runners_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_self_hosted_runners_for_org_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_self_hosted_runners_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_self_hosted_runners_for_org_partition_spec)

    %{
      id: "actions/list-self-hosted-runners-for-org",
      args: params,
      call: {__MODULE__, :list_self_hosted_runners_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/runners",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_self_hosted_runners_for_org],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["runners"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_self_hosted_runners_for_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"name", :name}, {"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List self-hosted runners for a repository\n\nLists all self-hosted runners configured in a repository.\n\nAuthenticated users must have admin access to the repository to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec list_self_hosted_runners_for_repo(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_self_hosted_runners_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_self_hosted_runners_for_repo_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_self_hosted_runners_for_repo(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_self_hosted_runners_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_self_hosted_runners_for_repo_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_self_hosted_runners_for_repo_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_self_hosted_runners_for_repo_partition_spec)

    %{
      id: "actions/list-self-hosted-runners-for-repo",
      args: params,
      call: {__MODULE__, :list_self_hosted_runners_for_repo},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/runners",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_self_hosted_runners_for_repo],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["runners"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_self_hosted_runners_in_group_for_org_partition_spec %{
    path: [{"org", :org}, {"runner_group_id", :runner_group_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"per_page", :per_page}, {"page", :page}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List self-hosted runners in a group for an organization\n\nLists self-hosted runners that are in a specific organization group.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec list_self_hosted_runners_in_group_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_self_hosted_runners_in_group_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_self_hosted_runners_in_group_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_self_hosted_runners_in_group_for_org(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_list_self_hosted_runners_in_group_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_self_hosted_runners_in_group_for_org_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_self_hosted_runners_in_group_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @list_self_hosted_runners_in_group_for_org_partition_spec)

    %{
      id: "actions/list-self-hosted-runners-in-group-for-org",
      args: params,
      call: {__MODULE__, :list_self_hosted_runners_in_group_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/runner-groups/{runner_group_id}/runners",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_self_hosted_runners_in_group_for_org],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["runners"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_workflow_run_artifacts_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"per_page", :per_page},
      {"page", :page},
      {"name", :name},
      {"direction", :direction}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List workflow run artifacts\n\nLists artifacts for a workflow run.\n\nAnyone with read access to the repository can use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with a private repository."
  @spec list_workflow_run_artifacts(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_workflow_run_artifacts(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_workflow_run_artifacts_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_workflow_run_artifacts(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_workflow_run_artifacts(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_workflow_run_artifacts_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_workflow_run_artifacts_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_workflow_run_artifacts_partition_spec)

    %{
      id: "actions/list-workflow-run-artifacts",
      args: params,
      call: {__MODULE__, :list_workflow_run_artifacts},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/artifacts",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_workflow_run_artifacts],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["artifacts"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_workflow_runs_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"workflow_id", :workflow_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
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
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List workflow runs for a workflow\n\nList all workflow runs for a workflow. You can replace `workflow_id` with the workflow file name. For example, you could use `main.yaml`. You can use parameters to narrow the list of results. For more information about using parameters, see [Parameters](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#parameters).\n\nAnyone with read access to the repository can use this endpoint\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with a private repository.\n\nThis endpoint will return up to 1,000 results for each search when using the following parameters: `actor`, `branch`, `check_suite_id`, `created`, `event`, `head_sha`, `status`."
  @spec list_workflow_runs(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_workflow_runs(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_workflow_runs_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_workflow_runs(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_workflow_runs(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_workflow_runs_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_workflow_runs_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_workflow_runs_partition_spec)

    %{
      id: "actions/list-workflow-runs",
      args: params,
      call: {__MODULE__, :list_workflow_runs},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/workflows/{workflow_id}/runs",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_workflow_runs],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["workflow_runs"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @list_workflow_runs_for_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
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
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List workflow runs for a repository\n\nLists all workflow runs for a repository. You can use parameters to narrow the list of results. For more information about using parameters, see [Parameters](https://docs.github.com/rest/guides/getting-started-with-the-rest-api#parameters).\n\nAnyone with read access to the repository can use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with a private repository.\n\nThis endpoint will return up to 1,000 results for each search when using the following parameters: `actor`, `branch`, `check_suite_id`, `created`, `event`, `head_sha`, `status`."
  @spec list_workflow_runs_for_repo(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_workflow_runs_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_workflow_runs_for_repo_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_workflow_runs_for_repo(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_workflow_runs_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_workflow_runs_for_repo_request(client, params, opts) end,
      fn
        nil ->
          {:halt, nil}

        request when is_map(request) ->
          wrapped_request =
            update_in(request[:opts], fn request_opts ->
              Keyword.put(request_opts || [], :response, :wrapped)
            end)

          case GitHubEx.Client.execute_generated_request(client, wrapped_request) do
            {:ok, response} ->
              items = List.wrap(OpenAPIClient.items(request, response))
              {items, OpenAPIClient.next_page_request(request, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_workflow_runs_for_repo_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @list_workflow_runs_for_repo_partition_spec)

    %{
      id: "actions/list-workflow-runs-for-repo",
      args: params,
      call: {__MODULE__, :list_workflow_runs_for_repo},
      opts: opts,
      method: :get,
      path_template: "/repos/{owner}/{repo}/actions/runs",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :list_workflow_runs_for_repo],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["workflow_runs"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @re_run_job_for_workflow_run_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"job_id", :job_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Re-run a job from a workflow run\n\nRe-run a job and its dependent jobs in a workflow run.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec re_run_job_for_workflow_run(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def re_run_job_for_workflow_run(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_re_run_job_for_workflow_run_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_re_run_job_for_workflow_run_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @re_run_job_for_workflow_run_partition_spec)

    %{
      id: "actions/re-run-job-for-workflow-run",
      args: params,
      call: {__MODULE__, :re_run_job_for_workflow_run},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/actions/jobs/{job_id}/rerun",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :re_run_job_for_workflow_run],
      timeout: nil,
      pagination: nil
    }
  end

  @re_run_workflow_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Re-run a workflow\n\nRe-runs your workflow run using its `id`.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec re_run_workflow(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def re_run_workflow(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_re_run_workflow_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_re_run_workflow_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @re_run_workflow_partition_spec)

    %{
      id: "actions/re-run-workflow",
      args: params,
      call: {__MODULE__, :re_run_workflow},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/rerun",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :re_run_workflow],
      timeout: nil,
      pagination: nil
    }
  end

  @re_run_workflow_failed_jobs_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Re-run failed jobs from a workflow run\n\nRe-run all of the failed jobs and their dependent jobs in a workflow run using the `id` of the workflow run.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec re_run_workflow_failed_jobs(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def re_run_workflow_failed_jobs(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_re_run_workflow_failed_jobs_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_re_run_workflow_failed_jobs_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @re_run_workflow_failed_jobs_partition_spec)

    %{
      id: "actions/re-run-workflow-failed-jobs",
      args: params,
      call: {__MODULE__, :re_run_workflow_failed_jobs},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/rerun-failed-jobs",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :re_run_workflow_failed_jobs],
      timeout: nil,
      pagination: nil
    }
  end

  @remove_all_custom_labels_from_self_hosted_runner_for_org_partition_spec %{
    path: [{"org", :org}, {"runner_id", :runner_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove all custom labels from a self-hosted runner for an organization\n\nRemove all custom labels from a self-hosted runner configured in an\norganization. Returns the remaining read-only labels from the runner.\n\nAuthenticated users must have admin access to the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint. If the repository is private, the `repo` scope is also required."
  @spec remove_all_custom_labels_from_self_hosted_runner_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def remove_all_custom_labels_from_self_hosted_runner_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_remove_all_custom_labels_from_self_hosted_runner_for_org_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_remove_all_custom_labels_from_self_hosted_runner_for_org_request(
         client,
         params,
         opts
       )
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @remove_all_custom_labels_from_self_hosted_runner_for_org_partition_spec
      )

    %{
      id: "actions/remove-all-custom-labels-from-self-hosted-runner-for-org",
      args: params,
      call: {__MODULE__, :remove_all_custom_labels_from_self_hosted_runner_for_org},
      opts: opts,
      method: :delete,
      path_template: "/orgs/{org}/actions/runners/{runner_id}/labels",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :remove_all_custom_labels_from_self_hosted_runner_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @remove_all_custom_labels_from_self_hosted_runner_for_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"runner_id", :runner_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove all custom labels from a self-hosted runner for a repository\n\nRemove all custom labels from a self-hosted runner configured in a\nrepository. Returns the remaining read-only labels from the runner.\n\nAuthenticated users must have admin access to the repository to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec remove_all_custom_labels_from_self_hosted_runner_for_repo(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def remove_all_custom_labels_from_self_hosted_runner_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_remove_all_custom_labels_from_self_hosted_runner_for_repo_request(
        client,
        params,
        opts
      )

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_remove_all_custom_labels_from_self_hosted_runner_for_repo_request(
         client,
         params,
         opts
       )
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @remove_all_custom_labels_from_self_hosted_runner_for_repo_partition_spec
      )

    %{
      id: "actions/remove-all-custom-labels-from-self-hosted-runner-for-repo",
      args: params,
      call: {__MODULE__, :remove_all_custom_labels_from_self_hosted_runner_for_repo},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/actions/runners/{runner_id}/labels",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [
        :github_ex,
        :actions,
        :remove_all_custom_labels_from_self_hosted_runner_for_repo
      ],
      timeout: nil,
      pagination: nil
    }
  end

  @remove_custom_label_from_self_hosted_runner_for_org_partition_spec %{
    path: [{"org", :org}, {"runner_id", :runner_id}, {"name", :name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove a custom label from a self-hosted runner for an organization\n\nRemove a custom label from a self-hosted runner configured\nin an organization. Returns the remaining labels from the runner.\n\nThis endpoint returns a `404 Not Found` status if the custom label is not\npresent on the runner.\n\nAuthenticated users must have admin access to the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint. If the repository is private, the `repo` scope is also required."
  @spec remove_custom_label_from_self_hosted_runner_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def remove_custom_label_from_self_hosted_runner_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_remove_custom_label_from_self_hosted_runner_for_org_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_remove_custom_label_from_self_hosted_runner_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @remove_custom_label_from_self_hosted_runner_for_org_partition_spec
      )

    %{
      id: "actions/remove-custom-label-from-self-hosted-runner-for-org",
      args: params,
      call: {__MODULE__, :remove_custom_label_from_self_hosted_runner_for_org},
      opts: opts,
      method: :delete,
      path_template: "/orgs/{org}/actions/runners/{runner_id}/labels/{name}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :remove_custom_label_from_self_hosted_runner_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @remove_custom_label_from_self_hosted_runner_for_repo_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"runner_id", :runner_id},
      {"name", :name}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove a custom label from a self-hosted runner for a repository\n\nRemove a custom label from a self-hosted runner configured\nin a repository. Returns the remaining labels from the runner.\n\nThis endpoint returns a `404 Not Found` status if the custom label is not\npresent on the runner.\n\nAuthenticated users must have admin access to the repository to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec remove_custom_label_from_self_hosted_runner_for_repo(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def remove_custom_label_from_self_hosted_runner_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_remove_custom_label_from_self_hosted_runner_for_repo_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_remove_custom_label_from_self_hosted_runner_for_repo_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @remove_custom_label_from_self_hosted_runner_for_repo_partition_spec
      )

    %{
      id: "actions/remove-custom-label-from-self-hosted-runner-for-repo",
      args: params,
      call: {__MODULE__, :remove_custom_label_from_self_hosted_runner_for_repo},
      opts: opts,
      method: :delete,
      path_template: "/repos/{owner}/{repo}/actions/runners/{runner_id}/labels/{name}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :remove_custom_label_from_self_hosted_runner_for_repo],
      timeout: nil,
      pagination: nil
    }
  end

  @remove_repo_access_to_self_hosted_runner_group_in_org_partition_spec %{
    path: [
      {"org", :org},
      {"runner_group_id", :runner_group_id},
      {"repository_id", :repository_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove repository access to a self-hosted runner group in an organization\n\nRemoves a repository from the list of selected repositories that can access a self-hosted runner group. The runner group must have `visibility` set to `selected`. For more information, see \"[Create a self-hosted runner group for an organization](#create-a-self-hosted-runner-group-for-an-organization).\"\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec remove_repo_access_to_self_hosted_runner_group_in_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def remove_repo_access_to_self_hosted_runner_group_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_remove_repo_access_to_self_hosted_runner_group_in_org_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_remove_repo_access_to_self_hosted_runner_group_in_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @remove_repo_access_to_self_hosted_runner_group_in_org_partition_spec
      )

    %{
      id: "actions/remove-repo-access-to-self-hosted-runner-group-in-org",
      args: params,
      call: {__MODULE__, :remove_repo_access_to_self_hosted_runner_group_in_org},
      opts: opts,
      method: :delete,
      path_template:
        "/orgs/{org}/actions/runner-groups/{runner_group_id}/repositories/{repository_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :remove_repo_access_to_self_hosted_runner_group_in_org],
      timeout: nil,
      pagination: nil
    }
  end

  @remove_selected_repo_from_org_secret_partition_spec %{
    path: [
      {"org", :org},
      {"secret_name", :secret_name},
      {"repository_id", :repository_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove selected repository from an organization secret\n\nRemoves a repository from an organization secret when the `visibility`\nfor repository access is set to `selected`. The visibility is set when you [Create\nor update an organization secret](https://docs.github.com/rest/actions/secrets#create-or-update-an-organization-secret).\n\nAuthenticated users must have collaborator access to a repository to create, update, or read secrets.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint. If the repository is private, the `repo` scope is also required."
  @spec remove_selected_repo_from_org_secret(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def remove_selected_repo_from_org_secret(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_remove_selected_repo_from_org_secret_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_remove_selected_repo_from_org_secret_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @remove_selected_repo_from_org_secret_partition_spec)

    %{
      id: "actions/remove-selected-repo-from-org-secret",
      args: params,
      call: {__MODULE__, :remove_selected_repo_from_org_secret},
      opts: opts,
      method: :delete,
      path_template: "/orgs/{org}/actions/secrets/{secret_name}/repositories/{repository_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :remove_selected_repo_from_org_secret],
      timeout: nil,
      pagination: nil
    }
  end

  @remove_selected_repo_from_org_variable_partition_spec %{
    path: [{"org", :org}, {"name", :name}, {"repository_id", :repository_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove selected repository from an organization variable\n\nRemoves a repository from an organization variable that is\navailable to selected repositories. Organization variables that are available to\nselected repositories have their `visibility` field set to `selected`.\n\nAuthenticated users must have collaborator access to a repository to create, update, or read variables.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint. If the repository is private, the `repo` scope is also required."
  @spec remove_selected_repo_from_org_variable(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def remove_selected_repo_from_org_variable(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_remove_selected_repo_from_org_variable_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_remove_selected_repo_from_org_variable_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @remove_selected_repo_from_org_variable_partition_spec)

    %{
      id: "actions/remove-selected-repo-from-org-variable",
      args: params,
      call: {__MODULE__, :remove_selected_repo_from_org_variable},
      opts: opts,
      method: :delete,
      path_template: "/orgs/{org}/actions/variables/{name}/repositories/{repository_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :remove_selected_repo_from_org_variable],
      timeout: nil,
      pagination: nil
    }
  end

  @remove_self_hosted_runner_from_group_for_org_partition_spec %{
    path: [
      {"org", :org},
      {"runner_group_id", :runner_group_id},
      {"runner_id", :runner_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Remove a self-hosted runner from a group for an organization\n\nRemoves a self-hosted runner from a group configured in an organization. The runner is then returned to the default group.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec remove_self_hosted_runner_from_group_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def remove_self_hosted_runner_from_group_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_remove_self_hosted_runner_from_group_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_remove_self_hosted_runner_from_group_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @remove_self_hosted_runner_from_group_for_org_partition_spec
      )

    %{
      id: "actions/remove-self-hosted-runner-from-group-for-org",
      args: params,
      call: {__MODULE__, :remove_self_hosted_runner_from_group_for_org},
      opts: opts,
      method: :delete,
      path_template: "/orgs/{org}/actions/runner-groups/{runner_group_id}/runners/{runner_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :remove_self_hosted_runner_from_group_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @review_custom_gates_for_run_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Review custom deployment protection rules for a workflow run\n\nApprove or reject custom deployment protection rules provided by a GitHub App for a workflow run. For more information, see \"[Using environments for deployment](https://docs.github.com/actions/deployment/targeting-different-environments/using-environments-for-deployment).\"\n\n> [!NOTE]\n> GitHub Apps can only review their own custom deployment protection rules. To approve or reject pending deployments that are waiting for review from a specific person or team, see [`POST /repos/{owner}/{repo}/actions/runs/{run_id}/pending_deployments`](https://docs.github.com/rest/actions/workflow-runs#review-pending-deployments-for-a-workflow-run).\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with a private repository."
  @spec review_custom_gates_for_run(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def review_custom_gates_for_run(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_review_custom_gates_for_run_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_review_custom_gates_for_run_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @review_custom_gates_for_run_partition_spec)

    %{
      id: "actions/review-custom-gates-for-run",
      args: params,
      call: {__MODULE__, :review_custom_gates_for_run},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/deployment_protection_rule",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :review_custom_gates_for_run],
      timeout: nil,
      pagination: nil
    }
  end

  @review_pending_deployments_for_run_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"run_id", :run_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Review pending deployments for a workflow run\n\nApprove or reject pending deployments that are waiting on approval by a required reviewer.\n\nRequired reviewers with read access to the repository contents and deployments can use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec review_pending_deployments_for_run(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def review_pending_deployments_for_run(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_review_pending_deployments_for_run_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_review_pending_deployments_for_run_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @review_pending_deployments_for_run_partition_spec)

    %{
      id: "actions/review-pending-deployments-for-run",
      args: params,
      call: {__MODULE__, :review_pending_deployments_for_run},
      opts: opts,
      method: :post,
      path_template: "/repos/{owner}/{repo}/actions/runs/{run_id}/pending_deployments",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :review_pending_deployments_for_run],
      timeout: nil,
      pagination: nil
    }
  end

  @set_actions_cache_retention_limit_for_enterprise_partition_spec %{
    path: [{"enterprise", :enterprise}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set GitHub Actions cache retention limit for an enterprise\n\nSets GitHub Actions cache retention limit for an enterprise. All organizations and repositories under this\nenterprise may not set a higher cache retention limit.\n\nOAuth tokens and personal access tokens (classic) need the `admin:enterprise` scope to use this endpoint."
  @spec set_actions_cache_retention_limit_for_enterprise(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_actions_cache_retention_limit_for_enterprise(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_set_actions_cache_retention_limit_for_enterprise_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_actions_cache_retention_limit_for_enterprise_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @set_actions_cache_retention_limit_for_enterprise_partition_spec
      )

    %{
      id: "actions/set-actions-cache-retention-limit-for-enterprise",
      args: params,
      call: {__MODULE__, :set_actions_cache_retention_limit_for_enterprise},
      opts: opts,
      method: :put,
      path_template: "/enterprises/{enterprise}/actions/cache/retention-limit",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :set_actions_cache_retention_limit_for_enterprise],
      timeout: nil,
      pagination: nil
    }
  end

  @set_actions_cache_retention_limit_for_organization_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set GitHub Actions cache retention limit for an organization\n\nSets GitHub Actions cache retention limit for an organization. All repositories under this\norganization may not set a higher cache retention limit.\n\nOAuth tokens and personal access tokens (classic) need the `admin:organization` scope to use this endpoint."
  @spec set_actions_cache_retention_limit_for_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_actions_cache_retention_limit_for_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_set_actions_cache_retention_limit_for_organization_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_actions_cache_retention_limit_for_organization_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @set_actions_cache_retention_limit_for_organization_partition_spec
      )

    %{
      id: "actions/set-actions-cache-retention-limit-for-organization",
      args: params,
      call: {__MODULE__, :set_actions_cache_retention_limit_for_organization},
      opts: opts,
      method: :put,
      path_template: "/organizations/{org}/actions/cache/retention-limit",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :set_actions_cache_retention_limit_for_organization],
      timeout: nil,
      pagination: nil
    }
  end

  @set_actions_cache_retention_limit_for_repository_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set GitHub Actions cache retention limit for a repository\n\nSets GitHub Actions cache retention limit for a repository. This determines how long caches will be retained for, if\nnot manually removed or evicted due to size constraints.\n\nOAuth tokens and personal access tokens (classic) need the `admin:repository` scope to use this endpoint."
  @spec set_actions_cache_retention_limit_for_repository(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_actions_cache_retention_limit_for_repository(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_set_actions_cache_retention_limit_for_repository_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_actions_cache_retention_limit_for_repository_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @set_actions_cache_retention_limit_for_repository_partition_spec
      )

    %{
      id: "actions/set-actions-cache-retention-limit-for-repository",
      args: params,
      call: {__MODULE__, :set_actions_cache_retention_limit_for_repository},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/actions/cache/retention-limit",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :set_actions_cache_retention_limit_for_repository],
      timeout: nil,
      pagination: nil
    }
  end

  @set_actions_cache_storage_limit_for_enterprise_partition_spec %{
    path: [{"enterprise", :enterprise}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set GitHub Actions cache storage limit for an enterprise\n\nSets GitHub Actions cache storage limit for an enterprise. All organizations and repositories under this\nenterprise may not set a higher cache storage limit.\n\nOAuth tokens and personal access tokens (classic) need the `admin:enterprise` scope to use this endpoint."
  @spec set_actions_cache_storage_limit_for_enterprise(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_actions_cache_storage_limit_for_enterprise(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_set_actions_cache_storage_limit_for_enterprise_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_actions_cache_storage_limit_for_enterprise_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @set_actions_cache_storage_limit_for_enterprise_partition_spec
      )

    %{
      id: "actions/set-actions-cache-storage-limit-for-enterprise",
      args: params,
      call: {__MODULE__, :set_actions_cache_storage_limit_for_enterprise},
      opts: opts,
      method: :put,
      path_template: "/enterprises/{enterprise}/actions/cache/storage-limit",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :set_actions_cache_storage_limit_for_enterprise],
      timeout: nil,
      pagination: nil
    }
  end

  @set_actions_cache_storage_limit_for_organization_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set GitHub Actions cache storage limit for an organization\n\nSets GitHub Actions cache storage limit for an organization. All organizations and repositories under this\norganization may not set a higher cache storage limit.\n\nOAuth tokens and personal access tokens (classic) need the `admin:organization` scope to use this endpoint."
  @spec set_actions_cache_storage_limit_for_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_actions_cache_storage_limit_for_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_set_actions_cache_storage_limit_for_organization_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_actions_cache_storage_limit_for_organization_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @set_actions_cache_storage_limit_for_organization_partition_spec
      )

    %{
      id: "actions/set-actions-cache-storage-limit-for-organization",
      args: params,
      call: {__MODULE__, :set_actions_cache_storage_limit_for_organization},
      opts: opts,
      method: :put,
      path_template: "/organizations/{org}/actions/cache/storage-limit",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :set_actions_cache_storage_limit_for_organization],
      timeout: nil,
      pagination: nil
    }
  end

  @set_actions_cache_storage_limit_for_repository_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set GitHub Actions cache storage limit for a repository\n\nSets GitHub Actions cache storage limit for a repository. This determines the maximum size of caches that can be\nstored before eviction occurs.\n\nOAuth tokens and personal access tokens (classic) need the `admin:repository` scope to use this endpoint."
  @spec set_actions_cache_storage_limit_for_repository(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_actions_cache_storage_limit_for_repository(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_set_actions_cache_storage_limit_for_repository_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_actions_cache_storage_limit_for_repository_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @set_actions_cache_storage_limit_for_repository_partition_spec
      )

    %{
      id: "actions/set-actions-cache-storage-limit-for-repository",
      args: params,
      call: {__MODULE__, :set_actions_cache_storage_limit_for_repository},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/actions/cache/storage-limit",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :set_actions_cache_storage_limit_for_repository],
      timeout: nil,
      pagination: nil
    }
  end

  @set_allowed_actions_organization_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set allowed actions and reusable workflows for an organization\n\nSets the actions and reusable workflows that are allowed in an organization. To use this endpoint, the organization permission policy for `allowed_actions` must be configured to `selected`. For more information, see \"[Set GitHub Actions permissions for an organization](#set-github-actions-permissions-for-an-organization).\"\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec set_allowed_actions_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_allowed_actions_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_set_allowed_actions_organization_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_allowed_actions_organization_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @set_allowed_actions_organization_partition_spec)

    %{
      id: "actions/set-allowed-actions-organization",
      args: params,
      call: {__MODULE__, :set_allowed_actions_organization},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/actions/permissions/selected-actions",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :set_allowed_actions_organization],
      timeout: nil,
      pagination: nil
    }
  end

  @set_allowed_actions_repository_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set allowed actions and reusable workflows for a repository\n\nSets the actions and reusable workflows that are allowed in a repository. To use this endpoint, the repository permission policy for `allowed_actions` must be configured to `selected`. For more information, see \"[Set GitHub Actions permissions for a repository](#set-github-actions-permissions-for-a-repository).\"\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec set_allowed_actions_repository(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_allowed_actions_repository(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_set_allowed_actions_repository_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_allowed_actions_repository_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @set_allowed_actions_repository_partition_spec)

    %{
      id: "actions/set-allowed-actions-repository",
      args: params,
      call: {__MODULE__, :set_allowed_actions_repository},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/actions/permissions/selected-actions",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :set_allowed_actions_repository],
      timeout: nil,
      pagination: nil
    }
  end

  @set_artifact_and_log_retention_settings_organization_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set artifact and log retention settings for an organization\n\nSets artifact and log retention settings for an organization.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope or the \"Actions policies\" fine-grained permission to use this endpoint."
  @spec set_artifact_and_log_retention_settings_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_artifact_and_log_retention_settings_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_set_artifact_and_log_retention_settings_organization_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_artifact_and_log_retention_settings_organization_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @set_artifact_and_log_retention_settings_organization_partition_spec
      )

    %{
      id: "actions/set-artifact-and-log-retention-settings-organization",
      args: params,
      call: {__MODULE__, :set_artifact_and_log_retention_settings_organization},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/actions/permissions/artifact-and-log-retention",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :set_artifact_and_log_retention_settings_organization],
      timeout: nil,
      pagination: nil
    }
  end

  @set_artifact_and_log_retention_settings_repository_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set artifact and log retention settings for a repository\n\nSets artifact and log retention settings for a repository.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec set_artifact_and_log_retention_settings_repository(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_artifact_and_log_retention_settings_repository(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_set_artifact_and_log_retention_settings_repository_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_artifact_and_log_retention_settings_repository_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @set_artifact_and_log_retention_settings_repository_partition_spec
      )

    %{
      id: "actions/set-artifact-and-log-retention-settings-repository",
      args: params,
      call: {__MODULE__, :set_artifact_and_log_retention_settings_repository},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/actions/permissions/artifact-and-log-retention",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :set_artifact_and_log_retention_settings_repository],
      timeout: nil,
      pagination: nil
    }
  end

  @set_custom_labels_for_self_hosted_runner_for_org_partition_spec %{
    path: [{"org", :org}, {"runner_id", :runner_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set custom labels for a self-hosted runner for an organization\n\nRemove all previous custom labels and set the new custom labels for a specific\nself-hosted runner configured in an organization.\n\nAuthenticated users must have admin access to the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint. If the repository is private, the `repo` scope is also required."
  @spec set_custom_labels_for_self_hosted_runner_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_custom_labels_for_self_hosted_runner_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_set_custom_labels_for_self_hosted_runner_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_custom_labels_for_self_hosted_runner_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @set_custom_labels_for_self_hosted_runner_for_org_partition_spec
      )

    %{
      id: "actions/set-custom-labels-for-self-hosted-runner-for-org",
      args: params,
      call: {__MODULE__, :set_custom_labels_for_self_hosted_runner_for_org},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/actions/runners/{runner_id}/labels",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :set_custom_labels_for_self_hosted_runner_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @set_custom_labels_for_self_hosted_runner_for_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"runner_id", :runner_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set custom labels for a self-hosted runner for a repository\n\nRemove all previous custom labels and set the new custom labels for a specific\nself-hosted runner configured in a repository.\n\nAuthenticated users must have admin access to the repository to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec set_custom_labels_for_self_hosted_runner_for_repo(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_custom_labels_for_self_hosted_runner_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_set_custom_labels_for_self_hosted_runner_for_repo_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_custom_labels_for_self_hosted_runner_for_repo_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @set_custom_labels_for_self_hosted_runner_for_repo_partition_spec
      )

    %{
      id: "actions/set-custom-labels-for-self-hosted-runner-for-repo",
      args: params,
      call: {__MODULE__, :set_custom_labels_for_self_hosted_runner_for_repo},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/actions/runners/{runner_id}/labels",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :set_custom_labels_for_self_hosted_runner_for_repo],
      timeout: nil,
      pagination: nil
    }
  end

  @set_custom_oidc_sub_claim_for_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set the customization template for an OIDC subject claim for a repository\n\nSets the customization template and `opt-in` or `opt-out` flag for an OpenID Connect (OIDC) subject claim for a repository.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec set_custom_oidc_sub_claim_for_repo(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_custom_oidc_sub_claim_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_set_custom_oidc_sub_claim_for_repo_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_custom_oidc_sub_claim_for_repo_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @set_custom_oidc_sub_claim_for_repo_partition_spec)

    %{
      id: "actions/set-custom-oidc-sub-claim-for-repo",
      args: params,
      call: {__MODULE__, :set_custom_oidc_sub_claim_for_repo},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/actions/oidc/customization/sub",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :set_custom_oidc_sub_claim_for_repo],
      timeout: nil,
      pagination: nil
    }
  end

  @set_fork_pr_contributor_approval_permissions_organization_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set fork PR contributor approval permissions for an organization\n\nSets the fork PR contributor approval policy for an organization.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec set_fork_pr_contributor_approval_permissions_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_fork_pr_contributor_approval_permissions_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_set_fork_pr_contributor_approval_permissions_organization_request(
        client,
        params,
        opts
      )

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_fork_pr_contributor_approval_permissions_organization_request(
         client,
         params,
         opts
       )
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @set_fork_pr_contributor_approval_permissions_organization_partition_spec
      )

    %{
      id: "actions/set-fork-pr-contributor-approval-permissions-organization",
      args: params,
      call: {__MODULE__, :set_fork_pr_contributor_approval_permissions_organization},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/actions/permissions/fork-pr-contributor-approval",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [
        :github_ex,
        :actions,
        :set_fork_pr_contributor_approval_permissions_organization
      ],
      timeout: nil,
      pagination: nil
    }
  end

  @set_fork_pr_contributor_approval_permissions_repository_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set fork PR contributor approval permissions for a repository\n\nSets the fork PR contributor approval policy for a repository.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec set_fork_pr_contributor_approval_permissions_repository(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_fork_pr_contributor_approval_permissions_repository(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_set_fork_pr_contributor_approval_permissions_repository_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_fork_pr_contributor_approval_permissions_repository_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @set_fork_pr_contributor_approval_permissions_repository_partition_spec
      )

    %{
      id: "actions/set-fork-pr-contributor-approval-permissions-repository",
      args: params,
      call: {__MODULE__, :set_fork_pr_contributor_approval_permissions_repository},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/actions/permissions/fork-pr-contributor-approval",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :set_fork_pr_contributor_approval_permissions_repository],
      timeout: nil,
      pagination: nil
    }
  end

  @set_github_actions_default_workflow_permissions_organization_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set default workflow permissions for an organization\n\nSets the default workflow permissions granted to the `GITHUB_TOKEN` when running workflows in an organization, and sets if GitHub Actions\ncan submit approving pull request reviews. For more information, see\n\"[Setting the permissions of the GITHUB_TOKEN for your organization](https://docs.github.com/organizations/managing-organization-settings/disabling-or-limiting-github-actions-for-your-organization#setting-the-permissions-of-the-github_token-for-your-organization).\"\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec set_github_actions_default_workflow_permissions_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_github_actions_default_workflow_permissions_organization(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_set_github_actions_default_workflow_permissions_organization_request(
        client,
        params,
        opts
      )

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_github_actions_default_workflow_permissions_organization_request(
         client,
         params,
         opts
       )
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @set_github_actions_default_workflow_permissions_organization_partition_spec
      )

    %{
      id: "actions/set-github-actions-default-workflow-permissions-organization",
      args: params,
      call: {__MODULE__, :set_github_actions_default_workflow_permissions_organization},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/actions/permissions/workflow",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [
        :github_ex,
        :actions,
        :set_github_actions_default_workflow_permissions_organization
      ],
      timeout: nil,
      pagination: nil
    }
  end

  @set_github_actions_default_workflow_permissions_repository_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set default workflow permissions for a repository\n\nSets the default workflow permissions granted to the `GITHUB_TOKEN` when running workflows in a repository, and sets if GitHub Actions\ncan submit approving pull request reviews.\nFor more information, see \"[Setting the permissions of the GITHUB_TOKEN for your repository](https://docs.github.com/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-github-actions-settings-for-a-repository#setting-the-permissions-of-the-github_token-for-your-repository).\"\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec set_github_actions_default_workflow_permissions_repository(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_github_actions_default_workflow_permissions_repository(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_set_github_actions_default_workflow_permissions_repository_request(
        client,
        params,
        opts
      )

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_github_actions_default_workflow_permissions_repository_request(
         client,
         params,
         opts
       )
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @set_github_actions_default_workflow_permissions_repository_partition_spec
      )

    %{
      id: "actions/set-github-actions-default-workflow-permissions-repository",
      args: params,
      call: {__MODULE__, :set_github_actions_default_workflow_permissions_repository},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/actions/permissions/workflow",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [
        :github_ex,
        :actions,
        :set_github_actions_default_workflow_permissions_repository
      ],
      timeout: nil,
      pagination: nil
    }
  end

  @set_github_actions_permissions_organization_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set GitHub Actions permissions for an organization\n\nSets the GitHub Actions permissions policy for repositories and allowed actions and reusable workflows in an organization.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec set_github_actions_permissions_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_github_actions_permissions_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_set_github_actions_permissions_organization_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_github_actions_permissions_organization_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @set_github_actions_permissions_organization_partition_spec)

    %{
      id: "actions/set-github-actions-permissions-organization",
      args: params,
      call: {__MODULE__, :set_github_actions_permissions_organization},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/actions/permissions",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :set_github_actions_permissions_organization],
      timeout: nil,
      pagination: nil
    }
  end

  @set_github_actions_permissions_repository_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set GitHub Actions permissions for a repository\n\nSets the GitHub Actions permissions policy for enabling GitHub Actions and allowed actions and reusable workflows in the repository.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec set_github_actions_permissions_repository(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_github_actions_permissions_repository(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_set_github_actions_permissions_repository_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_github_actions_permissions_repository_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @set_github_actions_permissions_repository_partition_spec)

    %{
      id: "actions/set-github-actions-permissions-repository",
      args: params,
      call: {__MODULE__, :set_github_actions_permissions_repository},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/actions/permissions",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :set_github_actions_permissions_repository],
      timeout: nil,
      pagination: nil
    }
  end

  @set_private_repo_fork_pr_workflows_settings_organization_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set private repo fork PR workflow settings for an organization\n\nSets the settings for whether workflows from fork pull requests can run on private repositories in an organization."
  @spec set_private_repo_fork_pr_workflows_settings_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_private_repo_fork_pr_workflows_settings_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_set_private_repo_fork_pr_workflows_settings_organization_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_private_repo_fork_pr_workflows_settings_organization_request(
         client,
         params,
         opts
       )
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @set_private_repo_fork_pr_workflows_settings_organization_partition_spec
      )

    %{
      id: "actions/set-private-repo-fork-pr-workflows-settings-organization",
      args: params,
      call: {__MODULE__, :set_private_repo_fork_pr_workflows_settings_organization},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/actions/permissions/fork-pr-workflows-private-repos",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :set_private_repo_fork_pr_workflows_settings_organization],
      timeout: nil,
      pagination: nil
    }
  end

  @set_private_repo_fork_pr_workflows_settings_repository_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set private repo fork PR workflow settings for a repository\n\nSets the settings for whether workflows from fork pull requests can run on a private repository.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec set_private_repo_fork_pr_workflows_settings_repository(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_private_repo_fork_pr_workflows_settings_repository(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_set_private_repo_fork_pr_workflows_settings_repository_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_private_repo_fork_pr_workflows_settings_repository_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @set_private_repo_fork_pr_workflows_settings_repository_partition_spec
      )

    %{
      id: "actions/set-private-repo-fork-pr-workflows-settings-repository",
      args: params,
      call: {__MODULE__, :set_private_repo_fork_pr_workflows_settings_repository},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/actions/permissions/fork-pr-workflows-private-repos",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :set_private_repo_fork_pr_workflows_settings_repository],
      timeout: nil,
      pagination: nil
    }
  end

  @set_repo_access_to_self_hosted_runner_group_in_org_partition_spec %{
    path: [{"org", :org}, {"runner_group_id", :runner_group_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set repository access for a self-hosted runner group in an organization\n\nReplaces the list of repositories that have access to a self-hosted runner group configured in an organization.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec set_repo_access_to_self_hosted_runner_group_in_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_repo_access_to_self_hosted_runner_group_in_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_set_repo_access_to_self_hosted_runner_group_in_org_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_repo_access_to_self_hosted_runner_group_in_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @set_repo_access_to_self_hosted_runner_group_in_org_partition_spec
      )

    %{
      id: "actions/set-repo-access-to-self-hosted-runner-group-in-org",
      args: params,
      call: {__MODULE__, :set_repo_access_to_self_hosted_runner_group_in_org},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/actions/runner-groups/{runner_group_id}/repositories",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :set_repo_access_to_self_hosted_runner_group_in_org],
      timeout: nil,
      pagination: nil
    }
  end

  @set_selected_repos_for_org_secret_partition_spec %{
    path: [{"org", :org}, {"secret_name", :secret_name}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set selected repositories for an organization secret\n\nReplaces all repositories for an organization secret when the `visibility`\nfor repository access is set to `selected`. The visibility is set when you [Create\nor update an organization secret](https://docs.github.com/rest/actions/secrets#create-or-update-an-organization-secret).\n\nAuthenticated users must have collaborator access to a repository to create, update, or read secrets.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint. If the repository is private, the `repo` scope is also required."
  @spec set_selected_repos_for_org_secret(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_selected_repos_for_org_secret(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_set_selected_repos_for_org_secret_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_selected_repos_for_org_secret_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @set_selected_repos_for_org_secret_partition_spec)

    %{
      id: "actions/set-selected-repos-for-org-secret",
      args: params,
      call: {__MODULE__, :set_selected_repos_for_org_secret},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/actions/secrets/{secret_name}/repositories",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :set_selected_repos_for_org_secret],
      timeout: nil,
      pagination: nil
    }
  end

  @set_selected_repos_for_org_variable_partition_spec %{
    path: [{"org", :org}, {"name", :name}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set selected repositories for an organization variable\n\nReplaces all repositories for an organization variable that is available\nto selected repositories. Organization variables that are available to selected\nrepositories have their `visibility` field set to `selected`.\n\nAuthenticated users must have collaborator access to a repository to create, update, or read variables.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint. If the repository is private, the `repo` scope is also required."
  @spec set_selected_repos_for_org_variable(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_selected_repos_for_org_variable(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_set_selected_repos_for_org_variable_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_selected_repos_for_org_variable_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @set_selected_repos_for_org_variable_partition_spec)

    %{
      id: "actions/set-selected-repos-for-org-variable",
      args: params,
      call: {__MODULE__, :set_selected_repos_for_org_variable},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/actions/variables/{name}/repositories",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :set_selected_repos_for_org_variable],
      timeout: nil,
      pagination: nil
    }
  end

  @set_selected_repositories_enabled_github_actions_organization_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set selected repositories enabled for GitHub Actions in an organization\n\nReplaces the list of selected repositories that are enabled for GitHub Actions in an organization. To use this endpoint, the organization permission policy for `enabled_repositories` must be configured to `selected`. For more information, see \"[Set GitHub Actions permissions for an organization](#set-github-actions-permissions-for-an-organization).\"\n\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec set_selected_repositories_enabled_github_actions_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_selected_repositories_enabled_github_actions_organization(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_set_selected_repositories_enabled_github_actions_organization_request(
        client,
        params,
        opts
      )

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_selected_repositories_enabled_github_actions_organization_request(
         client,
         params,
         opts
       )
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @set_selected_repositories_enabled_github_actions_organization_partition_spec
      )

    %{
      id: "actions/set-selected-repositories-enabled-github-actions-organization",
      args: params,
      call: {__MODULE__, :set_selected_repositories_enabled_github_actions_organization},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/actions/permissions/repositories",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [
        :github_ex,
        :actions,
        :set_selected_repositories_enabled_github_actions_organization
      ],
      timeout: nil,
      pagination: nil
    }
  end

  @set_selected_repositories_self_hosted_runners_organization_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set repositories allowed to use self-hosted runners in an organization\n\nSets repositories that are allowed to use self-hosted runners in an organization.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope or the \"Actions policies\" fine-grained permission to use this endpoint."
  @spec set_selected_repositories_self_hosted_runners_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_selected_repositories_self_hosted_runners_organization(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_set_selected_repositories_self_hosted_runners_organization_request(
        client,
        params,
        opts
      )

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_selected_repositories_self_hosted_runners_organization_request(
         client,
         params,
         opts
       )
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @set_selected_repositories_self_hosted_runners_organization_partition_spec
      )

    %{
      id: "actions/set-selected-repositories-self-hosted-runners-organization",
      args: params,
      call: {__MODULE__, :set_selected_repositories_self_hosted_runners_organization},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/actions/permissions/self-hosted-runners/repositories",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [
        :github_ex,
        :actions,
        :set_selected_repositories_self_hosted_runners_organization
      ],
      timeout: nil,
      pagination: nil
    }
  end

  @set_self_hosted_runners_in_group_for_org_partition_spec %{
    path: [{"org", :org}, {"runner_group_id", :runner_group_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set self-hosted runners in a group for an organization\n\nReplaces the list of self-hosted runners that are part of an organization runner group.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec set_self_hosted_runners_in_group_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_self_hosted_runners_in_group_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_set_self_hosted_runners_in_group_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_self_hosted_runners_in_group_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @set_self_hosted_runners_in_group_for_org_partition_spec)

    %{
      id: "actions/set-self-hosted-runners-in-group-for-org",
      args: params,
      call: {__MODULE__, :set_self_hosted_runners_in_group_for_org},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/actions/runner-groups/{runner_group_id}/runners",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :set_self_hosted_runners_in_group_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @set_self_hosted_runners_permissions_organization_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set self-hosted runners settings for an organization\n\nSets the settings for self-hosted runners for an organization.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope or the \"Actions policies\" fine-grained permission to use this endpoint."
  @spec set_self_hosted_runners_permissions_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_self_hosted_runners_permissions_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_set_self_hosted_runners_permissions_organization_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_self_hosted_runners_permissions_organization_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @set_self_hosted_runners_permissions_organization_partition_spec
      )

    %{
      id: "actions/set-self-hosted-runners-permissions-organization",
      args: params,
      call: {__MODULE__, :set_self_hosted_runners_permissions_organization},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/actions/permissions/self-hosted-runners",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :set_self_hosted_runners_permissions_organization],
      timeout: nil,
      pagination: nil
    }
  end

  @set_workflow_access_to_repository_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set the level of access for workflows outside of the repository\n\nSets the level of access that workflows outside of the repository have to actions and reusable workflows in the repository.\nThis endpoint only applies to private repositories.\nFor more information, see \"[Allowing access to components in a private repository](https://docs.github.com/repositories/managing-your-repositorys-settings-and-features/enabling-features-for-your-repository/managing-github-actions-settings-for-a-repository#allowing-access-to-components-in-a-private-repository)\".\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec set_workflow_access_to_repository(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def set_workflow_access_to_repository(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_set_workflow_access_to_repository_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_set_workflow_access_to_repository_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @set_workflow_access_to_repository_partition_spec)

    %{
      id: "actions/set-workflow-access-to-repository",
      args: params,
      call: {__MODULE__, :set_workflow_access_to_repository},
      opts: opts,
      method: :put,
      path_template: "/repos/{owner}/{repo}/actions/permissions/access",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :set_workflow_access_to_repository],
      timeout: nil,
      pagination: nil
    }
  end

  @update_environment_variable_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"name", :name},
      {"environment_name", :environment_name}
    ],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update an environment variable\n\nUpdates an environment variable that you can reference in a GitHub Actions workflow.\n\nAuthenticated users must have collaborator access to a repository to create, update, or read variables.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec update_environment_variable(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_environment_variable(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_environment_variable_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_environment_variable_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_environment_variable_partition_spec)

    %{
      id: "actions/update-environment-variable",
      args: params,
      call: {__MODULE__, :update_environment_variable},
      opts: opts,
      method: :patch,
      path_template: "/repos/{owner}/{repo}/environments/{environment_name}/variables/{name}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :update_environment_variable],
      timeout: nil,
      pagination: nil
    }
  end

  @update_hosted_runner_for_org_partition_spec %{
    path: [{"org", :org}, {"hosted_runner_id", :hosted_runner_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update a GitHub-hosted runner for an organization\n\nUpdates a GitHub-hosted runner for an organization.\nOAuth app tokens and personal access tokens (classic) need the `manage_runners:org` scope to use this endpoint."
  @spec update_hosted_runner_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_hosted_runner_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_hosted_runner_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_hosted_runner_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_hosted_runner_for_org_partition_spec)

    %{
      id: "actions/update-hosted-runner-for-org",
      args: params,
      call: {__MODULE__, :update_hosted_runner_for_org},
      opts: opts,
      method: :patch,
      path_template: "/orgs/{org}/actions/hosted-runners/{hosted_runner_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :update_hosted_runner_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @update_org_variable_partition_spec %{
    path: [{"org", :org}, {"name", :name}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update an organization variable\n\nUpdates an organization variable that you can reference in a GitHub Actions workflow.\n\nAuthenticated users must have collaborator access to a repository to create, update, or read variables.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint. If the repository is private, the `repo` scope is also required."
  @spec update_org_variable(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_org_variable(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_org_variable_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_org_variable_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_org_variable_partition_spec)

    %{
      id: "actions/update-org-variable",
      args: params,
      call: {__MODULE__, :update_org_variable},
      opts: opts,
      method: :patch,
      path_template: "/orgs/{org}/actions/variables/{name}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :update_org_variable],
      timeout: nil,
      pagination: nil
    }
  end

  @update_repo_variable_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"name", :name}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update a repository variable\n\nUpdates a repository variable that you can reference in a GitHub Actions workflow.\n\nAuthenticated users must have collaborator access to a repository to create, update, or read variables.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec update_repo_variable(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_repo_variable(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_repo_variable_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_repo_variable_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_repo_variable_partition_spec)

    %{
      id: "actions/update-repo-variable",
      args: params,
      call: {__MODULE__, :update_repo_variable},
      opts: opts,
      method: :patch,
      path_template: "/repos/{owner}/{repo}/actions/variables/{name}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :update_repo_variable],
      timeout: nil,
      pagination: nil
    }
  end

  @update_self_hosted_runner_group_for_org_partition_spec %{
    path: [{"org", :org}, {"runner_group_id", :runner_group_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update a self-hosted runner group for an organization\n\nUpdates the `name` and `visibility` of a self-hosted runner group in an organization.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec update_self_hosted_runner_group_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def update_self_hosted_runner_group_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_self_hosted_runner_group_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_self_hosted_runner_group_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @update_self_hosted_runner_group_for_org_partition_spec)

    %{
      id: "actions/update-self-hosted-runner-group-for-org",
      args: params,
      call: {__MODULE__, :update_self_hosted_runner_group_for_org},
      opts: opts,
      method: :patch,
      path_template: "/orgs/{org}/actions/runner-groups/{runner_group_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :actions, :update_self_hosted_runner_group_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @spec normalize_request_opts!(list()) :: keyword()
  defp normalize_request_opts!(opts) when is_list(opts) do
    if Keyword.keyword?(opts) do
      opts
    else
      raise ArgumentError, "request opts must be a keyword list"
    end
  end
end

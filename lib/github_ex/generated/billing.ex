defmodule GitHubEx.Billing do
  @moduledoc """
  Generated Github Ex operations for billing.
  """

  @delete_budget_org_partition_spec %{
    path: [{"org", :org}, {"budget_id", :budget_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Delete a budget for an organization\n\n> [!NOTE]\n> This endpoint is in public preview and is subject to change.\n\nDeletes a budget by ID for an organization. The authenticated user must be an organization admin or billing manager."
  @spec delete_budget_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_budget_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_delete_budget_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_delete_budget_org_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_budget_org_partition_spec)

    Pristine.Operation.new(%{
      id: "billing/delete-budget-org",
      method: :delete,
      path_template: "/organizations/{org}/settings/billing/budgets/{budget_id}",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :billing, :delete_budget_org],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_all_budgets_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"page", :page}, {"per_page", :per_page}, {"scope", :scope}],
    headers: []
  }

  @doc "Get all budgets for an organization\n\n> [!NOTE]\n> This endpoint is in public preview and is subject to change.\n\nGets all budgets for an organization. The authenticated user must be an organization admin or billing manager.\nEach page returns up to 10 budgets."
  @spec get_all_budgets_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_all_budgets_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_all_budgets_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_get_all_budgets_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_get_all_budgets_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_get_all_budgets_org_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          case Pristine.execute(runtime_client, operation, opts) do
            {:ok, response} ->
              items = List.wrap(Pristine.Operation.items(operation, response))
              {items, Pristine.Operation.next_page(operation, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_get_all_budgets_org_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_all_budgets_org_partition_spec)

    Pristine.Operation.new(%{
      id: "billing/get-all-budgets-org",
      method: :get,
      path_template: "/organizations/{org}/settings/billing/budgets",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :billing, :get_all_budgets_org],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: ["budgets"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
  end

  @get_budget_org_partition_spec %{
    path: [{"org", :org}, {"budget_id", :budget_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get a budget by ID for an organization\n\n> [!NOTE]\n> This endpoint is in public preview and is subject to change.\n\nGets a budget by ID. The authenticated user must be an organization admin or billing manager."
  @spec get_budget_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_budget_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_budget_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_budget_org_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_budget_org_partition_spec)

    Pristine.Operation.new(%{
      id: "billing/get-budget-org",
      method: :get,
      path_template: "/organizations/{org}/settings/billing/budgets/{budget_id}",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :billing, :get_budget_org],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_github_billing_premium_request_usage_report_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [
      {"year", :year},
      {"month", :month},
      {"day", :day},
      {"user", :user},
      {"model", :model},
      {"product", :product}
    ],
    headers: []
  }

  @doc "Get billing premium request usage report for an organization\n\nGets a report of premium request usage for an organization. To use this endpoint, you must be an administrator of an organization within an enterprise or an organization account.\n\n**Note:** Only data from the past 24 months is accessible via this endpoint."
  @spec get_github_billing_premium_request_usage_report_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_github_billing_premium_request_usage_report_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_github_billing_premium_request_usage_report_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_github_billing_premium_request_usage_report_org_operation(params)
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @get_github_billing_premium_request_usage_report_org_partition_spec
      )

    Pristine.Operation.new(%{
      id: "billing/get-github-billing-premium-request-usage-report-org",
      method: :get,
      path_template: "/organizations/{org}/settings/billing/premium_request/usage",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [
          :github_ex,
          :billing,
          :get_github_billing_premium_request_usage_report_org
        ],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_github_billing_premium_request_usage_report_user_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [
      {"year", :year},
      {"month", :month},
      {"day", :day},
      {"model", :model},
      {"product", :product}
    ],
    headers: []
  }

  @doc "Get billing premium request usage report for a user\n\nGets a report of premium request usage for a user.\n\n**Note:** Only data from the past 24 months is accessible via this endpoint."
  @spec get_github_billing_premium_request_usage_report_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_github_billing_premium_request_usage_report_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_github_billing_premium_request_usage_report_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_github_billing_premium_request_usage_report_user_operation(params)
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @get_github_billing_premium_request_usage_report_user_partition_spec
      )

    Pristine.Operation.new(%{
      id: "billing/get-github-billing-premium-request-usage-report-user",
      method: :get,
      path_template: "/users/{username}/settings/billing/premium_request/usage",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [
          :github_ex,
          :billing,
          :get_github_billing_premium_request_usage_report_user
        ],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_github_billing_usage_report_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"year", :year}, {"month", :month}, {"day", :day}],
    headers: []
  }

  @doc "Get billing usage report for an organization\n\nGets a report of the total usage for an organization. To use this endpoint, you must be an administrator of an organization within an enterprise or an organization account.\n\n**Note:** This endpoint is only available to organizations with access to the enhanced billing platform. For more information, see \"[About the enhanced billing platform](https://docs.github.com/billing/using-the-new-billing-platform).\""
  @spec get_github_billing_usage_report_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_github_billing_usage_report_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_github_billing_usage_report_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_github_billing_usage_report_org_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @get_github_billing_usage_report_org_partition_spec)

    Pristine.Operation.new(%{
      id: "billing/get-github-billing-usage-report-org",
      method: :get,
      path_template: "/organizations/{org}/settings/billing/usage",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :billing, :get_github_billing_usage_report_org],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_github_billing_usage_report_user_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"year", :year}, {"month", :month}, {"day", :day}],
    headers: []
  }

  @doc "Get billing usage report for a user\n\nGets a report of the total usage for a user.\n\n**Note:** This endpoint is only available to users with access to the enhanced billing platform."
  @spec get_github_billing_usage_report_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_github_billing_usage_report_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_github_billing_usage_report_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_github_billing_usage_report_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @get_github_billing_usage_report_user_partition_spec)

    Pristine.Operation.new(%{
      id: "billing/get-github-billing-usage-report-user",
      method: :get,
      path_template: "/users/{username}/settings/billing/usage",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :billing, :get_github_billing_usage_report_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_github_billing_usage_summary_report_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [
      {"year", :year},
      {"month", :month},
      {"day", :day},
      {"repository", :repository},
      {"product", :product},
      {"sku", :sku}
    ],
    headers: []
  }

  @doc "Get billing usage summary for an organization\n\n> [!NOTE]\n> This endpoint is in public preview and is subject to change.\n\nGets a summary report of usage for an organization. To use this endpoint, you must be an administrator of an organization within an enterprise or an organization account.\n\n**Note:** Only data from the past 24 months is accessible via this endpoint."
  @spec get_github_billing_usage_summary_report_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_github_billing_usage_summary_report_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_github_billing_usage_summary_report_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_github_billing_usage_summary_report_org_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @get_github_billing_usage_summary_report_org_partition_spec
      )

    Pristine.Operation.new(%{
      id: "billing/get-github-billing-usage-summary-report-org",
      method: :get,
      path_template: "/organizations/{org}/settings/billing/usage/summary",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :billing, :get_github_billing_usage_summary_report_org],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_github_billing_usage_summary_report_user_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [
      {"year", :year},
      {"month", :month},
      {"day", :day},
      {"repository", :repository},
      {"product", :product},
      {"sku", :sku}
    ],
    headers: []
  }

  @doc "Get billing usage summary for a user\n\n> [!NOTE]\n> This endpoint is in public preview and is subject to change.\n\nGets a summary report of usage for a user.\n\n**Note:** Only data from the past 24 months is accessible via this endpoint."
  @spec get_github_billing_usage_summary_report_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_github_billing_usage_summary_report_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_github_billing_usage_summary_report_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_github_billing_usage_summary_report_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @get_github_billing_usage_summary_report_user_partition_spec
      )

    Pristine.Operation.new(%{
      id: "billing/get-github-billing-usage-summary-report-user",
      method: :get,
      path_template: "/users/{username}/settings/billing/usage/summary",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :billing, :get_github_billing_usage_summary_report_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @update_budget_org_partition_spec %{
    path: [{"org", :org}, {"budget_id", :budget_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Update a budget for an organization\n\n> [!NOTE]\n> This endpoint is in public preview and is subject to change.\n\nUpdates an existing budget for an organization. The authenticated user must be an organization admin or billing manager."
  @spec update_budget_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_budget_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_update_budget_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_update_budget_org_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @update_budget_org_partition_spec)

    Pristine.Operation.new(%{
      id: "billing/update-budget-org",
      method: :patch,
      path_template: "/organizations/{org}/settings/billing/budgets/{budget_id}",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :billing, :update_budget_org],
        timeout_ms: nil
      },
      pagination: nil
    })
  end
end

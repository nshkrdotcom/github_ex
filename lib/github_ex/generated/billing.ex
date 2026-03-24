defmodule GitHubEx.Billing do
  @moduledoc """
  Generated Github Ex operations for billing.
  """

  alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient

  @delete_budget_org_partition_spec %{
    path: [{"org", :org}, {"budget_id", :budget_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a budget for an organization\n\n> [!NOTE]\n> This endpoint is in public preview and is subject to change.\n\nDeletes a budget by ID for an organization. The authenticated user must be an organization admin or billing manager."
  @spec delete_budget_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_budget_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_budget_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_budget_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @delete_budget_org_partition_spec)

    %{
      id: "billing/delete-budget-org",
      args: params,
      call: {__MODULE__, :delete_budget_org},
      opts: opts,
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
      resource: "core_api",
      retry: "github.delete",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :billing, :delete_budget_org],
      timeout: nil,
      pagination: nil
    }
  end

  @get_all_budgets_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"page", :page}, {"per_page", :per_page}, {"scope", :scope}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get all budgets for an organization\n\n> [!NOTE]\n> This endpoint is in public preview and is subject to change.\n\nGets all budgets for an organization. The authenticated user must be an organization admin or billing manager.\nEach page returns up to 10 budgets."
  @spec get_all_budgets_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_all_budgets_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_all_budgets_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_get_all_budgets_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_get_all_budgets_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_get_all_budgets_org_request(client, params, opts) end,
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

  defp build_get_all_budgets_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_all_budgets_org_partition_spec)

    %{
      id: "billing/get-all-budgets-org",
      args: params,
      call: {__MODULE__, :get_all_budgets_org},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :billing, :get_all_budgets_org],
      timeout: nil,
      pagination: %{
        default_limit: nil,
        items_path: ["budgets"],
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    }
  end

  @get_budget_org_partition_spec %{
    path: [{"org", :org}, {"budget_id", :budget_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a budget by ID for an organization\n\n> [!NOTE]\n> This endpoint is in public preview and is subject to change.\n\nGets a budget by ID. The authenticated user must be an organization admin or billing manager."
  @spec get_budget_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_budget_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_budget_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_budget_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_budget_org_partition_spec)

    %{
      id: "billing/get-budget-org",
      args: params,
      call: {__MODULE__, :get_budget_org},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :billing, :get_budget_org],
      timeout: nil,
      pagination: nil
    }
  end

  @get_github_billing_premium_request_usage_report_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"year", :year},
      {"month", :month},
      {"day", :day},
      {"user", :user},
      {"model", :model},
      {"product", :product}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get billing premium request usage report for an organization\n\nGets a report of premium request usage for an organization. To use this endpoint, you must be an administrator of an organization within an enterprise or an organization account.\n\n**Note:** Only data from the past 24 months is accessible via this endpoint."
  @spec get_github_billing_premium_request_usage_report_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_github_billing_premium_request_usage_report_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_get_github_billing_premium_request_usage_report_org_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_github_billing_premium_request_usage_report_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @get_github_billing_premium_request_usage_report_org_partition_spec
      )

    %{
      id: "billing/get-github-billing-premium-request-usage-report-org",
      args: params,
      call: {__MODULE__, :get_github_billing_premium_request_usage_report_org},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :billing, :get_github_billing_premium_request_usage_report_org],
      timeout: nil,
      pagination: nil
    }
  end

  @get_github_billing_premium_request_usage_report_user_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"year", :year},
      {"month", :month},
      {"day", :day},
      {"model", :model},
      {"product", :product}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get billing premium request usage report for a user\n\nGets a report of premium request usage for a user.\n\n**Note:** Only data from the past 24 months is accessible via this endpoint."
  @spec get_github_billing_premium_request_usage_report_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_github_billing_premium_request_usage_report_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_get_github_billing_premium_request_usage_report_user_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_github_billing_premium_request_usage_report_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @get_github_billing_premium_request_usage_report_user_partition_spec
      )

    %{
      id: "billing/get-github-billing-premium-request-usage-report-user",
      args: params,
      call: {__MODULE__, :get_github_billing_premium_request_usage_report_user},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :billing, :get_github_billing_premium_request_usage_report_user],
      timeout: nil,
      pagination: nil
    }
  end

  @get_github_billing_usage_report_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"year", :year}, {"month", :month}, {"day", :day}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get billing usage report for an organization\n\nGets a report of the total usage for an organization. To use this endpoint, you must be an administrator of an organization within an enterprise or an organization account.\n\n**Note:** This endpoint is only available to organizations with access to the enhanced billing platform. For more information, see \"[About the enhanced billing platform](https://docs.github.com/billing/using-the-new-billing-platform).\""
  @spec get_github_billing_usage_report_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_github_billing_usage_report_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_github_billing_usage_report_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_github_billing_usage_report_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @get_github_billing_usage_report_org_partition_spec)

    %{
      id: "billing/get-github-billing-usage-report-org",
      args: params,
      call: {__MODULE__, :get_github_billing_usage_report_org},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :billing, :get_github_billing_usage_report_org],
      timeout: nil,
      pagination: nil
    }
  end

  @get_github_billing_usage_report_user_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"year", :year}, {"month", :month}, {"day", :day}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get billing usage report for a user\n\nGets a report of the total usage for a user.\n\n**Note:** This endpoint is only available to users with access to the enhanced billing platform."
  @spec get_github_billing_usage_report_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_github_billing_usage_report_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_github_billing_usage_report_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_github_billing_usage_report_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @get_github_billing_usage_report_user_partition_spec)

    %{
      id: "billing/get-github-billing-usage-report-user",
      args: params,
      call: {__MODULE__, :get_github_billing_usage_report_user},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :billing, :get_github_billing_usage_report_user],
      timeout: nil,
      pagination: nil
    }
  end

  @get_github_billing_usage_summary_report_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"year", :year},
      {"month", :month},
      {"day", :day},
      {"repository", :repository},
      {"product", :product},
      {"sku", :sku}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get billing usage summary for an organization\n\n> [!NOTE]\n> This endpoint is in public preview and is subject to change.\n\nGets a summary report of usage for an organization. To use this endpoint, you must be an administrator of an organization within an enterprise or an organization account.\n\n**Note:** Only data from the past 24 months is accessible via this endpoint."
  @spec get_github_billing_usage_summary_report_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_github_billing_usage_summary_report_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_github_billing_usage_summary_report_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_github_billing_usage_summary_report_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @get_github_billing_usage_summary_report_org_partition_spec)

    %{
      id: "billing/get-github-billing-usage-summary-report-org",
      args: params,
      call: {__MODULE__, :get_github_billing_usage_summary_report_org},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :billing, :get_github_billing_usage_summary_report_org],
      timeout: nil,
      pagination: nil
    }
  end

  @get_github_billing_usage_summary_report_user_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"year", :year},
      {"month", :month},
      {"day", :day},
      {"repository", :repository},
      {"product", :product},
      {"sku", :sku}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get billing usage summary for a user\n\n> [!NOTE]\n> This endpoint is in public preview and is subject to change.\n\nGets a summary report of usage for a user.\n\n**Note:** Only data from the past 24 months is accessible via this endpoint."
  @spec get_github_billing_usage_summary_report_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_github_billing_usage_summary_report_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_github_billing_usage_summary_report_user_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_github_billing_usage_summary_report_user_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @get_github_billing_usage_summary_report_user_partition_spec
      )

    %{
      id: "billing/get-github-billing-usage-summary-report-user",
      args: params,
      call: {__MODULE__, :get_github_billing_usage_summary_report_user},
      opts: opts,
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
      resource: "core_api",
      retry: "github.read",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :billing, :get_github_billing_usage_summary_report_user],
      timeout: nil,
      pagination: nil
    }
  end

  @update_budget_org_partition_spec %{
    path: [{"org", :org}, {"budget_id", :budget_id}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Update a budget for an organization\n\n> [!NOTE]\n> This endpoint is in public preview and is subject to change.\n\nUpdates an existing budget for an organization. The authenticated user must be an organization admin or billing manager."
  @spec update_budget_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_budget_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_budget_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_budget_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @update_budget_org_partition_spec)

    %{
      id: "billing/update-budget-org",
      args: params,
      call: {__MODULE__, :update_budget_org},
      opts: opts,
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :billing, :update_budget_org],
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

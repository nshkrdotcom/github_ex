defmodule GitHubEx.Oidc do
  @moduledoc """
  Generated Github Ex operations for oidc.
  """

  alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient

  @create_oidc_custom_property_inclusion_for_enterprise_partition_spec %{
    path: [{"enterprise", :enterprise}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create an OIDC custom property inclusion for an enterprise\n\nAdds a repository custom property to be included in the OIDC token for repository actions in an enterprise.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:enterprise` scope to use this endpoint."
  @spec create_oidc_custom_property_inclusion_for_enterprise(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def create_oidc_custom_property_inclusion_for_enterprise(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_create_oidc_custom_property_inclusion_for_enterprise_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_oidc_custom_property_inclusion_for_enterprise_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @create_oidc_custom_property_inclusion_for_enterprise_partition_spec
      )

    %{
      id: "oidc/create-oidc-custom-property-inclusion-for-enterprise",
      args: params,
      call: {__MODULE__, :create_oidc_custom_property_inclusion_for_enterprise},
      opts: opts,
      method: :post,
      path_template: "/enterprises/{enterprise}/actions/oidc/customization/properties/repo",
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
      telemetry: [:github_ex, :oidc, :create_oidc_custom_property_inclusion_for_enterprise],
      timeout: nil,
      pagination: nil
    }
  end

  @create_oidc_custom_property_inclusion_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Create an OIDC custom property inclusion for an organization\n\nAdds a repository custom property to be included in the OIDC token for repository actions in an organization.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec create_oidc_custom_property_inclusion_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def create_oidc_custom_property_inclusion_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_create_oidc_custom_property_inclusion_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_create_oidc_custom_property_inclusion_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @create_oidc_custom_property_inclusion_for_org_partition_spec
      )

    %{
      id: "oidc/create-oidc-custom-property-inclusion-for-org",
      args: params,
      call: {__MODULE__, :create_oidc_custom_property_inclusion_for_org},
      opts: opts,
      method: :post,
      path_template: "/orgs/{org}/actions/oidc/customization/properties/repo",
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
      telemetry: [:github_ex, :oidc, :create_oidc_custom_property_inclusion_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_oidc_custom_property_inclusion_for_enterprise_partition_spec %{
    path: [
      {"enterprise", :enterprise},
      {"custom_property_name", :custom_property_name}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete an OIDC custom property inclusion for an enterprise\n\nRemoves a repository custom property from being included in the OIDC token for repository actions in an enterprise.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:enterprise` scope to use this endpoint."
  @spec delete_oidc_custom_property_inclusion_for_enterprise(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def delete_oidc_custom_property_inclusion_for_enterprise(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_delete_oidc_custom_property_inclusion_for_enterprise_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_oidc_custom_property_inclusion_for_enterprise_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @delete_oidc_custom_property_inclusion_for_enterprise_partition_spec
      )

    %{
      id: "oidc/delete-oidc-custom-property-inclusion-for-enterprise",
      args: params,
      call: {__MODULE__, :delete_oidc_custom_property_inclusion_for_enterprise},
      opts: opts,
      method: :delete,
      path_template:
        "/enterprises/{enterprise}/actions/oidc/customization/properties/repo/{custom_property_name}",
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
      telemetry: [:github_ex, :oidc, :delete_oidc_custom_property_inclusion_for_enterprise],
      timeout: nil,
      pagination: nil
    }
  end

  @delete_oidc_custom_property_inclusion_for_org_partition_spec %{
    path: [{"org", :org}, {"custom_property_name", :custom_property_name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete an OIDC custom property inclusion for an organization\n\nRemoves a repository custom property from being included in the OIDC token for repository actions in an organization.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:org` scope to use this endpoint."
  @spec delete_oidc_custom_property_inclusion_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def delete_oidc_custom_property_inclusion_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_delete_oidc_custom_property_inclusion_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_delete_oidc_custom_property_inclusion_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @delete_oidc_custom_property_inclusion_for_org_partition_spec
      )

    %{
      id: "oidc/delete-oidc-custom-property-inclusion-for-org",
      args: params,
      call: {__MODULE__, :delete_oidc_custom_property_inclusion_for_org},
      opts: opts,
      method: :delete,
      path_template:
        "/orgs/{org}/actions/oidc/customization/properties/repo/{custom_property_name}",
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
      telemetry: [:github_ex, :oidc, :delete_oidc_custom_property_inclusion_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @get_oidc_custom_sub_template_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get the customization template for an OIDC subject claim for an organization\n\nGets the customization template for an OpenID Connect (OIDC) subject claim.\n\nOAuth app tokens and personal access tokens (classic) need the `read:org` scope to use this endpoint."
  @spec get_oidc_custom_sub_template_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_oidc_custom_sub_template_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_oidc_custom_sub_template_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_oidc_custom_sub_template_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @get_oidc_custom_sub_template_for_org_partition_spec)

    %{
      id: "oidc/get-oidc-custom-sub-template-for-org",
      args: params,
      call: {__MODULE__, :get_oidc_custom_sub_template_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/oidc/customization/sub",
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
      telemetry: [:github_ex, :oidc, :get_oidc_custom_sub_template_for_org],
      timeout: nil,
      pagination: nil
    }
  end

  @list_oidc_custom_property_inclusions_for_enterprise_partition_spec %{
    path: [{"enterprise", :enterprise}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List OIDC custom property inclusions for an enterprise\n\nLists the repository custom properties that are included in the OIDC token for repository actions in an enterprise.\n\nOAuth app tokens and personal access tokens (classic) need the `admin:enterprise` scope to use this endpoint."
  @spec list_oidc_custom_property_inclusions_for_enterprise(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_oidc_custom_property_inclusions_for_enterprise(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    request =
      build_list_oidc_custom_property_inclusions_for_enterprise_request(client, params, opts)

    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_oidc_custom_property_inclusions_for_enterprise(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_list_oidc_custom_property_inclusions_for_enterprise(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn ->
        build_list_oidc_custom_property_inclusions_for_enterprise_request(client, params, opts)
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

  defp build_list_oidc_custom_property_inclusions_for_enterprise_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @list_oidc_custom_property_inclusions_for_enterprise_partition_spec
      )

    %{
      id: "oidc/list-oidc-custom-property-inclusions-for-enterprise",
      args: params,
      call: {__MODULE__, :list_oidc_custom_property_inclusions_for_enterprise},
      opts: opts,
      method: :get,
      path_template: "/enterprises/{enterprise}/actions/oidc/customization/properties/repo",
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
      telemetry: [:github_ex, :oidc, :list_oidc_custom_property_inclusions_for_enterprise],
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

  @list_oidc_custom_property_inclusions_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List OIDC custom property inclusions for an organization\n\nLists the repository custom properties that are included in the OIDC token for repository actions in an organization.\n\nOAuth app tokens and personal access tokens (classic) need the `read:org` scope to use this endpoint."
  @spec list_oidc_custom_property_inclusions_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_oidc_custom_property_inclusions_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_list_oidc_custom_property_inclusions_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  @spec stream_list_oidc_custom_property_inclusions_for_org(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_list_oidc_custom_property_inclusions_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)

    Stream.resource(
      fn -> build_list_oidc_custom_property_inclusions_for_org_request(client, params, opts) end,
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

  defp build_list_oidc_custom_property_inclusions_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(
        params,
        @list_oidc_custom_property_inclusions_for_org_partition_spec
      )

    %{
      id: "oidc/list-oidc-custom-property-inclusions-for-org",
      args: params,
      call: {__MODULE__, :list_oidc_custom_property_inclusions_for_org},
      opts: opts,
      method: :get,
      path_template: "/orgs/{org}/actions/oidc/customization/properties/repo",
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
      telemetry: [:github_ex, :oidc, :list_oidc_custom_property_inclusions_for_org],
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

  @update_oidc_custom_sub_template_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Set the customization template for an OIDC subject claim for an organization\n\nCreates or updates the customization template for an OpenID Connect (OIDC) subject claim.\n\nOAuth app tokens and personal access tokens (classic) need the `write:org` scope to use this endpoint."
  @spec update_oidc_custom_sub_template_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def update_oidc_custom_sub_template_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_update_oidc_custom_sub_template_for_org_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_update_oidc_custom_sub_template_for_org_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client

    partition =
      OpenAPIClient.partition(params, @update_oidc_custom_sub_template_for_org_partition_spec)

    %{
      id: "oidc/update-oidc-custom-sub-template-for-org",
      args: params,
      call: {__MODULE__, :update_oidc_custom_sub_template_for_org},
      opts: opts,
      method: :put,
      path_template: "/orgs/{org}/actions/oidc/customization/sub",
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
      telemetry: [:github_ex, :oidc, :update_oidc_custom_sub_template_for_org],
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

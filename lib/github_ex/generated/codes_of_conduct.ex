defmodule GitHubEx.CodesOfConduct do
  @moduledoc """
  Generated Github Ex operations for codes of conduct.
  """

  alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient

  @get_all_codes_of_conduct_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get all codes of conduct\n\nReturns array of all GitHub's codes of conduct."
  @spec get_all_codes_of_conduct(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_all_codes_of_conduct(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_all_codes_of_conduct_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_all_codes_of_conduct_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_all_codes_of_conduct_partition_spec)

    %{
      id: "codes-of-conduct/get-all-codes-of-conduct",
      args: params,
      call: {__MODULE__, :get_all_codes_of_conduct},
      opts: opts,
      method: :get,
      path_template: "/codes_of_conduct",
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
      telemetry: [:github_ex, :codes_of_conduct, :get_all_codes_of_conduct],
      timeout: nil,
      pagination: nil
    }
  end

  @get_conduct_code_partition_spec %{
    path: [{"key", :key}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a code of conduct\n\nReturns information about the specified GitHub code of conduct."
  @spec get_conduct_code(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_conduct_code(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_get_conduct_code_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_get_conduct_code_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @get_conduct_code_partition_spec)

    %{
      id: "codes-of-conduct/get-conduct-code",
      args: params,
      call: {__MODULE__, :get_conduct_code},
      opts: opts,
      method: :get,
      path_template: "/codes_of_conduct/{key}",
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
      telemetry: [:github_ex, :codes_of_conduct, :get_conduct_code],
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

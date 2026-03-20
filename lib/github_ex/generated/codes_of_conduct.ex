defmodule GitHubEx.CodesOfConduct do
  @moduledoc """
  Generated Github Ex operations for codes of conduct.
  """

  @get_all_codes_of_conduct_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get all codes of conduct\n\nReturns array of all GitHub's codes of conduct."
  @spec get_all_codes_of_conduct(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_all_codes_of_conduct(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_all_codes_of_conduct_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_all_codes_of_conduct_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_all_codes_of_conduct_partition_spec)

    Pristine.Operation.new(%{
      id: "codes-of-conduct/get-all-codes-of-conduct",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :codes_of_conduct, :get_all_codes_of_conduct],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_conduct_code_partition_spec %{
    path: [{"key", :key}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get a code of conduct\n\nReturns information about the specified GitHub code of conduct."
  @spec get_conduct_code(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_conduct_code(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_conduct_code_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_conduct_code_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_conduct_code_partition_spec)

    Pristine.Operation.new(%{
      id: "codes-of-conduct/get-conduct-code",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :codes_of_conduct, :get_conduct_code],
        timeout_ms: nil
      },
      pagination: nil
    })
  end
end

defmodule GitHubEx.CodesOfConduct do
  @moduledoc """
  Generated GitHub REST operations for the `CodesOfConduct` namespace.

  ## Operations

  * `codes-of-conduct/get-all-codes-of-conduct`
  * `codes-of-conduct/get-conduct-code`
  """

  @type result :: {:ok, term()} | {:error, GitHubEx.Error.t()}

  @doc "Get all codes of conduct\n\nPath: /codes_of_conduct\n\nMethod: get"
  @spec get_all_codes_of_conduct(GitHubEx.Client.t()) :: result
  @spec get_all_codes_of_conduct(GitHubEx.Client.t(), map()) :: result
  def get_all_codes_of_conduct(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.CodesOfConduct, :get_all_codes_of_conduct},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/codes_of_conduct",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a code of conduct\n\nPath: /codes_of_conduct/{key}\n\nMethod: get"
  @spec get_conduct_code(GitHubEx.Client.t()) :: result
  @spec get_conduct_code(GitHubEx.Client.t(), map()) :: result
  def get_conduct_code(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.CodesOfConduct, :get_conduct_code},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"key", :key}],
      path_template: "/codes_of_conduct/{key}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end
end

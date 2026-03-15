defmodule GitHubSDK.CodesOfConduct do
  @moduledoc """
  Generated GitHub REST operations for the `CodesOfConduct` namespace.

  ## Operations

  * `codes-of-conduct/get-all-codes-of-conduct`
  * `codes-of-conduct/get-conduct-code`
  """

  @type result :: {:ok, term()} | {:error, GitHubSDK.Error.t()}

  @doc "Get all codes of conduct\n\nPath: /codes_of_conduct\n\nMethod: get"
  @spec get_all_codes_of_conduct(GitHubSDK.Client.t()) :: result
  @spec get_all_codes_of_conduct(GitHubSDK.Client.t(), map()) :: result
  def get_all_codes_of_conduct(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.CodesOfConduct, :get_all_codes_of_conduct},
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
  @spec get_conduct_code(GitHubSDK.Client.t()) :: result
  @spec get_conduct_code(GitHubSDK.Client.t(), map()) :: result
  def get_conduct_code(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.CodesOfConduct, :get_conduct_code},
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

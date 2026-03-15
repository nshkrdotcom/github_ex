defmodule GitHubSDK.Emojis do
  @moduledoc """
  Generated GitHub REST operations for the `Emojis` namespace.

  ## Operations

  * `emojis/get`
  """

  @type result :: {:ok, term()} | {:error, GitHubSDK.Error.t()}

  @doc "Get emojis\n\nPath: /emojis\n\nMethod: get"
  @spec get(GitHubSDK.Client.t()) :: result
  @spec get(GitHubSDK.Client.t(), map()) :: result
  def get(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Emojis, :get},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/emojis",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end
end

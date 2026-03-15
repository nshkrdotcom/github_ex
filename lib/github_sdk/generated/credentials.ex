defmodule GitHubSDK.Credentials do
  @moduledoc """
  Generated GitHub REST operations for the `Credentials` namespace.

  ## Operations

  * `credentials/revoke`
  """

  @type result :: {:ok, term()} | {:error, GitHubSDK.Error.t()}

  @doc "Revoke a list of credentials\n\nPath: /credentials/revoke\n\nMethod: post"
  @spec revoke(GitHubSDK.Client.t()) :: result
  @spec revoke(GitHubSDK.Client.t(), map()) :: result
  def revoke(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubSDK.Credentials, :revoke},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [],
      path_template: "/credentials/revoke",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

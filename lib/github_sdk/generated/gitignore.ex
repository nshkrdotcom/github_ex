defmodule GitHubSDK.Gitignore do
  @moduledoc """
  Generated GitHub REST operations for the `Gitignore` namespace.

  ## Operations

  * `gitignore/get-all-templates`
  * `gitignore/get-template`
  """

  @type result :: {:ok, term()} | {:error, GitHubSDK.Error.t()}

  @doc "Get all gitignore templates\n\nPath: /gitignore/templates\n\nMethod: get"
  @spec get_all_templates(GitHubSDK.Client.t()) :: result
  @spec get_all_templates(GitHubSDK.Client.t(), map()) :: result
  def get_all_templates(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Gitignore, :get_all_templates},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/gitignore/templates",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get a gitignore template\n\nPath: /gitignore/templates/{name}\n\nMethod: get"
  @spec get_template(GitHubSDK.Client.t()) :: result
  @spec get_template(GitHubSDK.Client.t(), map()) :: result
  def get_template(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Gitignore, :get_template},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"name", :name}],
      path_template: "/gitignore/templates/{name}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end
end

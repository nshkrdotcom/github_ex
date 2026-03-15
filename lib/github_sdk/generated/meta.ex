defmodule GitHubSDK.Meta do
  @moduledoc """
  Generated GitHub REST operations for the `Meta` namespace.

  ## Operations

  * `meta/root`
  * `meta/get`
  * `meta/get-octocat`
  * `meta/get-all-versions`
  * `meta/get-zen`
  """

  @type result :: {:ok, term()} | {:error, GitHubSDK.Error.t()}

  @doc "Get GitHub meta information\n\nPath: /meta\n\nMethod: get"
  @spec get(GitHubSDK.Client.t()) :: result
  @spec get(GitHubSDK.Client.t(), map()) :: result
  def get(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Meta, :get},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/meta",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get all API versions\n\nPath: /versions\n\nMethod: get"
  @spec get_all_versions(GitHubSDK.Client.t()) :: result
  @spec get_all_versions(GitHubSDK.Client.t(), map()) :: result
  def get_all_versions(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Meta, :get_all_versions},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/versions",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get Octocat\n\nPath: /octocat\n\nMethod: get"
  @spec get_octocat(GitHubSDK.Client.t()) :: result
  @spec get_octocat(GitHubSDK.Client.t(), map()) :: result
  def get_octocat(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Meta, :get_octocat},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/octocat",
      query: [{"s", :s}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get the Zen of GitHub\n\nPath: /zen\n\nMethod: get"
  @spec get_zen(GitHubSDK.Client.t()) :: result
  @spec get_zen(GitHubSDK.Client.t(), map()) :: result
  def get_zen(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Meta, :get_zen},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/zen",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "GitHub API Root\n\nPath: /\n\nMethod: get"
  @spec root(GitHubSDK.Client.t()) :: result
  @spec root(GitHubSDK.Client.t(), map()) :: result
  def root(client, params \\ %{}) when is_map(params) do
    GitHubSDK.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubSDK.Meta, :root},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end
end

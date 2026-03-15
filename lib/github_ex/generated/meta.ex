defmodule GitHubEx.Meta do
  @moduledoc """
  Generated GitHub REST operations for the `Meta` namespace.

  ## Operations

  * `meta/root`
  * `meta/get`
  * `meta/get-octocat`
  * `meta/get-all-versions`
  * `meta/get-zen`
  """

  @type result :: {:ok, term()} | {:error, GitHubEx.Error.t()}

  @doc "Get GitHub meta information\n\nPath: /meta\n\nMethod: get"
  @spec get(GitHubEx.Client.t()) :: result
  @spec get(GitHubEx.Client.t(), map()) :: result
  def get(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Meta, :get},
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
  @spec get_all_versions(GitHubEx.Client.t()) :: result
  @spec get_all_versions(GitHubEx.Client.t(), map()) :: result
  def get_all_versions(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Meta, :get_all_versions},
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
  @spec get_octocat(GitHubEx.Client.t()) :: result
  @spec get_octocat(GitHubEx.Client.t(), map()) :: result
  def get_octocat(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Meta, :get_octocat},
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
  @spec get_zen(GitHubEx.Client.t()) :: result
  @spec get_zen(GitHubEx.Client.t(), map()) :: result
  def get_zen(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Meta, :get_zen},
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
  @spec root(GitHubEx.Client.t()) :: result
  @spec root(GitHubEx.Client.t(), map()) :: result
  def root(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Meta, :root},
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

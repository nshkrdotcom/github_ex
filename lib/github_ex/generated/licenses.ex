defmodule GitHubEx.Licenses do
  @moduledoc """
  Generated GitHub REST operations for the `Licenses` namespace.

  ## Operations

  * `licenses/get-all-commonly-used`
  * `licenses/get`
  * `licenses/get-for-repo`
  """

  @type result :: {:ok, term()} | {:error, GitHubEx.Error.t()}

  @doc "Get a license\n\nPath: /licenses/{license}\n\nMethod: get"
  @spec get(GitHubEx.Client.t()) :: result
  @spec get(GitHubEx.Client.t(), map()) :: result
  def get(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Licenses, :get},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"license", :license}],
      path_template: "/licenses/{license}",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get all commonly used licenses\n\nPath: /licenses\n\nMethod: get"
  @spec get_all_commonly_used(GitHubEx.Client.t()) :: result
  @spec get_all_commonly_used(GitHubEx.Client.t(), map()) :: result
  def get_all_commonly_used(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Licenses, :get_all_commonly_used},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [],
      path_template: "/licenses",
      query: [{"featured", :featured}, {"per_page", :per_page}, {"page", :page}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end

  @doc "Get the license for a repository\n\nPath: /repos/{owner}/{repo}/license\n\nMethod: get"
  @spec get_for_repo(GitHubEx.Client.t()) :: result
  @spec get_for_repo(GitHubEx.Client.t(), map()) :: result
  def get_for_repo(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :none,
      call: {GitHubEx.Licenses, :get_for_repo},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :get,
      path: [{"owner", :owner}, {"repo", :repo}],
      path_template: "/repos/{owner}/{repo}/license",
      query: [{"ref", :ref}],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.read",
      use_default_auth: true
    })
  end
end

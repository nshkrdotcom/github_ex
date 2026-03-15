defmodule GitHubEx.Markdown do
  @moduledoc """
  Generated GitHub REST operations for the `Markdown` namespace.

  ## Operations

  * `markdown/render`
  * `markdown/render-raw`
  """

  @type result :: {:ok, term()} | {:error, GitHubEx.Error.t()}

  @doc "Render a Markdown document\n\nPath: /markdown\n\nMethod: post"
  @spec render(GitHubEx.Client.t()) :: result
  @spec render(GitHubEx.Client.t(), map()) :: result
  def render(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: :remaining,
      call: {GitHubEx.Markdown, :render},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [],
      path_template: "/markdown",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end

  @doc "Render a Markdown document in raw mode\n\nPath: /markdown/raw\n\nMethod: post"
  @spec render_raw(GitHubEx.Client.t()) :: result
  @spec render_raw(GitHubEx.Client.t(), map()) :: result
  def render_raw(client, params \\ %{}) when is_map(params) do
    GitHubEx.GeneratedSupport.execute(client, params, %{
      auth_strategy: :default,
      body_mode: {:key, {"body", :body}},
      call: {GitHubEx.Markdown, :render_raw},
      circuit_breaker: "core_api",
      form_data_mode: :none,
      headers: [],
      method: :post,
      path: [],
      path_template: "/markdown/raw",
      query: [],
      rate_limit: "github.integration",
      resource: "core_api",
      retry: "github.write",
      use_default_auth: true
    })
  end
end

defmodule GitHubEx.Markdown do
  @moduledoc """
  Generated Github Ex operations for markdown.
  """

  alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient

  @render_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Render a Markdown document\n\nDepending on what is rendered in the Markdown, you may need to provide additional token scopes for labels, such as `issues:read` or `pull_requests:read`."
  @spec render(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def render(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_render_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_render_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @render_partition_spec)

    %{
      id: "markdown/render",
      args: params,
      call: {__MODULE__, :render},
      opts: opts,
      method: :post,
      path_template: "/markdown",
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :markdown, :render],
      timeout: nil,
      pagination: nil
    }
  end

  @render_raw_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :key, key: {"body", :body}},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Render a Markdown document in raw mode\n\nYou must send Markdown as plain text (using a `Content-Type` header of `text/plain` or `text/x-markdown`) to this endpoint, rather than using JSON format. In raw mode, [GitHub Flavored Markdown](https://github.github.com/gfm/) is not supported and Markdown will be rendered in plain format like a README.md file. Markdown content must be 400 KB or less."
  @spec render_raw(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def render_raw(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_render_raw_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_render_raw_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @render_raw_partition_spec)

    %{
      id: "markdown/render-raw",
      args: params,
      call: {__MODULE__, :render_raw},
      opts: opts,
      method: :post,
      path_template: "/markdown/raw",
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
      resource: "core_api",
      retry: "github.write",
      circuit_breaker: "core_api",
      rate_limit: "github.integration",
      telemetry: [:github_ex, :markdown, :render_raw],
      timeout: nil,
      pagination: nil
    }
  end

  @spec normalize_request_opts!(list()) :: keyword()
  defp normalize_request_opts!(opts) when is_list(opts) do
    if Keyword.keyword?(opts) do
      opts
    else
      raise ArgumentError, "request opts must be a keyword list"
    end
  end
end

defmodule GitHubEx.Markdown do
  @moduledoc """
  Generated Github Ex operations for markdown.
  """

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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_render_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_render_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @render_partition_spec)

    Pristine.Operation.new(%{
      id: "markdown/render",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :markdown, :render],
        timeout_ms: nil
      },
      pagination: nil
    })
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
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_render_raw_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_render_raw_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @render_raw_partition_spec)

    Pristine.Operation.new(%{
      id: "markdown/render-raw",
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
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :markdown, :render_raw],
        timeout_ms: nil
      },
      pagination: nil
    })
  end
end

defmodule GitHubEx.Gitignore do
  @moduledoc """
  Generated Github Ex operations for gitignore.
  """

  @get_all_templates_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get all gitignore templates\n\nList all templates available to pass as an option when [creating a repository](https://docs.github.com/rest/repos/repos#create-a-repository-for-the-authenticated-user)."
  @spec get_all_templates(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_all_templates(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_all_templates_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_all_templates_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_all_templates_partition_spec)

    Pristine.Operation.new(%{
      id: "gitignore/get-all-templates",
      method: :get,
      path_template: "/gitignore/templates",
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
        retry_group: "github.read",
        telemetry_event: [:github_ex, :gitignore, :get_all_templates],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_template_partition_spec %{
    path: [{"name", :name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get a gitignore template\n\nGet the content of a gitignore template.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/vnd.github.raw+json`**: Returns the raw .gitignore contents."
  @spec get_template(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_template(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_template_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_template_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_template_partition_spec)

    Pristine.Operation.new(%{
      id: "gitignore/get-template",
      method: :get,
      path_template: "/gitignore/templates/{name}",
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
        retry_group: "github.read",
        telemetry_event: [:github_ex, :gitignore, :get_template],
        timeout_ms: nil
      },
      pagination: nil
    })
  end
end

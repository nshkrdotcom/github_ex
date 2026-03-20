defmodule GitHubEx.RateLimit do
  @moduledoc """
  Generated Github Ex operations for rate limit.
  """

  @get_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get rate limit status for the authenticated user\n\n> [!NOTE]\n> Accessing this endpoint does not count against your REST API rate limit.\n\nSome categories of endpoints have custom rate limits that are separate from the rate limit governing the other REST API endpoints. For this reason, the API response categorizes your rate limit. Under `resources`, you'll see objects relating to different categories:\n* The `core` object provides your rate limit status for all non-search-related resources in the REST API.\n* The `search` object provides your rate limit status for the REST API for searching (excluding code searches). For more information, see \"[Search](https://docs.github.com/rest/search/search).\"\n* The `code_search` object provides your rate limit status for the REST API for searching code. For more information, see \"[Search code](https://docs.github.com/rest/search/search#search-code).\"\n* The `graphql` object provides your rate limit status for the GraphQL API. For more information, see \"[Resource limitations](https://docs.github.com/graphql/overview/resource-limitations#rate-limit).\"\n* The `integration_manifest` object provides your rate limit status for the `POST /app-manifests/{code}/conversions` operation. For more information, see \"[Creating a GitHub App from a manifest](https://docs.github.com/apps/creating-github-apps/setting-up-a-github-app/creating-a-github-app-from-a-manifest#3-you-exchange-the-temporary-code-to-retrieve-the-app-configuration).\"\n* The `dependency_snapshots` object provides your rate limit status for submitting snapshots to the dependency graph. For more information, see \"[Dependency graph](https://docs.github.com/rest/dependency-graph).\"\n* The `dependency_sbom` object provides your rate limit status for requesting SBOMs from the dependency graph. For more information, see \"[Dependency graph](https://docs.github.com/rest/dependency-graph).\"\n* The `code_scanning_upload` object provides your rate limit status for uploading SARIF results to code scanning. For more information, see \"[Uploading a SARIF file to GitHub](https://docs.github.com/code-security/code-scanning/integrating-with-code-scanning/uploading-a-sarif-file-to-github).\"\n* The `actions_runner_registration` object provides your rate limit status for registering self-hosted runners in GitHub Actions. For more information, see \"[Self-hosted runners](https://docs.github.com/rest/actions/self-hosted-runners).\"\n* The `source_import` object is no longer in use for any API endpoints, and it will be removed in the next API version. For more information about API versions, see \"[API Versions](https://docs.github.com/rest/about-the-rest-api/api-versions).\"\n\n> [!NOTE]\n> The `rate` object is closing down. If you're writing new API client code or updating existing code, you should use the `core` object instead of the `rate` object. The `core` object contains the same information that is present in the `rate` object."
  @spec get(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_partition_spec)

    Pristine.Operation.new(%{
      id: "rate-limit/get",
      method: :get,
      path_template: "/rate_limit",
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
        telemetry_event: [:github_ex, :rate_limit, :get],
        timeout_ms: nil
      },
      pagination: nil
    })
  end
end

defmodule GitHubEx.Credentials do
  @moduledoc """
  Generated Github Ex operations for credentials.
  """

  alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient

  @revoke_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Revoke a list of credentials\n\nSubmit a list of credentials to be revoked. This endpoint is intended to revoke credentials the caller does not own and may have found exposed on GitHub.com or elsewhere. It can also be used for credentials associated with an old user account that you no longer have access to. Credential owners will be notified of the revocation.\n\nThis endpoint currently accepts the following credential types:\n- Personal access tokens (classic)\n- Fine-grained personal access tokens\n\nRevoked credentials may impact users on GitHub Free, Pro, & Team and GitHub Enterprise Cloud, and GitHub Enterprise Cloud with Enterprise Managed Users.\nGitHub cannot reactivate any credentials that have been revoked; new credentials will need to be generated.\n\nTo prevent abuse, this API is limited to only 60 unauthenticated requests per hour and a max of 1000 tokens per API request.\n\n> [!NOTE]\n> Any authenticated requests will return a 403."
  @spec revoke(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def revoke(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    opts = normalize_request_opts!(opts)
    request = build_revoke_request(client, params, opts)
    GitHubEx.Client.execute_generated_request(client, request)
  end

  defp build_revoke_request(client, params, opts)
       when is_map(params) and is_list(opts) do
    _ = client
    partition = OpenAPIClient.partition(params, @revoke_partition_spec)

    %{
      id: "credentials/revoke",
      args: params,
      call: {__MODULE__, :revoke},
      opts: opts,
      method: :post,
      path_template: "/credentials/revoke",
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
      telemetry: [:github_ex, :credentials, :revoke],
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

defmodule GitHubEx.OAuth do
  @moduledoc """
  GitHub OAuth helper functions built on the shared `Pristine.OAuth2`
  boundary.
  """

  alias GitHubEx.Client
  alias Pristine.OAuth2

  @oauth_client_opts [
    :accept,
    :api_version,
    :base_url,
    :finch,
    :foundation,
    :log_level,
    :logger,
    :retry,
    :timeout_ms,
    :transport,
    :transport_opts,
    :typed_responses,
    :user_agent
  ]

  @spec provider() :: OAuth2.Provider.t()
  def provider do
    OAuth2.Provider.new(
      name: "github",
      flow: :authorization_code,
      site: oauth_site(),
      authorize_url: "/login/oauth/authorize",
      token_url: "/login/oauth/access_token",
      client_auth_method: :request_body,
      token_method: :post,
      token_content_type: "application/json"
    )
  end

  @spec authorization_request(keyword()) ::
          {:ok, OAuth2.AuthorizationRequest.t()} | {:error, OAuth2.Error.t()}
  def authorization_request(opts \\ []) when is_list(opts) do
    with {:ok, authorization_opts} <- authorization_opts(opts) do
      OAuth2.authorization_request(provider(), authorization_opts)
    end
  end

  @spec authorize_url(keyword()) :: {:ok, String.t()} | {:error, OAuth2.Error.t()}
  def authorize_url(opts \\ []) when is_list(opts) do
    with {:ok, authorization_opts} <- authorization_opts(opts) do
      OAuth2.authorize_url(provider(), authorization_opts)
    end
  end

  @spec exchange_code(String.t(), keyword()) ::
          {:ok, OAuth2.Token.t()} | {:error, OAuth2.Error.t()}
  def exchange_code(code, opts \\ []) when is_binary(code) and is_list(opts) do
    OAuth2.exchange_code(provider(), code, oauth_runtime_opts(opts))
  end

  @spec refresh_token(String.t(), keyword()) ::
          {:ok, OAuth2.Token.t()} | {:error, OAuth2.Error.t()}
  def refresh_token(refresh_token, opts \\ [])
      when is_binary(refresh_token) and is_list(opts) do
    OAuth2.refresh_token(provider(), refresh_token, oauth_runtime_opts(opts))
  end

  defp authorization_opts(opts) do
    params =
      opts
      |> Keyword.get(:params, [])
      |> normalize_keyword()
      |> maybe_put_allow_signup(Keyword.get(opts, :allow_signup))

    authorization_opts =
      []
      |> maybe_put(:client_id, Keyword.get(opts, :client_id))
      |> Keyword.put(:params, params)
      |> maybe_put(:generate_state, Keyword.get(opts, :generate_state))
      |> maybe_put(:pkce, Keyword.get(opts, :pkce))
      |> maybe_put(:redirect_uri, Keyword.get(opts, :redirect_uri))
      |> maybe_put(:scopes, normalize_scopes(Keyword.get(opts, :scopes)))

    case Keyword.get(authorization_opts, :redirect_uri) do
      redirect_uri when is_binary(redirect_uri) and redirect_uri != "" ->
        {:ok, authorization_opts}

      _other ->
        {:error, OAuth2.Error.new(:missing_redirect_uri, provider: provider().name)}
    end
  end

  defp oauth_runtime_opts(opts) do
    client = Keyword.get(opts, :client) || Client.new(client_opts(opts))

    token_params =
      []
      |> Keyword.merge(opts |> Keyword.get(:token_params, []) |> normalize_keyword())

    []
    |> Keyword.put(:context, client.context)
    |> maybe_put(:client_id, Keyword.get(opts, :client_id))
    |> maybe_put(:client_secret, Keyword.get(opts, :client_secret))
    |> maybe_put(:redirect_uri, Keyword.get(opts, :redirect_uri))
    |> maybe_put(:token_params, token_params)
  end

  defp client_opts(opts) do
    Keyword.take(opts, @oauth_client_opts)
  end

  defp normalize_keyword(value) when is_list(value), do: value
  defp normalize_keyword(value) when is_map(value), do: Enum.into(value, [])
  defp normalize_keyword(_value), do: []

  defp normalize_scopes(nil), do: nil
  defp normalize_scopes(scopes) when is_list(scopes), do: Enum.map(scopes, &to_string/1)

  defp normalize_scopes(scopes) when is_binary(scopes) do
    scopes
    |> String.split(~r/[\s,]+/, trim: true)
    |> Enum.reject(&(&1 == ""))
  end

  defp normalize_scopes(_scopes), do: nil

  defp maybe_put_allow_signup(params, value) when is_boolean(value) do
    Keyword.put(params, :allow_signup, value)
  end

  defp maybe_put_allow_signup(params, _value), do: params

  defp maybe_put(opts, _key, nil), do: opts
  defp maybe_put(opts, _key, []), do: opts
  defp maybe_put(opts, key, value), do: Keyword.put(opts, key, value)

  defp oauth_site do
    Application.get_env(:github_ex, :oauth_site, "https://github.com")
  end
end

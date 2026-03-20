defmodule GitHubEx.AppAuth do
  @moduledoc """
  Helpers for authenticating as a GitHub App and exchanging installation tokens.
  """

  @default_expires_in 540
  @default_iat_skew_seconds 60
  @type pem_input :: String.t() | {term(), String.t()}
  @type runtime_client :: GitHubEx.Client.t() | Pristine.Client.t()

  @spec jwt(String.t() | pos_integer(), pem_input(), keyword()) ::
          {:ok, String.t()} | {:error, term()}
  def jwt(app_id, pem, opts \\ [])
      when (is_binary(app_id) or is_integer(app_id)) and is_list(opts) do
    claims = build_claims(app_id, opts)

    with {:ok, pem} <- normalize_pem(pem) do
      try do
        jwk = JOSE.JWK.from_pem(pem)

        {_jws, compact} =
          JOSE.JWT.sign(jwk, %{"alg" => "RS256", "typ" => "JWT"}, claims)
          |> JOSE.JWS.compact()

        {:ok, compact}
      rescue
        error -> {:error, error}
      end
    end
  end

  @spec jwt!(String.t() | pos_integer(), pem_input(), keyword()) :: String.t()
  def jwt!(app_id, pem, opts \\ []) do
    case jwt(app_id, pem, opts) do
      {:ok, token} -> token
      {:error, error} -> raise error
    end
  end

  @spec app_client(String.t() | pos_integer(), pem_input(), keyword()) :: Pristine.Client.t()
  def app_client(app_id, pem, opts \\ []) when is_list(opts) do
    {jwt_opts, client_opts} = Keyword.split(opts, [:claims, :expires_in, :iat_skew_seconds])

    client_opts
    |> Keyword.put(:auth, jwt!(app_id, pem, jwt_opts))
    |> GitHubEx.Client.new()
    |> GitHubEx.Client.pristine_client()
  end

  @spec installation_token(runtime_client(), String.t() | pos_integer(), map()) ::
          {:ok, term()} | {:error, GitHubEx.Error.t()}
  def installation_token(client, installation_id, params \\ %{}) when is_map(params) do
    GitHubEx.Apps.create_installation_access_token(
      client,
      %{"installation_id" => to_string(installation_id)}
      |> Map.merge(stringify_keys(params))
    )
  end

  @spec installation_client(
          String.t() | pos_integer(),
          pem_input(),
          String.t() | pos_integer(),
          keyword()
        ) ::
          Pristine.Client.t()
  def installation_client(app_id, pem, installation_id, opts \\ []) when is_list(opts) do
    {jwt_opts, remaining_opts} = Keyword.split(opts, [:claims, :expires_in, :iat_skew_seconds])

    {token_opts, client_opts} =
      Keyword.split(remaining_opts, [:permissions, :repositories, :repository_ids])

    app_client = app_client(app_id, pem, jwt_opts)

    token_response =
      installation_token(app_client, installation_id, Enum.into(token_opts, %{}))
      |> case do
        {:ok, response} -> response
        {:error, error} -> raise error
      end

    token =
      Map.get(token_response, "token") ||
        Map.get(token_response, :token) ||
        raise "installation token response did not include a token"

    client_opts
    |> Keyword.put(:auth, token)
    |> GitHubEx.Client.new()
    |> GitHubEx.Client.pristine_client()
  end

  defp build_claims(app_id, opts) do
    now = DateTime.utc_now() |> DateTime.to_unix()
    expires_in = Keyword.get(opts, :expires_in, @default_expires_in)
    iat_skew_seconds = Keyword.get(opts, :iat_skew_seconds, @default_iat_skew_seconds)

    default_claims = %{
      "exp" => now + expires_in,
      "iat" => now - iat_skew_seconds,
      "iss" => to_string(app_id)
    }

    Map.merge(default_claims, normalize_claims(Keyword.get(opts, :claims, %{})))
  end

  defp normalize_claims(claims) when is_map(claims) do
    Map.new(claims, fn {key, value} -> {to_string(key), value} end)
  end

  defp normalize_claims(_claims), do: %{}

  defp normalize_pem(pem) when is_binary(pem), do: {:ok, pem}
  defp normalize_pem({_jwk, pem}) when is_binary(pem), do: {:ok, pem}

  defp normalize_pem(other),
    do: {:error, ArgumentError.exception("expected PEM string, got: #{inspect(other)}")}

  defp stringify_keys(map) do
    Map.new(map, fn {key, value} -> {to_string(key), value} end)
  end
end

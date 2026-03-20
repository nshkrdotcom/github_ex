defmodule GitHubEx.AppAuthTest do
  use ExUnit.Case, async: true

  alias GitHubEx.AppAuth
  alias GitHubEx.TestTransport
  alias Pristine.Adapters.Auth.Bearer
  alias Pristine.Client, as: RuntimeClient
  alias Pristine.Core.Response

  test "jwt signs an RS256 token for github app auth" do
    jwk = JOSE.JWK.generate_key({:rsa, 2048, 65_537})
    pem = JOSE.JWK.to_pem(jwk)

    assert {:ok, token} = AppAuth.jwt(123_456, pem)

    assert length(String.split(token, ".")) == 3

    {_verified, jose_jwt, _jws} = JOSE.JWT.verify_strict(jwk, ["RS256"], token)

    assert jose_jwt.fields["iss"] == "123456"
    assert is_integer(jose_jwt.fields["iat"])
    assert is_integer(jose_jwt.fields["exp"])
  end

  test "app_client returns a pristine runtime client with the app jwt as default auth" do
    jwk = JOSE.JWK.generate_key({:rsa, 2048, 65_537})
    pem = JOSE.JWK.to_pem(jwk)

    assert %RuntimeClient{
             base_url: "https://api.github.com",
             default_auth: [{Bearer, [token: token]}]
           } = AppAuth.app_client(123_456, pem)

    assert is_binary(token)
    assert length(String.split(token, ".")) == 3
  end

  test "installation_token accepts a pristine runtime client and authenticates with the app jwt" do
    jwk = JOSE.JWK.generate_key({:rsa, 2048, 65_537})
    pem = JOSE.JWK.to_pem(jwk)

    app_client =
      AppAuth.app_client(
        123_456,
        pem,
        transport: TestTransport,
        transport_opts: [
          response: fn request, _context ->
            assert request.url == "https://api.github.com/app/installations/42/access_tokens"
            assert request.headers["Authorization"] =~ "Bearer "

            assert Jason.decode!(request.body) == %{
                     "permissions" => %{"issues" => "read"},
                     "repositories" => ["repo-one"]
                   }

            {:ok, %Response{status: 201, body: Jason.encode!(%{"token" => "installation-token"})}}
          end
        ]
      )

    assert %RuntimeClient{} = app_client

    assert {:ok, %{"token" => "installation-token"}} =
             AppAuth.installation_token(app_client, 42, %{
               "permissions" => %{"issues" => "read"},
               "repositories" => ["repo-one"]
             })
  end
end

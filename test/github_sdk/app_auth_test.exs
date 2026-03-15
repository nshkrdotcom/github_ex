defmodule GitHubSDK.AppAuthTest do
  use ExUnit.Case, async: true

  alias GitHubSDK.AppAuth

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
end

defmodule GitHubEx.OAuthTest do
  use ExUnit.Case, async: true

  alias GitHubEx.OAuth

  test "provider points at github login oauth endpoints" do
    provider = OAuth.provider()

    assert provider.name == "github"
    assert provider.site == "https://github.com"
    assert provider.authorize_url == "/login/oauth/authorize"
    assert provider.token_url == "/login/oauth/access_token"
    assert provider.client_auth_method == :request_body
  end

  test "authorize_url requires a redirect_uri" do
    assert {:error, error} = OAuth.authorize_url()
    assert error.message =~ "redirect"
  end

  test "authorization_request builds a github authorization url" do
    assert {:ok, request} =
             OAuth.authorization_request(
               client_id: "github-client-id",
               redirect_uri: "http://127.0.0.1:40071/callback",
               scopes: ["repo", "read:user"],
               generate_state: true
             )

    assert request.url =~ "https://github.com/login/oauth/authorize"
    assert request.url =~ "scope=repo+read%3Auser"
    assert is_binary(request.state)
  end
end

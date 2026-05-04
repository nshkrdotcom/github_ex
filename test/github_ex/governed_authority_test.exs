defmodule GitHubEx.GovernedAuthorityTest do
  use ExUnit.Case, async: false

  alias GitHubEx.{AppAuth, Client, GovernedAuthority, Response, TestTransport, Users}
  alias Pristine.Core.Response, as: TransportResponse

  setup do
    previous_base_url = Application.get_env(:github_ex, :base_url)
    previous_api_version = Application.get_env(:github_ex, :api_version)

    on_exit(fn ->
      restore_app_env(:base_url, previous_base_url)
      restore_app_env(:api_version, previous_api_version)
    end)
  end

  test "governed client ignores ambient defaults and uses authority selected inputs" do
    Application.put_env(:github_ex, :base_url, "https://ambient.example.test")
    Application.put_env(:github_ex, :api_version, "1999-01-01")

    client =
      Client.new(
        governed_authority: authority(),
        transport: TestTransport,
        transport_opts: [
          test_pid: self(),
          response: fn request, context ->
            assert request.url == "https://governed.example.test/user"
            assert request.headers["Authorization"] == "Bearer governed-token"
            assert request.headers["Accept"] == "application/vnd.github+json"
            assert request.headers["X-GitHub-Api-Version"] == "2026-03-10"
            assert request.headers["X-GitHub-Governed-Target"] == "github-target-123"
            assert context.governed_authority.credential_ref == "github-credential-123"

            {:ok,
             %TransportResponse{
               status: 200,
               headers: %{"x-ratelimit-limit" => "5000"},
               body: Jason.encode!(%{"login" => "octocat"})
             }}
          end
        ]
      )

    assert client.base_url == "https://governed.example.test"
    assert client.api_version == "2026-03-10"
    assert client.governed_authority.credential_ref == "github-credential-123"

    assert {:ok, %Response{data: %{"login" => "octocat"}}} =
             Client.request(client, %{method: :get, path: "/user", opts: [response: :wrapped]})
  end

  test "governed client rejects direct constructor auth and endpoint inputs" do
    direct_values = [
      auth: "direct-token",
      oauth2: [token_source: {__MODULE__, []}],
      base_url: "https://direct.example.test",
      accept: "application/direct",
      api_version: "1999-01-01",
      user_agent: "direct-agent",
      foundation: [headers: %{"Authorization" => "Bearer direct-token"}],
      token: "direct-token",
      access_token: "direct-token",
      client_id: "direct-client-id",
      client_secret: "direct-client-secret",
      app_id: "123",
      private_key: "direct-private-key",
      installation_id: "456",
      webhook_secret: "direct-webhook-secret",
      oauth_token_path: "/direct/github.json"
    ]

    for {key, value} <- direct_values do
      error =
        assert_raise ArgumentError, fn ->
          Client.new([{key, value}, {:governed_authority, authority()}])
        end

      assert String.contains?(error.message, "governed authority")
    end
  end

  test "governed requests reject direct auth, headers, endpoint, and default bypass" do
    client =
      Client.new(
        governed_authority: authority(),
        transport: TestTransport,
        transport_opts: [response: {:ok, %TransportResponse{status: 200, body: "{}"}}]
      )

    direct_requests = [
      %{method: :get, path: "/user", auth: "direct-token"},
      %{method: :get, path: "/user", use_default_auth: false},
      %{method: :get, path: "/user", headers: %{"Authorization" => "Bearer direct-token"}},
      %{method: :get, path: "/user", headers: %{"X-Direct" => "direct"}},
      %{method: :get, path: "/user", base_url: "https://direct.example.test"}
    ]

    for request <- direct_requests do
      error =
        assert_raise ArgumentError, fn ->
          Client.request(client, request)
        end

      assert String.contains?(error.message, "governed authority")
    end
  end

  test "generated requests reject auth overrides in governed mode" do
    client =
      Client.new(
        governed_authority: authority(),
        transport: TestTransport,
        transport_opts: [response: {:ok, %TransportResponse{status: 200, body: "{}"}}]
      )

    error =
      assert_raise ArgumentError, fn ->
        Users.get_authenticated(client, %{"auth" => "direct-token"})
      end

    assert String.contains?(error.message, "governed authority")
  end

  test "generated requests use authority selected auth in governed mode" do
    client =
      Client.new(
        governed_authority: authority(),
        transport: TestTransport,
        transport_opts: [
          response: fn request, _context ->
            assert request.url == "https://governed.example.test/user"
            assert request.headers["Authorization"] == "Bearer governed-token"

            {:ok,
             %TransportResponse{
               status: 200,
               body: Jason.encode!(%{"login" => "octocat"})
             }}
          end
        ]
      )

    assert {:ok, %{"login" => "octocat"}} = Users.get_authenticated(client)
  end

  test "governed mode rejects app credential helper smuggling before signing" do
    jwk = JOSE.JWK.generate_key({:rsa, 2048, 65_537})
    pem = JOSE.JWK.to_pem(jwk)

    error =
      assert_raise ArgumentError, fn ->
        AppAuth.app_client(123_456, pem, governed_authority: authority())
      end

    assert String.contains?(error.message, "governed authority")
  end

  test "governed redaction removes authority selected secret values" do
    client = Client.new(governed_authority: authority(), transport: TestTransport)

    assert GovernedAuthority.redact(
             client.governed_authority,
             "Authorization: Bearer governed-token"
           ) == "Authorization: [REDACTED]"
  end

  defp authority do
    %{
      authority_ref: "github-authority-123",
      provider_ref: "github",
      credential_ref: "github-credential-123",
      credential_lease_ref: "github-lease-123",
      credential_family_ref: "installation_token",
      token_family: "installation_token",
      app_ref: "github-app-123",
      installation_ref: "github-installation-456",
      target_ref: "github-target-123",
      redaction_ref: "github-redaction-123",
      base_url: "https://governed.example.test",
      token: "governed-token",
      headers: %{"X-GitHub-Governed-Target" => "github-target-123"}
    }
  end

  defp restore_app_env(key, nil), do: Application.delete_env(:github_ex, key)
  defp restore_app_env(key, value), do: Application.put_env(:github_ex, key, value)
end

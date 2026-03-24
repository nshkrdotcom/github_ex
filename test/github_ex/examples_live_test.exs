Code.require_file("../../examples/support/live_example.exs", __DIR__)

defmodule GitHubEx.ExamplesLiveTest do
  use ExUnit.Case, async: false

  alias GitHubEx.Examples.Live
  alias Pristine.Core.EndpointMetadata
  alias Pristine.Error, as: PristineError
  alias Pristine.OAuth2.AuthorizationRequest
  alias Pristine.OAuth2.Error, as: OAuth2Error
  alias Pristine.Response, as: PristineResponse

  @moduletag :tmp_dir

  @example_envs [
    "GITHUB_APP_ID",
    "GITHUB_APP_INSTALLATION_ID",
    "GITHUB_APP_PRIVATE_KEY_PATH",
    "GITHUB_EXAMPLE_ISSUE_NUMBER",
    "GITHUB_EXAMPLE_OWNER",
    "GITHUB_EXAMPLE_REPO",
    "GITHUB_EXAMPLE_WORKFLOW_ID",
    "GITHUB_OAUTH_AUTH_CODE",
    "GITHUB_OAUTH_CLIENT_ID",
    "GITHUB_OAUTH_CLIENT_SECRET",
    "GITHUB_OAUTH_REDIRECT_URI",
    "GITHUB_OAUTH_TOKEN_PATH",
    "GITHUB_TOKEN",
    "XDG_CONFIG_HOME"
  ]

  setup do
    previous =
      Map.new(@example_envs, fn name ->
        {name, System.get_env(name)}
      end)

    Enum.each(@example_envs, &System.delete_env/1)

    on_exit(fn ->
      Enum.each(previous, fn
        {name, nil} -> System.delete_env(name)
        {name, value} -> System.put_env(name, value)
      end)
    end)

    :ok
  end

  test "oauth token path falls back to the default saved location", %{tmp_dir: tmp_dir} do
    System.put_env("XDG_CONFIG_HOME", tmp_dir)

    assert Live.oauth_token_path() ==
             Path.join([tmp_dir, "github_ex", "oauth", "github.json"])
  end

  test "maybe_unauthenticated_params disables auth when GITHUB_TOKEN is missing" do
    assert Live.maybe_unauthenticated_params(%{"owner" => "octocat"}) == %{
             "owner" => "octocat",
             "auth" => false
           }
  end

  test "maybe_unauthenticated_params keeps params untouched when GITHUB_TOKEN is set" do
    System.put_env("GITHUB_TOKEN", "example-token")

    assert Live.maybe_unauthenticated_params(%{"owner" => "octocat"}) == %{
             "owner" => "octocat"
           }
  end

  test "oauth auth code helper prefers the explicit env var" do
    System.put_env("GITHUB_OAUTH_AUTH_CODE", "example-auth-code")

    assert Live.oauth_auth_code_or_prompt!() == "example-auth-code"
  end

  test "oauth authorization request helper returns url and generated state" do
    System.put_env("GITHUB_OAUTH_CLIENT_ID", "github-client-id")
    System.put_env("GITHUB_OAUTH_REDIRECT_URI", "http://127.0.0.1:40071/callback")

    assert %AuthorizationRequest{url: url, state: state} =
             Live.oauth_authorization_request!(["repo", "read:user"])

    assert url =~ "https://github.com/login/oauth/authorize"
    assert url =~ "scope=repo+read%3Auser"
    assert is_binary(state)
    assert state != ""
  end

  test "ok! formats permission denied errors with auth guidance" do
    error = %PristineError{
      type: :permission_denied,
      status: 403,
      message: "Permission denied",
      body: %{
        "documentation_url" => "https://docs.github.com/rest/pulls/pulls#list-pull-requests",
        "message" => "Resource not accessible by personal access token",
        "status" => "403"
      },
      response: %PristineResponse{
        status: 403,
        headers: %{
          "x-accepted-github-permissions" => "pull_requests=read"
        },
        body: %{
          "documentation_url" => "https://docs.github.com/rest/pulls/pulls#list-pull-requests",
          "message" => "Resource not accessible by personal access token",
          "status" => "403"
        },
        metadata: %{
          endpoint: %EndpointMetadata{
            id: "pulls/list",
            method: :get,
            path: "/repos/{owner}/{repo}/pulls"
          }
        }
      }
    }

    message =
      assert_raise RuntimeError, fn ->
        Live.ok!({:error, error}, "GitHubEx.Pulls.list/2")
      end

    assert message.message =~ "GitHub denied this request for the current credential."
    assert message.message =~ "Endpoint: GET /repos/{owner}/{repo}/pulls"

    assert message.message =~
             "GitHub message: Resource not accessible by personal access token"

    assert message.message =~ "GitHub accepted permissions: pull_requests=read"
    assert message.message =~ "Fine-grained PAT requirement: Pull requests: read"
    assert message.message =~ "GitHub App requirement: Pull requests: read"
    assert message.message =~ "https://docs.github.com/rest/pulls/pulls#list-pull-requests"
  end

  test "ok! formats oauth errors with guidance" do
    error = %OAuth2Error{
      reason: :authorization_request_requires_explicit_values,
      message: "authorize_url/2 requires explicit state or PKCE inputs",
      provider: "github",
      headers: %{}
    }

    message =
      assert_raise RuntimeError, fn ->
        Live.ok!({:error, error}, "GitHubEx.OAuth.authorize_url/1")
      end

    assert message.message =~
             "This OAuth helper requested generated state or PKCE values while only asking for a URL."

    assert message.message =~ "Use `GitHubEx.OAuth.authorization_request/1`"
    assert message.message =~ "Provider: github"
    assert message.message =~ "authorize_url/2 requires explicit state or PKCE inputs"
  end

  test "ok! formats oauth token endpoint errors with provider guidance" do
    error = %OAuth2Error{
      reason: :token_request_failed,
      message:
        "oauth provider returned an error: bad_verification_code - The code passed is incorrect or expired.",
      provider: "github",
      status: 200,
      body: %{
        "error" => "bad_verification_code",
        "error_description" => "The code passed is incorrect or expired.",
        "error_uri" =>
          "https://docs.github.com/apps/managing-oauth-apps/troubleshooting-oauth-app-access-token-request-errors/#bad-verification-code"
      },
      headers: %{}
    }

    message =
      assert_raise RuntimeError, fn ->
        Live.ok!({:error, error}, "GitHubEx.OAuth.exchange_code/2")
      end

    assert message.message =~ "GitHub OAuth token exchange was rejected."
    assert message.message =~ "Provider: github"
    assert message.message =~ "Reason: token_request_failed"
    assert message.message =~ "OAuth error: bad_verification_code"
    assert message.message =~ "OAuth description: The code passed is incorrect or expired."

    assert message.message =~
             "https://docs.github.com/apps/managing-oauth-apps/troubleshooting-oauth-app-access-token-request-errors/#bad-verification-code"
  end
end

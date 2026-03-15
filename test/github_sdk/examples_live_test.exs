Code.require_file("../../examples/support/live_example.exs", __DIR__)

defmodule GitHubSDK.ExamplesLiveTest do
  use ExUnit.Case, async: false

  alias GitHubSDK.Examples.Live

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
             Path.join([tmp_dir, "github_sdk", "oauth", "github.json"])
  end

  test "oauth auth code helper prefers the explicit env var" do
    System.put_env("GITHUB_OAUTH_AUTH_CODE", "example-auth-code")

    assert Live.oauth_auth_code_or_prompt!() == "example-auth-code"
  end
end

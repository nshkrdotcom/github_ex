defmodule GitHubEx.OAuthTokenFileTest do
  use ExUnit.Case, async: false

  alias GitHubEx.OAuthTokenFile

  @moduletag :tmp_dir

  setup do
    on_exit(fn -> Application.delete_env(:github_ex, :oauth_config_home) end)
  end

  test "default_path uses configured config home when present", %{tmp_dir: tmp_dir} do
    Application.put_env(:github_ex, :oauth_config_home, tmp_dir)

    assert OAuthTokenFile.default_path() ==
             Path.join([tmp_dir, "github_ex", "oauth", "github.json"])
  end

  test "resolve_env_or_default expands custom paths" do
    assert OAuthTokenFile.resolve_env_or_default("~/tmp/example.json") ==
             Path.expand("~/tmp/example.json")
  end
end

defmodule GitHubEx.OAuthTokenFileTest do
  use ExUnit.Case, async: true

  alias GitHubEx.OAuthTokenFile

  @moduletag :tmp_dir

  test "default_path uses XDG config when present", %{tmp_dir: tmp_dir} do
    System.put_env("XDG_CONFIG_HOME", tmp_dir)

    assert OAuthTokenFile.default_path() ==
             Path.join([tmp_dir, "github_ex", "oauth", "github.json"])
  after
    System.delete_env("XDG_CONFIG_HOME")
  end

  test "resolve_env_or_default expands custom paths" do
    assert OAuthTokenFile.resolve_env_or_default("~/tmp/example.json") ==
             Path.expand("~/tmp/example.json")
  end
end

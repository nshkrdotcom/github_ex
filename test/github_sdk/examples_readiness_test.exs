defmodule GitHubSDK.ExamplesReadinessTest do
  use ExUnit.Case, async: true

  @examples_dir Path.expand("../../examples", __DIR__)
  @readme_path Path.join(@examples_dir, "README.md")
  @runner_path Path.join(@examples_dir, "run_all.sh")

  test "example scripts parse as valid Elixir" do
    example_paths = root_example_paths()

    assert example_paths != []

    Enum.each(example_paths, fn path ->
      assert {:ok, _quoted} = path |> File.read!() |> Code.string_to_quoted(file: path)
    end)
  end

  test "example inventory stays pinned" do
    assert length(root_example_paths()) == 9
  end

  test "example runner shell script parses" do
    {_, 0} = System.cmd("bash", ["-n", @runner_path], stderr_to_stdout: true)
  end

  test "example readme documents the main env vars and runner" do
    readme = File.read!(@readme_path)

    assert readme =~ "[`run_all.sh`](./run_all.sh)"

    for env_name <- [
          "GITHUB_TOKEN",
          "GITHUB_EXAMPLE_OWNER",
          "GITHUB_EXAMPLE_REPO",
          "GITHUB_EXAMPLE_ISSUE_NUMBER",
          "GITHUB_EXAMPLE_WORKFLOW_ID",
          "GITHUB_OAUTH_CLIENT_ID",
          "GITHUB_OAUTH_CLIENT_SECRET",
          "GITHUB_OAUTH_REDIRECT_URI",
          "GITHUB_OAUTH_AUTH_CODE",
          "GITHUB_APP_ID",
          "GITHUB_APP_PRIVATE_KEY_PATH",
          "GITHUB_APP_INSTALLATION_ID"
        ] do
      assert readme =~ env_name
    end
  end

  defp root_example_paths do
    @examples_dir
    |> Path.join("[0-9][0-9]_*.exs")
    |> Path.wildcard()
    |> Enum.sort()
  end
end

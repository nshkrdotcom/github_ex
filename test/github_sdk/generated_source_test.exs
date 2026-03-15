defmodule GitHubSDK.GeneratedSourceTest do
  use ExUnit.Case, async: true

  @generated_dir Path.expand("../../lib/github_sdk/generated", __DIR__)
  @apps_source Path.join(@generated_dir, "apps.ex")
  @support_source Path.expand("../../lib/github_sdk/generated_support.ex", __DIR__)
  @users_source Path.join(@generated_dir, "users.ex")
  @repos_source Path.join(@generated_dir, "repos.ex")

  test "generated modules delegate through the shared support module" do
    sources =
      @generated_dir
      |> Path.join("**/*.ex")
      |> Path.wildcard()
      |> Enum.map(&File.read!/1)

    assert sources != []

    assert Enum.all?(
             sources,
             &String.contains?(&1, "GitHubSDK.GeneratedSupport.execute(client, params")
           )
  end

  test "request controls are handled in the shared support module" do
    support_source = File.read!(@support_source)

    assert support_source =~ "request_opts = GitHubSDK.Client.request_opts(params)"
    assert support_source =~ "GitHubSDK.Client.drop_request_controls(params)"
    assert support_source =~ "opts: request_opts"
  end

  test "oauth application endpoints declare auth-sensitive metadata for the shared runtime" do
    apps_source = File.read!(@apps_source)

    assert apps_source =~ "auth_strategy: :oauth_application"
    assert apps_source =~ ~s(resource: "oauth_application")
    assert apps_source =~ "use_default_auth: false"
  end

  test "runtime metadata is attached to generated request maps" do
    repos_source = File.read!(@repos_source)
    apps_source = File.read!(@apps_source)
    users_source = File.read!(@users_source)

    assert repos_source =~ ~s(rate_limit: "github.integration")
    assert repos_source =~ ~s(retry: "github.read")
    assert apps_source =~ ~s(retry: "github.oauth")
    assert users_source =~ ~s(call: {GitHubSDK.Users, :get_authenticated})
  end
end

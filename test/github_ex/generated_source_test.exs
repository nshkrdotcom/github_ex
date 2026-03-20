defmodule GitHubEx.GeneratedSourceTest do
  use ExUnit.Case, async: true

  @generated_dir Path.expand("../../lib/github_ex/generated", __DIR__)
  @apps_source Path.join(@generated_dir, "apps.ex")
  @users_source Path.join(@generated_dir, "users.ex")
  @repos_source Path.join(@generated_dir, "repos.ex")
  @client_source Path.expand("../../lib/github_ex/client.ex", __DIR__)

  test "generated operations render Pristine.Operation values and execute directly" do
    sources =
      @generated_dir
      |> Path.join("**/*.ex")
      |> Path.wildcard()
      |> Enum.reject(fn path ->
        String.ends_with?(path, "/client.ex") or String.ends_with?(path, "/runtime_schema.ex")
      end)
      |> Enum.map(&File.read!/1)

    assert sources != []

    assert Enum.all?(sources, &String.contains?(&1, "Pristine.Operation.new("))

    assert Enum.all?(
             sources,
             &String.contains?(&1, "Pristine.execute(runtime_client, operation, execute_opts)")
           )

    refute Enum.any?(sources, &String.contains?(&1, "GitHubEx.GeneratedSupport"))
    refute Enum.any?(sources, &String.contains?(&1, "GitHubEx.Client.execute_generated_request"))
  end

  test "generated modules use the thin runtime client bridge instead of request-map helpers" do
    users_source = File.read!(@users_source)
    client_source = File.read!(@client_source)

    assert users_source =~ "runtime_client = GitHubEx.Client.pristine_client(client)"
    assert users_source =~ "execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)"
    assert client_source =~ "alias Pristine.Client, as: RuntimeClient"
    refute client_source =~ "alias Pristine.SDK.OpenAPI.Client"
    refute client_source =~ "Pristine.execute_request("
  end

  test "oauth application endpoints build direct runtime operations with github oauth metadata" do
    apps_source = File.read!(@apps_source)

    assert apps_source =~ ~s(path_template: "/applications/{client_id}/token")
    assert apps_source =~ ~s(resource: "oauth_application")
    assert apps_source =~ ~s(retry_group: "github.oauth")
    assert apps_source =~ "use_client_default?: false"
  end

  test "runtime metadata and pagination wrappers are rendered from the shared compiler" do
    repos_source = File.read!(@repos_source)
    apps_source = File.read!(@apps_source)
    users_source = File.read!(@users_source)

    assert repos_source =~ ~s(rate_limit_group: "github.integration")
    assert repos_source =~ ~s(retry_group: "github.read")
    assert repos_source =~ "def stream_list_for_authenticated_user("
    assert apps_source =~ ~s(retry_group: "github.oauth")
    assert users_source =~ ~s(telemetry_event: [:github_ex, :users, :get_authenticated])
  end

  test "generated schema helpers stay provider-local" do
    runtime_schema_source = File.read!(Path.join(@generated_dir, "runtime_schema.ex"))

    assert runtime_schema_source =~ "defmodule GitHubEx.Generated.RuntimeSchema do"
    assert runtime_schema_source =~ "def build_schema("
    assert runtime_schema_source =~ "def decode_module_type("
    refute runtime_schema_source =~ "Pristine.Runtime.Schema"
  end
end

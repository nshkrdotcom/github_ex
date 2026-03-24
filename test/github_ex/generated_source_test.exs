defmodule GitHubEx.GeneratedSourceTest do
  use ExUnit.Case, async: true

  @generated_dir Path.expand("../../lib/github_ex/generated", __DIR__)
  @apps_source Path.join(@generated_dir, "apps.ex")
  @users_source Path.join(@generated_dir, "users.ex")
  @repos_source Path.join(@generated_dir, "repos.ex")
  @client_source Path.expand("../../lib/github_ex/client.ex", __DIR__)

  test "generated operations render request maps and delegate through the client request bridge" do
    sources =
      @generated_dir
      |> Path.join("**/*.ex")
      |> Path.wildcard()
      |> Enum.reject(fn path ->
        String.ends_with?(path, "/client.ex") or String.ends_with?(path, "/runtime_schema.ex")
      end)
      |> Enum.map(&File.read!/1)

    assert sources != []

    assert Enum.all?(
             sources,
             &String.contains?(&1, "alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient")
           )

    assert Enum.all?(
             sources,
             &String.contains?(&1, "GitHubEx.Client.execute_generated_request(client, request)")
           )

    refute Enum.any?(sources, &String.contains?(&1, "Pristine.Operation.new("))

    refute Enum.any?(
             sources,
             &String.contains?(&1, "Pristine.execute(runtime_client, operation, execute_opts)")
           )

    refute Enum.any?(sources, &String.contains?(&1, "GitHubEx.GeneratedSupport"))
  end

  test "generated modules use the request-map bridge end to end" do
    users_source = File.read!(@users_source)
    client_source = File.read!(@client_source)

    assert users_source =~ "opts = normalize_request_opts!(opts)"
    assert users_source =~ "defp normalize_request_opts!(opts) when is_list(opts) do"
    assert users_source =~ "request = build_get_authenticated_request(client, params, opts)"
    assert users_source =~ "GitHubEx.Client.execute_generated_request(client, request)"
    assert client_source =~ "alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient"
    assert client_source =~ "Pristine.execute_request("
    refute users_source =~ "runtime_client = GitHubEx.Client.pristine_client(client)"
    refute users_source =~ "execute_opts = GitHubEx.Client.runtime_execute_opts(client, opts)"
  end

  test "oauth application endpoints build request specs with github oauth metadata" do
    apps_source = File.read!(@apps_source)

    assert apps_source =~ ~s(path_template: "/applications/{client_id}/token")
    assert apps_source =~ ~s(resource: "oauth_application")
    assert apps_source =~ ~s(retry: "github.oauth")
    assert apps_source =~ "use_client_default?: false"
  end

  test "runtime metadata and pagination wrappers are rendered from the shared compiler" do
    repos_source = File.read!(@repos_source)
    apps_source = File.read!(@apps_source)
    users_source = File.read!(@users_source)

    assert repos_source =~ ~s(rate_limit: "github.integration")
    assert repos_source =~ ~s(retry: "github.read")
    assert repos_source =~ "def stream_list_for_authenticated_user("
    assert repos_source =~ "OpenAPIClient.next_page_request(request, response)"
    assert apps_source =~ ~s(retry: "github.oauth")
    assert users_source =~ ~s(telemetry: [:github_ex, :users, :get_authenticated])
  end

  test "generated operation docs rewrite GitHub relative links to absolute docs URLs" do
    sources =
      @generated_dir
      |> Path.join("**/*.ex")
      |> Path.wildcard()
      |> Enum.reject(fn path ->
        String.ends_with?(path, "/client.ex") or String.ends_with?(path, "/runtime_schema.ex")
      end)
      |> Enum.map(&File.read!/1)

    assert Enum.any?(sources, &String.contains?(&1, "https://docs.github.com/"))
    refute Enum.any?(sources, &Regex.match?(~r/\]\(\/[^)]+\)/, &1))
  end

  test "generated schema helpers stay provider-local" do
    runtime_schema_source = File.read!(Path.join(@generated_dir, "runtime_schema.ex"))

    assert runtime_schema_source =~ "defmodule GitHubEx.Generated.RuntimeSchema do"
    assert runtime_schema_source =~ "def build_schema("
    assert runtime_schema_source =~ "def decode_module_type("
    refute runtime_schema_source =~ "Pristine.Runtime.Schema"
  end
end

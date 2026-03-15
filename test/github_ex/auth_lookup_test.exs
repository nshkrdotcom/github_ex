defmodule GitHubEx.AuthLookupTest do
  use ExUnit.Case, async: false

  alias Mix.Tasks.Github.Auth.Lookup, as: AuthLookupTask

  setup do
    previous_shell = Mix.shell()
    Mix.shell(Mix.Shell.Process)
    Mix.Task.reenable("github.auth.lookup")

    on_exit(fn ->
      Mix.shell(previous_shell)
    end)

    :ok
  end

  test "runtime lookup resolves by method and path" do
    operation = GitHubEx.AuthMatrix.lookup("GET", "/user/repos")

    assert operation["operation_id"] == "repos/list-for-authenticated-user"

    assert operation["fine_grained_permissions"] == [
             %{
               "access" => "read",
               "additional_permissions" => false,
               "permission" => "Metadata",
               "scope_type" => "repository"
             }
           ]
  end

  test "runtime lookup resolves by operation id" do
    operation = GitHubEx.AuthMatrix.lookup("apps/check-token")

    assert operation["path"] == "/applications/{client_id}/token"
    assert get_in(operation, ["special_auth", "oauth_application"]) == true
  end

  test "mix task prints the looked-up JSON entry" do
    AuthLookupTask.run(["GET", "/user/repos"])

    assert_receive {:mix_shell, :info, [payload]}

    decoded = Jason.decode!(payload)
    assert decoded["operation_id"] == "repos/list-for-authenticated-user"
    assert get_in(decoded, ["token_support", "fine_grained_pat"]) == true
  end
end

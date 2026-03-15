defmodule GitHubSDK.GeneratedCompileTest do
  use ExUnit.Case, async: true

  @manifest_path Path.expand("../../priv/generated/manifest.json", __DIR__)

  test "all generated operations are present and compiled" do
    manifest = Jason.decode!(File.read!(@manifest_path))

    assert manifest["operation_count"] == 1093
    assert length(manifest["operations"]) == 1093

    Enum.each(manifest["operations"], fn %{"function" => function_name, "module" => module_name} ->
      module = Module.concat([GitHubSDK, module_name])
      function = String.to_atom(function_name)

      assert Code.ensure_loaded?(module)
      assert function_exported?(module, function, 1)
      assert function_exported?(module, function, 2)
    end)
  end

  test "key api modules and auth-sensitive operations are exported" do
    assert Code.ensure_loaded?(GitHubSDK.Meta)
    assert function_exported?(GitHubSDK.Meta, :root, 1)

    assert Code.ensure_loaded?(GitHubSDK.Users)
    assert function_exported?(GitHubSDK.Users, :get_authenticated, 1)

    assert Code.ensure_loaded?(GitHubSDK.Repos)
    assert function_exported?(GitHubSDK.Repos, :list_for_authenticated_user, 2)

    assert Code.ensure_loaded?(GitHubSDK.Issues)
    assert function_exported?(GitHubSDK.Issues, :list_for_repo, 2)

    assert Code.ensure_loaded?(GitHubSDK.Pulls)
    assert function_exported?(GitHubSDK.Pulls, :list, 2)

    assert Code.ensure_loaded?(GitHubSDK.Actions)
    assert function_exported?(GitHubSDK.Actions, :list_workflow_runs_for_repo, 2)

    assert Code.ensure_loaded?(GitHubSDK.Apps)
    assert function_exported?(GitHubSDK.Apps, :create_installation_access_token, 2)
    assert function_exported?(GitHubSDK.Apps, :check_token, 2)
  end
end

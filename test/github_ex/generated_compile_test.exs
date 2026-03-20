defmodule GitHubEx.GeneratedCompileTest do
  use ExUnit.Case, async: true

  @generation_manifest_path Path.expand("../../priv/generated/generation_manifest.json", __DIR__)
  @provider_ir_path Path.expand("../../priv/generated/provider_ir.json", __DIR__)
  @operation_auth_policies_path Path.expand(
                                  "../../priv/generated/operation_auth_policies.json",
                                  __DIR__
                                )

  test "all generated operations are present and compiled" do
    manifest = Jason.decode!(File.read!(@generation_manifest_path))
    provider_ir = Jason.decode!(File.read!(@provider_ir_path))
    operation_auth_policies = Jason.decode!(File.read!(@operation_auth_policies_path))

    assert manifest["operation_count"] == 1093
    assert length(provider_ir["operations"]) == 1093
    assert map_size(operation_auth_policies) == 1093

    Enum.each(provider_ir["operations"], fn %{
                                              "function" => function_name,
                                              "module" => module_name
                                            } ->
      module = parse_module!(module_name)
      function = String.to_atom(function_name)

      assert Code.ensure_loaded?(module)
      assert function_exported?(module, function, 3)
    end)
  end

  test "key api modules, generated client, and pagination wrappers are exported" do
    assert Code.ensure_loaded?(GitHubEx.Generated.Client)
    assert function_exported?(GitHubEx.Generated.Client, :new, 1)

    assert Code.ensure_loaded?(GitHubEx.Meta)
    assert function_exported?(GitHubEx.Meta, :root, 3)

    assert Code.ensure_loaded?(GitHubEx.Users)
    assert function_exported?(GitHubEx.Users, :get_authenticated, 3)

    assert Code.ensure_loaded?(GitHubEx.Repos)
    assert function_exported?(GitHubEx.Repos, :list_for_authenticated_user, 3)
    assert function_exported?(GitHubEx.Repos, :stream_list_for_authenticated_user, 3)

    assert Code.ensure_loaded?(GitHubEx.Issues)
    assert function_exported?(GitHubEx.Issues, :list_for_repo, 3)

    assert Code.ensure_loaded?(GitHubEx.Pulls)
    assert function_exported?(GitHubEx.Pulls, :list, 3)

    assert Code.ensure_loaded?(GitHubEx.Actions)
    assert function_exported?(GitHubEx.Actions, :list_workflow_runs_for_repo, 3)
    assert function_exported?(GitHubEx.Actions, :stream_list_workflow_runs_for_repo, 3)

    assert Code.ensure_loaded?(GitHubEx.Apps)
    assert function_exported?(GitHubEx.Apps, :create_installation_access_token, 3)
    assert function_exported?(GitHubEx.Apps, :check_token, 3)
  end

  defp parse_module!(module_name) when is_binary(module_name) do
    module_name
    |> String.split(".")
    |> Enum.map(&String.to_atom/1)
    |> Module.concat()
  end
end

defmodule GitHubEx.ProviderContractTest do
  use ExUnit.Case, async: true

  alias GitHubEx.Codegen.Provider
  alias GitHubEx.Codegen.Plugins.Auth, as: AuthPlugin
  alias PristineCodegen.Compiler

  @project_root Path.expand("../..", __DIR__)

  @moduletag timeout: 120_000

  test "provider compiles into the final provider ir and artifact contract" do
    assert {:ok, compilation} =
             Compiler.compile(Provider, project_root: @project_root)

    provider_ir = compilation.provider_ir

    assert provider_ir.provider.base_module == GitHubEx
    assert provider_ir.provider.client_module == GitHubEx.Client
    assert provider_ir.provider.package_app == :github_ex
    assert provider_ir.provider.package_name == "github_ex"
    assert provider_ir.provider.source_strategy == :openapi_only

    assert Enum.any?(provider_ir.operations, fn operation ->
             operation.module == GitHubEx.Repos and
               operation.function == :list_for_authenticated_user
           end)

    assert Enum.any?(provider_ir.operations, fn operation ->
             operation.module == GitHubEx.Users and operation.function == :get_authenticated
           end)

    artifact_paths = Enum.map(provider_ir.artifact_plan.artifacts, & &1.path)

    assert "priv/generated/provider_ir.json" in artifact_paths
    assert "priv/generated/generation_manifest.json" in artifact_paths
    assert "priv/generated/docs_inventory.json" in artifact_paths
    assert "priv/generated/auth_manifest.json" in artifact_paths
    assert "priv/generated/operation_auth_policies.json" in artifact_paths

    refute "priv/generated/manifest.json" in artifact_paths
    refute "priv/generated/docs_manifest.json" in artifact_paths
    refute "priv/generated/open_api_state.snapshot.term" in artifact_paths
  end

  test "provider exposes GitHub auth derivation through the shared auth plugin seam" do
    auth_plugins = Provider.auth_plugins()

    assert length(auth_plugins) == 1
    assert Enum.member?(auth_plugins, AuthPlugin)

    assert {:ok, compilation} =
             Compiler.compile(Provider, project_root: @project_root)

    auth_policy_ids = Enum.map(compilation.provider_ir.auth_policies, & &1.id)

    assert "github.default_bearer_optional" in auth_policy_ids
    assert "github.oauth_application_client_credentials" in auth_policy_ids

    assert Enum.find(compilation.provider_ir.operations, &(&1.id == "apps/check-token")).auth_policy_id ==
             "github.oauth_application_client_credentials"
  end
end

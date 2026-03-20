defmodule GitHubEx.ArtifactFreshnessTest do
  use ExUnit.Case, async: true

  alias GitHubEx.AuthManifest
  alias GitHubEx.Codegen.Provider
  alias PristineCodegen.Compiler
  alias PristineProviderTestkit.Conformance

  @project_root Path.expand("../..", __DIR__)
  @auth_matrix_guide "guides/auth-capability-matrix.md"
  @final_artifacts [
    "priv/generated/provider_ir.json",
    "priv/generated/generation_manifest.json",
    "priv/generated/docs_inventory.json",
    "priv/generated/auth_manifest.json",
    "priv/generated/operation_auth_policies.json"
  ]
  @legacy_artifacts [
    "priv/generated/manifest.json",
    "priv/generated/docs_manifest.json",
    "priv/generated/open_api_state.snapshot.term"
  ]

  test "committed generated artifacts match the migration matrix" do
    assert Enum.all?(@final_artifacts, &File.exists?(Path.join(@project_root, &1)))
    refute Enum.any?(@legacy_artifacts, &File.exists?(Path.join(@project_root, &1)))
  end

  test "provider conformance passes against the committed generated surface" do
    assert :ok = Conformance.verify_provider(Provider, project_root: @project_root)
  end

  test "committed auth capability guide matches the compiler-rendered auth output" do
    assert {:ok, compilation} =
             Compiler.compile(Provider, project_root: @project_root)

    %{guide: guide} = AuthManifest.render(compilation.provider_ir, project_root: @project_root)

    assert File.read!(Path.join(@project_root, @auth_matrix_guide)) == guide
  end
end

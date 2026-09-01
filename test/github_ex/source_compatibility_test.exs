defmodule GitHubEx.SourceCompatibilityTest do
  use ExUnit.Case, async: true

  alias GitHubEx.TestSupport.ModuleTools

  @project_root Path.expand("../..", __DIR__)

  test "result classifier source compiles without transport error modules being present" do
    probe_module = ModuleTools.unique_module("ResultClassifierProbe")

    source =
      ModuleTools.transform_module_source!(
        Path.join(@project_root, "lib/github_ex/result_classifier.ex"),
        GitHubEx.ResultClassifier,
        probe_module,
        [
          {"Mint.TransportError", "Missing.TransportError"},
          {"Mint.HTTPError", "Missing.HTTPError"}
        ]
      )

    assert [{^probe_module, _beam}] = Code.compile_string(source)

    on_exit(fn ->
      :code.purge(probe_module)
      :code.delete(probe_module)
    end)
  end

  test "refresh source compiles without Finch.Response being present" do
    probe_module = ModuleTools.unique_module("RefreshProbe")

    source =
      ModuleTools.transform_module_source!(
        Path.join(@project_root, "lib/github_ex/refresh.ex"),
        GitHubEx.Refresh,
        probe_module,
        [{"Finch.Response", "Missing.Finch.Response"}]
      )

    assert [{^probe_module, _beam}] = Code.compile_string(source)

    on_exit(fn ->
      :code.purge(probe_module)
      :code.delete(probe_module)
    end)
  end
end

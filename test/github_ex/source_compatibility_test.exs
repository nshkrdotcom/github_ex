defmodule GitHubEx.SourceCompatibilityTest do
  use ExUnit.Case, async: false

  alias GitHubEx.TestSupport.ModuleTools

  @moduletag :tmp_dir

  @project_root Path.expand("../..", __DIR__)

  setup do
    original_project = Mix.Project.get()

    on_exit(fn ->
      restore_mix_project_stack(original_project)
    end)

    :ok
  end

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

  test "mix project skips path dependency loading when compiled from a deps checkout", %{
    tmp_dir: tmp_dir
  } do
    probe_module = ModuleTools.unique_module("MixProjectDepsProbe")
    mix_path = Path.join([tmp_dir, "deps", "github_ex", "mix.exs"])

    write_transformed_mix_exs!(mix_path, probe_module)

    assert [{^probe_module, _beam}] = Code.compile_file(mix_path)
    assert Keyword.keyword?(probe_module.project())

    on_exit(fn ->
      :code.purge(probe_module)
      :code.delete(probe_module)
    end)
  end

  test "mix project skips path dependency loading outside its own project root", %{
    tmp_dir: tmp_dir
  } do
    probe_module = ModuleTools.unique_module("MixProjectStandaloneProbe")
    mix_path = Path.join([tmp_dir, "standalone", "github_ex", "mix.exs"])

    write_transformed_mix_exs!(mix_path, probe_module)

    assert [{^probe_module, _beam}] = Code.compile_file(mix_path)
    assert Keyword.keyword?(probe_module.project())

    on_exit(fn ->
      :code.purge(probe_module)
      :code.delete(probe_module)
    end)
  end

  defp write_transformed_mix_exs!(path, probe_module) do
    plt_path = Path.join(@project_root, "build_support/plt_fingerprint.ex")

    dependency_resolver_path =
      Path.join(@project_root, "build_support/dependency_resolver.exs")

    source =
      Path.join(@project_root, "mix.exs")
      |> File.read!()
      |> String.replace(
        "Code.require_file(\"build_support/dependency_resolver.exs\", __DIR__)",
        "Code.require_file(#{inspect(dependency_resolver_path)})",
        global: false
      )
      |> String.replace(
        "Code.require_file(\"build_support/plt_fingerprint.ex\", __DIR__)",
        "Code.require_file(#{inspect(plt_path)})",
        global: false
      )
      |> String.replace(
        "defmodule GitHubEx.MixProject do",
        "defmodule #{inspect(probe_module)} do",
        global: false
      )

    File.mkdir_p!(Path.dirname(path))
    File.write!(path, source)
  end

  defp restore_mix_project_stack(original_project) do
    case Mix.Project.get() do
      ^original_project ->
        :ok

      nil ->
        :ok

      _other ->
        Mix.Project.pop()
        restore_mix_project_stack(original_project)
    end
  end
end

defmodule GitHubEx.SourceCompatibilityTest do
  use ExUnit.Case, async: false

  alias GitHubEx.TestSupport.ModuleTools

  @moduletag :tmp_dir

  @project_root Path.expand("../..", __DIR__)

  setup do
    original_project = Mix.Project.get()
    original_argv = System.argv()

    on_exit(fn ->
      System.argv(original_argv)
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
    assert Keyword.keyword?(project_config(probe_module))

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
    assert Keyword.keyword?(project_config(probe_module))

    on_exit(fn ->
      :code.purge(probe_module)
      :code.delete(probe_module)
    end)
  end

  test "mix deps.get prefers sibling workspace sources when they exist", %{
    tmp_dir: tmp_dir
  } do
    probe_module = ModuleTools.unique_module("MixProjectWorkspaceDepsProbe")
    mix_path = Path.join([tmp_dir, "standalone", "github_ex", "mix.exs"])
    original_argv = System.argv()

    pristine_runtime_path =
      Path.join([tmp_dir, "standalone", "pristine", "apps", "pristine_runtime"])

    pristine_codegen_path =
      Path.join([tmp_dir, "standalone", "pristine", "apps", "pristine_codegen"])

    pristine_provider_testkit_path =
      Path.join([tmp_dir, "standalone", "pristine", "apps", "pristine_provider_testkit"])

    File.mkdir_p!(pristine_runtime_path)
    File.mkdir_p!(pristine_codegen_path)
    File.mkdir_p!(pristine_provider_testkit_path)
    write_transformed_mix_exs!(mix_path, probe_module)
    System.argv(["deps.get"])

    assert [{^probe_module, _beam}] = Code.compile_file(mix_path)

    deps = project_config(probe_module)[:deps]

    assert {:pristine, opts} = find_dependency!(deps, :pristine)
    assert resolved_path(opts[:path], mix_path) == pristine_runtime_path

    assert {:pristine_codegen, codegen_opts} = find_dependency!(deps, :pristine_codegen)
    assert resolved_path(codegen_opts[:path], mix_path) == pristine_codegen_path

    assert {:pristine_provider_testkit, testkit_opts} =
             find_dependency!(deps, :pristine_provider_testkit)

    assert resolved_path(testkit_opts[:path], mix_path) == pristine_provider_testkit_path

    on_exit(fn ->
      System.argv(original_argv)
      :code.purge(probe_module)
      :code.delete(probe_module)
    end)
  end

  test "hex packaging commands match the published dependency surface", %{
    tmp_dir: tmp_dir
  } do
    probe_module = ModuleTools.unique_module("MixProjectPublishedDepsProbe")
    mix_path = Path.join([tmp_dir, "standalone", "github_ex", "mix.exs"])

    write_transformed_mix_exs!(mix_path, probe_module)
    System.argv(["hex.build"])

    assert [{^probe_module, _beam}] = Code.compile_file(mix_path)

    deps = project_config(probe_module)[:deps]

    assert {:pristine, "~> 0.2.1"} = find_dependency!(deps, :pristine)
    refute dependency_present?(deps, :pristine_codegen)
    refute dependency_present?(deps, :pristine_provider_testkit)

    on_exit(fn ->
      :code.purge(probe_module)
      :code.delete(probe_module)
    end)
  end

  defp write_transformed_mix_exs!(path, probe_module) do
    plt_path = Path.join(@project_root, "build_support/plt_fingerprint.ex")
    dependency_sources_path = Path.join(@project_root, "build_support/dependency_sources.exs")
    build_support_path = Path.join(Path.dirname(path), "build_support")

    source =
      Path.join(@project_root, "mix.exs")
      |> File.read!()
      |> String.replace(
        "Code.require_file(\"build_support/dependency_sources.exs\", __DIR__)",
        "Code.require_file(#{inspect(dependency_sources_path)})",
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

    File.mkdir_p!(build_support_path)

    File.cp!(
      Path.join(@project_root, "build_support/dependency_sources.config.exs"),
      Path.join(build_support_path, "dependency_sources.config.exs")
    )

    File.write!(path, source)
  end

  defp project_config(module) do
    :erlang.apply(module, :project, [])
  end

  defp find_dependency!(deps, app) do
    Enum.find(deps, fn
      {^app, _requirement} -> true
      {^app, _requirement, _opts} -> true
      {^app, opts} when is_list(opts) -> true
      _other -> false
    end) || flunk("expected dependency #{inspect(app)} to be present")
  end

  defp dependency_present?(deps, app) do
    Enum.any?(deps, fn
      {^app, _requirement} -> true
      {^app, _requirement, _opts} -> true
      {^app, opts} when is_list(opts) -> true
      _other -> false
    end)
  end

  defp resolved_path(path, mix_path), do: Path.expand(path, Path.dirname(mix_path))

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

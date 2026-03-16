defmodule GitHubEx.TestSupport.ModuleTools do
  @moduledoc false

  def replace!(module, source) when is_atom(module) and is_binary(source) do
    original = snapshot(module)
    unload(module)
    compile_without_conflicts!(source)
    fn -> restore(module, original) end
  end

  def unique_module(prefix) when is_binary(prefix) do
    Module.concat([GitHubEx, TestSupport, "#{prefix}#{System.unique_integer([:positive])}"])
  end

  def transform_module_source!(path, original_module, replacement_module, replacements \\ [])
      when is_binary(path) and is_atom(original_module) and is_atom(replacement_module) do
    source =
      path
      |> File.read!()
      |> String.replace(
        "defmodule #{inspect(original_module)} do",
        "defmodule #{inspect(replacement_module)} do",
        global: false
      )

    Enum.reduce(replacements, source, fn {pattern, replacement}, source ->
      String.replace(source, pattern, replacement)
    end)
  end

  defp snapshot(module) do
    case :code.get_object_code(module) do
      {^module, binary, path} -> {:loaded, binary, path}
      :error -> :unloaded
    end
  end

  defp restore(module, original) do
    unload(module)

    case original do
      {:loaded, binary, path} ->
        {:module, ^module} = :code.load_binary(module, path, binary)
        :ok

      :unloaded ->
        :ok
    end
  end

  defp unload(module) do
    :code.purge(module)
    :code.delete(module)
    :ok
  end

  defp compile_without_conflicts!(source) do
    previous_options = Code.compiler_options()
    Code.compiler_options(ignore_module_conflict: true)

    try do
      Code.compile_string(source)
    after
      Code.compiler_options(previous_options)
    end
  end
end

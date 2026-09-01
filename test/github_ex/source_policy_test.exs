defmodule GitHubEx.SourcePolicyTest do
  use ExUnit.Case, async: true

  @repo_root Path.expand("../..", __DIR__)

  @code_extensions [".ex", ".exs", ".erl", ".hrl", ".sh", ".js", ".ts", ".py"]
  @code_basenames [".credo.exs", ".formatter.exs", "mix.exs"]

  test "repo-owned code avoids unbounded atom creation" do
    assert_no_hits(atom_tokens(), &code_file?/1)
    assert_no_prefixed_dynamic_quoted_atom_hits()
  end

  test "repo-owned code avoids pattern engine APIs" do
    assert_no_hits(elixir_pattern_tokens(), &elixir_code_file?/1)
    assert_no_hits(javascript_pattern_tokens(), &javascript_code_file?/1)
    assert_no_hits(python_pattern_tokens(), &python_code_file?/1)
  end

  defp assert_no_hits(tokens, file_filter) do
    hits =
      @repo_root
      |> candidate_files()
      |> Enum.filter(file_filter)
      |> Enum.flat_map(&file_hits(&1, tokens))

    assert hits == []
  end

  defp assert_no_prefixed_dynamic_quoted_atom_hits do
    hits =
      @repo_root
      |> candidate_files()
      |> Enum.filter(&(code_file?(&1) and prefixed_dynamic_quoted_atom?(&1)))
      |> Enum.map(&(&1 <> " contains prefixed dynamic quoted atom interpolation"))

    assert hits == []
  end

  defp candidate_files(repo_root) do
    tracked = git_lines(repo_root, ["ls-files"])
    untracked = git_lines(repo_root, ["ls-files", "--others", "--exclude-standard"])

    (tracked ++ untracked)
    |> Enum.uniq()
    |> Enum.filter(&File.regular?(Path.join(repo_root, &1)))
    |> Enum.reject(&ignored_path?/1)
  end

  defp git_lines(repo_root, args) do
    {output, 0} = System.cmd("git", ["-C", repo_root] ++ args)
    String.split(output, "\n", trim: true)
  end

  defp ignored_path?(path) do
    String.starts_with?(path, "deps/") or
      String.starts_with?(path, "_build/") or
      String.starts_with?(path, "doc/") or
      String.starts_with?(path, "tmp/")
  end

  defp code_file?(path) do
    Path.basename(path) in @code_basenames or Path.extname(path) in @code_extensions
  end

  defp elixir_code_file?(path) do
    Path.basename(path) in @code_basenames or
      Path.extname(path) in [".ex", ".exs", ".erl", ".hrl"]
  end

  defp javascript_code_file?(path), do: Path.extname(path) in [".js", ".ts"]
  defp python_code_file?(path), do: Path.extname(path) == ".py"

  defp file_hits(path, tokens) do
    content = File.read!(Path.join(@repo_root, path))

    tokens
    |> Enum.filter(&String.contains?(content, &1))
    |> Enum.map(fn token -> path <> " contains " <> inspect(token) end)
  end

  defp atom_tokens do
    [
      "String." <> "to_atom",
      "String." <> "to_existing_atom",
      "binary_" <> "to_atom",
      "binary_" <> "to_existing_atom",
      "list_" <> "to_atom",
      "list_" <> "to_existing_atom",
      "Module." <> "concat",
      <<?:, ?#, ?{>>,
      <<?:, ?", ?#, ?{>>
    ]
  end

  defp prefixed_dynamic_quoted_atom?(path) do
    @repo_root
    |> Path.join(path)
    |> File.read!()
    |> String.split(<<?:, ?">>)
    |> Enum.drop(1)
    |> Enum.any?(&prefixed_interpolation_before_quote?/1)
  end

  defp prefixed_interpolation_before_quote?(segment) do
    segment
    |> quoted_prefix()
    |> prefixed_interpolation?()
  end

  defp quoted_prefix(segment) do
    segment
    |> String.split(<<?">>, parts: 2)
    |> List.first()
  end

  defp prefixed_interpolation?(quoted) do
    case :binary.match(quoted, <<?#, ?{>>) do
      {0, 2} -> false
      {_index, 2} -> true
      :nomatch -> false
    end
  end

  defp elixir_pattern_tokens do
    [
      "reg" <> "ex",
      "Reg" <> "ex",
      "~" <> "r",
      ":re" <> ".",
      "String." <> "match"
    ]
  end

  defp javascript_pattern_tokens do
    [
      "Reg" <> "Exp",
      "reg" <> "exp"
    ]
  end

  defp python_pattern_tokens do
    [
      "re." <> "compile",
      "re." <> "search",
      "re." <> "match",
      "re." <> "fullmatch",
      "re." <> "sub",
      "re." <> "split",
      "re." <> "findall",
      "re." <> "finditer",
      "from " <> "re import",
      "import " <> "re"
    ]
  end
end

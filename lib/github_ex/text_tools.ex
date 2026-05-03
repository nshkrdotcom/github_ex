defmodule GitHubEx.TextTools do
  @moduledoc false

  @relative_link_base "https://docs.github.com"

  def replace_markdown_relative_links(text) when is_binary(text) do
    replace_markdown_relative_links(text, "")
  end

  def split_scopes(value) when is_binary(value) do
    value
    |> split_on_chars([?\s, ?\n, ?\r, ?\t, ?,])
    |> Enum.reject(&(&1 == ""))
  end

  def split_words(value) when is_binary(value) do
    value
    |> split_on_chars([?\s, ?\n, ?\r, ?\t])
    |> Enum.reject(&(&1 == ""))
  end

  def identifier_name(value) do
    value
    |> to_string()
    |> Macro.underscore()
    |> replace_non_identifier_chars()
    |> String.trim("_")
  end

  def module_name_from_tag(tag) do
    tag
    |> to_string()
    |> split_on_non_alnum()
    |> Enum.map_join(&Macro.camelize/1)
    |> case do
      "" -> "Misc"
      module_name -> module_name
    end
  end

  def code_span_values(text) when is_binary(text) do
    text
    |> String.split("`")
    |> every_other_segment()
    |> Enum.filter(&identifierish?/1)
  end

  def sentence_fragments(text) when is_binary(text) do
    text
    |> String.split([".", "\n", "\r"], trim: true)
    |> Enum.map(&String.trim/1)
    |> Enum.reject(&(&1 == ""))
  end

  def relative_markdown_link?(text) when is_binary(text) do
    String.contains?(text, "](/")
  end

  def next_data_script_json!(html, page_url) when is_binary(html) do
    start_marker = ~s(<script id="__NEXT_DATA__" type="application/json">)
    end_marker = "</script>"

    with [_before, after_start] <- String.split(html, start_marker, parts: 2),
         [json, _after] <- String.split(after_start, end_marker, parts: 2) do
      json
    else
      _other -> raise "missing __NEXT_DATA__ payload for #{page_url}"
    end
  end

  def parse_link_relation(part) when is_binary(part) do
    trimmed = String.trim(part)

    with "<" <> rest <- trimmed,
         [url, rel_part] <- String.split(rest, ">;", parts: 2),
         {:ok, rel} <- parse_rel(String.trim(rel_part)) do
      {:ok, url, rel}
    else
      _other -> :error
    end
  end

  def normalize_markdown_relative_link(url) when is_binary(url) do
    @relative_link_base <> url
  end

  defp replace_markdown_relative_links("", acc), do: acc

  defp replace_markdown_relative_links(text, acc) do
    case String.split(text, "](/", parts: 2) do
      [rest] ->
        acc <> rest

      [before, after_marker] ->
        case String.split(after_marker, ")", parts: 2) do
          [relative_url, rest] ->
            replace_markdown_relative_links(
              rest,
              acc <>
                before <> "](" <> normalize_markdown_relative_link("/" <> relative_url) <> ")"
            )

          [_unterminated] ->
            acc <> before <> "](/" <> after_marker
        end
    end
  end

  defp split_on_chars(value, separators) do
    value
    |> String.to_charlist()
    |> Enum.reduce({[], []}, fn char, {current, parts} ->
      if char in separators do
        {[], [current |> Enum.reverse() |> to_string() | parts]}
      else
        {[char | current], parts}
      end
    end)
    |> then(fn {current, parts} ->
      [current |> Enum.reverse() |> to_string() | parts]
    end)
    |> Enum.reverse()
  end

  defp split_on_non_alnum(value) do
    value
    |> String.to_charlist()
    |> Enum.reduce({[], []}, fn char, {current, parts} ->
      if ascii_alnum?(char) do
        {[char | current], parts}
      else
        {[], [current |> Enum.reverse() |> to_string() | parts]}
      end
    end)
    |> then(fn {current, parts} ->
      [current |> Enum.reverse() |> to_string() | parts]
    end)
    |> Enum.reverse()
    |> Enum.reject(&(&1 == ""))
  end

  defp replace_non_identifier_chars(value) do
    value
    |> String.to_charlist()
    |> Enum.map(fn char ->
      if ascii_lower?(char) or ascii_digit?(char) or char == ?_ do
        char
      else
        ?_
      end
    end)
    |> to_string()
  end

  defp every_other_segment(segments) do
    segments
    |> Enum.with_index()
    |> Enum.filter(fn {_segment, index} -> rem(index, 2) == 1 end)
    |> Enum.map(fn {segment, _index} -> segment end)
  end

  defp identifierish?(value) do
    value != "" and
      value
      |> String.to_charlist()
      |> Enum.all?(fn char ->
        ascii_lower?(char) or ascii_digit?(char) or char in [?:, ?_, ?-]
      end)
  end

  defp parse_rel(~s(rel=") <> rest) do
    case String.split(rest, ~s("), parts: 2) do
      [rel, ""] -> {:ok, rel}
      [rel, _rest] -> {:ok, rel}
      _other -> :error
    end
  end

  defp parse_rel(_rel_part), do: :error

  defp ascii_alnum?(char), do: ascii_lower?(char) or ascii_upper?(char) or ascii_digit?(char)
  defp ascii_lower?(char), do: char >= ?a and char <= ?z
  defp ascii_upper?(char), do: char >= ?A and char <= ?Z
  defp ascii_digit?(char), do: char >= ?0 and char <= ?9
end

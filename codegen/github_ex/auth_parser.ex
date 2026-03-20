defmodule GitHubEx.AuthParser do
  @moduledoc false

  @availability_pattern ~r/\[`?(GET|POST|PUT|PATCH|DELETE|HEAD|OPTIONS)\s+([^`\]]+)`?\]\(([^)]+)\)/
  @heading_pattern ~r/^##\s+(.+?) permissions for "(.+)"\s*$/
  @table_row_pattern ~r/^\|\s*`(GET|POST|PUT|PATCH|DELETE|HEAD|OPTIONS)\s+([^`]+)`\s*\|\s*([^|]+?)\s*\|\s*([^|]+?)\s*\|\s*([^|]+?)\s*\|$/
  @prog_access_permission_pattern ~r/^"([^"]+)"\s+(.+?)\s+permissions$/
  @scope_sentence_pattern ~r/[^.\n]*(scope|scopes)[^.\n]*/i

  @spec normalize_endpoint_key(atom() | String.t(), String.t()) :: String.t()
  def normalize_endpoint_key(method, path) when is_atom(method) do
    normalize_endpoint_key(Atom.to_string(method), path)
  end

  def normalize_endpoint_key(method, path) when is_binary(path) do
    "#{method |> to_string() |> String.upcase()} #{path}"
  end

  @spec parse_endpoint_availability(String.t()) :: map()
  def parse_endpoint_availability(markdown) when is_binary(markdown) do
    Regex.scan(@availability_pattern, markdown)
    |> Enum.reduce(%{}, fn [_, method, path, href], acc ->
      Map.put_new(acc, normalize_endpoint_key(method, path), %{
        method: method,
        path: path,
        docs_href: href
      })
    end)
  end

  @spec parse_permissions(String.t(), :fine_grained_pat | :github_apps) :: map()
  def parse_permissions(markdown, kind)
      when is_binary(markdown) and kind in [:fine_grained_pat, :github_apps] do
    markdown
    |> String.split("\n")
    |> Enum.reduce(%{acc: %{}, current: nil}, &reduce_permission_line(&1, &2, kind))
    |> Map.fetch!(:acc)
    |> Map.new(fn {key, entries} ->
      {key, entries |> Enum.reverse() |> Enum.uniq()}
    end)
  end

  @spec parse_prog_access(map() | nil) :: map() | nil
  def parse_prog_access(nil), do: nil

  def parse_prog_access(raw) when is_map(raw) do
    %{
      fine_grained_pat: get(raw, "fineGrainedPat"),
      github_app_installation: get(raw, "serverToServer"),
      github_app_user: get(raw, "userToServerRest"),
      allow_permissionless_access: Map.get(raw, "allowPermissionlessAccess", false),
      allows_public_read: Map.get(raw, "allowsPublicRead", false),
      permissions:
        raw
        |> Map.get("permissions", [])
        |> Enum.flat_map(&parse_prog_access_permissions/1)
        |> Enum.uniq()
    }
  end

  defp reduce_permission_line(line, state, kind) do
    cond do
      heading = parse_permission_heading(line) ->
        %{state | current: heading}

      row = parse_permission_row(line) ->
        merge_permission_row(state, row, kind)

      true ->
        state
    end
  end

  defp merge_permission_row(%{current: nil} = state, _row, _kind), do: state

  defp merge_permission_row(%{acc: acc, current: current} = state, row, kind) do
    entry =
      current
      |> Map.merge(%{
        access: normalize_access(row.access),
        additional_permissions: additional_permissions?(row.additional_permissions)
      })
      |> maybe_put_token_types(kind, row.tokens)

    %{state | acc: merge_permission_entry(acc, row, entry)}
  end

  @spec extract_legacy_scope_hints(String.t() | nil) :: [String.t()]
  def extract_legacy_scope_hints(nil), do: []

  def extract_legacy_scope_hints(description) when is_binary(description) do
    description
    |> legacy_hint_sentences()
    |> Enum.flat_map(fn sentence ->
      Regex.scan(~r/`([a-z][a-z0-9:_-]*)`/, sentence, capture: :all_but_first)
      |> List.flatten()
    end)
    |> Enum.uniq()
  end

  @spec legacy_hint_flags(String.t() | nil) :: %{
          classic_pat: boolean(),
          oauth_access_token: boolean()
        }
  def legacy_hint_flags(nil), do: %{classic_pat: false, oauth_access_token: false}

  def legacy_hint_flags(description) when is_binary(description) do
    lowered = String.downcase(description)

    %{
      classic_pat:
        String.contains?(lowered, "personal access tokens (classic)") or
          String.contains?(lowered, "personal access token (classic)") or
          String.contains?(lowered, "classic pat"),
      oauth_access_token:
        String.contains?(lowered, "oauth app token") or
          String.contains?(lowered, "oauth app tokens") or
          String.contains?(lowered, "oauth apps")
    }
  end

  @spec mentions_github_app_only?(String.t() | nil) :: boolean()
  def mentions_github_app_only?(nil), do: false

  def mentions_github_app_only?(description) when is_binary(description) do
    lowered = String.downcase(description)

    (String.contains?(lowered, "must use a github app") or
       String.contains?(lowered, "only available to github apps")) and
      (String.contains?(lowered, "oauth apps") or String.contains?(lowered, "authenticated users"))
  end

  defp get(map, key) when is_map(map) do
    Map.get(map, key) || Map.get(map, String.to_atom(key))
  rescue
    ArgumentError -> Map.get(map, key)
  end

  defp parse_permission_heading(line) do
    case Regex.run(@heading_pattern, line) do
      [_, scope_type, permission] ->
        %{
          scope_type: normalize_scope_type(scope_type),
          permission: permission
        }

      _other ->
        nil
    end
  end

  defp parse_permission_row(line) do
    case Regex.run(@table_row_pattern, line) do
      [_, method, path, access, tokens, additional_permissions] ->
        %{
          method: method,
          path: path,
          access: access,
          tokens: tokens,
          additional_permissions: additional_permissions
        }

      _other ->
        nil
    end
  end

  defp maybe_put_token_types(entry, :fine_grained_pat, _tokens), do: entry

  defp maybe_put_token_types(entry, :github_apps, tokens) do
    Map.put(entry, :token_types, parse_token_types(tokens))
  end

  defp merge_permission_entry(acc, row, entry) do
    Map.update(
      acc,
      normalize_endpoint_key(row.method, row.path),
      [entry],
      &[entry | &1]
    )
  end

  defp parse_token_types(tokens) when is_binary(tokens) do
    tokens
    |> String.split([",", "/"], trim: true)
    |> Enum.map(&String.trim/1)
    |> Enum.reject(&(&1 == ""))
    |> Enum.uniq()
  end

  defp parse_prog_access_permissions(entry) when is_map(entry) do
    Enum.flat_map(entry, fn {label, access} ->
      case Regex.run(@prog_access_permission_pattern, label) do
        [_, permission, scope_type] ->
          [
            %{
              scope_type: normalize_scope_type(scope_type),
              permission: permission,
              access: normalize_access(access),
              additional_permissions: false
            }
          ]

        _other ->
          []
      end
    end)
  end

  defp legacy_hint_sentences(description) do
    matches =
      Regex.scan(@scope_sentence_pattern, description)
      |> Enum.map(&List.first/1)

    flag_matches =
      description
      |> String.split(["\n", "\r"], trim: true)
      |> Enum.filter(fn line ->
        lowered = String.downcase(line)

        String.contains?(lowered, "personal access tokens (classic)") or
          String.contains?(lowered, "oauth app token") or
          String.contains?(lowered, "oauth app tokens")
      end)

    (matches ++ flag_matches)
    |> Enum.map(&String.trim/1)
    |> Enum.reject(&(&1 == ""))
    |> Enum.uniq()
  end

  defp normalize_scope_type(scope_type) do
    scope_type
    |> String.trim()
    |> String.downcase()
    |> case do
      "user" -> "account"
      other -> other
    end
  end

  defp normalize_access(access) do
    access
    |> String.trim()
    |> String.downcase()
  end

  defp additional_permissions?(value) do
    value
    |> String.trim()
    |> case do
      "✓" -> true
      "✔" -> true
      _other -> false
    end
  end
end

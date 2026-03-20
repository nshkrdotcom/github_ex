defmodule GitHubEx.AuthManifest do
  @moduledoc false

  alias GitHubEx.AuthParser
  alias GitHubEx.AuthSources
  alias PristineCodegen.{JSON, ProviderIR}

  @supported_methods ~w(get post put patch delete head options)
  @example_lookup_order [
    {"00_smoke.exs", "meta/root"},
    {"01_get_authenticated_user.exs", "users/get-authenticated"},
    {"02_list_authenticated_repos.exs", "repos/list-for-authenticated-user"},
    {"03_list_repo_issues.exs", "issues/list-for-repo"},
    {"04_list_pull_requests.exs", "pulls/list"},
    {"05_list_workflow_runs.exs", "actions/list-workflow-runs-for-repo"}
  ]

  @spec paths(keyword()) :: map()
  def paths(opts \\ []) when is_list(opts) do
    project_root = Keyword.get(opts, :project_root, Path.expand("../..", __DIR__))

    %{
      auth_manifest_path: Path.join(project_root, "priv/generated/auth_manifest.json"),
      auth_matrix_guide_path: Path.join(project_root, "guides/auth-capability-matrix.md"),
      project_root: project_root
    }
  end

  @spec generate!(map(), [map()], keyword()) :: map()
  def generate!(spec, operations, opts \\ []) when is_map(spec) and is_list(operations) do
    manifest =
      opts
      |> AuthSources.load!()
      |> build(spec, operations)

    manifest_paths = paths(opts)

    File.write!(
      manifest_paths.auth_manifest_path,
      JSON.encode!(manifest)
    )

    File.write!(manifest_paths.auth_matrix_guide_path, build_guide(manifest))

    manifest
  end

  @spec render(ProviderIR.t(), keyword()) :: %{manifest: map(), guide: String.t()}
  def render(%ProviderIR{} = provider_ir, opts \\ []) when is_list(opts) do
    spec =
      opts
      |> AuthSources.paths()
      |> Map.fetch!(:spec_path)
      |> File.read!()
      |> Jason.decode!()

    manifest =
      opts
      |> AuthSources.load!()
      |> build(spec, provider_ir.operations)

    %{guide: build_guide(manifest), manifest: manifest}
  end

  @spec write!(ProviderIR.t(), keyword()) :: map()
  def write!(%ProviderIR{} = provider_ir, opts \\ []) when is_list(opts) do
    %{guide: guide, manifest: manifest} = render(provider_ir, opts)
    manifest_paths = paths(opts)

    File.write!(
      manifest_paths.auth_manifest_path,
      JSON.encode!(manifest)
    )

    File.write!(manifest_paths.auth_matrix_guide_path, guide)

    manifest
  end

  @spec build(map(), map(), [map()]) :: map()
  def build(bundle, spec, operations)
      when is_map(bundle) and is_map(spec) and is_list(operations) do
    operations = Enum.map(operations, &normalize_operation/1)
    parsed = parse_sources(bundle)
    spec_index = build_spec_index(spec)

    manifest_operations =
      operations
      |> Enum.map(fn operation ->
        key = AuthParser.normalize_endpoint_key(operation.method, operation.path)

        case Map.fetch(spec_index, key) do
          {:ok, spec_entry} -> build_operation_entry(operation, spec_entry, parsed)
          :error -> raise "missing OpenAPI metadata for #{key}"
        end
      end)
      |> Enum.sort_by(&{&1.module, &1.path, &1.function})

    %{
      generated_at: Date.utc_today() |> Date.to_iso8601(),
      module_summaries: build_module_summaries(manifest_operations),
      operations: manifest_operations,
      sources: build_sources(bundle),
      spec_version: GitHubEx.Client.default_api_version(),
      summary: build_summary(manifest_operations)
    }
  end

  @spec build_guide(map()) :: String.t()
  def build_guide(manifest) when is_map(manifest) do
    summary = manifest.summary
    module_summaries = manifest.module_summaries
    examples = build_example_rows(manifest.operations)
    conflicts = Enum.filter(manifest.operations, &(&1.source_confidence == "conflict"))

    ([
       "# Auth Capability Matrix",
       "",
       "Generated from `priv/generated/auth_manifest.json` and the committed GitHub Docs auth snapshots in `priv/upstream/github_docs_auth/`.",
       "",
       "## Token Families",
       "",
       "| Token family | Supported operations | Notes |",
       "|--------|--------:|--------|",
       "| Fine-grained PAT | #{summary.token_support_counts.fine_grained_pat} | Structured support comes from GitHub's endpoint-availability page plus endpoint `progAccess` when present. |",
       "| GitHub App installation token | #{summary.token_support_counts.github_app_installation} | Structured support comes from GitHub's installation-token availability page. |",
       "| GitHub App user token | #{summary.token_support_counts.github_app_user} | Structured support comes from GitHub's app-user-token availability page. |",
       "| OAuth application client credentials | #{summary.token_support_counts.oauth_application} | These are the five `/applications/{client_id}/token*` and `/grant` endpoints. |",
       "",
       "Classic PAT and OAuth access token coverage are only lower-confidence legacy hints here. GitHub does not publish one structured classic-PAT coverage index for the full REST surface.",
       "",
       "## Confidence Levels",
       "",
       "- `structured`: the operation is backed by GitHub's structured availability pages, permission tables, endpoint `progAccess`, or the special OAuth-application path contract.",
       "- `legacy_hint`: the best available signal is legacy OpenAPI prose or classic/OAuth scope hints.",
       "- `unknown`: there is no reliable structured or legacy auth signal for that field.",
       "- `conflict`: structured sources or legacy prose materially disagree, so the matrix preserves the disagreement instead of pretending certainty.",
       "",
       "## Token Support Values",
       "",
       "- `true` or `false`: derived from structured GitHub docs sources.",
       "- `legacy_scope_hint`: only a legacy scope hint exists for that token family.",
       "- `unknown`: no trustworthy source exists for that token family.",
       "- `conflict`: structured sources or structured-vs-legacy sources disagree.",
       "",
       "## Lookup",
       "",
       "Use the generated manifest directly or ask the CLI helper for one operation at a time:",
       "",
       "```bash",
       "mix github.auth.lookup GET /user/repos",
       "mix github.auth.lookup repos/list-for-authenticated-user",
       "```",
       "",
       "The runtime helper is `GitHubEx.AuthMatrix.lookup/1` or `GitHubEx.AuthMatrix.lookup/2`.",
       "",
       "## Example Lookups",
       "",
       "| Example | Operation | Fine-grained PAT | GitHub App install | GitHub App user | Notes |",
       "|--------|--------|--------|--------|--------|--------|"
     ] ++
       Enum.map(examples, &render_example_row/1) ++
       [
         "",
         "## Module Summary",
         "",
         "| Module | Total | FG PAT | App install | App user | Conflicts |",
         "|--------|--------:|--------:|--------:|--------:|--------:|"
       ] ++
       Enum.map(module_summaries, &render_module_row/1) ++
       [
         "",
         "## Conflict Notes",
         ""
       ] ++
       render_conflict_section(conflicts) ++
       [
         "",
         "## Machine-Readable Source",
         "",
         "The full per-operation matrix, including source provenance and notes, is committed in `priv/generated/auth_manifest.json`."
       ])
    |> Enum.join("\n")
    |> Kernel.<>("\n")
  end

  defp parse_sources(bundle) do
    %{
      app_install_support:
        bundle.snapshots
        |> Map.fetch!(:endpoints_github_app_installation)
        |> AuthParser.parse_endpoint_availability()
        |> Map.keys()
        |> MapSet.new(),
      app_permissions:
        bundle.snapshots
        |> Map.fetch!(:permissions_github_apps)
        |> AuthParser.parse_permissions(:github_apps),
      app_user_support:
        bundle.snapshots
        |> Map.fetch!(:endpoints_github_app_user)
        |> AuthParser.parse_endpoint_availability()
        |> Map.keys()
        |> MapSet.new(),
      endpoint_prog_access: normalize_endpoint_prog_access(bundle.endpoint_prog_access),
      fg_pat_permissions:
        bundle.snapshots
        |> Map.fetch!(:permissions_fg_pat)
        |> AuthParser.parse_permissions(:fine_grained_pat),
      fg_pat_support:
        bundle.snapshots
        |> Map.fetch!(:endpoints_fg_pat)
        |> AuthParser.parse_endpoint_availability()
        |> Map.keys()
        |> MapSet.new()
    }
  end

  defp normalize_endpoint_prog_access(snapshot) do
    snapshot
    |> Map.get("operations", %{})
    |> Map.new(fn {key, entry} ->
      {key,
       %{
         method: entry["method"],
         path: entry["path"],
         page_url: entry["page_url"],
         title: entry["title"],
         prog_access: normalize_prog_access(entry["prog_access"])
       }}
    end)
  end

  defp normalize_prog_access(nil), do: nil

  defp normalize_prog_access(raw) do
    %{
      allow_permissionless_access: raw["allow_permissionless_access"] || false,
      allows_public_read: raw["allows_public_read"] || false,
      fine_grained_pat: raw["fine_grained_pat"],
      github_app_installation: raw["github_app_installation"],
      github_app_user: raw["github_app_user"],
      permissions:
        Enum.map(raw["permissions"] || [], fn permission ->
          %{
            access: permission["access"],
            additional_permissions: permission["additional_permissions"] || false,
            permission: permission["permission"],
            scope_type: permission["scope_type"]
          }
        end)
    }
  end

  defp build_spec_index(spec) do
    spec
    |> Map.get("paths", %{})
    |> Enum.flat_map(fn {path, methods} ->
      Enum.flat_map(methods, fn
        {method, operation} when method in @supported_methods ->
          [
            {AuthParser.normalize_endpoint_key(method, path),
             %{
               description: normalize_text(operation["description"]),
               docs_url: get_in(operation, ["externalDocs", "url"]),
               enabled_for_github_apps: get_in(operation, ["x-github", "enabledForGitHubApps"]),
               operation_id: operation["operationId"],
               summary: normalize_text(operation["summary"])
             }}
          ]

        _other ->
          []
      end)
    end)
    |> Map.new()
  end

  defp normalize_operation(%ProviderIR.Operation{} = operation) do
    %{
      auth_strategy:
        if(operation.auth_policy_id == "github.oauth_application_client_credentials",
          do: :oauth_application,
          else: :default
        ),
      function: operation.function,
      method: operation.method,
      module: operation.module |> Module.split() |> List.last(),
      operation_id: operation.id,
      path: operation.path_template
    }
  end

  defp normalize_operation(operation) when is_map(operation) do
    %{
      auth_strategy:
        Map.get(operation, :auth_strategy, Map.get(operation, "auth_strategy", :default)),
      function: Map.get(operation, :function, Map.get(operation, "function")),
      method: Map.get(operation, :method, Map.get(operation, "method")),
      module:
        Map.get(operation, :module, Map.get(operation, "module"))
        |> normalize_operation_module(),
      operation_id:
        Map.get(operation, :operation_id, Map.get(operation, "operation_id", operation[:id])),
      path: Map.get(operation, :path, Map.get(operation, "path", operation[:path_template]))
    }
  end

  defp normalize_operation_module(module) when is_atom(module) do
    module
    |> Module.split()
    |> List.last()
  end

  defp normalize_operation_module(module) when is_binary(module), do: module
  defp normalize_operation_module(_module), do: "Misc"

  defp build_operation_entry(operation, spec_entry, parsed) do
    key = AuthParser.normalize_endpoint_key(operation.method, operation.path)
    endpoint_prog_access_entry = Map.get(parsed.endpoint_prog_access, key)
    endpoint_prog_access = endpoint_prog_access_entry && endpoint_prog_access_entry.prog_access
    special_auth = %{oauth_application: operation.auth_strategy == :oauth_application}
    legacy_scope_hints = AuthParser.extract_legacy_scope_hints(spec_entry.description)
    legacy_flags = AuthParser.legacy_hint_flags(spec_entry.description)
    fg_pat_permissions = Map.get(parsed.fg_pat_permissions, key, [])
    app_permissions = Map.get(parsed.app_permissions, key, [])

    {fg_pat_support, fg_pat_notes, fg_pat_conflict?} =
      resolve_fine_grained_support(
        key,
        parsed.fg_pat_support,
        fg_pat_permissions,
        endpoint_prog_access
      )

    {app_install_support, app_install_notes, app_install_conflict?} =
      resolve_app_support(
        :github_app_installation,
        key,
        parsed.app_install_support,
        app_permissions,
        endpoint_prog_access
      )

    {app_user_support, app_user_notes, app_user_conflict?} =
      resolve_app_support(
        :github_app_user,
        key,
        parsed.app_user_support,
        app_permissions,
        endpoint_prog_access
      )

    {fine_grained_permissions, permission_notes} =
      resolve_fine_grained_permissions(fg_pat_permissions, endpoint_prog_access, fg_pat_support)

    {github_app_permissions, app_permission_notes} =
      resolve_app_permissions(
        app_permissions,
        endpoint_prog_access,
        app_install_support,
        app_user_support
      )

    token_support =
      token_support_for(
        special_auth,
        legacy_flags,
        fg_pat_support,
        app_install_support,
        app_user_support
      )

    notes =
      operation_notes(%{
        app_install_notes: app_install_notes,
        app_permission_notes: app_permission_notes,
        app_user_notes: app_user_notes,
        app_user_support: app_user_support,
        endpoint_prog_access: endpoint_prog_access,
        fg_pat_notes: fg_pat_notes,
        fg_pat_support: fg_pat_support,
        permission_notes: permission_notes,
        special_auth: special_auth,
        spec_entry: spec_entry
      })

    clean_notes = notes |> Enum.reject(&is_nil/1) |> Enum.uniq()

    conflict? =
      fg_pat_conflict? or app_install_conflict? or app_user_conflict? or
        Enum.any?(clean_notes, &String.starts_with?(&1, "Conflict:"))

    %{
      docs_url: spec_entry.docs_url,
      fine_grained_permissions: fine_grained_permissions,
      function: Atom.to_string(operation.function),
      github_app_permissions: github_app_permissions,
      legacy_scope_hints: legacy_scope_hints,
      method: Atom.to_string(operation.method),
      module: operation.module,
      notes: clean_notes,
      operation_id: operation.operation_id,
      path: operation.path,
      source_confidence:
        source_confidence(
          conflict?,
          token_support,
          legacy_scope_hints,
          endpoint_prog_access,
          special_auth
        ),
      source_provenance:
        build_source_provenance(
          endpoint_prog_access_entry,
          spec_entry,
          fg_pat_permissions,
          app_permissions,
          legacy_scope_hints
        ),
      special_auth: special_auth,
      token_support: token_support
    }
  end

  defp resolve_fine_grained_support(key, support_set, permissions, endpoint_prog_access) do
    support_page = MapSet.member?(support_set, key)
    permission_table = permissions != []
    prog_support = endpoint_prog_access && endpoint_prog_access.fine_grained_pat

    conflict_messages =
      []
      |> maybe_add_conflict(
        permission_table and not support_page,
        "Conflict: fine-grained PAT permission tables include this endpoint, but the availability page does not."
      )
      |> maybe_add_conflict(
        is_boolean(prog_support) and prog_support != support_page,
        "Conflict: endpoint progAccess and the fine-grained PAT availability page disagree."
      )

    {
      if(conflict_messages == [], do: support_page, else: "conflict"),
      Enum.reject(conflict_messages, &is_nil/1),
      conflict_messages != []
    }
  end

  defp resolve_app_support(kind, key, support_set, permissions, endpoint_prog_access) do
    %{label: label, prog_support: prog_support, token_type: token_type} =
      app_support_metadata(kind, endpoint_prog_access)

    support_page = MapSet.member?(support_set, key)
    permission_table = Enum.any?(permissions, &(token_type in &1.token_types))

    conflict_messages =
      []
      |> maybe_add_conflict(
        permission_table and not support_page,
        "Conflict: #{label} permission tables include this endpoint, but the availability page does not."
      )
      |> maybe_add_conflict(
        is_boolean(prog_support) and prog_support != support_page,
        "Conflict: endpoint progAccess and the #{label} availability page disagree."
      )

    {
      if(conflict_messages == [], do: support_page, else: "conflict"),
      conflict_messages,
      conflict_messages != []
    }
  end

  defp app_support_metadata(:github_app_installation, endpoint_prog_access) do
    %{
      label: "GitHub App installation-token",
      prog_support: endpoint_prog_access && endpoint_prog_access.github_app_installation,
      token_type: "IAT"
    }
  end

  defp app_support_metadata(:github_app_user, endpoint_prog_access) do
    %{
      label: "GitHub App user-token",
      prog_support: endpoint_prog_access && endpoint_prog_access.github_app_user,
      token_type: "UAT"
    }
  end

  defp resolve_fine_grained_permissions(permissions, endpoint_prog_access, support_value) do
    cond do
      permissions != [] ->
        {permissions, []}

      support_value in [true, "conflict"] and endpoint_prog_access != nil and
          endpoint_prog_access.permissions != [] ->
        {endpoint_prog_access.permissions,
         [
           "Used endpoint progAccess permissions because the fine-grained PAT permission table had no row for this operation."
         ]}

      true ->
        {[], []}
    end
  end

  defp resolve_app_permissions(
         permissions,
         endpoint_prog_access,
         app_install_support,
         app_user_support
       ) do
    cond do
      permissions != [] ->
        {permissions, []}

      endpoint_prog_access != nil and endpoint_prog_access.permissions != [] and
          app_support_known?(app_install_support, app_user_support) ->
        token_types =
          []
          |> maybe_add_token_type(app_user_support in [true, "conflict"], "UAT")
          |> maybe_add_token_type(app_install_support in [true, "conflict"], "IAT")

        app_permissions =
          Enum.map(endpoint_prog_access.permissions, fn permission ->
            Map.put(permission, :token_types, token_types)
          end)

        {app_permissions,
         [
           "Used endpoint progAccess permissions because the GitHub App permission table had no row for this operation."
         ]}

      true ->
        {[], []}
    end
  end

  defp build_source_provenance(
         endpoint_prog_access_entry,
         spec_entry,
         fg_permissions,
         app_permissions,
         legacy_scope_hints
       ) do
    %{
      endpoint_prog_access:
        endpoint_prog_access_entry &&
          %{
            page_url: endpoint_prog_access_entry.page_url,
            title: endpoint_prog_access_entry.title
          },
      fine_grained_pat_permissions: if(fg_permissions != [], do: "permissions_fg_pat.md"),
      github_app_permissions: if(app_permissions != [], do: "permissions_github_apps.md"),
      openapi: %{
        docs_url: spec_entry.docs_url,
        enabled_for_github_apps: spec_entry.enabled_for_github_apps
      },
      structured_support: %{
        fine_grained_pat: "endpoints_fg_pat.md",
        github_app_installation: "endpoints_github_app_installation.md",
        github_app_user: "endpoints_github_app_user.md"
      },
      legacy_scope_hints: legacy_scope_hints != []
    }
  end

  defp build_sources(bundle) do
    metadata_sources =
      bundle.metadata
      |> Map.get("sources", %{})
      |> Enum.map(fn {key, value} -> {key, value} end)
      |> Map.new()

    Map.put(metadata_sources, "endpoint_prog_access", %{
      "page_count" => get_in(bundle, [:endpoint_prog_access, "page_count"]),
      "snapshot" => get_in(bundle, [:metadata, "endpoint_prog_access", "snapshot"])
    })
  end

  defp build_summary(operations) do
    %{
      confidence_counts: %{
        conflict: Enum.count(operations, &(&1.source_confidence == "conflict")),
        legacy_hint: Enum.count(operations, &(&1.source_confidence == "legacy_hint")),
        structured: Enum.count(operations, &(&1.source_confidence == "structured")),
        unknown: Enum.count(operations, &(&1.source_confidence == "unknown"))
      },
      module_count: operations |> Enum.map(& &1.module) |> Enum.uniq() |> length(),
      operation_count: length(operations),
      token_support_counts: %{
        fine_grained_pat:
          Enum.count(operations, &(get_in(&1, [:token_support, :fine_grained_pat]) == true)),
        github_app_installation:
          Enum.count(
            operations,
            &(get_in(&1, [:token_support, :github_app_installation]) == true)
          ),
        github_app_user:
          Enum.count(operations, &(get_in(&1, [:token_support, :github_app_user]) == true)),
        oauth_application:
          Enum.count(operations, &(get_in(&1, [:special_auth, :oauth_application]) == true))
      }
    }
  end

  defp build_module_summaries(operations) do
    operations
    |> Enum.group_by(& &1.module)
    |> Enum.map(fn {module_name, module_operations} ->
      %{
        conflicts: Enum.count(module_operations, &(&1.source_confidence == "conflict")),
        fine_grained_pat:
          Enum.count(
            module_operations,
            &(get_in(&1, [:token_support, :fine_grained_pat]) == true)
          ),
        github_app_installation:
          Enum.count(
            module_operations,
            &(get_in(&1, [:token_support, :github_app_installation]) == true)
          ),
        github_app_user:
          Enum.count(module_operations, &(get_in(&1, [:token_support, :github_app_user]) == true)),
        module: module_name,
        total: length(module_operations)
      }
    end)
    |> Enum.sort_by(& &1.module)
  end

  defp build_example_rows(operations) do
    operations_by_id = Map.new(operations, &{&1.operation_id, &1})

    Enum.map(@example_lookup_order, fn {example_name, operation_id} ->
      operation = Map.fetch!(operations_by_id, operation_id)

      %{
        docs_url: operation.docs_url,
        example: example_name,
        fine_grained_pat: render_example_fg_permissions(operation),
        github_app_installation:
          human_support_value(operation.token_support.github_app_installation),
        github_app_user: human_support_value(operation.token_support.github_app_user),
        notes: example_notes(operation),
        operation: "#{String.upcase(operation.method)} #{operation.path}"
      }
    end)
  end

  defp render_example_fg_permissions(operation) do
    cond do
      operation.operation_id == "meta/root" ->
        "no auth required for the smoke request"

      operation.fine_grained_permissions == [] and
          Enum.any?(
            operation.notes,
            &String.contains?(&1, "no explicit fine-grained PAT permission")
          ) ->
        "supported with no fine-grained PAT permissions"

      true ->
        operation.fine_grained_permissions
        |> Enum.map_join(", ", fn permission ->
          "#{permission.permission}: #{permission.access}"
        end)
    end
  end

  defp token_support_for(
         %{oauth_application: true},
         _legacy_flags,
         _fg_pat_support,
         _app_install_support,
         _app_user_support
       ) do
    %{
      classic_pat: false,
      fine_grained_pat: false,
      github_app_installation: false,
      github_app_user: false,
      oauth_access_token: false
    }
  end

  defp token_support_for(
         _special_auth,
         legacy_flags,
         fg_pat_support,
         app_install_support,
         app_user_support
       ) do
    %{
      classic_pat: legacy_support_value(legacy_flags.classic_pat),
      fine_grained_pat: fg_pat_support,
      github_app_installation: app_install_support,
      github_app_user: app_user_support,
      oauth_access_token: legacy_support_value(legacy_flags.oauth_access_token)
    }
  end

  defp operation_notes(%{
         app_install_notes: app_install_notes,
         app_permission_notes: app_permission_notes,
         app_user_notes: app_user_notes,
         app_user_support: app_user_support,
         endpoint_prog_access: endpoint_prog_access,
         fg_pat_notes: fg_pat_notes,
         fg_pat_support: fg_pat_support,
         permission_notes: permission_notes,
         special_auth: special_auth,
         spec_entry: spec_entry
       }) do
    [
      oauth_application_note(special_auth),
      permissionless_access_note(endpoint_prog_access),
      public_read_note(endpoint_prog_access),
      github_app_only_conflict_note(spec_entry, fg_pat_support, app_user_support)
    ] ++
      fg_pat_notes ++
      app_install_notes ++ app_user_notes ++ permission_notes ++ app_permission_notes
  end

  defp oauth_application_note(%{oauth_application: true}) do
    "Uses OAuth application client credentials instead of bearer-token auth."
  end

  defp oauth_application_note(_special_auth), do: nil

  defp permissionless_access_note(%{allow_permissionless_access: true}) do
    "Endpoint progAccess indicates that no explicit fine-grained PAT permission is required."
  end

  defp permissionless_access_note(_endpoint_prog_access), do: nil

  defp public_read_note(%{allows_public_read: true}) do
    "Endpoint progAccess indicates that public data can be read without private-resource permission grants."
  end

  defp public_read_note(_endpoint_prog_access), do: nil

  defp github_app_only_conflict_note(spec_entry, fg_pat_support, app_user_support) do
    if AuthParser.mentions_github_app_only?(spec_entry.description) and
         (fg_pat_support == true or app_user_support == true) do
      "Conflict: OpenAPI prose still says GitHub App only, but endpoint progAccess marks fine-grained PAT or GitHub App user-token support."
    end
  end

  defp example_notes(operation) do
    cond do
      operation.operation_id == "meta/root" ->
        "The smoke example also calls `GET /rate_limit`, which works without auth for this path."

      Enum.any?(operation.notes, &String.contains?(&1, "public data")) ->
        "Public-read fallback exists, but private-resource access still follows the listed permission requirements."

      true ->
        operation.source_confidence
    end
  end

  defp render_example_row(example) do
    "| #{example.example} | [#{example.operation}](#{example.docs_url}) | #{example.fine_grained_pat} | #{example.github_app_installation} | #{example.github_app_user} | #{example.notes} |"
  end

  defp render_module_row(module_summary) do
    "| #{module_summary.module} | #{module_summary.total} | #{module_summary.fine_grained_pat} | #{module_summary.github_app_installation} | #{module_summary.github_app_user} | #{module_summary.conflicts} |"
  end

  defp render_conflict_section([]) do
    ["No structured auth conflicts are currently recorded."]
  end

  defp render_conflict_section(conflicts) do
    ["| Operation | Notes |", "|--------|--------|"] ++
      Enum.map(conflicts, fn conflict ->
        note =
          conflict.notes
          |> Enum.filter(&String.starts_with?(&1, "Conflict:"))
          |> Enum.join(" ")

        "| [#{String.upcase(conflict.method)} #{conflict.path}](#{conflict.docs_url}) | #{note} |"
      end)
  end

  defp source_confidence(
         true,
         _token_support,
         _legacy_scope_hints,
         _endpoint_prog_access,
         _special_auth
       ),
       do: "conflict"

  defp source_confidence(
         false,
         token_support,
         legacy_scope_hints,
         endpoint_prog_access,
         special_auth
       ) do
    cond do
      special_auth.oauth_application ->
        "structured"

      Enum.any?(
        [
          token_support.fine_grained_pat,
          token_support.github_app_installation,
          token_support.github_app_user
        ],
        &is_boolean/1
      ) ->
        "structured"

      endpoint_prog_access != nil ->
        "structured"

      legacy_scope_hints != [] ->
        "legacy_hint"

      true ->
        "unknown"
    end
  end

  defp human_support_value("conflict"), do: "conflict"
  defp human_support_value(true), do: "supported"
  defp human_support_value(false), do: "not listed"
  defp human_support_value("legacy_scope_hint"), do: "legacy scope hint"
  defp human_support_value("unknown"), do: "unknown"

  defp legacy_support_value(true), do: "legacy_scope_hint"
  defp legacy_support_value(false), do: "unknown"

  defp app_support_known?(app_install_support, app_user_support) do
    app_install_support in [true, "conflict"] or app_user_support in [true, "conflict"]
  end

  defp maybe_add_conflict(messages, true, message), do: [message | messages]
  defp maybe_add_conflict(messages, false, _message), do: messages

  defp maybe_add_token_type(token_types, true, token_type), do: [token_type | token_types]
  defp maybe_add_token_type(token_types, false, _token_type), do: token_types

  defp normalize_text(nil), do: nil
  defp normalize_text(""), do: nil
  defp normalize_text(value), do: String.trim(value)
end

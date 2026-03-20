defmodule GitHubEx.Codegen.Provider do
  @moduledoc false

  @behaviour PristineCodegen.Provider

  alias GitHubEx.AuthManifest
  alias GitHubEx.Client
  alias GitHubEx.Codegen
  alias GitHubEx.Codegen.Plugins.Source
  alias PristineCodegen.{JSON, ProviderIR}

  @impl true
  def definition(_opts) do
    %{
      provider: %{
        id: :github_ex,
        base_module: GitHubEx,
        client_module: GitHubEx.Client,
        package_app: :github_ex,
        package_name: "github_ex",
        source_strategy: :openapi_only
      },
      runtime_defaults: %{
        base_url: "https://api.github.com",
        default_headers: %{
          "Accept" => "application/vnd.github+json",
          "X-GitHub-Api-Version" => Client.default_api_version()
        },
        user_agent_prefix: "github-ex-elixir",
        timeout_ms: 60_000,
        retry_defaults: %{strategy: :standard},
        serializer: :json,
        typed_responses_default: false
      },
      operations: [],
      schemas: [],
      auth_policies: [],
      pagination_policies: [],
      docs_inventory: %{guides: [], examples: [], operations: %{}},
      fingerprints: %{sources: [], generation: %{}},
      artifact_plan: %{
        generated_code_dir: "lib/github_ex/generated",
        artifacts: [
          %{id: :provider_ir, path: "priv/generated/provider_ir.json"},
          %{id: :generation_manifest, path: "priv/generated/generation_manifest.json"},
          %{id: :docs_inventory, path: "priv/generated/docs_inventory.json"},
          %{id: :operation_auth_policies, path: "priv/generated/operation_auth_policies.json"},
          %{id: :auth_manifest, path: "priv/generated/auth_manifest.json"}
        ],
        forbidden_paths: [
          "priv/generated/manifest.json",
          "priv/generated/docs_manifest.json",
          "priv/generated/open_api_state.snapshot.term"
        ]
      }
    }
  end

  @impl true
  def paths(opts) do
    paths = Codegen.paths(opts)

    %{
      project_root: paths.project_root,
      generated_code_dir: paths.generated_dir,
      generated_artifact_dir: paths.generated_artifact_dir
    }
  end

  @impl true
  def source_plugins, do: [Source]

  @impl true
  def auth_plugins, do: []

  @impl true
  def pagination_plugins, do: []

  @impl true
  def docs_plugins, do: []

  @impl true
  def render_artifact(:auth_manifest, %ProviderIR{} = provider_ir, _rendered_files, opts) do
    provider_ir
    |> AuthManifest.render(opts)
    |> Map.fetch!(:manifest)
    |> JSON.encode!()
  end

  def render_artifact(_artifact_id, _provider_ir, _rendered_files, _opts), do: nil
end

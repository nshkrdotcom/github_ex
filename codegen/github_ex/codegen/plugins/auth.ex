defmodule GitHubEx.Codegen.Plugins.Auth do
  @moduledoc false

  @behaviour PristineCodegen.Plugin.Auth

  alias GitHubEx.AuthSources
  alias PristineCodegen.ProviderIR
  alias PristineCodegen.ProviderIR.AuthPolicy
  alias PristineCodegen.ProviderIR.Operation

  @default_auth_policy_id "github.default_bearer_optional"
  @oauth_application_policy_id "github.oauth_application_client_credentials"

  @impl true
  def transform(%ProviderIR{} = provider_ir, opts) when is_list(opts) do
    %{
      provider_ir
      | auth_policies: auth_policies(),
        operations: Enum.map(provider_ir.operations, &put_auth_policy_id/1),
        fingerprints: put_auth_fingerprints(provider_ir.fingerprints, opts)
    }
  end

  defp auth_policies do
    [
      %AuthPolicy{
        id: @default_auth_policy_id,
        mode: :request_override_optional,
        security_schemes: ["githubToken"],
        override_source: %{key: "auth"},
        strategy_label: "Default bearer token with optional request override"
      },
      %AuthPolicy{
        id: @oauth_application_policy_id,
        mode: :request_override,
        security_schemes: ["basicAuth"],
        override_source: %{
          mode: :keys,
          keys: [{"client_id", :client_id}, {"client_secret", :client_secret}]
        },
        strategy_label: "OAuth application client credentials"
      }
    ]
  end

  defp put_auth_policy_id(%Operation{} = operation) do
    %{operation | auth_policy_id: auth_policy_id(operation.path_template)}
  end

  defp auth_policy_id("/applications/" <> _rest), do: @oauth_application_policy_id
  defp auth_policy_id(_path), do: @default_auth_policy_id

  defp put_auth_fingerprints(fingerprints, opts) do
    auth_paths = AuthSources.paths(opts)

    auth_sources =
      [auth_paths.metadata_path, auth_paths.endpoint_prog_access_path] ++
        Map.values(auth_paths.snapshot_paths)

    merged_sources =
      (fingerprints.sources ++
         Enum.map(
           Enum.filter(auth_sources, &File.exists?/1),
           &fingerprint_source(&1, auth_paths.project_root)
         ))
      |> Enum.uniq_by(& &1.path)
      |> Enum.sort_by(& &1.path)

    %{fingerprints | sources: merged_sources}
  end

  defp fingerprint_source(path, project_root) do
    %{
      kind: :github_docs_auth,
      path: Path.relative_to(path, project_root),
      sha256: sha256_file(path)
    }
  end

  defp sha256_file(path) do
    path
    |> File.read!()
    |> then(&:crypto.hash(:sha256, &1))
    |> Base.encode16(case: :lower)
  end
end

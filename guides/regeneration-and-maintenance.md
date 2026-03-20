# Regeneration and Maintenance

`github_ex` is generated from pinned upstream inputs committed in this repo.

## Pinned Inputs

- OpenAPI source: `priv/upstream/openapi/api.github.com.2026-03-10.json`
- Codegen spec: `priv/upstream/openapi/api.github.com.2026-03-10.codegen.json`
- GitHub Docs auth snapshots: `priv/upstream/github_docs_auth/`

The auth matrix depends on both the pinned OpenAPI file and the committed
GitHub Docs auth snapshots.

## Generation Model

Normal SDK generation now runs through the shared `pristine_codegen` compiler:

- provider definition: `codegen/github_ex/codegen/provider.ex`
- OpenAPI source plugin: `codegen/github_ex/codegen/plugins/source.ex`
- provider auth artifact support: `codegen/github_ex/auth_manifest.ex`

The generated request surface compiles straight to `Pristine.Operation` and
direct runtime execution. There is no repo-local string-template fallback and
no `GitHubEx.GeneratedSupport` shim in the active path.

## Refresh the OpenAPI Spec

```bash
mix github.refresh
```

To refresh the committed OpenAPI files without regenerating immediately:

```bash
mix github.refresh --no-generate
```

## Refresh the GitHub Docs Auth Snapshots

```bash
mix github.auth.refresh
```

To refresh the snapshots without regenerating immediately:

```bash
mix github.auth.refresh --no-generate
```

This updates:

- the nine committed GitHub Docs markdown snapshots
- `priv/upstream/github_docs_auth/endpoint_prog_access.json`
- `priv/upstream/github_docs_auth/metadata.json`

## Regenerate the SDK And Auth Matrix

```bash
mix github.generate
```

Generated outputs land in:

- `lib/github_ex/generated`
- `priv/generated/provider_ir.json`
- `priv/generated/generation_manifest.json`
- `priv/generated/docs_inventory.json`
- `priv/generated/operation_auth_policies.json`
- `priv/generated/auth_manifest.json`
- `guides/auth-capability-matrix.md`

Legacy artifacts that must stay deleted:

- `priv/generated/manifest.json`
- `priv/generated/docs_manifest.json`
- `priv/generated/open_api_state.snapshot.term`

## Verification

```bash
mix github.generate
mix format
mix compile --warnings-as-errors
mix test
mix credo --strict
mix dialyzer
mix docs
```

When the pinned OpenAPI spec changes or the GitHub Docs auth snapshots change,
rerun `mix github.generate` and then the full verification loop.

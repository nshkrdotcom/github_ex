# Regeneration and Maintenance

`github_ex` is generated from the pinned official GitHub REST OpenAPI
description committed in this repo.

## Upstream Source

- Spec repository: `github/rest-api-description`
- Pinned file: `priv/upstream/openapi/api.github.com.2026-03-10.json`
- Supported versions check: `https://api.github.com/versions`

## Refresh the Spec

```bash
mix github.refresh
```

That downloads the pinned upstream JSON into `priv/upstream/openapi/` and then
regenerates the SDK surface.

To refresh the committed file without regenerating immediately:

```bash
mix github.refresh --no-generate
```

## Regenerate the SDK

```bash
mix github.generate
```

Generated code lands in:

- `lib/github_ex/generated`
- `priv/generated/manifest.json`
- `priv/generated/docs_manifest.json`
- `priv/generated/open_api_state.snapshot.term`

## Verification

```bash
mix format
mix compile --warnings-as-errors
mix test
mix dialyzer
mix credo --strict
mix docs
```

The goal is to keep the committed spec, generated source, docs, and test suite
moving together as one contract.

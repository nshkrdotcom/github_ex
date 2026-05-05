# Upstream Sources

This directory stores committed upstream artifacts used to build `github_ex`.

Current pinned source:

- GitHub REST OpenAPI description
- Repository: `github/rest-api-description`
- File: `openapi/api.github.com.2026-03-10.json`

Refresh workflow:

```bash
mix github.refresh
```

Local policy note:

- `mix github.refresh` sanitizes provider pattern-engine operator vocabulary
  before writing the committed OpenAPI snapshot. Keep that transformation in
  `GitHubEx.Refresh` so future upstream refreshes do not reintroduce
  codebase-disallowed pattern-engine terms.

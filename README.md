<p align="center">
  <img src="assets/github_ex.svg" alt="GitHubEx" width="200"/>
</p>

<p align="center">
  <a href="https://hex.pm/packages/github_ex"><img src="https://img.shields.io/hexpm/v/github_ex.svg" alt="Hex.pm"/></a>
  <a href="https://hexdocs.pm/github_ex"><img src="https://img.shields.io/badge/hex-docs-blue.svg" alt="HexDocs"/></a>
  <a href="https://github.com/nshkrdotcom/github_ex"><img src="https://img.shields.io/badge/GitHub-repo-black?logo=github" alt="GitHub"/></a>
  <a href="https://hex.pm/packages/github_ex"><img src="https://img.shields.io/hexpm/l/github_ex.svg" alt="License"/></a>
</p>

# GitHubEx

Native Elixir SDK for the GitHub REST API, generated from the pinned official
GitHub OpenAPI description and executed through the shared `pristine` runtime.

## Authentication Start Here

Read this before creating any credentials:

- If you just want to try the SDK locally today: start with a fine-grained PAT. Read [Authentication and OAuth](guides/authentication-and-oauth.md).
- If your app needs GitHub to show an approval screen in the browser and send a callback code back to your app: use an OAuth app. Read [Authentication and OAuth](guides/authentication-and-oauth.md).
- If you want repo/org automation installed onto repositories with short-lived bot tokens: use a GitHub App. Read [GitHub App Authentication](guides/github-app-authentication.md).
- If you want the exact environment variables used by the live examples: read [Live Examples README](examples/README.md).

`GitHubEx` is intentionally thin:

- generated endpoint modules stay close to the upstream REST payloads
- `GitHubEx.Client` owns GitHub-specific headers, retries, response wrapping, and auth defaults
- `GitHubEx.OAuth` and `GitHubEx.AppAuth` cover the two most important onboarding paths beyond raw bearer tokens
- `GitHubEx.Pagination` and `GitHubEx.Response` expose the GitHub-specific `Link` and rate-limit headers that normal JSON decoding would otherwise hide

## Install

```elixir
def deps do
  [
    {:github_ex, "~> 0.1.0"}
  ]
end
```

Then fetch dependencies:

```bash
mix deps.get
```

## Make One Request

Create a client with a GitHub token:

```elixir
client = GitHubEx.Client.new(auth: System.fetch_env!("GITHUB_TOKEN"))
```

Fetch the authenticated user:

```elixir
{:ok, me} = GitHubEx.Users.get_authenticated(client)
```

List repositories for that user:

```elixir
{:ok, repos} =
  GitHubEx.Repos.list_for_authenticated_user(client, %{
    "visibility" => "all",
    "per_page" => 50
  })
```

Ask for a wrapped response when you need headers, rate-limit information, or
pagination links:

```elixir
{:ok, wrapped} =
  GitHubEx.Client.request(client, %{
    method: :get,
    path: "/user",
    opts: [response: :wrapped]
  })

wrapped.data
wrapped.rate_limit
wrapped.links["next"]
```

## Authentication Modes

`GitHubEx.Client.new/1` supports:

- raw bearer tokens such as fine-grained PATs, classic PATs, installation tokens, or OAuth access tokens
- OAuth-backed token sources through `oauth2: [...]`
- request-scoped basic auth for `/applications/{client_id}/token*` endpoints
- GitHub App JWT and installation token flows through `GitHubEx.AppAuth`

The user-friendly onboarding docs live in:

- [Authentication and OAuth](guides/authentication-and-oauth.md)
- [GitHub App Authentication](guides/github-app-authentication.md)
- [Live Examples README](examples/README.md)

## Docs Map

- [Getting Started](guides/getting-started.md): installation, clients, wrapped responses, and first calls
- [Client Configuration](guides/client-configuration.md): runtime options, `foundation:` overrides, request-scoped overrides, and typed responses
- [Authentication and OAuth](guides/authentication-and-oauth.md): PATs, OAuth apps, saved token files, and application token endpoints
- [GitHub App Authentication](guides/github-app-authentication.md): JWT signing, installation tokens, and app-vs-installation clients
- [Pagination and Rate Limits](guides/pagination-and-rate-limits.md): `Link` headers, wrapped responses, and retry behavior
- [Common Workflows](guides/common-workflows.md): repos, issues, pulls, workflow runs, and common read paths
- [Low-Level Requests](guides/low-level-requests.md): the raw request escape hatch on `GitHubEx.Client.request/2`
- [Regeneration and Maintenance](guides/regeneration-and-maintenance.md): upstream spec provenance, refresh commands, and the codegen artifact map

## Examples Map

- [Live Examples README](examples/README.md): environment setup, auth requirements, and grouped suite commands
- `examples/run_all.sh`: run `smoke`, `repos`, `oauth`, `app`, or `all`

The live examples are real-service proofs only. There are no mocks and no fake
transports in the example suite.

## Pinned Upstream Contract

This repo is currently pinned to:

- GitHub REST API version header: `2026-03-10`
- OpenAPI source: `github/rest-api-description`
- OpenAPI file: `priv/upstream/openapi/api.github.com.2026-03-10.json`

GitHub currently reports supported REST API versions `2026-03-10` and
`2022-11-28` from `https://api.github.com/versions`. This SDK intentionally
pins `2026-03-10` instead of silently drifting.

## Verification

Recommended verification loop:

```bash
mix format
mix compile --warnings-as-errors
mix test
mix dialyzer
mix credo --strict
mix docs
```

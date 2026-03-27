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

The SDK already exposes the full pinned REST surface. The hard part is choosing
the right credential for the endpoint you want to call. This repo now ships a
generated [Auth Capability Matrix](guides/auth-capability-matrix.md) so that
auth guidance comes from committed data instead of memory.

Normal request-surface generation now flows through
`codegen/github_ex/codegen/provider.ex`, the OpenAPI source plugin, the GitHub
auth plugin, and the shared `pristine_codegen` compiler. Generated modules
build request maps, hand them to the generated-request bridge inside
`GitHubEx.Client`, and ultimately execute through `Pristine.execute_request/3`, with
compiler-emitted `stream_*` wrappers for paginated endpoints.

## Authentication Start Here

### 1. I want to run the bundled examples today

Use a fine-grained PAT.

- Resource owner: your user account if you want `/user` and `/user/repos`
- Repository access: only the selected repos you will test
- Minimal repository permissions: `Metadata: read`, `Issues: read`, `Pull requests: read`, `Actions: read`
- `GET /user` currently needs no fine-grained PAT permissions
- `Contents: read` is not required for the current bundled examples

Read [Authentication and OAuth](guides/authentication-and-oauth.md),
[Auth Capability Matrix](guides/auth-capability-matrix.md), and
[Examples README](examples/README.md).

### 2. I want to explore the SDK broadly from local scripts

Start with the [Auth Capability Matrix](guides/auth-capability-matrix.md).

If you want to roam across many modules, multiple organizations, packages,
checks, or enterprise-flavored surfaces, a classic PAT is often the simpler
local-development credential. It is broader and less safe, but GitHub still
documents real fine-grained PAT gaps and this repo does not hide that anymore.

Read [Authentication and OAuth](guides/authentication-and-oauth.md).

### 3. My app needs a browser approval screen and callback code

Use an OAuth app when you need GitHub to send a user through an approval screen
and redirect back with an authorization code. OAuth also still matters for some
enterprise-object access.

Read [Authentication and OAuth](guides/authentication-and-oauth.md).

### 4. I need installed repo or org automation with short-lived bot tokens

Use a GitHub App.

Keep these credentials distinct:

- app JWT: app-level authentication and installation-token exchange
- installation token: the default runtime credential for most repo and org API work
- app user token: user-attributed GitHub App access when the endpoint supports it

Read [GitHub App Authentication](guides/github-app-authentication.md) and the
[Auth Capability Matrix](guides/auth-capability-matrix.md).

### 5. Enterprise-object access note

If you need enterprise-object access, read the OAuth section first. GitHub
still documents that as a real reason OAuth can remain the better fit.

## Install

```elixir
def deps do
  [
    {:github_ex, "~> 0.1.0"}
  ]
end
```

```bash
mix deps.get
```

For active local development beside sibling checkouts, `github_ex` can also be
consumed from a relative path:

```elixir
{:github_ex, path: "../github_ex"}
```

Inside this repo, the shared `pristine` child apps now resolve by one stable
policy:

- prefer sibling-relative paths when local checkouts exist
- otherwise fall back to GitHub `subdir:` dependencies

That removes the need for a committed vendored `deps/` tree while keeping
local development and downstream dependency behavior aligned.

## Make One Request

Create a client with a bearer token:

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
- GitHub App JWT and installation-token flows through `GitHubEx.AppAuth`, which returns `Pristine.Client` runtime clients ready for generated operations

Use the generated [Auth Capability Matrix](guides/auth-capability-matrix.md) to
check a specific REST operation before assuming one token type covers it.

## Docs Map

- [Getting Started](guides/getting-started.md): installation, auth preflight, clients, and first calls
- [Client Configuration](guides/client-configuration.md): runtime options, request overrides, and typed responses
- [Authentication and OAuth](guides/authentication-and-oauth.md): bundled-example path, classic vs fine-grained PATs, OAuth apps, and application-token endpoints
- [Auth Capability Matrix](guides/auth-capability-matrix.md): generated per-operation token support and permission lookup
- [GitHub App Authentication](guides/github-app-authentication.md): JWTs, installation tokens, app user tokens, narrowing, and 403 debugging
- [Pagination and Rate Limits](guides/pagination-and-rate-limits.md): `Link` headers, wrapped responses, and retry behavior
- [Common Workflows](guides/common-workflows.md): repos, issues, pulls, workflow runs, and common read paths
- [Architecture and Design Reference](guides/architecture-and-design-reference.md): the canonical end-to-end design, build, auth, and runtime reference for this repo
- [Low-Level Requests](guides/low-level-requests.md): the raw request escape hatch on `GitHubEx.Client.request/2`
- [Regeneration and Maintenance](guides/regeneration-and-maintenance.md): pinned inputs, auth snapshot refresh, and codegen artifacts

## Examples Map

- [Examples README](examples/README.md): example-by-example auth requirements, env vars, and runner commands
- `examples/run_all.sh`: run `smoke`, `repos`, `oauth`, `app`, or `all`

## Pinned Upstream Contract

This repo is currently pinned to:

- GitHub REST API version header: `2026-03-10`
- OpenAPI source: `github/rest-api-description`
- OpenAPI file: `priv/upstream/openapi/api.github.com.2026-03-10.json`
- Auth snapshot directory: `priv/upstream/github_docs_auth/`

GitHub currently reports supported REST API versions `2026-03-10` and
`2022-11-28` from `https://api.github.com/versions`. This SDK intentionally
pins `2026-03-10` instead of silently drifting.

## Verification

`mix github.generate` delegates to the shared compiler and refreshes the final
committed artifact contract:

- `priv/generated/provider_ir.json`
- `priv/generated/generation_manifest.json`
- `priv/generated/docs_inventory.json`
- `priv/generated/operation_auth_policies.json`
- `priv/generated/auth_manifest.json`

```bash
mix github.generate
mix format
mix compile --warnings-as-errors
mix test
mix credo --strict
mix dialyzer
mix docs
```

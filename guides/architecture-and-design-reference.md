# Architecture And Design Reference

This document is the canonical design reference for `github_ex`.

Its job is to explain:

- what the library integrates with
- which official GitHub standards and documents define that behavior
- how this repository turns those upstream contracts into generated Elixir modules
- how the runtime layer is split between `github_ex` and `pristine`
- how authentication, pagination, retries, error handling, and code generation work
- how to recreate the library from scratch from the official upstream sources

This guide is intentionally detailed. The other guides in this repo remain useful
for task-focused usage, but this is the single architecture document meant to
explain the whole system end to end.

## 1. Scope And System Boundary

`github_ex` is a thin generated SDK for the GitHub REST API. It does not try to
hide GitHub's API model behind a heavily opinionated Elixir DSL. The primary
design goal is to stay close to GitHub's official REST contract while using the
shared `pristine` runtime and `pristine_codegen` compiler for transport,
execution, resilience, and generated code emission.

At runtime, the library integrates with these GitHub services:

- the GitHub REST API on `https://api.github.com`
- GitHub OAuth authorization and token exchange endpoints on `https://github.com`
- GitHub App authentication flows, including installation-token exchange
- bearer-token based access from personal access tokens, OAuth tokens, GitHub
  App tokens, and `GITHUB_TOKEN`

At build time, the library also depends on official GitHub metadata sources:

- GitHub's published REST OpenAPI descriptions
- GitHub Docs pages that describe endpoint token-family support and permission
  requirements
- the live GitHub API versions endpoint

Out of scope for this library:

- GitHub GraphQL
- webhook receiver infrastructure
- Git protocol operations over SSH or HTTPS
- a local persistent cache or offline GitHub mirror
- a high-level handwritten domain abstraction that diverges from the REST API

## 2. Official Standards And Source Catalog

The following official GitHub sources define the behaviors that `github_ex`
implements or mirrors.

| Topic | Official source | How `github_ex` uses it |
| --- | --- | --- |
| REST API versioning | [API Versions](https://docs.github.com/en/rest/about-the-rest-api/api-versions) | Defines the date-based `X-GitHub-Api-Version` contract and the pinned version header this repo sends by default. |
| REST OpenAPI contract | [About the OpenAPI description for the REST API](https://docs.github.com/en/rest/about-the-rest-api/about-the-openapi-description-for-the-rest-api) | Establishes that GitHub publishes an OpenAPI description suitable for code generation. |
| OpenAPI repository | [github/rest-api-description](https://github.com/github/rest-api-description) | Provides the upstream OpenAPI files this repo pins and refreshes. |
| REST authentication model | [Authenticating to the REST API](https://docs.github.com/en/rest/authentication/authenticating-to-the-rest-api) | Defines bearer-token usage, supported token families, GitHub App recommendations, `GITHUB_TOKEN`, and special basic-auth cases for app endpoints. |
| Personal access tokens | [Managing your personal access tokens](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens) | Defines fine-grained PAT versus classic PAT behavior, approval model, owner scoping, repository scoping, and documented limitations. |
| Fine-grained PAT endpoint coverage | [Endpoints available for fine-grained personal access tokens](https://docs.github.com/en/rest/authentication/endpoints-available-for-fine-grained-personal-access-tokens) | Build-time source for whether a REST endpoint supports fine-grained PATs. |
| Fine-grained PAT permissions | [Permissions required for fine-grained personal access tokens](https://docs.github.com/en/rest/authentication/permissions-required-for-fine-grained-personal-access-tokens) | Build-time source for endpoint-to-permission mappings and the meaning of `X-Accepted-GitHub-Permissions`. |
| GitHub App installation-token endpoint coverage | [Endpoints available for GitHub App installation access tokens](https://docs.github.com/en/rest/authentication/endpoints-available-for-github-app-installation-access-tokens) | Build-time source for whether installation tokens are supported by a REST endpoint. |
| GitHub App user-token endpoint coverage | [Endpoints available for GitHub App user access tokens](https://docs.github.com/en/rest/authentication/endpoints-available-for-github-app-user-access-tokens) | Build-time source for whether GitHub App user tokens are supported by a REST endpoint. |
| GitHub App permissions | [Permissions required for GitHub Apps](https://docs.github.com/en/rest/authentication/permissions-required-for-github-apps) | Build-time source for GitHub App permission requirements. |
| GitHub App versus OAuth guidance | [Differences between GitHub Apps and OAuth apps](https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/differences-between-github-apps-and-oauth-apps) | Explains the security and lifecycle differences that inform this repo's auth guidance. |
| OAuth flow | [Authorizing OAuth apps](https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/authorizing-oauth-apps) | Defines the authorization-code flow used by `GitHubEx.OAuth`. |
| OAuth scopes | [Scopes for OAuth apps](https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/scopes-for-oauth-apps) | Defines classic OAuth scope semantics and why they differ from fine-grained permissions. |
| GitHub App auth modes | [Authenticating with a GitHub App](https://docs.github.com/en/apps/creating-github-apps/authenticating-with-a-github-app) | Defines app JWTs, installation tokens, and user tokens as separate auth modes. |
| Installation token narrowing | [Generating an installation access token for a GitHub App](https://docs.github.com/en/apps/creating-github-apps/authenticating-with-a-github-app/generating-an-installation-access-token-for-a-github-app) | Defines repository narrowing, permission narrowing, and token expiry for installation tokens. |
| Pagination | [Using pagination in the REST API](https://docs.github.com/en/rest/using-the-rest-api/using-pagination-in-the-rest-api) | Defines `Link` header pagination and `per_page` behavior. |
| Rate limits | [Rate limits for the REST API](https://docs.github.com/en/rest/using-the-rest-api/rate-limits-for-the-rest-api) | Defines primary and secondary limits and the meaning of `x-ratelimit-*` headers. |
| Troubleshooting and permission failures | [Troubleshooting the REST API](https://docs.github.com/en/rest/using-the-rest-api/troubleshooting-the-rest-api) | Defines how to interpret `403` permission failures and use `X-Accepted-GitHub-Permissions`. |
| Live supported versions | [api.github.com/versions](https://api.github.com/versions) | Used by the refresh path to record what API versions GitHub currently reports. |

## 3. Upstream Contract Pinned In This Repository

This repository deliberately pins its upstream inputs instead of drifting with
whatever GitHub publishes on a given day.

Pinned runtime contract:

- default REST host: `https://api.github.com`
- default `Accept` header: `application/vnd.github+json`
- default API version header: `X-GitHub-Api-Version: 2026-03-10`

Pinned committed upstream artifacts:

- full OpenAPI description:
  `priv/upstream/openapi/api.github.com.2026-03-10.json`
- pruned codegen OpenAPI description:
  `priv/upstream/openapi/api.github.com.2026-03-10.codegen.json`
- auth snapshot directory:
  `priv/upstream/github_docs_auth/`

As checked on March 20, 2026, the live
[`https://api.github.com/versions`](https://api.github.com/versions) endpoint
returns:

- `2026-03-10`
- `2022-11-28`

The repo intentionally pins `2026-03-10` and emits that version header by
default through `GitHubEx.Client`.

### Why A Full Spec And A Pruned Codegen Spec Both Exist

The repo keeps two OpenAPI artifacts:

- the full upstream spec for fidelity and doc correlation
- a pruned codegen spec for generation efficiency and deterministic output

`GitHubEx.Refresh` downloads the full upstream file and then removes codegen
noise such as verbose descriptions, examples, external docs, and `x-github`
fields before writing the `.codegen.json` artifact. This keeps the committed
source contract intact while reducing the amount of text the generator must
carry through compilation.

## 4. Repository Layout

The design is easiest to understand by treating the repo as five layers:

| Location | Role |
| --- | --- |
| `lib/github_ex/` | Thin handwritten runtime layer: client defaults, auth helpers, retries, pagination helpers, error shaping, OAuth helpers, GitHub App helpers. |
| `lib/github_ex/generated/` | Generated endpoint modules and generated runtime-schema helpers. |
| `codegen/github_ex/` | Provider definition, source/auth plugins, auth parsing, and auth-manifest generation. |
| `priv/upstream/` | Committed upstream inputs from GitHub, including OpenAPI and docs-auth snapshots. |
| `priv/generated/` | Generated machine-readable artifacts used by docs and runtime lookup. |

Supporting directories:

| Location | Role |
| --- | --- |
| `guides/` | Human-facing documentation, including generated auth matrix and architecture docs. |
| `examples/` | Live service examples meant to prove the pinned contract against real GitHub behavior. |
| `test/` | Unit and integration tests around runtime behavior, generation artifacts, auth consistency, and examples readiness. |

External but design-critical dependencies from `mix.exs`:

- `../pristine/apps/pristine_runtime`
- `../pristine/apps/pristine_codegen`
- `../pristine/apps/pristine_provider_testkit`

`github_ex` is therefore not an isolated runtime stack. It is a GitHub-specific
provider package built on shared `pristine` execution and generation layers.

## 5. Runtime Architecture

### 5.1 Application Boot

The OTP application in `lib/github_ex/application.ex` starts a Finch
supervisor with two pool families:

- `https://api.github.com`
- `https://github.com`

That split matches the two host classes the library talks to:

- `api.github.com` for REST API calls
- `github.com` for OAuth authorization and token exchange flows

### 5.2 Client Layer

The main handwritten entrypoint is `GitHubEx.Client`.

Its role is to translate GitHub-specific defaults into a `Pristine`
foundation context and a thin provider profile:

- default base URL
- GitHub media type
- GitHub API version header
- transport and transport options
- retry defaults
- response wrapper
- error module
- result classifier
- optional OAuth2 token-source wiring

The client is intentionally thin. It does not own endpoint-specific knowledge.
That knowledge stays in generated request maps and the shared `Pristine.SDK.*`
runtime boundary.

### 5.3 Generated Operations

Each generated endpoint function is a very small wrapper that does the
following:

1. Partition the params with `Pristine.SDK.OpenAPI.Client.partition/2`.
2. Build a request map with stable runtime metadata such as `resource`,
   `retry`, `circuit_breaker`, and `rate_limit`.
3. Hand that request map to the generated-request bridge in `GitHubEx.Client`.
4. Let the thin client convert the request into a request spec and call
   `Pristine.execute_request/3`.

This matters architecturally because it keeps the generated surface declarative.
Generated code describes the request; `pristine` executes it.

### 5.4 Generated Module Split

Operations are split into generated modules by GitHub OpenAPI tag, yielding
modules such as:

- `GitHubEx.Repos`
- `GitHubEx.Issues`
- `GitHubEx.Pulls`
- `GitHubEx.Actions`
- many other tag-derived namespaces under `lib/github_ex/generated/`

This tag-driven split is implemented in
`codegen/github_ex/codegen/plugins/source.ex`.

### 5.5 Raw Escape Hatch

`GitHubEx.Client.request/2` is the low-level path for requests that are:

- not yet regenerated
- experimental
- better expressed as direct HTTP requests

Even raw requests still go through the same `Pristine` execution pipeline for:

- auth handling
- retries
- wrapped responses
- error shaping
- transport

### 5.6 Typed Responses

Typed responses are disabled by default.

The default design is:

- JSON decoded data is returned as plain maps and lists
- generated schemas are optional
- callers can opt into typed response handling

`lib/github_ex/generated/runtime_schema.ex` exists to support runtime
validation and materialization when typed responses are enabled. This keeps the
default runtime lightweight while still allowing typed response workflows.

## 6. Where `pristine` Fits

`github_ex` depends on `pristine` for the general execution model and on
`pristine_codegen` for compilation.

`pristine` owns generic concerns:

- request construction
- auth adapter plumbing
- JSON serialization and decoding
- retry orchestration
- circuit breaking
- rate limiting
- response wrapping
- streaming support
- telemetry hooks

`github_ex` owns GitHub-specific concerns:

- pinned defaults for media type and API version
- GitHub-specific retry classification
- GitHub-shaped error structs
- rate-limit header parsing
- OAuth helper functions tailored to GitHub's endpoints
- GitHub App JWT and installation-token helpers
- build-time harvesting of GitHub Docs auth metadata

The design goal is explicit separation:

- `pristine` is the generic engine
- `github_ex` is the GitHub provider package

## 7. Build And Generation Pipeline

### 7.1 Refresh OpenAPI

`mix github.refresh` calls `GitHubEx.Refresh.run!/1`.

That path:

1. Downloads the pinned OpenAPI file from GitHub's official
   `github/rest-api-description` repository.
2. Writes the full spec to `priv/upstream/openapi/`.
3. Builds the pruned `.codegen.json` variant.
4. Stores metadata including the live contents of
   [`https://api.github.com/versions`](https://api.github.com/versions).
5. Optionally regenerates the SDK.

The pinned upstream URL in the code is:

- `https://raw.githubusercontent.com/github/rest-api-description/main/descriptions-next/api.github.com/api.github.com.2026-03-10.json`

This choice is aligned with GitHub's published OpenAPI model:

- the [OpenAPI description docs](https://docs.github.com/en/rest/about-the-rest-api/about-the-openapi-description-for-the-rest-api)
  describe date-based versions and per-product descriptions
- the [official repository](https://github.com/github/rest-api-description)
  documents `descriptions-next` as the 3.1 line and `descriptions` as the 3.0 line

### 7.2 Refresh Auth Snapshots

`mix github.auth.refresh` calls the auth-source refresh path implemented in
`codegen/github_ex/auth_sources.ex`.

That build-time path downloads and commits official GitHub Docs pages for:

- fine-grained PAT endpoint availability
- fine-grained PAT permission requirements
- GitHub App installation-token endpoint availability
- GitHub App user-token endpoint availability
- GitHub App permission requirements
- PAT management
- GitHub App versus OAuth comparison
- OAuth scopes
- installation-token generation

The repo also extracts endpoint-level `progAccess` data from the official docs
page payloads and writes it to:

- `priv/upstream/github_docs_auth/endpoint_prog_access.json`

That file is an implementation artifact derived from official GitHub Docs page
data. It is useful because GitHub's human-readable docs include some structured
per-endpoint token-family metadata that is not captured in the OpenAPI file
alone.

### 7.3 Compile Provider IR

`mix github.generate` calls `GitHubEx.Codegen.generate!/0`, which delegates to
`PristineCodegen.Compiler.generate/2` using the provider defined in
`codegen/github_ex/codegen/provider.ex`.

The provider defines:

- base module: `GitHubEx`
- client module: `GitHubEx.Client`
- source strategy: `:openapi_only`
- runtime defaults
- artifact plan

### 7.4 Source Plugin

`codegen/github_ex/codegen/plugins/source.ex` reads the pinned OpenAPI spec and
builds the operation dataset.

Important responsibilities:

- enumerate OpenAPI paths and methods
- map tags to generated modules
- derive function names
- partition parameters into path, query, header, body, and form-data groups
- attach runtime metadata such as telemetry event names, retry groups, circuit
  breaker groups, and resource groups
- infer link-header pagination policies
- build docs inventory and fingerprints

### 7.5 Auth Plugin

`codegen/github_ex/codegen/plugins/auth.ex` injects auth policy selection into
the provider IR.

It defines two core auth policies:

- default bearer token with optional request override
- OAuth application client credentials for `/applications/{client_id}/*`

That split reflects GitHub's official auth model from
[Authenticating to the REST API](https://docs.github.com/en/rest/authentication/authenticating-to-the-rest-api):

- most REST requests use bearer tokens
- some GitHub App and OAuth app endpoints require basic authentication with
  client ID and client secret

### 7.6 Auth Manifest And Generated Matrix

`codegen/github_ex/auth_manifest.ex` combines:

- the OpenAPI operations
- the GitHub Docs auth snapshots
- legacy scope hints from endpoint descriptions
- endpoint-level `progAccess` data

It emits:

- `priv/generated/auth_manifest.json`
- `guides/auth-capability-matrix.md`

This is a key design choice. GitHub's auth truth is not published in a single
machine-readable source. The repo therefore creates one generated internal
source of truth from multiple official sources and preserves provenance and
conflict states instead of pretending everything is perfectly uniform.

### 7.7 Generated Outputs

The generation pipeline emits:

- generated modules in `lib/github_ex/generated/`
- `priv/generated/provider_ir.json`
- `priv/generated/generation_manifest.json`
- `priv/generated/docs_inventory.json`
- `priv/generated/operation_auth_policies.json`
- `priv/generated/auth_manifest.json`
- `guides/auth-capability-matrix.md`

It also explicitly forbids older artifact paths that are no longer part of the
current design.

## 8. Authentication Model In `github_ex`

The library must handle multiple GitHub auth families that look similar at the
HTTP level but differ significantly in semantics.

### 8.1 Common Runtime Shape

At the wire level, most GitHub auth modes collapse to:

- `Authorization: Bearer <token>`

From GitHub's own auth docs:

- bearer tokens can come from PATs, GitHub Apps, OAuth apps, or `GITHUB_TOKEN`
- JWTs must be sent with `Authorization: Bearer`
- username/password auth is not supported for normal REST API authentication

`github_ex` reflects that by accepting raw bearer strings in
`GitHubEx.Client.new(auth: token)`.

### 8.2 Fine-Grained Personal Access Tokens

Official GitHub guidance is to prefer fine-grained PATs over classic PATs when
possible:

- [Authenticating to the REST API](https://docs.github.com/en/rest/authentication/authenticating-to-the-rest-api)
- [Managing your personal access tokens](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens)

Important GitHub-defined properties that directly affect this repo:

- a fine-grained PAT is tied to a single user or organization owner
- it can be restricted to selected repositories
- it carries fine-grained permissions instead of broad scopes
- organizations may require approval
- until approved, org-owned fine-grained tokens may remain effectively limited
- fine-grained PATs still have documented gaps, including Packages, Checks,
  multi-organization access, certain collaborator scenarios, and some public
  contribution flows

Because GitHub's auth behavior is endpoint-specific, this repo does not infer
"repo read works" from "some repo endpoint worked." It generates a per-endpoint
auth matrix instead.

### 8.3 Classic Personal Access Tokens

Classic PATs are still relevant because GitHub explicitly documents scenarios
that fine-grained PATs do not yet cover:

- [Managing your personal access tokens](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens)
- [Scopes for OAuth apps](https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/scopes-for-oauth-apps)

This repo treats classic-PAT support as lower-confidence metadata because
GitHub does not publish one structured endpoint-coverage index for classic PATs
equivalent to the fine-grained PAT or GitHub App coverage pages.

The generated auth manifest therefore stores classic coverage as:

- structured support when possible
- legacy scope hints when only prose exists
- `unknown` when GitHub does not provide a reliable signal

### 8.4 OAuth App Tokens

OAuth apps remain part of the supported design because GitHub still documents:

- the standard authorization-code flow
- device flow for headless apps
- scope-based OAuth access tokens
- enterprise-object scenarios where OAuth may still be preferable

Official sources:

- [Authorizing OAuth apps](https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/authorizing-oauth-apps)
- [Scopes for OAuth apps](https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/scopes-for-oauth-apps)
- [Differences between GitHub Apps and OAuth apps](https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/differences-between-github-apps-and-oauth-apps)

`GitHubEx.OAuth` implements the GitHub OAuth authorization-code path:

- build authorization requests and URLs
- exchange a code for an access token
- refresh tokens through the shared `Pristine.OAuth2` boundary

The repo does not present OAuth as the default recommendation. GitHub's own
comparison docs prefer GitHub Apps in most integration scenarios because GitHub
Apps use finer permissions, repo selection, and short-lived tokens.

### 8.5 GitHub App Auth

GitHub's official GitHub App auth model distinguishes three credentials:

- app JWT
- installation access token
- GitHub App user access token

Official sources:

- [Authenticating with a GitHub App](https://docs.github.com/en/apps/creating-github-apps/authenticating-with-a-github-app)
- [Generating an installation access token for a GitHub App](https://docs.github.com/en/apps/creating-github-apps/authenticating-with-a-github-app/generating-an-installation-access-token-for-a-github-app)
- [Differences between GitHub Apps and OAuth apps](https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/differences-between-github-apps-and-oauth-apps)

`GitHubEx.AppAuth` maps directly to that model:

- `jwt/3` and `jwt!/3` generate an app JWT locally using the app private key
- `app_client/3` creates a runtime client authenticated as the app itself
- `installation_token/3` exchanges an app-authenticated request for an
  installation token
- `installation_client/4` exchanges the token and returns a runtime client
  authenticated as the installation

The installation-token docs are especially important for this repo because they
define three behaviors the library preserves:

- installation tokens can be narrowed to `repositories` or `repository_ids`
- installation tokens can be narrowed with the `permissions` body parameter
- installation tokens expire after 1 hour

The library exposes those narrowing parameters directly instead of hiding them
behind custom abstractions.

### 8.6 OAuth Application Client Credentials

GitHub's REST auth docs also define a special class of endpoints that require
basic authentication with app client credentials rather than bearer-token auth.

Official source:

- [Authenticating to the REST API](https://docs.github.com/en/rest/authentication/authenticating-to-the-rest-api)

GitHub's rule is:

- some GitHub App and OAuth app endpoints require basic auth using client ID as
  username and client secret as password

`github_ex` encodes this design at generation time:

- `/applications/{client_id}/*` routes are assigned the
  `github.oauth_application_client_credentials` auth policy
- the request override uses `client_id` and `client_secret`
- the runtime converts that into Basic auth instead of treating the call as a
  normal bearer-token endpoint

This keeps the generated call sites faithful to GitHub's special-case contract
without forcing the user to hand-build the Authorization header.

### 8.7 `GITHUB_TOKEN`

GitHub's REST auth docs explicitly recommend using the built-in `GITHUB_TOKEN`
in GitHub Actions workflows when possible:

- [Authenticating to the REST API](https://docs.github.com/en/rest/authentication/authenticating-to-the-rest-api)
- [Rate limits for the REST API](https://docs.github.com/en/rest/using-the-rest-api/rate-limits-for-the-rest-api)

`github_ex` does not special-case `GITHUB_TOKEN` in the runtime. It is simply
another bearer token source:

```elixir
client = GitHubEx.Client.new(auth: System.fetch_env!("GITHUB_TOKEN"))
```

The important GitHub-defined differences are semantic:

- workflow permissions can narrow the token
- its rate limit is different from PATs and app installations
- its availability is workflow-scoped

## 9. Auth Catalog For The Integrated Services

This section summarizes the concrete auth-bearing services the library touches.

| Service | Host | Library entrypoints | Primary auth forms | Official references |
| --- | --- | --- | --- | --- |
| GitHub REST API | `api.github.com` | generated modules, `GitHubEx.Client.request/2` | PATs, OAuth tokens, installation tokens, app user tokens, `GITHUB_TOKEN` | [Authenticating to the REST API](https://docs.github.com/en/rest/authentication/authenticating-to-the-rest-api), [Getting started with the REST API](https://docs.github.com/en/rest/using-the-rest-api/getting-started-with-the-rest-api) |
| OAuth authorization and token exchange | `github.com` | `GitHubEx.OAuth` | OAuth app client ID, client secret, authorization code, refresh token | [Authorizing OAuth apps](https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/authorizing-oauth-apps), [Scopes for OAuth apps](https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/scopes-for-oauth-apps) |
| GitHub App auth as app | local signing + `api.github.com` | `GitHubEx.AppAuth.jwt/3`, `app_client/3` | app ID + private key -> JWT | [Authenticating with a GitHub App](https://docs.github.com/en/apps/creating-github-apps/authenticating-with-a-github-app) |
| GitHub App installation token exchange | `api.github.com` | `GitHubEx.AppAuth.installation_token/3`, `installation_client/4` | app JWT -> installation token | [Generating an installation access token for a GitHub App](https://docs.github.com/en/apps/creating-github-apps/authenticating-with-a-github-app/generating-an-installation-access-token-for-a-github-app) |
| OAuth application token-management endpoints | `api.github.com` | generated `/applications/{client_id}/*` endpoints | basic auth with client ID and client secret | [Authenticating to the REST API](https://docs.github.com/en/rest/authentication/authenticating-to-the-rest-api) |
| Build-time auth catalog inputs | `docs.github.com` | `codegen/github_ex/auth_sources.ex`, `codegen/github_ex/auth_manifest.ex` | official docs pages, docs page metadata | [Endpoints for fine-grained PATs](https://docs.github.com/en/rest/authentication/endpoints-available-for-fine-grained-personal-access-tokens), [Permissions for fine-grained PATs](https://docs.github.com/en/rest/authentication/permissions-required-for-fine-grained-personal-access-tokens), [Endpoints for GitHub App installation tokens](https://docs.github.com/en/rest/authentication/endpoints-available-for-github-app-installation-access-tokens), [Endpoints for GitHub App user tokens](https://docs.github.com/en/rest/authentication/endpoints-available-for-github-app-user-access-tokens), [Permissions for GitHub Apps](https://docs.github.com/en/rest/authentication/permissions-required-for-github-apps) |

## 10. Permission Discovery, Cataloging, And The Auth Matrix

GitHub does not publish one single official machine-readable file that answers,
for every REST operation:

- which token families are supported
- which fine-grained PAT permissions are required
- which GitHub App permissions are required
- whether a GitHub App installation token, app user token, or fine-grained PAT
  is even valid for the endpoint

This repo solves that by generating its own manifest from official GitHub
sources.

The logic lives in:

- `codegen/github_ex/auth_sources.ex`
- `codegen/github_ex/auth_parser.ex`
- `codegen/github_ex/auth_manifest.ex`
- `lib/github_ex/auth_matrix.ex`

The output is:

- human-readable: `guides/auth-capability-matrix.md`
- machine-readable: `priv/generated/auth_manifest.json`
- runtime lookup API: `GitHubEx.AuthMatrix`
- CLI lookup: `mix github.auth.lookup`

This generated auth catalog is an architectural feature, not incidental
documentation. It exists because the auth problem is part of the library's
contract.

## 11. Pagination, Rate Limits, Errors, And Retries

### 11.1 Pagination

GitHub's pagination standard for the REST API is documented in
[Using pagination in the REST API](https://docs.github.com/en/rest/using-the-rest-api/using-pagination-in-the-rest-api).

The essential GitHub rule is:

- paginated responses include a `Link` header
- the `Link` header contains URLs for `prev`, `next`, `first`, and `last` when
  available
- `per_page` may be supported by the endpoint

`github_ex` mirrors that design exactly:

- generated pagination policies use `strategy: :link_header`
- the request-side limit parameter defaults to `per_page`
- wrapped responses expose parsed pagination links
- generated paginated endpoints also get `stream_*` helpers
- `GitHubEx.Pagination` remains available for manual pagination orchestration

### 11.2 Rate Limits

GitHub's rate-limit model is defined in
[Rate limits for the REST API](https://docs.github.com/en/rest/using-the-rest-api/rate-limits-for-the-rest-api).

Important official rules that shape this repo:

- authenticated users, OAuth tokens, app user tokens, installations, and
  `GITHUB_TOKEN` do not all share identical limits
- installation-token rate limits scale differently from OAuth and PAT limits
- `x-ratelimit-limit`, `x-ratelimit-remaining`, `x-ratelimit-used`, and
  `x-ratelimit-reset` are informational rate-limit headers
- if you exceed the primary rate limit, GitHub returns `403` or `429` and
  `x-ratelimit-remaining` becomes `0`

`GitHubEx.RateLimitInfo` normalizes those headers into:

- `limit`
- `remaining`
- `used`
- `resource`
- `reset_at`
- `reset_epoch`
- `retry_after_ms`

The critical design rule in this repo is that the presence of
`x-ratelimit-reset` alone is not treated as permission to retry a request.
`x-ratelimit-reset` is general rate-limit window metadata, not universal proof
that the current response was caused by rate limiting.

### 11.3 Error Semantics

`GitHubEx.Error` is the handwritten GitHub-shaped error type layered over
`pristine` response handling.

The repo keeps GitHub-specific error shaping because callers benefit from:

- GitHub-specific error codes such as `:forbidden` and `:rate_limited`
- request IDs
- documentation URLs
- normalized headers
- retry delay information when the response really is rate-limit related

### 11.4 Troubleshooting Permission Failures

GitHub's official troubleshooting docs state that if you see
`"Resource not accessible by integration"` or
`"Resource not accessible by personal access token"`, then the token has
insufficient permissions, and the `X-Accepted-GitHub-Permissions` header can be
used to identify the permissions required by the endpoint.

Official source:

- [Troubleshooting the REST API](https://docs.github.com/en/rest/using-the-rest-api/troubleshooting-the-rest-api)

This is why `github_ex` design treats auth as endpoint-specific, not
repository-generic.

### 11.5 Example: Why Issues And Pull Requests Can Diverge

One of the motivating auth cases in this repo is:

- `GET /repos/{owner}/{repo}/issues`
- `GET /repos/{owner}/{repo}/pulls`

These are both repository reads, but GitHub's fine-grained permission model can
require different permissions:

- `Issues: read` for issues endpoints
- `Pull requests: read` for pull request endpoints

Relevant official sources:

- [Permissions required for fine-grained personal access tokens](https://docs.github.com/en/rest/authentication/permissions-required-for-fine-grained-personal-access-tokens)
- [List pull requests](https://docs.github.com/en/rest/pulls/pulls#list-pull-requests)
- [Troubleshooting the REST API](https://docs.github.com/en/rest/using-the-rest-api/troubleshooting-the-rest-api)

The design implication is straightforward:

- successful access to repository metadata or issues does not imply successful
  access to pull requests
- example suites must be explicit about per-endpoint permissions
- retry logic must not reinterpret a plain `403 permission_denied` as a
  rate-limit event

## 12. Design Decisions

### 12.1 Thin SDK Over Pinned Contract

The repo intentionally chooses a thin generated surface over a highly abstract
handwritten client because GitHub already publishes a rich, official contract.
The design objective is to preserve that contract and make it ergonomic in
Elixir, not to invent a parallel object model.

### 12.2 Pinned Inputs Instead Of Floating Latest

The library pins:

- REST API version
- OpenAPI spec
- GitHub Docs auth snapshots

That pinning improves reproducibility for:

- generated code
- generated auth manifests
- docs output
- tests

### 12.3 Generated Auth Matrix Instead Of Ad Hoc Advice

GitHub auth is spread across:

- endpoint docs
- auth overview docs
- permission tables
- token-family availability pages
- runtime response headers

This repo consolidates those into generated artifacts because otherwise auth
guidance would drift into tribal knowledge.

### 12.4 Shared Runtime And Codegen

Using `pristine` and `pristine_codegen` keeps provider-specific code small and
lets this repo focus on GitHub-specific policy rather than rebuilding transport,
retry, and compiler infrastructure.

### 12.5 Explicit Special Cases

The repo keeps GitHub-specific special cases explicit:

- `/applications/{client_id}/*` uses client credentials rather than normal
  bearer-token auth
- GitHub App auth uses app JWT, installation token, and app user token as
  distinct concepts
- pagination follows `Link` headers
- retries depend on actual rate-limit signals rather than generic window-reset
  metadata

## 13. Recreating The Library From Scratch

If you needed to rebuild `github_ex` from nothing, the sequence would be:

1. Choose and pin a GitHub REST API version.
2. Verify the version exists in the live
   [`https://api.github.com/versions`](https://api.github.com/versions)
   response.
3. Download the corresponding official OpenAPI description from
   [github/rest-api-description](https://github.com/github/rest-api-description),
   using the `api.github.com` date-based artifact for the selected version.
4. Commit the full OpenAPI file under `priv/upstream/openapi/`.
5. Generate a pruned codegen variant for deterministic compiler input.
6. Build a provider definition that maps the GitHub contract into a shared
   runtime/codegen model.
7. Implement a source plugin that:
   - walks paths and methods
   - splits parameters
   - derives module names from tags
   - infers pagination from GitHub list behavior
8. Implement an auth plugin that:
   - sets default bearer-token behavior
   - carves out the `/applications/{client_id}/*` client-credential special case
9. Download the official GitHub Docs auth pages that describe:
   - fine-grained PAT endpoint availability
   - fine-grained PAT permissions
   - GitHub App installation-token endpoint availability
   - GitHub App user-token endpoint availability
   - GitHub App permissions
   - PAT, OAuth, and GitHub App guidance pages
10. Parse those pages into machine-readable auth inputs.
11. Correlate those auth inputs with the pinned OpenAPI operation set.
12. Emit:
    - generated endpoint modules
    - machine-readable IR and manifests
    - human-readable auth matrix docs
13. Write a thin handwritten runtime layer that:
    - sets GitHub headers and API version defaults
    - exposes raw request escape hatches
    - shapes GitHub-specific errors
    - normalizes GitHub rate-limit headers
    - bridges into the shared runtime
14. Add OAuth helpers for GitHub's authorization-code endpoints on
    `github.com`.
15. Add GitHub App helpers for:
    - app JWT generation
    - installation-token exchange
    - installation-client construction
16. Start HTTP pools for both `api.github.com` and `github.com`.
17. Add example programs that hit the real service and therefore prove the
    contract under real authentication.
18. Add tests that verify:
    - generator output
    - runtime auth behavior
    - error shaping
    - pagination handling
    - docs/auth consistency

That sequence is the actual design of this repository, not merely a conceptual
outline.

## 14. Non-Goals

The repo intentionally does not attempt to be:

- a GitHub GraphQL client
- a webhook framework
- an Octokit clone with a large handwritten compatibility layer
- a long-lived credential manager
- a stateful synchronization engine

Its scope is:

- generated REST surface
- GitHub-specific runtime defaults
- GitHub-specific auth helpers
- generated auth cataloging
- reliable, pinned, reproducible docs and artifacts

## 15. Official References

These are the primary official references used by this design:

- [Authenticating to the REST API](https://docs.github.com/en/rest/authentication/authenticating-to-the-rest-api)
- [Managing your personal access tokens](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens)
- [Endpoints available for fine-grained personal access tokens](https://docs.github.com/en/rest/authentication/endpoints-available-for-fine-grained-personal-access-tokens)
- [Permissions required for fine-grained personal access tokens](https://docs.github.com/en/rest/authentication/permissions-required-for-fine-grained-personal-access-tokens)
- [Endpoints available for GitHub App installation access tokens](https://docs.github.com/en/rest/authentication/endpoints-available-for-github-app-installation-access-tokens)
- [Endpoints available for GitHub App user access tokens](https://docs.github.com/en/rest/authentication/endpoints-available-for-github-app-user-access-tokens)
- [Permissions required for GitHub Apps](https://docs.github.com/en/rest/authentication/permissions-required-for-github-apps)
- [Differences between GitHub Apps and OAuth apps](https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/differences-between-github-apps-and-oauth-apps)
- [Authorizing OAuth apps](https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/authorizing-oauth-apps)
- [Scopes for OAuth apps](https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/scopes-for-oauth-apps)
- [Authenticating with a GitHub App](https://docs.github.com/en/apps/creating-github-apps/authenticating-with-a-github-app)
- [Generating an installation access token for a GitHub App](https://docs.github.com/en/apps/creating-github-apps/authenticating-with-a-github-app/generating-an-installation-access-token-for-a-github-app)
- [About the OpenAPI description for the REST API](https://docs.github.com/en/rest/about-the-rest-api/about-the-openapi-description-for-the-rest-api)
- [API Versions](https://docs.github.com/en/rest/about-the-rest-api/api-versions)
- [Using pagination in the REST API](https://docs.github.com/en/rest/using-the-rest-api/using-pagination-in-the-rest-api)
- [Rate limits for the REST API](https://docs.github.com/en/rest/using-the-rest-api/rate-limits-for-the-rest-api)
- [Troubleshooting the REST API](https://docs.github.com/en/rest/using-the-rest-api/troubleshooting-the-rest-api)
- [Getting started with the REST API](https://docs.github.com/en/rest/using-the-rest-api/getting-started-with-the-rest-api)
- [About the OpenAPI description for the REST API](https://docs.github.com/en/rest/about-the-rest-api/about-the-openapi-description-for-the-rest-api)
- [github/rest-api-description](https://github.com/github/rest-api-description)
- [api.github.com/versions](https://api.github.com/versions)

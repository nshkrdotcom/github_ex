# Getting Started

`GitHubEx` is a generated, runtime-thin SDK for the GitHub REST API.

## Auth Preflight

Before you create credentials, choose your path:

- Bundled examples: use the exact fine-grained PAT recipe in
  [Authentication and OAuth](authentication-and-oauth.md) and the per-example
  table in [Examples README](../examples/README.md).
- Broad local exploration: start with
  [Auth Capability Matrix](auth-capability-matrix.md) before you assume one
  token type covers the SDK surface you want.
- Installed automation: read [GitHub App Authentication](github-app-authentication.md).

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

For local multi-repo development, a sibling checkout is also a supported
installation shape:

```elixir
def deps do
  [
    {:github_ex, path: "../github_ex"}
  ]
end
```

Inside this repo, `pristine` dependencies follow the same policy:

- prefer sibling-relative paths when those checkouts exist
- otherwise use Hex `pristine ~> 0.2.0` plus GitHub `subdir:` dependencies for
  `pristine_codegen` and `pristine_provider_testkit`

That keeps local development and downstream consumption aligned without a
vendored `deps/` layout.

## Create a Client

With a bearer token:

```elixir
client = GitHubEx.Client.new(auth: System.fetch_env!("GITHUB_TOKEN"))
```

Without auth for public endpoints:

```elixir
client = GitHubEx.Client.new()
```

Defaults:

- `base_url`: `https://api.github.com`
- `accept`: `application/vnd.github+json`
- `X-GitHub-Api-Version`: `2026-03-10`
- `timeout_ms`: `60000`

## First Calls

Authenticated user:

```elixir
{:ok, me} = GitHubEx.Users.get_authenticated(client)
```

Repository issues:

```elixir
{:ok, issues} =
  GitHubEx.Issues.list_for_repo(client, %{
    "owner" => "octocat",
    "repo" => "Hello-World",
    "state" => "open"
  })
```

Pull requests:

```elixir
{:ok, pulls} =
  GitHubEx.Pulls.list(client, %{
    "owner" => "octocat",
    "repo" => "Hello-World"
  })
```

## Wrapped Responses

Normal generated calls return decoded JSON-shaped maps and lists. When you need
GitHub-specific response metadata such as pagination links or rate-limit
headers, ask for a wrapped response:

```elixir
{:ok, response} =
  GitHubEx.Client.request(client, %{
    method: :get,
    path: "/user",
    opts: [response: :wrapped]
  })

response.data
response.rate_limit
response.links
```

For generated list endpoints, prefer the helper in
[Pagination and Rate Limits](pagination-and-rate-limits.md).

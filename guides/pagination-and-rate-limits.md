# Pagination and Rate Limits

GitHub pagination is header-driven. Many list endpoints return a `Link` header
instead of embedding cursor fields in the JSON body.

## Wrapped Responses

Use wrapped responses whenever you need:

- `Link` pagination URLs
- `X-RateLimit-*` headers
- elapsed timing and retry counts

Raw example:

```elixir
{:ok, response} =
  GitHubEx.Client.request(client, %{
    method: :get,
    path: "/user/repos",
    query: %{"per_page" => 100},
    opts: [response: :wrapped]
  })

response.links["next"]
response.rate_limit.remaining
```

## Generated Stream Helpers

The shared compiler emits `stream_*` wrappers for paginated operations. They
follow GitHub `Link` headers and unwrap the current page through the shared
`Pristine.SDK.OpenAPI.Client` pagination helpers:

```elixir
GitHubEx.Repos.stream_list_for_authenticated_user(client, %{"per_page" => 100})
|> Enum.take(150)
```

`GitHubEx.Pagination` still exists when you want to drive pagination manually
from an endpoint function:

```elixir
{:ok, repos} =
  GitHubEx.Pagination.collect_api(
    &GitHubEx.Repos.list_for_authenticated_user/2,
    client,
    %{"per_page" => 100}
  )
```

For endpoints that return a JSON envelope, supply `item_key:`:

```elixir
{:ok, issues} =
  GitHubEx.Pagination.collect_api(
    &GitHubEx.Search.issues_and_pull_requests/2,
    client,
    %{"q" => "org:elixir-lang is:open"},
    item_key: "items"
  )
```

## Rate-Limit Parsing

Wrapped responses expose a normalized rate-limit map:

- `limit`
- `remaining`
- `used`
- `resource`
- `reset_at`
- `retry_after_ms`

The result classifier treats `429` and rate-limit-style `403` responses as
retryable for idempotent groups such as reads, deletes, OAuth application
checks, and GitHub App auth flows.

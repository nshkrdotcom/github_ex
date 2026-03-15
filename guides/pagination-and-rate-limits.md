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
  GitHubSDK.Client.request(client, %{
    method: :get,
    path: "/user/repos",
    query: %{"per_page" => 100},
    opts: [response: :wrapped]
  })

response.links["next"]
response.rate_limit.remaining
```

## Generated List Helpers

`GitHubSDK.Pagination` layers header-aware iteration on top of generated
endpoint functions:

```elixir
{:ok, repos} =
  GitHubSDK.Pagination.collect_api(
    &GitHubSDK.Repos.list_for_authenticated_user/2,
    client,
    %{"per_page" => 100}
  )
```

For endpoints that return a JSON envelope, supply `item_key:`:

```elixir
{:ok, issues} =
  GitHubSDK.Pagination.collect_api(
    &GitHubSDK.Search.issues_and_pull_requests/2,
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

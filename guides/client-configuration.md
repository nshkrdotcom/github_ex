# Client Configuration

`GitHubSDK.Client` is intentionally narrow. It configures GitHub-specific
headers and runtime defaults, then delegates transport, serialization, retry,
telemetry, and circuit breaking to `pristine`.

## Supported Options

Common options:

- `auth:` raw token string, auth adapter tuple, or auth adapter list
- `oauth2:` token source config for `Pristine.Adapters.Auth.OAuth2`
- `base_url:` override the REST API site
- `api_version:` override the `X-GitHub-Api-Version` header
- `accept:` override the `Accept` header
- `timeout_ms:`
- `typed_responses:`
- `transport:` and `transport_opts:`
- `retry:` false, keyword list, or map
- `foundation:` keyword list forwarded to `Pristine.foundation_context/1`

## Request-Scoped Controls

Generated endpoint functions accept a `request_opts` key for runtime controls
that should not become API parameters.

Most callers only need this for wrapped responses:

```elixir
GitHubSDK.Repos.list_for_authenticated_user(client, %{
  "per_page" => 100,
  "request_opts" => [response: :wrapped]
})
```

That keeps query parameters and runtime options separate.

## Typed Responses

Generated wrappers return JSON-shaped maps and lists by default. Opt into typed
materialization when you need it:

```elixir
client = GitHubSDK.Client.new(auth: token, typed_responses: true)
```

or per request:

```elixir
GitHubSDK.Users.get_authenticated(client, %{"typed_responses" => true})
```

## Foundation Overrides

`GitHubSDK.Client` builds its runtime context with `Pristine.foundation_context/1`.
That means you can still override advanced seams through `foundation:`.

Example:

```elixir
client =
  GitHubSDK.Client.new(
    auth: System.fetch_env!("GITHUB_TOKEN"),
    foundation: [
      telemetry: [namespace: [:github_sdk]],
      rate_limit: [key: {:my_app, :github}],
      circuit_breaker: [failure_threshold: 8]
    ]
  )
```

Keep those overrides explicit in application code. The SDK docs only promise
the `GitHubSDK.Client` surface, not raw runtime internals.

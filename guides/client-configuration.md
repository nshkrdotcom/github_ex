# Client Configuration

`GitHubEx.Client` is intentionally narrow. It configures GitHub-specific
headers and runtime defaults, then delegates transport, serialization, retry,
telemetry, and circuit breaking to `pristine`.

That delegation stops at the `pristine` family surface. `GitHubEx.Client`
builds a GitHub-specific facade without re-exposing `Pristine.Core.*` or any
raw lower transport package as the public SDK contract.

## Supported Options

Common options:

- `auth:` raw token string, auth adapter tuple, or auth adapter list
- `oauth2:` token source config for `Pristine.Adapters.Auth.OAuth2`
- `governed_authority:` authority-selected GitHub credential, lease, target,
  endpoint, and redaction refs for governed execution
- `base_url:` override the REST API site
- `api_version:` override the `X-GitHub-Api-Version` header
- `accept:` override the `Accept` header
- `timeout_ms:`
- `typed_responses:`
- `transport:` and `transport_opts:`
- `retry:` false, keyword list, or map
- `foundation:` keyword list forwarded to `Pristine.foundation_context/1`

`governed_authority:` is mutually exclusive with direct auth and endpoint
configuration. When it is present, `GitHubEx.Client` uses package defaults and
authority-selected headers to build the lower `pristine` governed context, and
rejects direct `auth:`, `oauth2:`, `base_url:`, `api_version:`, `accept:`,
`user_agent:`, `foundation:`, token, app credential, installation, webhook, and
OAuth token-file inputs.

## Request-Scoped Controls

Generated endpoint functions accept a `request_opts` key for runtime controls
that should not become API parameters.

Most callers only need this for wrapped responses:

```elixir
GitHubEx.Repos.list_for_authenticated_user(client, %{
  "per_page" => 100,
  "request_opts" => [response: :wrapped]
})
```

That keeps query parameters and runtime options separate.

## Typed Responses

Generated wrappers return JSON-shaped maps and lists by default. Opt into typed
materialization when you need it:

```elixir
client = GitHubEx.Client.new(auth: token, typed_responses: true)
```

or per request:

```elixir
GitHubEx.Users.get_authenticated(client, %{"typed_responses" => true})
```

## Foundation Overrides

`GitHubEx.Client` builds its runtime context with `Pristine.foundation_context/1`.
That means you can still override advanced seams through `foundation:`.

Example:

```elixir
client =
  GitHubEx.Client.new(
    auth: System.fetch_env!("GITHUB_TOKEN"),
    foundation: [
      telemetry: [namespace: [:github_ex]],
      rate_limit: [key: {:my_app, :github}],
      circuit_breaker: [failure_threshold: 8]
    ]
  )
```

Keep those overrides explicit in application code. The SDK docs only promise
the `GitHubEx.Client` surface, not raw runtime internals.

Governed clients do not accept `foundation:` because it can override lower
headers, auth, or endpoint materialization. Put those choices in the authority
packet before constructing the client.

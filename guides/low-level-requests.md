# Low-Level Requests

The generated surface is broad, but there are still cases where a raw request
is the clearest option:

- you want to hit an endpoint before the generated wrappers are refreshed
- you want direct control over wrapped responses
- you are experimenting with unusual headers or request bodies

## Raw Request Shape

```elixir
{:ok, response} =
  GitHubEx.Client.request(client, %{
    method: :get,
    path: "/repos/{owner}/{repo}",
    path_params: %{"owner" => "octocat", "repo" => "Hello-World"},
    query: %{},
    body: nil,
    headers: %{},
    opts: [response: :wrapped]
  })
```

The raw request still goes through:

- path validation
- auth override handling
- retry classification
- response decoding
- wrapped response handling

For governed clients, raw requests cannot supply direct `auth`, `headers`,
`base_url`, token, app credential, installation, webhook, OAuth token-file, or
`use_default_auth: false` controls. Those choices must come from the authority
packet before the client is constructed.

## Disabling Default Auth

For public requests where you explicitly do not want the client default token
attached:

```elixir
GitHubEx.Client.request(client, %{
  method: :get,
  path: "/meta",
  use_default_auth: false
})
```

This bypass is standalone-only. Governed clients reject it because the
authority packet owns whether a request may execute and which credential
material is attached.

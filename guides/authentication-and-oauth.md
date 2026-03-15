# Authentication and OAuth

GitHub REST calls are authenticated with bearer tokens, but there are multiple
ways to obtain them.

## Bearer Tokens

For most API callers, this is enough:

```elixir
client = GitHubSDK.Client.new(auth: System.fetch_env!("GITHUB_TOKEN"))
```

That token can be:

- a fine-grained personal access token
- a classic personal access token
- an OAuth access token
- a GitHub App installation token

## OAuth App Flow

`GitHubSDK.OAuth` covers the standard authorization-code flow against
`https://github.com/login/oauth/*`.

Build the authorization URL:

```elixir
{:ok, url} =
  GitHubSDK.OAuth.authorize_url(
    client_id: System.fetch_env!("GITHUB_OAUTH_CLIENT_ID"),
    redirect_uri: System.fetch_env!("GITHUB_OAUTH_REDIRECT_URI"),
    scopes: ["repo", "read:user"],
    generate_state: true
  )
```

Exchange the code:

```elixir
client = GitHubSDK.Client.new()

{:ok, token} =
  GitHubSDK.OAuth.exchange_code(
    System.fetch_env!("GITHUB_OAUTH_AUTH_CODE"),
    client: client,
    client_id: System.fetch_env!("GITHUB_OAUTH_CLIENT_ID"),
    client_secret: System.fetch_env!("GITHUB_OAUTH_CLIENT_SECRET"),
    redirect_uri: System.fetch_env!("GITHUB_OAUTH_REDIRECT_URI")
  )
```

## Saved OAuth Token Files

Use the included task for a user-friendly terminal onboarding path:

```bash
export GITHUB_OAUTH_CLIENT_ID="..."
export GITHUB_OAUTH_CLIENT_SECRET="..."
export GITHUB_OAUTH_REDIRECT_URI="http://127.0.0.1:40071/callback"

mix github.oauth --save --manual --no-browser
```

That writes a token file to:

```bash
~/.config/github_sdk/oauth/github.json
```

or the XDG-equivalent path when `XDG_CONFIG_HOME` is set.

Use that saved token in normal API calls:

```elixir
client =
  GitHubSDK.Client.new(
    oauth2: [
      token_source:
        {Pristine.Adapters.TokenSource.File,
         path: GitHubSDK.OAuthTokenFile.default_path()}
    ]
  )
```

## Application Token Endpoints

GitHub exposes OAuth application token inspection and revocation endpoints under
`/applications/{client_id}/token*`.

Those do not use bearer auth. They require request-scoped client credentials:

```elixir
GitHubSDK.Apps.check_token(client, %{
  "client_id" => System.fetch_env!("GITHUB_OAUTH_CLIENT_ID"),
  "client_secret" => System.fetch_env!("GITHUB_OAUTH_CLIENT_SECRET"),
  "access_token" => token
})
```

`GitHubSDK` strips `client_secret` from the request body and converts it into
Basic auth automatically for those endpoints.

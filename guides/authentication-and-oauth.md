# Authentication and OAuth

## Start Here

Use this guide when you need to decide which credential to create before you
write code.

- Use a fine-grained PAT if you want the current bundled examples and a narrow,
  user-created local token.
- Use a classic PAT if you want broad local exploration across many modules and
  do not want to fight fine-grained PAT limitations first.
- Use an OAuth app if you need a browser approval screen and callback code, or
  if you need enterprise-object access that still fits OAuth better.
- Use a GitHub App if you need installed repo or org automation with
  short-lived bot credentials. Read [GitHub App Authentication](github-app-authentication.md).

Before you guess, check the generated
[Auth Capability Matrix](auth-capability-matrix.md).

## Fastest Path For The Bundled Examples

Use this if you want the examples in `examples/` working today.

Create a fine-grained PAT with:

- resource owner: your current user account when you want `/user` and `/user/repos`
- repository access: only the selected repos you will test
- repository permissions: `Metadata: read`, `Issues: read`, `Pull requests: read`, `Actions: read`

Important corrections for this repo:

- `GET /user` currently requires no fine-grained PAT permissions
- `GET /user/repos` needs `Metadata: read`
- `Contents: read` is not required for the current bundled examples

Then export the token:

```bash
export GITHUB_TOKEN="..."
```

And use it:

```elixir
client = GitHubEx.Client.new(auth: System.fetch_env!("GITHUB_TOKEN"))
```

For the example-by-example mapping, read [Examples README](../examples/README.md).

## Broad Local Exploration

Use this if you want to roam across the SDK instead of staying inside the
bundled read-focused examples.

Start with [Auth Capability Matrix](auth-capability-matrix.md). It tells you, per
operation:

- whether fine-grained PATs are supported
- whether GitHub App installation and user tokens are supported
- which fine-grained or GitHub App permission is required
- whether the repo only has legacy classic-PAT or OAuth scope hints
- whether GitHub's sources disagree

Classic PAT is often the simpler choice when:

- you need to move across many modules quickly
- you need multiple organizations at once
- you need Packages or Checks access
- you hit outside-collaborator or public-contribution patterns GitHub still
  documents as fine-grained PAT gaps
- you are working with enterprise-flavored surfaces and do not want to keep
  re-cutting tokens during discovery

Do not use a classic PAT if a narrow fine-grained PAT already covers the
specific endpoints you need. Classic PAT is broader and less safe.

## Fine-Grained PATs

Use this if you want the narrowest user-created bearer token GitHub offers for
most normal local SDK work.

Do not use this if your real need is broad exploration across unsupported
surfaces or if you already know you need a browser callback or installed app
automation.

The fine-grained PAT UI is conditional. The permission list is not fixed.

- account permissions only appear when the current user is the resource owner
- organization permissions only appear when the resource owner is an organization
- repository permissions appear for both user-owned and organization-owned repositories

That is why the UI changes when you switch owners or repository scope.

Organization-owned fine-grained PATs may also require approval. Until approved,
GitHub can leave the token in a `pending` state where it only reads public
resources.

GitHub still documents real fine-grained PAT gaps, including:

- public repo contribution when you are not a member
- outside-collaborator and repository-collaborator scenarios
- access across multiple organizations
- Packages
- Checks API
- Projects owned by a user account

Use the matrix before assuming a fine-grained PAT is the universal answer.

## Classic PATs

Use this if you need a broad local-development credential and you already know
the narrower fine-grained PAT path will slow you down.

This is the simpler choice when:

- you are testing across many modules quickly
- you need endpoints GitHub still documents as fine-grained PAT gaps
- you need one token that spans more than one organization
- you need a practical local fallback before you design a narrower production credential

Do not use this if you can stay inside a smaller fine-grained PAT or GitHub App
permission set. Classic PAT remains broader than necessary for many flows.

This repo treats classic PAT coverage as a lower-confidence signal. GitHub does
not publish one structured classic-PAT support index for the full REST API, so
the matrix stores classic coverage as `legacy_scope_hint` or `unknown`.

## OAuth Apps

Use this if:

- your app needs GitHub to show a browser approval screen and redirect back
  with an authorization code
- you need enterprise-object access where GitHub still points you toward OAuth

Do not use this if you only need local scripts or installed bot automation.

Typical OAuth flow:

1. Register an OAuth app in GitHub developer settings.
2. Send the user to GitHub's authorization URL.
3. Receive the callback with a code.
4. Exchange the code for a user access token.

`GitHubEx.OAuth` covers that flow:

```elixir
{:ok, url} =
  GitHubEx.OAuth.authorize_url(
    client_id: System.fetch_env!("GITHUB_OAUTH_CLIENT_ID"),
    redirect_uri: System.fetch_env!("GITHUB_OAUTH_REDIRECT_URI"),
    scopes: ["repo", "read:user"],
    generate_state: true
  )
```

```elixir
client = GitHubEx.Client.new()

{:ok, token} =
  GitHubEx.OAuth.exchange_code(
    System.fetch_env!("GITHUB_OAUTH_AUTH_CODE"),
    client: client,
    client_id: System.fetch_env!("GITHUB_OAUTH_CLIENT_ID"),
    client_secret: System.fetch_env!("GITHUB_OAUTH_CLIENT_SECRET"),
    redirect_uri: System.fetch_env!("GITHUB_OAUTH_REDIRECT_URI")
  )
```

GitHub App permissions are usually finer-grained than OAuth scopes. Use OAuth
because the flow or enterprise surface needs it, not because it is the default.

## OAuth Application Token Endpoints

These five endpoints are special:

- `DELETE /applications/{client_id}/grant`
- `POST /applications/{client_id}/token`
- `DELETE /applications/{client_id}/token`
- `PATCH /applications/{client_id}/token`
- `POST /applications/{client_id}/token/scoped`

They do not use normal bearer-token auth. They use OAuth application client
credentials. `GitHubEx` converts the request-scoped client credentials into
Basic auth automatically for these endpoints.

```elixir
GitHubEx.Apps.check_token(client, %{
  "client_id" => System.fetch_env!("GITHUB_OAUTH_CLIENT_ID"),
  "client_secret" => System.fetch_env!("GITHUB_OAUTH_CLIENT_SECRET"),
  "access_token" => token
})
```

## Where To Look Up Exact Permissions

Use one of these, in order:

- [Auth Capability Matrix](auth-capability-matrix.md) for the generated repo-level answer
- `mix github.auth.lookup GET /user/repos`
- `mix github.auth.lookup repos/list-for-authenticated-user`
- the endpoint docs URL stored in `priv/generated/auth_manifest.json`
- GitHub's `X-Accepted-GitHub-Permissions` response header when a request fails

For the current example suite, read [Examples README](../examples/README.md).

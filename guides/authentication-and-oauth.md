# Authentication and OAuth

GitHub REST calls are usually made with a bearer token, but the right way to
obtain that token depends on what you are building.

## Start Here

Choose auth mode like this:

- Personal use, local development, one human user: use a fine-grained personal access token first.
- User login flow for your own application: use an OAuth app.
- Automation, bots, org/repo installation model, or multi-tenant integrations: use a GitHub App instead of OAuth or PATs. See [GitHub App Authentication](github-app-authentication.md).
- Classic personal access token: use only as a fallback when fine-grained PATs cannot cover the endpoints or access pattern you need.

For normal bearer-token calls, the SDK entry point stays the same:

```elixir
client = GitHubSDK.Client.new(auth: System.fetch_env!("GITHUB_TOKEN"))
```

That bearer token can be:

- a fine-grained personal access token
- a classic personal access token
- an OAuth access token
- a GitHub App installation token

## Personal Access Tokens

### Which PAT should you create?

Use a fine-grained PAT unless you have a known reason not to.

That matches GitHub's current guidance:

- GitHub recommends fine-grained PATs over classic PATs for better restriction and control.
- GitHub notes that some features and endpoints still require classic PATs.
- Fine-grained PATs are also the tokens that organizations can require approval for.

Use a classic PAT only if you hit one of the known fine-grained gaps, such as:

- an endpoint that GitHub documents as classic-only
- enterprise account APIs
- checks API access
- packages access
- access patterns that need multiple organizations at once
- outside-collaborator or public-repo contribution scenarios that GitHub still documents as classic-only

### How to create a good PAT for this SDK

Recommended local-development checklist for this repo:

1. Create a fine-grained token under `Settings -> Developer settings -> Personal access tokens -> Fine-grained tokens`.
2. Put only the owner or organization you actually need in `Resource owner`.
3. Grant access only to the repositories you will test against.
4. Pick the shortest practical expiration. For local development, this repo recommends `7` to `30` days rather than an indefinite token. This is a repo recommendation, not a GitHub requirement.
5. Name it so you can revoke it later without guessing. Recommended convention in this repo:

```text
github-ex local-dev <owner-or-org> <repo-or-scope> <yyyy-mm>
```

Examples:

```text
github-ex local-dev octocat hello-world 2026-03
github-ex local-dev my-org workflow-read 2026-03
```

### Which permissions should a fine-grained PAT start with?

For the bundled example surface in this repo, start narrow:

- User permission `Profile: read` if you want `GitHubSDK.Users.get_authenticated/1`
- Repository permission `Contents: read` for basic repo reads
- Repository permission `Issues: read` for issue-list examples
- Repository permission `Pull requests: read` for PR-list examples
- Repository permission `Actions: read` for workflow run examples

If you only want to call public endpoints like `GitHubSDK.Meta.root/1`, you can
skip auth entirely.

If a call fails with `403`, do not immediately broaden everything. GitHub's REST
docs expose the required permission tables for both fine-grained PATs and
GitHub Apps, and GitHub also returns an `X-Accepted-GitHub-Permissions` header
to help you narrow the missing permission.

### PAT organization and SSO notes

- Fine-grained PATs may require organization approval, depending on org policy.
- Classic PATs can be blocked by organization policy.
- Classic PATs may also require a separate SSO authorization step for SAML SSO organizations.
- Fine-grained PATs are authorized for org access during token creation.

## OAuth App Flow

Use OAuth when a human user needs to sign in to your app and grant your app the
ability to act as that user.

GitHub currently recommends considering a GitHub App instead of an OAuth app for
new integrations when that model fits, because GitHub Apps use fine-grained
permissions and short-lived tokens. OAuth apps still make sense when your main
need is user sign-in plus user-attributed access.

### Register the OAuth app

Create it in GitHub at `Settings -> Developer settings -> OAuth apps`.

You will need:

- `Application name`: choose a user-visible name such as `github-ex local dev`
- `Homepage URL`: your local or deployed app home page
- `Authorization callback URL`: the exact redirect URI your app will receive the code on

This SDK's examples expect:

```text
http://127.0.0.1:40071/callback
```

### Which OAuth scopes should you request?

Start with the smallest scope set that matches your flow:

- identity only: `read:user`
- identity plus private email: `read:user`, `user:email`
- public repository access only: `public_repo`
- private repository access or repo-owned resources such as issues and pull requests: `repo`
- commit status only: `repo:status`
- deployments only: `repo_deployment`
- repository webhooks: `write:repo_hook`
- organization webhooks: `write:org_hook`

Important tradeoff:

- OAuth scopes limit the token.
- They do not grant access the user does not already have.
- OAuth scopes are broader than GitHub App permissions. For example, GitHub documents that OAuth apps need `repo` to work with issues, pull requests, or anything owned by the repository, while GitHub Apps can request narrower permissions.

### Build the authorization URL

`GitHubSDK.OAuth` covers the standard authorization-code flow against
`https://github.com/login/oauth/*`.

```elixir
{:ok, url} =
  GitHubSDK.OAuth.authorize_url(
    client_id: System.fetch_env!("GITHUB_OAUTH_CLIENT_ID"),
    redirect_uri: System.fetch_env!("GITHUB_OAUTH_REDIRECT_URI"),
    scopes: ["repo", "read:user"],
    generate_state: true
  )
```

### Exchange the code

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

Use the returned access token as a normal bearer token:

```elixir
client = GitHubSDK.Client.new(auth: token.access_token)
```

## Saved OAuth Token Files

Use the included task for a terminal-friendly onboarding path:

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

Those do not use normal bearer auth. They require request-scoped client
credentials:

```elixir
GitHubSDK.Apps.check_token(client, %{
  "client_id" => System.fetch_env!("GITHUB_OAUTH_CLIENT_ID"),
  "client_secret" => System.fetch_env!("GITHUB_OAUTH_CLIENT_SECRET"),
  "access_token" => token
})
```

`GitHubSDK` strips `client_secret` from the request body and converts it into
Basic auth automatically for those endpoints.

## Current GitHub Docs Backing This Guide

- Fine-grained vs classic PATs: https://docs.github.com/en/enterprise-cloud@latest/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens
- Fine-grained PAT permissions: https://docs.github.com/en/rest/authentication/permissions-required-for-fine-grained-personal-access-tokens
- OAuth scopes: https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/scopes-for-oauth-apps
- GitHub Apps vs OAuth apps: https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/differences-between-github-apps-and-oauth-apps

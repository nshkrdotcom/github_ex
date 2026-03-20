# GitHub App Authentication

## When A GitHub App Is Actually The Right Choice

Use a GitHub App when you need:

- installed repo or org automation instead of one user's long-lived token
- short-lived credentials and narrower permissions than OAuth scopes
- repository selection at installation time and token narrowing at runtime

Do not start here if you just want the bundled examples or a one-off local
script for yourself. Start with
[Authentication and OAuth](authentication-and-oauth.md).

Check the generated [Auth Capability Matrix](auth-capability-matrix.md) before
you assume a GitHub App installation token covers the endpoint you want.

## Three Credentials You Need To Distinguish

### App JWT

Use this to authenticate as the app itself.

- valid for app-level endpoints
- used to exchange for an installation access token
- not the normal credential for repo and org API work

```elixir
jwt =
  GitHubEx.AppAuth.jwt!(
    System.fetch_env!("GITHUB_APP_ID"),
    File.read!(System.fetch_env!("GITHUB_APP_PRIVATE_KEY_PATH"))
  )
```

`GitHubEx.AppAuth.app_client/3` returns a `Pristine.Client` configured with that
JWT as the default runtime credential, so you can pass it straight to generated
GitHubEx operations.

### Installation Access Token

Use this for most real API work.

- represents one installation of one GitHub App
- expires after about `1 hour`
- can be narrowed to selected repositories and selected permissions
- is the normal runtime credential for repo and org automation

### GitHub App User Access Token

Use this when the endpoint is user-attributed and GitHub's docs say a GitHub
App user token is supported.

- acts on behalf of a user through the GitHub App model
- is different from the app JWT
- is different from the installation token

## What An Installation Token Can And Cannot Do

An installation token can:

- call normal repo and org endpoints that the installation can access
- inherit only the repositories selected for that installation
- inherit only the permissions granted to that installation
- be narrowed further when you mint the token

An installation token cannot:

- replace the app JWT for app-level endpoints that expect app authentication
- access repositories outside the installation
- exceed the permissions granted to the installation

Keep the distinction explicit in your code:

- app JWT: app-level auth and token exchange
- installation token: default runtime credential
- app user token: user-attributed GitHub App access where supported

## Minimal Permissions For The App Example

`examples/08_github_app_auth.exs` signs an app JWT and exchanges an installation
token. That flow does not need repository read permissions just to mint the
token, but the installation must already exist on the target owner.

If you then use that installation token for the same read-focused repo examples
this repo ships, start with:

- `Metadata: read`
- `Issues: read`
- `Pull requests: read`
- `Actions: read`

`Contents: read` is not required for that bundled read-focused surface.

## How To Narrow An Installation Token

Narrow by repository and permission when you create the token:

```elixir
app_client =
  GitHubEx.AppAuth.app_client(
    System.fetch_env!("GITHUB_APP_ID"),
    File.read!(System.fetch_env!("GITHUB_APP_PRIVATE_KEY_PATH"))
  )

{:ok, token_response} =
  GitHubEx.AppAuth.installation_token(
    app_client,
    System.fetch_env!("GITHUB_APP_INSTALLATION_ID"),
    %{
      "permissions" => %{
        "issues" => "read",
        "pull_requests" => "read",
        "actions" => "read",
        "metadata" => "read"
      },
      "repositories" => ["repo-one"]
    }
  )
```

If you omit narrowing, GitHub issues a token with the full repository set and
permission set already granted to the installation.

`GitHubEx.AppAuth.installation_client/4` likewise returns a `Pristine.Client`
ready to hand to generated modules such as `GitHubEx.Repos` or `GitHubEx.Issues`.

## How To Debug 403s

Check these first:

- you used an installation token for installation-level work, not the app JWT
- the app is installed on the correct owner
- the installation includes the target repository
- the installation has the required permission
- the token has not expired
- the endpoint really supports installation or app user tokens in the
  [Auth Capability Matrix](auth-capability-matrix.md)

When a call still fails, inspect the response headers for
`X-Accepted-GitHub-Permissions` and compare them with the generated matrix.

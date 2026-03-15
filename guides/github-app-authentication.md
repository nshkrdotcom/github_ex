# GitHub App Authentication

GitHub Apps have two distinct auth modes:

- app authentication with a short-lived JWT
- installation authentication with a short-lived installation access token

`GitHubEx.AppAuth` covers both.

If you are just trying the SDK locally as one human user, do not start here.
Start with a fine-grained PAT in [Authentication and OAuth](authentication-and-oauth.md).

## When to choose a GitHub App

Choose a GitHub App when you want:

- short-lived credentials instead of a long-lived PAT
- installation on a specific org, account, or selected repositories
- permissions that are narrower than OAuth `repo` scopes
- bot/server automation rather than "act exactly as one user forever"

GitHub currently documents GitHub Apps as the preferred model over OAuth apps
for many new integrations because GitHub Apps use fine-grained permissions and
short-lived tokens.

## What an installation token actually is

An installation token is a short-lived bearer token issued for one installation
of one GitHub App.

That means:

- it only has access to the repositories granted to that installation
- it only has the permissions granted to that installation
- it represents the app/bot, not a human user
- GitHub currently documents installation tokens as expiring after `1 hour`

Most normal repo, issue, pull request, and workflow automation calls should use
an installation token, not the app JWT directly.

## Setup Checklist

Before you can use `GitHubEx.AppAuth`, create and install a GitHub App:

1. Register a GitHub App in GitHub developer settings.
2. Give it the minimum repository or organization permissions needed.
3. Install the app on the target account or organization.
4. Limit installation access to only the repositories you want when possible.
5. Generate and download a private key PEM.
6. Record the App ID and installation ID.

Recommended naming convention for local development:

```text
github-ex local-dev <owner-or-org> <purpose>
```

Examples:

```text
github-ex local-dev octocat repo-read
github-ex local-dev my-org workflow-read
```

## Which GitHub App permissions should you start with?

For this repo's bundled examples, start with:

- `Metadata: read`
- `Contents: read` for repository reads
- `Issues: read` for issue-list calls
- `Pull requests: read` for PR-list calls
- `Actions: read` for workflow-run calls

If a call returns `403`, do not widen everything immediately. GitHub documents
the required app-permission tables for REST endpoints, and GitHub also returns
an `X-Accepted-GitHub-Permissions` header that helps narrow the missing
permission.

## Generate an App JWT

```elixir
private_key_pem = File.read!(System.fetch_env!("GITHUB_APP_PRIVATE_KEY_PATH"))

jwt =
  GitHubEx.AppAuth.jwt!(
    System.fetch_env!("GITHUB_APP_ID"),
    private_key_pem
  )
```

That token can call app-level endpoints such as `GitHubEx.Apps.get_authenticated/1`.

Keep the distinction explicit:

- app JWT: for app-level endpoints and installation-token exchange
- installation token: for most real API work against repos and org resources

## Create an App Client

```elixir
app_client =
  GitHubEx.AppAuth.app_client(
    System.fetch_env!("GITHUB_APP_ID"),
    File.read!(System.fetch_env!("GITHUB_APP_PRIVATE_KEY_PATH"))
  )
```

## Exchange an Installation Token

```elixir
{:ok, token_response} =
  GitHubEx.AppAuth.installation_token(
    app_client,
    System.fetch_env!("GITHUB_APP_INSTALLATION_ID")
  )
```

The returned JSON includes a short-lived bearer token and expiration time.

You can also narrow the token on creation:

```elixir
{:ok, token_response} =
  GitHubEx.AppAuth.installation_token(
    app_client,
    System.fetch_env!("GITHUB_APP_INSTALLATION_ID"),
    %{
      "permissions" => %{
        "issues" => "read",
        "pull_requests" => "read",
        "actions" => "read",
        "contents" => "read"
      }
    }
  )
```

If you omit `permissions`, GitHub will issue a token with all permissions that
the installation already has.

## Create an Installation Client

```elixir
installation_client =
  GitHubEx.AppAuth.installation_client(
    System.fetch_env!("GITHUB_APP_ID"),
    File.read!(System.fetch_env!("GITHUB_APP_PRIVATE_KEY_PATH")),
    System.fetch_env!("GITHUB_APP_INSTALLATION_ID")
  )
```

That client is ready for normal repository, issue, pull request, and workflow
calls that the installation has permission to access.

## Permission Notes

GitHub App failures are usually one of:

- the app JWT is expired or signed with the wrong private key
- the installation id is wrong
- the installation does not have the required repository access
- the installation token lacks the required permissions

Keep the app-vs-installation distinction explicit in your application code.

## Current GitHub Docs Backing This Guide

- Authenticating as an installation: https://docs.github.com/apps/creating-github-apps/authenticating-with-a-github-app/authenticating-as-a-github-app-installation
- Generating an installation token: https://docs.github.com/en/apps/creating-github-apps/authenticating-with-a-github-app/generating-an-installation-access-token-for-a-github-app
- GitHub Apps vs OAuth apps: https://docs.github.com/en/apps/oauth-apps/building-oauth-apps/differences-between-github-apps-and-oauth-apps
- GitHub App permissions: https://docs.github.com/en/rest/authentication/permissions-required-for-github-apps

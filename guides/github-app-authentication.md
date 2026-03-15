# GitHub App Authentication

GitHub Apps have two distinct auth modes:

- app authentication with a short-lived JWT
- installation authentication with a short-lived installation access token

`GitHubSDK.AppAuth` covers both.

## Generate an App JWT

```elixir
private_key_pem = File.read!(System.fetch_env!("GITHUB_APP_PRIVATE_KEY_PATH"))

jwt =
  GitHubSDK.AppAuth.jwt!(
    System.fetch_env!("GITHUB_APP_ID"),
    private_key_pem
  )
```

That token can call app-level endpoints such as `GitHubSDK.Apps.get_authenticated/1`.

## Create an App Client

```elixir
app_client =
  GitHubSDK.AppAuth.app_client(
    System.fetch_env!("GITHUB_APP_ID"),
    File.read!(System.fetch_env!("GITHUB_APP_PRIVATE_KEY_PATH"))
  )
```

## Exchange an Installation Token

```elixir
{:ok, token_response} =
  GitHubSDK.AppAuth.installation_token(
    app_client,
    System.fetch_env!("GITHUB_APP_INSTALLATION_ID")
  )
```

The returned JSON includes a short-lived bearer token and expiration time.

## Create an Installation Client

```elixir
installation_client =
  GitHubSDK.AppAuth.installation_client(
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

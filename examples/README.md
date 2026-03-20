# Live Examples

These examples are strict real-service proofs for the GitHub REST API surface
in this package.

The normal request surface is generated through the shared `pristine`
runtime/codegen stack. For paginated endpoints, the generated modules also
expose `stream_*` helpers such as
`GitHubEx.Repos.stream_list_for_authenticated_user/3`.

Read these first if you have not created credentials yet:

- [Authentication and OAuth](../guides/authentication-and-oauth.md)
- [Auth Capability Matrix](../guides/auth-capability-matrix.md)
- [GitHub App Authentication](../guides/github-app-authentication.md)

## Example Auth Table

| Example | Endpoint | Minimal FG PAT requirement | Notes |
|--------|--------|--------|--------|
| `00_smoke.exs` | `GET /` and `GET /rate_limit` | none | no auth required for the smoke path |
| `01_get_authenticated_user.exs` | `GET /user` | none | endpoint page says a fine-grained PAT needs no permissions |
| `02_list_authenticated_repos.exs` | `GET /user/repos` | `Metadata: read` | choose your own user as resource owner for `/user` and `/user/repos` |
| `03_list_repo_issues.exs` | `GET /repos/{owner}/{repo}/issues` | `Issues: read` | select the target repository on the token |
| `04_list_pull_requests.exs` | `GET /repos/{owner}/{repo}/pulls` | `Pull requests: read` | select the target repository on the token |
| `05_list_workflow_runs.exs` | `GET /repos/{owner}/{repo}/actions/runs` | `Actions: read` | select the target repository on the token |

## Fine-Grained PAT Quickstart

Create a fine-grained PAT for the bundled read-focused examples:

1. Choose your current user as resource owner when you want `/user` and `/user/repos`.
2. Choose only the selected repositories you will test.
3. Add exactly these repository permissions:
   - `Metadata: read`
   - `Issues: read`
   - `Pull requests: read`
   - `Actions: read`

`Contents: read` is not required for the bundled examples.

If you want to try endpoints outside this read-focused surface, stop and read
the [Auth Capability Matrix](../guides/auth-capability-matrix.md) before you
assume the same token will work.

## Environment

General:

```bash
export GITHUB_TOKEN="..."
export GITHUB_EXAMPLE_OWNER="octocat"
export GITHUB_EXAMPLE_REPO="Hello-World"
export GITHUB_EXAMPLE_ISSUE_NUMBER="1"
```

Optional workflow example override:

```bash
export GITHUB_EXAMPLE_WORKFLOW_ID="ci.yml"
```

OAuth examples:

```bash
export GITHUB_OAUTH_CLIENT_ID="..."
export GITHUB_OAUTH_CLIENT_SECRET="..."
export GITHUB_OAUTH_REDIRECT_URI="http://127.0.0.1:40071/callback"
export GITHUB_OAUTH_AUTH_CODE="..."
```

OAuth app minimum:

1. Go to GitHub Settings -> Developer settings -> OAuth Apps.
2. Create a new OAuth app.
3. Fill the minimum fields:
   - Application name: any clear local-test name
   - Homepage URL: any valid URL you control
   - Authorization callback URL: `http://127.0.0.1:40071/callback`
   - Enable Device Flow: leave unchecked
4. Copy the client ID and client secret.
5. Export `GITHUB_OAUTH_CLIENT_ID`, `GITHUB_OAUTH_CLIENT_SECRET`, and `GITHUB_OAUTH_REDIRECT_URI`.
6. Run `mix github.oauth --save --manual --no-browser`.
7. Open the printed authorize URL, approve access, and paste back the returned code.

This repo uses the normal authorization-code flow, not Device Flow.

GitHub App example:

```bash
export GITHUB_APP_ID="..."
export GITHUB_APP_PRIVATE_KEY_PATH="/path/to/private-key.pem"
export GITHUB_APP_INSTALLATION_ID="..."
```

GitHub App minimum:

1. Go to GitHub Settings -> Developer settings -> GitHub Apps.
2. Create a new GitHub App.
3. Fill only the minimum fields:
   - GitHub App name: any unique local-test name
   - Homepage URL: any valid URL you control
   - Callback URL: leave blank for this example
   - Expire user authorization tokens: leave off
   - Request user authorization during installation: leave off
   - Enable Device Flow: leave off
   - Setup URL: leave blank
   - Installation target: `Only on this account` is fine for local testing
4. For permissions, start with `Repository metadata: Read-only`.
5. Generate and download a private key `.pem` file.
6. Click `Install App` in the GitHub App UI and install it on the target account or org.
7. Copy the App ID from the app settings page.
8. Copy the installation ID from the installation page URL. It is the number in `/settings/installations/<id>`.
9. Export `GITHUB_APP_ID`, `GITHUB_APP_PRIVATE_KEY_PATH`, and `GITHUB_APP_INSTALLATION_ID`.

## Running

Fastest first run:

```bash
mix run examples/00_smoke.exs
```

That public smoke example does not require `GITHUB_TOKEN`.

The suite runner is stricter:

- `./examples/run_all.sh smoke` requires `GITHUB_TOKEN` because it also runs `01_get_authenticated_user.exs`
- `./examples/run_all.sh all` requires `GITHUB_TOKEN` before it reaches the repo, OAuth, and app examples
- `./examples/run_all.sh repos` also needs `GITHUB_EXAMPLE_OWNER` and `GITHUB_EXAMPLE_REPO`

Single example:

```bash
mix run examples/00_smoke.exs
mix run examples/03_list_repo_issues.exs
mix run examples/07_oauth_exchange_code.exs
```

Suites:

```bash
./examples/run_all.sh smoke
./examples/run_all.sh repos
./examples/run_all.sh oauth
./examples/run_all.sh app
./examples/run_all.sh all
```

Run examples from the repo root with `mix run`, or use [`run_all.sh`](./run_all.sh).

## Inventory

- `00_smoke.exs`: `meta/root` and `rate-limit/get`
- `01_get_authenticated_user.exs`: `users/get-authenticated`
- `02_list_authenticated_repos.exs`: `repos/list-for-authenticated-user`
- `03_list_repo_issues.exs`: `issues/list-for-repo`
- `04_list_pull_requests.exs`: `pulls/list`
- `05_list_workflow_runs.exs`: `actions/list-workflow-runs-for-repo`
- `06_oauth_authorize_url.exs`: build a real GitHub OAuth URL
- `07_oauth_exchange_code.exs`: exchange a real OAuth authorization code
- `08_github_app_auth.exs`: sign a GitHub App JWT into a runtime client and exchange an installation token

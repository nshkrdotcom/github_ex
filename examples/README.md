# Live Examples

These examples are strict real-service proofs for the GitHub REST API surface
in this package.

Rules:

- no mocks
- no fake transports
- missing setup is a hard failure
- API errors are hard failures

Run examples from the repo root with `mix run`, or use [`run_all.sh`](./run_all.sh).

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

GitHub App example:

```bash
export GITHUB_APP_ID="..."
export GITHUB_APP_PRIVATE_KEY_PATH="/path/to/private-key.pem"
export GITHUB_APP_INSTALLATION_ID="..."
```

## Running

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

## Inventory

- `00_smoke.exs`: `meta/root` and `rate-limit/get`
- `01_get_authenticated_user.exs`: `users/get-authenticated`
- `02_list_authenticated_repos.exs`: `repos/list-for-authenticated-user`
- `03_list_repo_issues.exs`: `issues/list-for-repo`
- `04_list_pull_requests.exs`: `pulls/list`
- `05_list_workflow_runs.exs`: `actions/list-workflow-runs-for-repo`
- `06_oauth_authorize_url.exs`: build a real GitHub OAuth URL
- `07_oauth_exchange_code.exs`: exchange a real OAuth authorization code
- `08_github_app_auth.exs`: sign a GitHub App JWT and exchange an installation token

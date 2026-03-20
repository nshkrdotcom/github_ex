#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

SMOKE=(
  "00_smoke.exs"
  "01_get_authenticated_user.exs"
)

REPOS=(
  "02_list_authenticated_repos.exs"
  "03_list_repo_issues.exs"
  "04_list_pull_requests.exs"
  "05_list_workflow_runs.exs"
)

OAUTH=(
  "06_oauth_authorize_url.exs"
  "07_oauth_exchange_code.exs"
)

APP=(
  "08_github_app_auth.exs"
)

usage() {
  cat <<'EOF'
usage: ./examples/run_all.sh <suite>
       ./examples/run_all.sh --setup [suite]

Suites:
  smoke  Run public smoke plus the authenticated user example. Requires GITHUB_TOKEN.
  repos  Run repository, issues, pull request, and workflow examples. Requires GITHUB_TOKEN and GITHUB_EXAMPLE_* vars.
  oauth  Run OAuth onboarding examples. Requires GITHUB_OAUTH_* vars.
  app    Run the GitHub App auth example. Requires GITHUB_APP_* vars.
  all    Run every example. Requires GITHUB_TOKEN plus any suite-specific env vars.

Options:
  --setup [suite]  Show setup instructions for a suite without running examples.

Default:
  No suite argument runs `repos`.
  Run `./examples/run_all.sh all` for every example.
  Run `./examples/run_all.sh --help` for usage.

OAuth app minimum:
  Set callback URL to `http://127.0.0.1:40071/callback`.
  Device Flow is not required for this repo's OAuth examples.

GitHub App minimum:
  Most form fields can stay blank for the example path.
  What you need is App ID, a downloaded private key `.pem`, and an installation ID.
  After creating the app, click `Install App`; the installation ID is the number in `/settings/installations/<id>`.
EOF
}

require_env() {
  local name="$1"

  if [[ -z "${!name:-}" ]]; then
    return 1
  fi

  return 0
}

print_setup_summary() {
  local suite="$1"

  cat <<'EOF'
Setup summary
=============

Public smoke only:
  mix run examples/00_smoke.exs

Bundled user/repo examples:
  1. In GitHub, create a fine-grained personal access token.
  2. Use your user account as the resource owner if you want `/user` and `/user/repos`.
  3. Give it repo read permissions for the repos you want to test.
  4. Export it locally:
  export GITHUB_TOKEN="..."

Repo-targeted examples:
  1. Pick a repository you can read with that token.
  2. Fill in the owner, repo name, and an issue number from that repo:
  export GITHUB_EXAMPLE_OWNER="octocat"
  export GITHUB_EXAMPLE_REPO="Hello-World"
  export GITHUB_EXAMPLE_ISSUE_NUMBER="1"
  export GITHUB_EXAMPLE_WORKFLOW_ID="ci.yml"   # optional

OAuth examples:
  1. In GitHub, go to Settings -> Developer settings -> OAuth Apps.
  2. Create a new OAuth app.
  3. Fill the minimum fields:
     - Application name: any clear local-test name
     - Homepage URL: any valid URL you control
     - Authorization callback URL: `http://127.0.0.1:40071/callback`
     - Enable Device Flow: leave unchecked
  4. Copy the client ID and generate/copy the client secret.
  5. Export the values locally:
  export GITHUB_OAUTH_CLIENT_ID="..."
  export GITHUB_OAUTH_CLIENT_SECRET="..."
  export GITHUB_OAUTH_REDIRECT_URI="http://127.0.0.1:40071/callback"
  6. Run the interactive helper:
  mix github.oauth --save --manual --no-browser
  7. Open the printed authorize URL, approve the app, and paste back the returned code.
  8. If you want to run `examples/07_oauth_exchange_code.exs` directly, export the code too:
  export GITHUB_OAUTH_AUTH_CODE="..."

GitHub App example:
  1. In GitHub, go to Settings -> Developer settings -> GitHub Apps.
  2. Create a GitHub App.
  3. Fill only the minimum fields:
     - GitHub App name: any unique local-test name
     - Homepage URL: any valid URL you control
     - Callback URL: leave blank for this example
     - Expire user authorization tokens: leave off
     - Request user authorization during installation: leave off
     - Enable Device Flow: leave off
     - Setup URL: leave blank
     - Webhooks: leave unused unless GitHub forces a URL in the UI
     - Installation target: `Only on this account` is fine for local testing
  4. For permissions, start with `Repository metadata: Read-only`.
  5. Generate and download a private key `.pem` file.
  6. Click `Install App` in the GitHub App UI and install it on the target account or org.
  7. Copy the App ID from the app settings page.
  8. Copy the installation ID from the installation page URL. It is the number in `/settings/installations/<id>`.
  9. Export the values locally:
  export GITHUB_APP_ID="..."
  export GITHUB_APP_PRIVATE_KEY_PATH="/path/to/private-key.pem"
  export GITHUB_APP_INSTALLATION_ID="..."

Docs:
  - examples/README.md
  - guides/authentication-and-oauth.md
  - guides/github-app-authentication.md
EOF

  case "$suite" in
    smoke)
      cat <<'EOF'

Selected suite notes:
  - smoke runs 00_smoke.exs and 01_get_authenticated_user.exs
  - 00_smoke.exs is public, but the suite still requires GITHUB_TOKEN for 01_get_authenticated_user.exs
EOF
      ;;
    repos)
      cat <<'EOF'

Selected suite notes:
  - repos runs 02_list_authenticated_repos.exs through 05_list_workflow_runs.exs
  - set GITHUB_EXAMPLE_OWNER and GITHUB_EXAMPLE_REPO before running
EOF
      ;;
    oauth)
      cat <<'EOF'

Selected suite notes:
  - oauth runs 06_oauth_authorize_url.exs and 07_oauth_exchange_code.exs
  - 07 will block waiting for pasted input if GITHUB_OAUTH_AUTH_CODE is not set
EOF
      ;;
    app)
      cat <<'EOF'

Selected suite notes:
  - app runs 08_github_app_auth.exs
EOF
      ;;
    all)
      cat <<'EOF'

Selected suite notes:
  - all runs every example in order
  - if GITHUB_OAUTH_AUTH_CODE is missing, 07_oauth_exchange_code.exs would otherwise wait for pasted input
EOF
      ;;
  esac
}

append_missing() {
  local name="$1"

  if ! require_env "$name"; then
    MISSING_VARS+=("$name")
  fi
}

preflight_suite() {
  local suite="$1"
  MISSING_VARS=()

  case "$suite" in
    smoke)
      append_missing "GITHUB_TOKEN"
      ;;
  esac

  case "$suite" in
    repos|all)
      append_missing "GITHUB_TOKEN"
      append_missing "GITHUB_EXAMPLE_OWNER"
      append_missing "GITHUB_EXAMPLE_REPO"
      ;;
  esac

  case "$suite" in
    oauth|all)
      append_missing "GITHUB_OAUTH_CLIENT_ID"
      append_missing "GITHUB_OAUTH_CLIENT_SECRET"
      append_missing "GITHUB_OAUTH_REDIRECT_URI"
      append_missing "GITHUB_OAUTH_AUTH_CODE"
      ;;
  esac

  case "$suite" in
    app|all)
      append_missing "GITHUB_APP_ID"
      append_missing "GITHUB_APP_PRIVATE_KEY_PATH"
      append_missing "GITHUB_APP_INSTALLATION_ID"
      ;;
  esac

  if ((${#MISSING_VARS[@]} > 0)); then
    echo >&2
    echo "Missing required environment variables for suite '${suite}':" >&2
    printf '  - %s\n' "${MISSING_VARS[@]}" >&2
    echo >&2
    echo "Run './examples/run_all.sh --setup ${suite}' for setup instructions." >&2
    exit 1
  fi
}

run_example() {
  local script="$1"
  echo
  echo "==> ${script}"
  (
    cd "$ROOT_DIR"
    mix run "examples/${script}"
  )
}

build_suite() {
  local suite="$1"

  case "$suite" in
    smoke)
      printf '%s\n' "${SMOKE[@]}"
      ;;
    repos)
      printf '%s\n' "${REPOS[@]}"
      ;;
    oauth)
      printf '%s\n' "${OAUTH[@]}"
      ;;
    app)
      printf '%s\n' "${APP[@]}"
      ;;
    all)
      printf '%s\n' "${SMOKE[@]}" "${REPOS[@]}" "${OAUTH[@]}" "${APP[@]}"
      ;;
    *)
      echo "unknown suite: ${suite}" >&2
      usage >&2
      exit 1
      ;;
  esac
}

main() {
  local suite="${1:-repos}"
  local setup_only=0

  case "$suite" in
    -h|--help|help)
      usage
      exit 0
      ;;
    --setup)
      setup_only=1
      suite="${2:-all}"
      ;;
  esac

  mapfile -t scripts < <(build_suite "$suite")

  if [[ "$setup_only" -eq 1 ]]; then
    print_setup_summary "$suite"
    exit 0
  fi

  preflight_suite "$suite"

  echo "Running suite: ${suite}"
  echo "This run will execute: ${scripts[*]}"
  echo "Run './examples/run_all.sh all' for every example, or '--help' for usage."
  echo "Repo root: ${ROOT_DIR}"

  for script in "${scripts[@]}"; do
    run_example "$script"
  done
}

main "$@"

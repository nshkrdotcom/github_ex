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

Suites:
  smoke  Run public and authenticated smoke flows.
  repos  Run repository, issues, pull request, and workflow examples.
  oauth  Run OAuth onboarding examples.
  app    Run the GitHub App auth example.
  all    Run every example.
EOF
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
  local suite="${1:-all}"

  case "$suite" in
    -h|--help|help)
      usage
      exit 0
      ;;
  esac

  mapfile -t scripts < <(build_suite "$suite")

  echo "Running suite: ${suite}"
  echo "Repo root: ${ROOT_DIR}"

  for script in "${scripts[@]}"; do
    run_example "$script"
  done
}

main "$@"

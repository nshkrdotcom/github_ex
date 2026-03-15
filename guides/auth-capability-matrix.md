# Auth Capability Matrix

Generated from `priv/generated/auth_manifest.json` and the committed GitHub Docs auth snapshots in `priv/upstream/github_docs_auth/`.

## Token Families

| Token family | Supported operations | Notes |
|--------|--------:|--------|
| Fine-grained PAT | 855 | Structured support comes from GitHub's endpoint-availability page plus endpoint `progAccess` when present. |
| GitHub App installation token | 887 | Structured support comes from GitHub's installation-token availability page. |
| GitHub App user token | 999 | Structured support comes from GitHub's app-user-token availability page. |
| OAuth application client credentials | 5 | These are the five `/applications/{client_id}/token*` and `/grant` endpoints. |

Classic PAT and OAuth access token coverage are only lower-confidence legacy hints here. GitHub does not publish one structured classic-PAT coverage index for the full REST surface.

## Confidence Levels

- `structured`: the operation is backed by GitHub's structured availability pages, permission tables, endpoint `progAccess`, or the special OAuth-application path contract.
- `legacy_hint`: the best available signal is legacy OpenAPI prose or classic/OAuth scope hints.
- `unknown`: there is no reliable structured or legacy auth signal for that field.
- `conflict`: structured sources or legacy prose materially disagree, so the matrix preserves the disagreement instead of pretending certainty.

## Token Support Values

- `true` or `false`: derived from structured GitHub docs sources.
- `legacy_scope_hint`: only a legacy scope hint exists for that token family.
- `unknown`: no trustworthy source exists for that token family.
- `conflict`: structured sources or structured-vs-legacy sources disagree.

## Lookup

Use the generated manifest directly or ask the CLI helper for one operation at a time:

```bash
mix github.auth.lookup GET /user/repos
mix github.auth.lookup repos/list-for-authenticated-user
```

The runtime helper is `GitHubEx.AuthMatrix.lookup/1` or `GitHubEx.AuthMatrix.lookup/2`.

## Example Lookups

| Example | Operation | Fine-grained PAT | GitHub App install | GitHub App user | Notes |
|--------|--------|--------|--------|--------|--------|
| 00_smoke.exs | [GET /](https://docs.github.com/rest/meta/meta#github-api-root) | no auth required for the smoke request | supported | supported | The smoke example also calls `GET /rate_limit`, which works without auth for this path. |
| 01_get_authenticated_user.exs | [GET /user](https://docs.github.com/rest/users/users#get-the-authenticated-user) | supported with no fine-grained PAT permissions | not listed | supported | conflict |
| 02_list_authenticated_repos.exs | [GET /user/repos](https://docs.github.com/rest/repos/repos#list-repositories-for-the-authenticated-user) | Metadata: read | not listed | supported | Public-read fallback exists, but private-resource access still follows the listed permission requirements. |
| 03_list_repo_issues.exs | [GET /repos/{owner}/{repo}/issues](https://docs.github.com/rest/issues/issues#list-repository-issues) | Issues: read | supported | supported | Public-read fallback exists, but private-resource access still follows the listed permission requirements. |
| 04_list_pull_requests.exs | [GET /repos/{owner}/{repo}/pulls](https://docs.github.com/rest/pulls/pulls#list-pull-requests) | Pull requests: read | supported | supported | Public-read fallback exists, but private-resource access still follows the listed permission requirements. |
| 05_list_workflow_runs.exs | [GET /repos/{owner}/{repo}/actions/runs](https://docs.github.com/rest/actions/workflow-runs#list-workflow-runs-for-a-repository) | Actions: read | supported | supported | Public-read fallback exists, but private-resource access still follows the listed permission requirements. |

## Module Summary

| Module | Total | FG PAT | App install | App user | Conflicts |
|--------|--------:|--------:|--------:|--------:|--------:|
| Actions | 184 | 179 | 184 | 183 | 0 |
| Activity | 32 | 11 | 13 | 19 | 8 |
| Apps | 37 | 0 | 3 | 5 | 3 |
| Billing | 10 | 10 | 7 | 10 | 0 |
| Campaigns | 5 | 5 | 5 | 5 | 0 |
| Checks | 12 | 0 | 12 | 12 | 12 |
| Classroom | 6 | 0 | 0 | 6 | 6 |
| CodeScanning | 21 | 21 | 21 | 21 | 0 |
| CodeSecurity | 20 | 11 | 11 | 11 | 0 |
| CodesOfConduct | 2 | 0 | 2 | 2 | 2 |
| Codespaces | 48 | 48 | 23 | 48 | 0 |
| Copilot | 11 | 11 | 11 | 11 | 0 |
| Credentials | 1 | 0 | 1 | 1 | 1 |
| Dependabot | 22 | 21 | 21 | 21 | 0 |
| DependencyGraph | 3 | 3 | 3 | 3 | 0 |
| Emojis | 1 | 0 | 1 | 1 | 1 |
| EnterpriseTeamMemberships | 6 | 0 | 6 | 6 | 0 |
| EnterpriseTeamOrganizations | 6 | 0 | 6 | 6 | 0 |
| EnterpriseTeams | 5 | 0 | 5 | 5 | 0 |
| Gists | 20 | 9 | 0 | 20 | 11 |
| Git | 13 | 13 | 13 | 13 | 0 |
| Gitignore | 2 | 0 | 2 | 2 | 2 |
| HostedCompute | 6 | 6 | 6 | 6 | 0 |
| Interactions | 9 | 9 | 6 | 9 | 0 |
| Issues | 55 | 52 | 52 | 55 | 3 |
| Licenses | 3 | 1 | 3 | 3 | 2 |
| Markdown | 2 | 1 | 2 | 2 | 1 |
| Meta | 5 | 0 | 5 | 5 | 5 |
| Migrations | 22 | 8 | 0 | 8 | 0 |
| Oidc | 8 | 5 | 8 | 8 | 0 |
| Orgs | 108 | 93 | 102 | 108 | 7 |
| Packages | 27 | 0 | 26 | 18 | 3 |
| PrivateRegistries | 6 | 6 | 6 | 6 | 0 |
| Projects | 26 | 13 | 13 | 13 | 0 |
| Pulls | 27 | 27 | 27 | 27 | 0 |
| RateLimit | 1 | 0 | 1 | 1 | 1 |
| Reactions | 15 | 12 | 15 | 15 | 3 |
| Repos | 201 | 198 | 194 | 200 | 0 |
| Search | 7 | 1 | 7 | 7 | 6 |
| SecretScanning | 9 | 9 | 8 | 9 | 0 |
| SecurityAdvisories | 10 | 8 | 10 | 10 | 2 |
| Teams | 32 | 31 | 31 | 32 | 1 |
| Users | 47 | 33 | 15 | 46 | 13 |

## Conflict Notes

| Operation | Notes |
|--------|--------|
| [GET /events](https://docs.github.com/rest/activity/events#list-public-events) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /feeds](https://docs.github.com/rest/activity/feeds#get-feeds) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /networks/{owner}/{repo}/events](https://docs.github.com/rest/activity/events#list-public-events-for-a-network-of-repositories) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /orgs/{org}/events](https://docs.github.com/rest/activity/events#list-public-organization-events) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /users/{username}/events](https://docs.github.com/rest/activity/events#list-events-for-the-authenticated-user) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /users/{username}/events/public](https://docs.github.com/rest/activity/events#list-public-events-for-a-user) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /users/{username}/received_events](https://docs.github.com/rest/activity/events#list-events-received-by-the-authenticated-user) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /users/{username}/received_events/public](https://docs.github.com/rest/activity/events#list-public-events-received-by-a-user) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /apps/{app_slug}](https://docs.github.com/rest/apps/apps#get-an-app) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /user/marketplace_purchases](https://docs.github.com/rest/apps/marketplace#list-subscriptions-for-the-authenticated-user) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /user/marketplace_purchases/stubbed](https://docs.github.com/rest/apps/marketplace#list-subscriptions-for-the-authenticated-user-stubbed) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [POST /repos/{owner}/{repo}/check-runs](https://docs.github.com/rest/checks/runs#create-a-check-run) | Conflict: OpenAPI prose still says GitHub App only, but endpoint progAccess marks fine-grained PAT or GitHub App user-token support. Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /repos/{owner}/{repo}/check-runs/{check_run_id}](https://docs.github.com/rest/checks/runs#get-a-check-run) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [PATCH /repos/{owner}/{repo}/check-runs/{check_run_id}](https://docs.github.com/rest/checks/runs#update-a-check-run) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /repos/{owner}/{repo}/check-runs/{check_run_id}/annotations](https://docs.github.com/rest/checks/runs#list-check-run-annotations) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [POST /repos/{owner}/{repo}/check-runs/{check_run_id}/rerequest](https://docs.github.com/rest/checks/runs#rerequest-a-check-run) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [POST /repos/{owner}/{repo}/check-suites](https://docs.github.com/rest/checks/suites#create-a-check-suite) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [PATCH /repos/{owner}/{repo}/check-suites/preferences](https://docs.github.com/rest/checks/suites#update-repository-preferences-for-check-suites) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /repos/{owner}/{repo}/check-suites/{check_suite_id}](https://docs.github.com/rest/checks/suites#get-a-check-suite) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /repos/{owner}/{repo}/check-suites/{check_suite_id}/check-runs](https://docs.github.com/rest/checks/runs#list-check-runs-in-a-check-suite) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [POST /repos/{owner}/{repo}/check-suites/{check_suite_id}/rerequest](https://docs.github.com/rest/checks/suites#rerequest-a-check-suite) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /repos/{owner}/{repo}/commits/{ref}/check-runs](https://docs.github.com/rest/checks/runs#list-check-runs-for-a-git-reference) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /repos/{owner}/{repo}/commits/{ref}/check-suites](https://docs.github.com/rest/checks/suites#list-check-suites-for-a-git-reference) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /assignments/{assignment_id}](https://docs.github.com/rest/classroom/classroom#get-an-assignment) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /assignments/{assignment_id}/accepted_assignments](https://docs.github.com/rest/classroom/classroom#list-accepted-assignments-for-an-assignment) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /assignments/{assignment_id}/grades](https://docs.github.com/rest/classroom/classroom#get-assignment-grades) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /classrooms](https://docs.github.com/rest/classroom/classroom#list-classrooms) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /classrooms/{classroom_id}](https://docs.github.com/rest/classroom/classroom#get-a-classroom) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /classrooms/{classroom_id}/assignments](https://docs.github.com/rest/classroom/classroom#list-assignments-for-a-classroom) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /codes_of_conduct](https://docs.github.com/rest/codes-of-conduct/codes-of-conduct#get-all-codes-of-conduct) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /codes_of_conduct/{key}](https://docs.github.com/rest/codes-of-conduct/codes-of-conduct#get-a-code-of-conduct) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [POST /credentials/revoke](https://docs.github.com/rest/credentials/revoke#revoke-a-list-of-credentials) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /emojis](https://docs.github.com/rest/emojis/emojis#get-emojis) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /gists](https://docs.github.com/rest/gists/gists#list-gists-for-the-authenticated-user) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /gists/public](https://docs.github.com/rest/gists/gists#list-public-gists) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /gists/starred](https://docs.github.com/rest/gists/gists#list-starred-gists) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /gists/{gist_id}](https://docs.github.com/rest/gists/gists#get-a-gist) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /gists/{gist_id}/comments](https://docs.github.com/rest/gists/comments#list-gist-comments) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /gists/{gist_id}/comments/{comment_id}](https://docs.github.com/rest/gists/comments#get-a-gist-comment) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /gists/{gist_id}/commits](https://docs.github.com/rest/gists/gists#list-gist-commits) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /gists/{gist_id}/forks](https://docs.github.com/rest/gists/gists#list-gist-forks) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /gists/{gist_id}/star](https://docs.github.com/rest/gists/gists#check-if-a-gist-is-starred) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /gists/{gist_id}/{sha}](https://docs.github.com/rest/gists/gists#get-a-gist-revision) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /users/{username}/gists](https://docs.github.com/rest/gists/gists#list-gists-for-a-user) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /gitignore/templates](https://docs.github.com/rest/gitignore/gitignore#get-all-gitignore-templates) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /gitignore/templates/{name}](https://docs.github.com/rest/gitignore/gitignore#get-a-gitignore-template) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /issues](https://docs.github.com/rest/issues/issues#list-issues-assigned-to-the-authenticated-user) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /orgs/{org}/issues](https://docs.github.com/rest/issues/issues#list-organization-issues-assigned-to-the-authenticated-user) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /user/issues](https://docs.github.com/rest/issues/issues#list-user-account-issues-assigned-to-the-authenticated-user) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /licenses](https://docs.github.com/rest/licenses/licenses#get-all-commonly-used-licenses) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /licenses/{license}](https://docs.github.com/rest/licenses/licenses#get-a-license) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [POST /markdown/raw](https://docs.github.com/rest/markdown/markdown#render-a-markdown-document-in-raw-mode) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /](https://docs.github.com/rest/meta/meta#github-api-root) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /meta](https://docs.github.com/rest/meta/meta#get-apiname-meta-information) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /octocat](https://docs.github.com/rest/meta/meta#get-octocat) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /versions](https://docs.github.com/rest/meta/meta#get-all-api-versions) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /zen](https://docs.github.com/rest/meta/meta#get-the-zen-of-github) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /organizations](https://docs.github.com/rest/orgs/orgs#list-organizations) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /orgs/{org}](https://docs.github.com/rest/orgs/orgs#get-an-organization) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [POST /orgs/{org}/attestations/bulk-list](https://docs.github.com/rest/orgs/attestations#list-attestations-by-bulk-subject-digests) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /orgs/{org}/attestations/{subject_digest}](https://docs.github.com/rest/orgs/attestations#list-attestations) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /user/memberships/orgs](https://docs.github.com/rest/orgs/members#list-organization-memberships-for-the-authenticated-user) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /user/orgs](https://docs.github.com/rest/orgs/orgs#list-organizations-for-the-authenticated-user) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /users/{username}/orgs](https://docs.github.com/rest/orgs/orgs#list-organizations-for-a-user) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /orgs/{org}/docker/conflicts](https://docs.github.com/rest/packages/packages#get-list-of-conflicting-packages-during-docker-migration-for-organization) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /user/docker/conflicts](https://docs.github.com/rest/packages/packages#get-list-of-conflicting-packages-during-docker-migration-for-authenticated-user) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /users/{username}/docker/conflicts](https://docs.github.com/rest/packages/packages#get-list-of-conflicting-packages-during-docker-migration-for-user) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /rate_limit](https://docs.github.com/rest/rate-limit/rate-limit#get-rate-limit-status-for-the-authenticated-user) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [POST /repos/{owner}/{repo}/releases/{release_id}/reactions](https://docs.github.com/rest/reactions/reactions#create-reaction-for-a-release) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /repos/{owner}/{repo}/releases/{release_id}/reactions](https://docs.github.com/rest/reactions/reactions#list-reactions-for-a-release) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [DELETE /repos/{owner}/{repo}/releases/{release_id}/reactions/{reaction_id}](https://docs.github.com/rest/reactions/reactions#delete-a-release-reaction) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /search/code](https://docs.github.com/rest/search/search#search-code) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /search/commits](https://docs.github.com/rest/search/search#search-commits) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /search/issues](https://docs.github.com/rest/search/search#search-issues-and-pull-requests) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /search/repositories](https://docs.github.com/rest/search/search#search-repositories) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /search/topics](https://docs.github.com/rest/search/search#search-topics) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /search/users](https://docs.github.com/rest/search/search#search-users) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /advisories](https://docs.github.com/rest/security-advisories/global-advisories#list-global-security-advisories) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /advisories/{ghsa_id}](https://docs.github.com/rest/security-advisories/global-advisories#get-a-global-security-advisory) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /user/teams](https://docs.github.com/rest/teams/teams#list-teams-for-the-authenticated-user) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /user](https://docs.github.com/rest/users/users#get-the-authenticated-user) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /user/social_accounts](https://docs.github.com/rest/users/social-accounts#list-social-accounts-for-the-authenticated-user) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /user/{account_id}](https://docs.github.com/rest/users/users#get-a-user-using-their-id) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /users](https://docs.github.com/rest/users/users#list-users) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /users/{username}](https://docs.github.com/rest/users/users#get-a-user) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [POST /users/{username}/attestations/bulk-list](https://docs.github.com/rest/users/attestations#list-attestations-by-bulk-subject-digests) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /users/{username}/attestations/{subject_digest}](https://docs.github.com/rest/users/attestations#list-attestations) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /users/{username}/followers](https://docs.github.com/rest/users/followers#list-followers-of-a-user) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /users/{username}/following](https://docs.github.com/rest/users/followers#list-the-people-a-user-follows) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /users/{username}/following/{target_user}](https://docs.github.com/rest/users/followers#check-if-a-user-follows-another-user) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /users/{username}/gpg_keys](https://docs.github.com/rest/users/gpg-keys#list-gpg-keys-for-a-user) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /users/{username}/social_accounts](https://docs.github.com/rest/users/social-accounts#list-social-accounts-for-a-user) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |
| [GET /users/{username}/ssh_signing_keys](https://docs.github.com/rest/users/ssh-signing-keys#list-ssh-signing-keys-for-a-user) | Conflict: endpoint progAccess and the fine-grained PAT availability page disagree. |

## Machine-Readable Source

The full per-operation matrix, including source provenance and notes, is committed in `priv/generated/auth_manifest.json`.

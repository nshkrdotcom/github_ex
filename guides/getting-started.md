# Getting Started

`GitHubSDK` is a generated, runtime-thin SDK for the GitHub REST API.

The public entry points are:

- `GitHubSDK.Client.new/1`
- generated endpoint modules such as `GitHubSDK.Users`, `GitHubSDK.Repos`, `GitHubSDK.Issues`, `GitHubSDK.Pulls`, and `GitHubSDK.Actions`
- `GitHubSDK.Client.request/2` for raw requests
- `GitHubSDK.Response` and `GitHubSDK.Pagination` when you need header-aware flows

## Install

```elixir
def deps do
  [
    {:github_ex, "~> 0.1.0"}
  ]
end
```

```bash
mix deps.get
```

## Create a Client

With a token:

```elixir
client = GitHubSDK.Client.new(auth: System.fetch_env!("GITHUB_TOKEN"))
```

Without auth for public endpoints:

```elixir
client = GitHubSDK.Client.new()
```

Defaults:

- `base_url`: `https://api.github.com`
- `accept`: `application/vnd.github+json`
- `X-GitHub-Api-Version`: `2026-03-10`
- `timeout_ms`: `60000`

## First Calls

Authenticated user:

```elixir
{:ok, me} = GitHubSDK.Users.get_authenticated(client)
```

Repository issues:

```elixir
{:ok, issues} =
  GitHubSDK.Issues.list_for_repo(client, %{
    "owner" => "octocat",
    "repo" => "Hello-World",
    "state" => "open"
  })
```

Pull requests:

```elixir
{:ok, pulls} =
  GitHubSDK.Pulls.list(client, %{
    "owner" => "octocat",
    "repo" => "Hello-World"
  })
```

## Wrapped Responses

Normal generated calls return decoded JSON-shaped maps and lists. When you need
GitHub-specific response metadata such as pagination links or rate-limit
headers, ask for a wrapped response:

```elixir
{:ok, response} =
  GitHubSDK.Client.request(client, %{
    method: :get,
    path: "/user",
    opts: [response: :wrapped]
  })

response.data
response.rate_limit
response.links
```

For generated list endpoints, prefer the helper in
[Pagination and Rate Limits](pagination-and-rate-limits.md).

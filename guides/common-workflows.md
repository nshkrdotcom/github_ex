# Common Workflows

The generated surface is large, but a few namespaces cover most day-to-day
GitHub automation.

## Authenticated User

```elixir
{:ok, me} = GitHubSDK.Users.get_authenticated(client)
```

## Repositories

```elixir
{:ok, repos} =
  GitHubSDK.Repos.list_for_authenticated_user(client, %{
    "visibility" => "all",
    "sort" => "updated"
  })
```

Single repository:

```elixir
{:ok, repo} =
  GitHubSDK.Repos.get(client, %{
    "owner" => "octocat",
    "repo" => "Hello-World"
  })
```

## Issues

```elixir
{:ok, issues} =
  GitHubSDK.Issues.list_for_repo(client, %{
    "owner" => "octocat",
    "repo" => "Hello-World",
    "state" => "open"
  })
```

## Pull Requests

```elixir
{:ok, pulls} =
  GitHubSDK.Pulls.list(client, %{
    "owner" => "octocat",
    "repo" => "Hello-World"
  })
```

## Workflow Runs

```elixir
{:ok, runs} =
  GitHubSDK.Actions.list_workflow_runs_for_repo(client, %{
    "owner" => "octocat",
    "repo" => "Hello-World",
    "per_page" => 25
  })
```

## Search

Search endpoints usually return `items` arrays and benefit from
`GitHubSDK.Pagination` with `item_key: "items"`.

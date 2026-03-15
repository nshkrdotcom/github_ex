# Common Workflows

The generated surface is large, but a few namespaces cover most day-to-day
GitHub automation.

## Authenticated User

```elixir
{:ok, me} = GitHubEx.Users.get_authenticated(client)
```

## Repositories

```elixir
{:ok, repos} =
  GitHubEx.Repos.list_for_authenticated_user(client, %{
    "visibility" => "all",
    "sort" => "updated"
  })
```

Single repository:

```elixir
{:ok, repo} =
  GitHubEx.Repos.get(client, %{
    "owner" => "octocat",
    "repo" => "Hello-World"
  })
```

## Issues

```elixir
{:ok, issues} =
  GitHubEx.Issues.list_for_repo(client, %{
    "owner" => "octocat",
    "repo" => "Hello-World",
    "state" => "open"
  })
```

## Pull Requests

```elixir
{:ok, pulls} =
  GitHubEx.Pulls.list(client, %{
    "owner" => "octocat",
    "repo" => "Hello-World"
  })
```

## Workflow Runs

```elixir
{:ok, runs} =
  GitHubEx.Actions.list_workflow_runs_for_repo(client, %{
    "owner" => "octocat",
    "repo" => "Hello-World",
    "per_page" => 25
  })
```

## Search

Search endpoints usually return `items` arrays and benefit from
`GitHubEx.Pagination` with `item_key: "items"`.

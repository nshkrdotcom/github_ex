Code.require_file("support/live_example.exs", __DIR__)

alias GitHubEx.Examples.Live

client =
  if System.get_env("GITHUB_TOKEN") do
    Live.client!()
  else
    Live.public_client!()
  end

Live.banner!("List workflow runs")

params =
  %{
    "owner" => Live.owner!(),
    "repo" => Live.repo!(),
    "per_page" => 25
  }
  |> then(fn params ->
    case Live.workflow_id() do
      nil -> params
      workflow_id -> Map.put(params, "workflow_id", workflow_id)
    end
  end)
  |> Live.maybe_unauthenticated_params()

GitHubEx.Actions.list_workflow_runs_for_repo(client, params)
|> Live.ok!("GitHubEx.Actions.list_workflow_runs_for_repo/2")
|> Live.print_json!()

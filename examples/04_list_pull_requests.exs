Code.require_file("support/live_example.exs", __DIR__)

alias GitHubSDK.Examples.Live

client =
  if System.get_env("GITHUB_TOKEN") do
    Live.client!()
  else
    Live.public_client!()
  end

Live.banner!("List pull requests")

GitHubSDK.Pulls.list(client, %{
  "owner" => Live.owner!(),
  "repo" => Live.repo!(),
  "per_page" => 25,
  "state" => "open"
})
|> Live.ok!("GitHubSDK.Pulls.list/2")
|> Live.print_json!()

Code.require_file("support/live_example.exs", __DIR__)

alias GitHubEx.Examples.Live

client =
  if System.get_env("GITHUB_TOKEN") do
    Live.client!()
  else
    Live.public_client!()
  end

Live.banner!("List repository issues")

GitHubEx.Issues.list_for_repo(client, %{
  "owner" => Live.owner!(),
  "repo" => Live.repo!(),
  "per_page" => 25,
  "state" => "open"
})
|> Live.ok!("GitHubEx.Issues.list_for_repo/2")
|> Live.print_json!()

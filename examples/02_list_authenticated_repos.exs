Code.require_file("support/live_example.exs", __DIR__)

alias GitHubEx.Examples.Live

client = Live.client!()

Live.banner!("List authenticated repositories")

GitHubEx.Pagination.collect_api(
  &GitHubEx.Repos.list_for_authenticated_user/2,
  client,
  %{"per_page" => 50}
)
|> Live.ok!("GitHubEx.Pagination.collect_api/4")
|> Enum.take(10)
|> Live.print_json!()

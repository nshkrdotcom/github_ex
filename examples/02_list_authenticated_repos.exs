Code.require_file("support/live_example.exs", __DIR__)

alias GitHubSDK.Examples.Live

client = Live.client!()

Live.banner!("List authenticated repositories")

GitHubSDK.Pagination.collect_api(
  &GitHubSDK.Repos.list_for_authenticated_user/2,
  client,
  %{"per_page" => 50}
)
|> Live.ok!("GitHubSDK.Pagination.collect_api/4")
|> Enum.take(10)
|> Live.print_json!()

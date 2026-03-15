Code.require_file("support/live_example.exs", __DIR__)

alias GitHubSDK.Examples.Live

client =
  if System.get_env("GITHUB_TOKEN") do
    Live.client!()
  else
    Live.public_client!()
  end

Live.banner!("GitHubSDK smoke")

meta = GitHubSDK.Meta.root(client) |> Live.ok!("GitHubSDK.Meta.root/1")
rate_limit = GitHubSDK.RateLimit.get(client) |> Live.ok!("GitHubSDK.RateLimit.get/1")

Live.print_json!(%{meta: meta, rate_limit: rate_limit})

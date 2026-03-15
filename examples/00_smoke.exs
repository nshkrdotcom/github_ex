Code.require_file("support/live_example.exs", __DIR__)

alias GitHubEx.Examples.Live

client =
  if System.get_env("GITHUB_TOKEN") do
    Live.client!()
  else
    Live.public_client!()
  end

Live.banner!("GitHubEx smoke")

meta = GitHubEx.Meta.root(client) |> Live.ok!("GitHubEx.Meta.root/1")
rate_limit = GitHubEx.RateLimit.get(client) |> Live.ok!("GitHubEx.RateLimit.get/1")

Live.print_json!(%{meta: meta, rate_limit: rate_limit})

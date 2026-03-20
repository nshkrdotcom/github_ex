Code.require_file("support/live_example.exs", __DIR__)

alias GitHubEx.Examples.Live

client =
  if System.get_env("GITHUB_TOKEN") do
    Live.client!()
  else
    Live.public_client!()
  end

Live.banner!("GitHubEx smoke")

params = Live.maybe_unauthenticated_params()

meta = GitHubEx.Meta.root(client, params) |> Live.ok!("GitHubEx.Meta.root/2")
rate_limit = GitHubEx.RateLimit.get(client, params) |> Live.ok!("GitHubEx.RateLimit.get/2")

Live.print_json!(%{meta: meta, rate_limit: rate_limit})

Code.require_file("support/live_example.exs", __DIR__)

alias GitHubEx.Examples.Live

Live.banner!("Build GitHub OAuth authorize URL")

request = Live.oauth_authorization_request!(["read:user", "repo"])

Live.print_json!(%{
  authorize_url: request.url,
  state: request.state
})

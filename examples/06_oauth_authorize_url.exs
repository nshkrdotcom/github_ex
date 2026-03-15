Code.require_file("support/live_example.exs", __DIR__)

alias GitHubEx.Examples.Live

Live.banner!("Build GitHub OAuth authorize URL")

url = Live.oauth_authorize_url!(["read:user", "repo"])

IO.puts(url)

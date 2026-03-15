Code.require_file("support/live_example.exs", __DIR__)

alias GitHubEx.Examples.Live

client = Live.client!()

Live.banner!("Get authenticated user")

GitHubEx.Users.get_authenticated(client)
|> Live.ok!("GitHubEx.Users.get_authenticated/1")
|> Live.print_json!()

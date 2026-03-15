Code.require_file("support/live_example.exs", __DIR__)

alias GitHubSDK.Examples.Live

client = Live.client!()

Live.banner!("Get authenticated user")

GitHubSDK.Users.get_authenticated(client)
|> Live.ok!("GitHubSDK.Users.get_authenticated/1")
|> Live.print_json!()

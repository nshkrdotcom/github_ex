Code.require_file("support/live_example.exs", __DIR__)

alias GitHubEx.Examples.Live

client = Live.oauth_client!()
credentials = Live.oauth_credentials!()
code = Live.oauth_auth_code_or_prompt!()

Live.banner!("Exchange GitHub OAuth code")

GitHubEx.OAuth.exchange_code(code,
  client: client,
  client_id: credentials.client_id,
  client_secret: credentials.client_secret,
  redirect_uri: credentials.redirect_uri
)
|> Live.ok!("GitHubEx.OAuth.exchange_code/2")
|> Map.from_struct()
|> Live.print_json!()

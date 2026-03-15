Code.require_file("support/live_example.exs", __DIR__)

alias GitHubSDK.Examples.Live

app_client = Live.app_client!()

Live.banner!("GitHub App auth")

app =
  GitHubSDK.Apps.get_authenticated(app_client) |> Live.ok!("GitHubSDK.Apps.get_authenticated/1")

installation_token =
  GitHubSDK.AppAuth.installation_token(
    app_client,
    Live.app_credentials!().installation_id
  )
  |> Live.ok!("GitHubSDK.AppAuth.installation_token/3")

Live.print_json!(%{app: app, installation_token: installation_token})

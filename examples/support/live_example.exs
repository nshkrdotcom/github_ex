defmodule GitHubEx.Examples.Live do
  @moduledoc false

  alias GitHubEx.{AppAuth, Client, OAuth, OAuthTokenFile}

  def start! do
    Mix.Task.run("app.start")
  end

  def client! do
    start!()
    Client.new(auth: fetch_env!("GITHUB_TOKEN"))
  end

  def public_client! do
    start!()
    Client.new()
  end

  def oauth_client! do
    start!()
    Client.new()
  end

  def oauth_credentials! do
    %{
      client_id: fetch_env!("GITHUB_OAUTH_CLIENT_ID"),
      client_secret: fetch_env!("GITHUB_OAUTH_CLIENT_SECRET"),
      redirect_uri: fetch_env!("GITHUB_OAUTH_REDIRECT_URI")
    }
  end

  def oauth_token_path do
    OAuthTokenFile.resolve_env_or_default(get_env("GITHUB_OAUTH_TOKEN_PATH"))
  end

  def oauth_auth_code_or_prompt! do
    case get_env("GITHUB_OAUTH_AUTH_CODE") do
      value when is_binary(value) and value != "" ->
        value

      _ ->
        IO.gets("Paste the GitHub OAuth authorization code: ")
        |> to_string()
        |> String.trim()
        |> case do
          "" -> raise "no OAuth authorization code provided"
          value -> value
        end
    end
  end

  def owner! do
    fetch_env!("GITHUB_EXAMPLE_OWNER")
  end

  def repo! do
    fetch_env!("GITHUB_EXAMPLE_REPO")
  end

  def issue_number! do
    fetch_env!("GITHUB_EXAMPLE_ISSUE_NUMBER")
  end

  def workflow_id do
    get_env("GITHUB_EXAMPLE_WORKFLOW_ID")
  end

  def app_credentials! do
    %{
      app_id: fetch_env!("GITHUB_APP_ID"),
      installation_id: fetch_env!("GITHUB_APP_INSTALLATION_ID"),
      private_key_pem:
        fetch_env!("GITHUB_APP_PRIVATE_KEY_PATH")
        |> Path.expand()
        |> File.read!()
    }
  end

  def app_client! do
    %{app_id: app_id, private_key_pem: pem} = app_credentials!()
    AppAuth.app_client(app_id, pem)
  end

  def installation_client! do
    %{app_id: app_id, installation_id: installation_id, private_key_pem: pem} = app_credentials!()
    AppAuth.installation_client(app_id, pem, installation_id)
  end

  def banner!(title) do
    line = String.duplicate("=", String.length(title))
    IO.puts(line)
    IO.puts(title)
    IO.puts(line)
  end

  def ok!({:ok, value}, _label), do: value

  def ok!({:error, error}, label) do
    raise """
    #{label} failed
    #{inspect(error, pretty: true)}
    """
  end

  def ok!(other, label) do
    raise "#{label} returned an unexpected result: #{inspect(other, pretty: true)}"
  end

  def print_json!(value) do
    IO.puts(Jason.encode_to_iodata!(value, pretty: true))
  end

  def fetch_env!(name) do
    case get_env(name) do
      value when is_binary(value) and value != "" -> value
      _other -> raise "missing required environment variable #{name}"
    end
  end

  def get_env(name), do: System.get_env(name)

  def oauth_authorize_url!(scopes \\ ["read:user"]) do
    %{client_id: client_id, redirect_uri: redirect_uri} = oauth_credentials!()

    OAuth.authorize_url(
      client_id: client_id,
      redirect_uri: redirect_uri,
      scopes: scopes,
      generate_state: true
    )
    |> ok!("GitHubEx.OAuth.authorize_url/1")
  end
end

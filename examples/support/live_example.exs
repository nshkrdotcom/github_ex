defmodule GitHubEx.Examples.Live do
  @moduledoc false

  alias GitHubEx.{AppAuth, Client, OAuth, OAuthTokenFile}
  alias Pristine.Error, as: PristineError
  alias Pristine.OAuth2.Error, as: OAuth2Error
  alias Pristine.Response, as: PristineResponse

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

  def maybe_unauthenticated_params(params \\ %{}) when is_map(params) do
    if token_present?("GITHUB_TOKEN") do
      params
    else
      Map.put_new(params, "auth", false)
    end
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
      private_key_pem: read_env_file!("GITHUB_APP_PRIVATE_KEY_PATH")
    }
  end

  def app_client! do
    %{app_id: app_id, private_key_pem: pem} = app_credentials!()

    AppAuth.app_client(app_id, pem)
  rescue
    error ->
      raise """
      GitHubEx.AppAuth.app_client/3 setup failed

      Could not build a GitHub App client from GITHUB_APP_ID and GITHUB_APP_PRIVATE_KEY_PATH.
      Ensure `GITHUB_APP_PRIVATE_KEY_PATH` points to a valid GitHub App PEM private key.
      Underlying error: #{Exception.message(error)}
      """
  end

  def installation_client! do
    %{app_id: app_id, installation_id: installation_id, private_key_pem: pem} = app_credentials!()

    AppAuth.installation_client(app_id, pem, installation_id)
  rescue
    error ->
      raise """
      GitHubEx.AppAuth.installation_client/4 setup failed

      Could not build a GitHub App installation client from GITHUB_APP_ID,
      GITHUB_APP_INSTALLATION_ID, and GITHUB_APP_PRIVATE_KEY_PATH.
      Ensure the installation exists and the private key file is a valid GitHub App PEM key.
      Underlying error: #{Exception.message(error)}
      """
  end

  def banner!(title) do
    line = String.duplicate("=", String.length(title))
    IO.puts(line)
    IO.puts(title)
    IO.puts(line)
  end

  def ok!({:ok, value}, _label), do: value

  def ok!({:error, %PristineError{} = error}, label) do
    raise format_pristine_error(error, label)
  end

  def ok!({:error, %OAuth2Error{} = error}, label) do
    raise format_oauth2_error(error, label)
  end

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
    oauth_authorization_request!(scopes).url
  end

  def oauth_authorization_request!(scopes \\ ["read:user"]) do
    client_id = fetch_env!("GITHUB_OAUTH_CLIENT_ID")
    redirect_uri = fetch_env!("GITHUB_OAUTH_REDIRECT_URI")

    OAuth.authorization_request(
      client_id: client_id,
      redirect_uri: redirect_uri,
      scopes: scopes,
      generate_state: true
    )
    |> ok!("GitHubEx.OAuth.authorization_request/1")
  end

  defp format_pristine_error(
         %PristineError{response: %PristineResponse{} = response} = error,
         label
       ) do
    endpoint = response.metadata[:endpoint] || %{}
    operation_id = endpoint_field(endpoint, :id)
    auth_record = operation_id && GitHubEx.AuthMatrix.lookup(to_string(operation_id))

    docs_url =
      (auth_record && auth_record["docs_url"]) ||
        body_field(error.body || response.body, "documentation_url")

    method = endpoint_field(endpoint, :method)
    path = endpoint_field(endpoint, :path)
    github_message = body_field(error.body || response.body, "message")
    accepted_permissions = header_value(response.headers, "x-accepted-github-permissions")
    fine_grained_requirement = render_permissions(auth_record, "fine_grained_permissions")
    github_app_requirement = render_permissions(auth_record, "github_app_permissions")

    [
      "#{label} failed",
      "",
      pristine_error_summary(error),
      body_line("Status", response.status),
      endpoint_line(method, path),
      body_line("GitHub message", github_message),
      body_line("GitHub accepted permissions", accepted_permissions),
      maybe_fg_pat_line(fine_grained_requirement),
      maybe_github_app_line(github_app_requirement),
      body_line("Docs", docs_url)
    ]
    |> Enum.reject(&is_nil/1)
    |> Enum.join("\n")
  end

  defp format_pristine_error(%PristineError{} = error, label) do
    [
      "#{label} failed",
      "",
      pristine_error_summary(error),
      body_line("Status", error.status),
      body_line("GitHub message", body_field(error.body, "message") || error.message)
    ]
    |> Enum.reject(&is_nil/1)
    |> Enum.join("\n")
  end

  defp format_oauth2_error(
         %OAuth2Error{
           reason: :authorization_request_requires_explicit_values,
           provider: provider,
           message: message
         },
         label
       ) do
    [
      "#{label} failed",
      "",
      "This OAuth helper requested generated state or PKCE values while only asking for a URL.",
      "Use `GitHubEx.OAuth.authorization_request/1` so the generated `state` and `pkce_verifier` are returned with the URL.",
      body_line("Provider", provider),
      body_line("OAuth message", message)
    ]
    |> Enum.reject(&is_nil/1)
    |> Enum.join("\n")
  end

  defp format_oauth2_error(%OAuth2Error{} = error, label) do
    docs_url =
      body_field(error.body, "error_uri") ||
        body_field(error.body, "documentation_url")

    [
      "#{label} failed",
      "",
      oauth2_error_summary(error),
      body_line("Provider", error.provider),
      body_line("Reason", error.reason),
      body_line("OAuth message", error.message),
      body_line("OAuth error", body_field(error.body, "error")),
      body_line("OAuth description", body_field(error.body, "error_description")),
      body_line("Docs", docs_url)
    ]
    |> Enum.reject(&is_nil/1)
    |> Enum.join("\n")
  end

  defp endpoint_field(endpoint, key) when is_map(endpoint) do
    Map.get(endpoint, key) || Map.get(endpoint, Atom.to_string(key))
  end

  defp endpoint_line(nil, nil), do: nil

  defp endpoint_line(method, path) do
    "Endpoint: #{method |> to_string() |> String.upcase()} #{path}"
  end

  defp body_line(_label, nil), do: nil
  defp body_line(label, value), do: "#{label}: #{value}"

  defp maybe_fg_pat_line(nil), do: nil

  defp maybe_fg_pat_line(requirement) do
    "Fine-grained PAT requirement: #{requirement}"
  end

  defp maybe_github_app_line(nil), do: nil

  defp maybe_github_app_line(requirement) do
    "GitHub App requirement: #{requirement}"
  end

  defp render_permissions(nil, _key), do: nil

  defp render_permissions(record, key) when is_map(record) do
    permissions =
      record
      |> Map.get(key, [])
      |> Enum.map(fn permission ->
        access = Map.get(permission, "access")
        name = Map.get(permission, "permission")

        if is_binary(name) and is_binary(access) do
          "#{name}: #{access}"
        end
      end)
      |> Enum.reject(&is_nil/1)
      |> Enum.uniq()

    case permissions do
      [] -> nil
      list -> Enum.join(list, ", ")
    end
  end

  defp body_field(body, key) when is_map(body) do
    Map.get(body, key) || Map.get(body, String.to_atom(key))
  rescue
    ArgumentError -> Map.get(body, key)
  end

  defp body_field(_body, _key), do: nil

  defp header_value(headers, name) when is_map(headers) do
    downcased = String.downcase(name)

    headers
    |> Enum.find_value(fn {key, value} ->
      if String.downcase(to_string(key)) == downcased, do: value
    end)
  end

  defp header_value(_headers, _name), do: nil

  defp pristine_error_summary(%PristineError{type: :permission_denied}) do
    "GitHub denied this request for the current credential."
  end

  defp pristine_error_summary(%PristineError{type: :authentication}) do
    "GitHub rejected this credential."
  end

  defp pristine_error_summary(%PristineError{type: :rate_limit}) do
    "GitHub rate limited this request."
  end

  defp pristine_error_summary(%PristineError{}) do
    "GitHub returned an API error."
  end

  defp oauth2_error_summary(%OAuth2Error{reason: :token_request_failed, body: body}) do
    case body_field(body, "error") do
      value when is_binary(value) and value != "" ->
        "GitHub OAuth token exchange was rejected."

      _other ->
        "OAuth setup failed."
    end
  end

  defp oauth2_error_summary(%OAuth2Error{}) do
    "OAuth setup failed."
  end

  defp read_env_file!(name) do
    path =
      name
      |> fetch_env!()
      |> Path.expand()

    case File.read(path) do
      {:ok, contents} ->
        contents

      {:error, reason} ->
        raise """
        Could not read #{name}

        Path: #{path}
        Reason: #{inspect(reason)}
        """
    end
  end

  defp token_present?(name) do
    case get_env(name) do
      value when is_binary(value) and value != "" -> true
      _other -> false
    end
  end
end

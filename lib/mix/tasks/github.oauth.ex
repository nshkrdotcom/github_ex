defmodule Mix.Tasks.Github.Oauth do
  @moduledoc """
  Runs the interactive GitHub OAuth authorization-code flow and refreshes saved
  OAuth tokens.

      export GITHUB_OAUTH_CLIENT_ID="..."
      export GITHUB_OAUTH_CLIENT_SECRET="..."
      export GITHUB_OAUTH_REDIRECT_URI="http://127.0.0.1:40071/callback"
      mix github.oauth --save --manual --no-browser
  """

  use Mix.Task

  alias GitHubEx.OAuthTokenFile
  alias Pristine.SDK.OAuth2.Error

  @default_timeout_ms 120_000
  @interactive_switches [
    manual: :boolean,
    no_browser: :boolean,
    path: :string,
    redirect_uri: :string,
    save: :boolean,
    scope: :keep,
    timeout: :integer
  ]
  @refresh_switches [path: :string]

  @shortdoc "Complete the interactive GitHub OAuth flow"

  @impl Mix.Task
  def run(["refresh" | args]) do
    Mix.Task.run("app.start")

    {opts, _argv, invalid} = OptionParser.parse(args, strict: @refresh_switches)

    if invalid != [] do
      Mix.raise("invalid options: #{format_invalid_options(invalid)}")
    end

    refresh_saved_token(opts)
  end

  def run(args) do
    Mix.Task.run("app.start")

    {opts, _argv, invalid} = OptionParser.parse(args, strict: @interactive_switches)

    if invalid != [] do
      Mix.raise("invalid options: #{format_invalid_options(invalid)}")
    end

    client_id = fetch_env!("GITHUB_OAUTH_CLIENT_ID")
    client_secret = fetch_env!("GITHUB_OAUTH_CLIENT_SECRET")
    redirect_uri = opts[:redirect_uri] || fetch_env!("GITHUB_OAUTH_REDIRECT_URI")
    timeout_ms = opts[:timeout] || @default_timeout_ms
    open_browser? = not Keyword.get(opts, :no_browser, false)
    manual? = Keyword.get(opts, :manual, false)
    scopes = Keyword.get_values(opts, :scope)
    client = GitHubEx.Client.new()

    result =
      interactive_module().authorize(GitHubEx.OAuth.provider(),
        client_id: client_id,
        client_secret: client_secret,
        context: client.context,
        manual?: manual?,
        open_browser?: open_browser?,
        redirect_uri: redirect_uri,
        scopes: scopes,
        timeout_ms: timeout_ms
      )

    case result do
      {:ok, token} ->
        maybe_save_token(token, opts)
        print_token(token, opts)

      {:error, error} ->
        raise_oauth_error("oauth failed", error)
    end
  end

  defp refresh_saved_token(opts) do
    client_id = fetch_env!("GITHUB_OAUTH_CLIENT_ID")
    client_secret = fetch_env!("GITHUB_OAUTH_CLIENT_SECRET")
    path = save_path(opts)
    client = GitHubEx.Client.new()

    case saved_token_module().refresh(GitHubEx.OAuth.provider(),
           oauth2_module: oauth2_module(),
           client_id: client_id,
           client_secret: client_secret,
           context: client.context,
           token_source: {token_source_module(), path: path}
         ) do
      {:ok, refreshed_token} ->
        Mix.shell().info("Updated token file: #{path}")
        print_token(refreshed_token, save: true, path: path)

      :error ->
        Mix.raise("saved oauth token file not found at #{path}")

      {:error, :missing_refresh_token} ->
        Mix.raise("#{path} does not contain a refresh token")

      {:error, {:token_refresh_persist_failed, reason}} ->
        Mix.raise("failed to save oauth token to #{path}: #{format_save_error(reason)}")

      {:error, {:token_file_read_failed, _} = reason} ->
        Mix.raise("failed to load oauth token from #{path}: #{format_save_error(reason)}")

      {:error, {:invalid_token_json, _} = reason} ->
        Mix.raise("failed to load oauth token from #{path}: #{format_save_error(reason)}")

      {:error, {:invalid_token_data, _} = reason} ->
        Mix.raise("failed to load oauth token from #{path}: #{format_save_error(reason)}")

      {:error, error} ->
        raise_oauth_error("token refresh failed", error)
    end
  end

  defp interactive_module do
    Application.get_env(
      :github_ex,
      :oauth_interactive_module,
      Module.concat([Pristine, OAuth2, Interactive])
    )
  end

  defp oauth2_module do
    Application.get_env(:github_ex, :oauth2_module, Module.concat([Pristine, SDK, OAuth2]))
  end

  defp saved_token_module do
    Module.concat([Pristine, OAuth2, SavedToken])
  end

  defp fetch_env!(name) do
    case System.get_env(name) do
      value when is_binary(value) and value != "" -> value
      _other -> Mix.raise("missing required environment variable #{name}")
    end
  end

  defp print_token(token, opts) do
    shell = Mix.shell()

    shell.info("Access token:")
    shell.info(Map.get(token, :access_token) || "")

    refresh_token = Map.get(token, :refresh_token)

    if is_binary(refresh_token) and refresh_token != "" do
      shell.info("Refresh token:")
      shell.info(refresh_token)
    end

    shell.info("Export commands:")
    shell.info(~s(export GITHUB_OAUTH_ACCESS_TOKEN="#{Map.get(token, :access_token) || ""}"))

    if is_binary(refresh_token) and refresh_token != "" do
      shell.info(~s(export GITHUB_OAUTH_REFRESH_TOKEN="#{refresh_token}"))
    end

    if save_enabled?(opts) do
      shell.info(~s(export GITHUB_OAUTH_TOKEN_PATH="#{save_path(opts)}"))
    end
  end

  defp format_invalid_options(invalid) do
    Enum.map_join(invalid, ", ", fn {key, value} -> "#{key}=#{value}" end)
  end

  @spec raise_oauth_error(String.t(), term()) :: no_return()
  defp raise_oauth_error(prefix, error) do
    if oauth_error?(error) do
      Mix.raise(Exception.message(error))
    else
      Mix.raise("#{prefix}: #{inspect(error)}")
    end
  end

  defp maybe_save_token(token, opts) do
    if save_enabled?(opts) do
      path = save_path(opts)

      case saved_token_module().save(
             token,
             {token_source_module(), [path: path, create_dirs?: true]}
           ) do
        :ok ->
          Mix.shell().info("Saved token file: #{path}")

        {:error, reason} ->
          Mix.raise("failed to save oauth token to #{path}: #{format_save_error(reason)}")
      end
    end
  end

  defp save_enabled?(opts), do: Keyword.get(opts, :save, false)

  defp save_path(opts) do
    opts
    |> Keyword.get(:path, default_save_path())
    |> Path.expand()
  end

  defp default_save_path do
    OAuthTokenFile.default_path()
  end

  defp oauth_error?(%{__struct__: module}), do: module == oauth_error_module()
  defp oauth_error?(_error), do: false

  defp oauth_error_module do
    Error.new(:oauth2_unavailable).__struct__
  end

  defp token_source_module do
    Module.concat([Pristine, Adapters, TokenSource, File])
  end

  defp format_save_error({kind, %_{} = error}), do: "#{kind}: #{Exception.message(error)}"
  defp format_save_error({kind, reason}), do: "#{kind}: #{inspect(reason)}"
  defp format_save_error(reason), do: inspect(reason)
end

defmodule GitHubSDK.OAuthTokenFile do
  @moduledoc """
  Helpers for the saved GitHub OAuth token file used by `mix github.oauth`.

  The default path follows the XDG config convention:

      $XDG_CONFIG_HOME/github_sdk/oauth/github.json

  When `XDG_CONFIG_HOME` is unset, it falls back to:

      ~/.config/github_sdk/oauth/github.json
  """

  @spec default_path() :: String.t()
  def default_path do
    config_root =
      case System.get_env("XDG_CONFIG_HOME") do
        value when is_binary(value) and value != "" -> value
        _other -> Path.join(System.user_home!(), ".config")
      end

    Path.join([config_root, "github_sdk", "oauth", "github.json"])
  end

  @spec resolve_env_or_default(String.t() | nil) :: String.t()
  def resolve_env_or_default(path \\ System.get_env("GITHUB_OAUTH_TOKEN_PATH")) do
    case path do
      value when is_binary(value) and value != "" -> Path.expand(value)
      _other -> default_path()
    end
  end
end

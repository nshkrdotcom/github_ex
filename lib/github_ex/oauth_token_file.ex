defmodule GitHubEx.OAuthTokenFile do
  @moduledoc """
  Helpers for the saved GitHub OAuth token file used by `mix github.oauth`.

  The default path follows the configured OAuth config home when one is set
  under `:github_ex, :oauth_config_home`; otherwise it falls back to:

      ~/.config/github_ex/oauth/github.json
  """

  @spec default_path(String.t() | nil) :: String.t()
  def default_path(config_home \\ nil) do
    config_root =
      case config_home || Application.get_env(:github_ex, :oauth_config_home) do
        value when is_binary(value) and value != "" -> value
        _other -> Path.join(System.user_home!(), ".config")
      end

    Path.join([config_root, "github_ex", "oauth", "github.json"])
  end

  @spec resolve_env_or_default(String.t() | nil) :: String.t()
  def resolve_env_or_default(path \\ nil) do
    case path do
      value when is_binary(value) and value != "" -> Path.expand(value)
      _other -> default_path()
    end
  end
end

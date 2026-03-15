defmodule GitHubEx.Auth do
  @moduledoc """
  Small helpers for building auth adapter tuples accepted by `GitHubEx.Client`.
  """

  alias Pristine.Adapters.Auth.{Basic, Bearer, OAuth2}

  @spec bearer(String.t()) :: {module(), keyword()}
  def bearer(token) when is_binary(token), do: Bearer.new(token)

  @spec token(String.t()) :: {module(), keyword()}
  def token(token) when is_binary(token), do: bearer(token)

  @spec basic(String.t(), String.t()) :: {module(), keyword()}
  def basic(username, password) when is_binary(username) and is_binary(password) do
    Basic.new(username, password)
  end

  @spec oauth2(keyword()) :: {module(), keyword()}
  def oauth2(opts) when is_list(opts), do: OAuth2.new(opts)
end

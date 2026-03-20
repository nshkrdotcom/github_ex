defmodule GitHubEx.Generated.Client do
  @moduledoc """
  Generated Github Ex client facade over `Pristine.Client`.
  """

  @spec new(keyword()) :: Pristine.Client.t()
  def new(opts \\ []) when is_list(opts) do
    base_url = Keyword.get(opts, :base_url, "https://api.github.com")
    timeout_ms = Keyword.get(opts, :timeout_ms, 60_000)

    default_headers =
      opts
      |> Keyword.get(:default_headers, %{})
      |> Enum.into(%{
        "Accept" => "application/vnd.github+json",
        "X-GitHub-Api-Version" => "2026-03-10",
        "user-agent" => "github-ex-elixir"
      })

    default_auth = Keyword.get(opts, :default_auth, [])

    Pristine.Client.new(
      base_url: base_url,
      default_headers: default_headers,
      default_auth: default_auth,
      timeout_ms: timeout_ms
    )
  end
end

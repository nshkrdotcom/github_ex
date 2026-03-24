defmodule GitHubEx.Generated.Client do
  @moduledoc """
  Generated Github Ex client facade over `GitHubEx.Client`.
  """

  @spec new(keyword()) :: GitHubEx.Client.t()
  def new(opts \\ []) when is_list(opts) do
    GitHubEx.Client.new(opts)
  end
end

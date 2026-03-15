defmodule GitHubEx.Application do
  @moduledoc false
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Finch, name: GitHubEx.Finch, pools: finch_pools()}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: GitHubEx.Supervisor)
  end

  defp finch_pools do
    %{
      "https://api.github.com" => [
        size: 10,
        count: 1,
        conn_opts: [transport_opts: [timeout: 60_000]]
      ],
      "https://github.com" => [
        size: 4,
        count: 1,
        conn_opts: [transport_opts: [timeout: 60_000]]
      ]
    }
  end
end

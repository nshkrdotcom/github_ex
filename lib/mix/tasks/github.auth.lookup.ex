defmodule Mix.Tasks.Github.Auth.Lookup do
  @moduledoc """
  Look up generated auth matrix data for one GitHub REST operation.
  """

  use Mix.Task

  @shortdoc "Look up auth support and permissions for a GitHub REST operation"

  @impl Mix.Task
  def run(args) do
    Mix.Task.run("app.start")

    lookup =
      case args do
        [method, path] ->
          GitHubEx.AuthMatrix.lookup(method, path)

        [operation_id] ->
          GitHubEx.AuthMatrix.lookup(operation_id)

        _other ->
          Mix.raise(
            "usage: mix github.auth.lookup GET /path OR mix github.auth.lookup operation-id"
          )
      end

    case lookup do
      nil ->
        Mix.raise("no auth matrix entry found for #{Enum.join(args, " ")}")

      operation ->
        Mix.shell().info(Jason.encode!(operation, pretty: true))
    end
  end
end

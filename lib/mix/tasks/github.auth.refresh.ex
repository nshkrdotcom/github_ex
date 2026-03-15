defmodule Mix.Tasks.Github.Auth.Refresh do
  @moduledoc """
  Refresh the committed GitHub Docs auth snapshots and regenerate the auth matrix.
  """

  use Mix.Task

  @switches [no_generate: :boolean]
  @shortdoc "Refresh GitHub Docs auth snapshots and optionally regenerate the auth matrix"

  @impl Mix.Task
  def run(args) do
    Mix.Task.run("app.start")

    {opts, _argv, invalid} = OptionParser.parse(args, strict: @switches)

    if invalid != [] do
      Mix.raise("invalid options: #{inspect(invalid)}")
    end

    metadata = GitHubEx.AuthSources.refresh!()

    if not Keyword.get(opts, :no_generate, false) do
      GitHubEx.Codegen.generate!()
    end

    Mix.shell().info("Refreshed GitHub Docs auth snapshots at #{metadata.metadata.captured_at}")
  end
end

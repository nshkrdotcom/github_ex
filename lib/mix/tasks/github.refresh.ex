defmodule Mix.Tasks.Github.Refresh do
  @moduledoc """
  Download the pinned upstream GitHub REST OpenAPI description and regenerate
  the SDK surface.
  """

  use Mix.Task

  @switches [no_generate: :boolean, spec_url: :string, spec_path: :string]
  @shortdoc "Refresh the committed GitHub REST spec and regenerate the SDK"

  @impl Mix.Task
  def run(args) do
    Mix.Task.run("app.start")

    {opts, _argv, invalid} = OptionParser.parse(args, strict: @switches)

    if invalid != [] do
      Mix.raise("invalid options: #{inspect(invalid)}")
    end

    metadata =
      GitHubEx.Refresh.run!(
        generate?: not Keyword.get(opts, :no_generate, false),
        spec_path: opts[:spec_path],
        spec_url: opts[:spec_url]
      )

    Mix.shell().info(
      "Refreshed GitHub REST spec: #{metadata["spec_filename"] || metadata[:spec_filename]}"
    )
  end
end

defmodule Mix.Tasks.Github.Generate do
  @moduledoc """
  Regenerate the GitHub REST SDK modules from the committed OpenAPI document.
  """

  use Mix.Task

  @shortdoc "Generate GitHubSDK from the committed GitHub REST OpenAPI spec"

  @impl Mix.Task
  def run(_args) do
    Mix.Task.run("app.start")
    GitHubSDK.Codegen.generate!()
    Mix.shell().info("Generated GitHubSDK from priv/upstream/openapi")
  end
end

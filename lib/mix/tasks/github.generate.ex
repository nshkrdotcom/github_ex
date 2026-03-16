defmodule Mix.Tasks.Github.Generate do
  @moduledoc """
  Regenerate the GitHub REST SDK modules from the committed OpenAPI document.
  """

  use Mix.Task

  @shortdoc "Generate GitHubEx from the committed GitHub REST OpenAPI spec"

  @impl Mix.Task
  def run(_args) do
    Mix.Task.run("app.start")
    run_codegen!()
    Mix.shell().info("Generated GitHubEx from priv/upstream/openapi")
  end

  defp run_codegen! do
    codegen_module = Module.concat(GitHubEx, Codegen)

    if Code.ensure_loaded?(codegen_module) and function_exported?(codegen_module, :generate!, 0) do
      apply(codegen_module, :generate!, [])
    else
      Mix.raise("GitHubEx.Codegen.generate!/0 is unavailable in this build")
    end
  end
end

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

    metadata = refresh_auth_sources!()

    if not Keyword.get(opts, :no_generate, false) do
      run_codegen!()
    end

    Mix.shell().info("Refreshed GitHub Docs auth snapshots at #{metadata.metadata.captured_at}")
  end

  defp refresh_auth_sources! do
    auth_sources_module = Module.concat(GitHubEx, AuthSources)

    if Code.ensure_loaded?(auth_sources_module) and
         function_exported?(auth_sources_module, :refresh!, 0) do
      :erlang.apply(auth_sources_module, :refresh!, [])
    else
      Mix.raise("GitHubEx.AuthSources.refresh!/0 is unavailable in this build")
    end
  end

  defp run_codegen! do
    codegen_module = Module.concat(GitHubEx, Codegen)

    if Code.ensure_loaded?(codegen_module) and function_exported?(codegen_module, :generate!, 0) do
      :erlang.apply(codegen_module, :generate!, [])
    else
      Mix.raise("GitHubEx.Codegen.generate!/0 is unavailable in this build")
    end
  end
end

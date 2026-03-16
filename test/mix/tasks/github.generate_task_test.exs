defmodule Mix.Tasks.Github.GenerateTaskTest do
  use ExUnit.Case, async: false

  alias GitHubEx.TestSupport.ModuleTools
  alias Mix.Tasks.Github.Generate, as: GenerateTask

  setup do
    previous_shell = Mix.shell()
    Mix.shell(Mix.Shell.Process)
    Mix.Task.reenable("github.generate")
    Process.put(:github_generate_task_test_pid, self())

    on_exit(fn ->
      Process.delete(:github_generate_task_test_pid)
      Mix.shell(previous_shell)
    end)

    :ok
  end

  test "delegates generation to GitHubEx.Codegen when available" do
    restore_codegen =
      ModuleTools.replace!(
        GitHubEx.Codegen,
        """
        defmodule GitHubEx.Codegen do
          def generate!() do
            send(Process.get(:github_generate_task_test_pid), :codegen_generate)
            :ok
          end
        end
        """
      )

    on_exit(restore_codegen)

    GenerateTask.run([])

    assert_receive :codegen_generate
    assert_receive {:mix_shell, :info, ["Generated GitHubEx from priv/upstream/openapi"]}
  end

  test "raises a clear error when GitHubEx.Codegen is unavailable" do
    restore_codegen =
      ModuleTools.replace!(
        GitHubEx.Codegen,
        """
        defmodule GitHubEx.Codegen do
        end
        """
      )

    on_exit(restore_codegen)

    assert_raise Mix.Error,
                 ~r/GitHubEx\.Codegen\.generate!\/0 is unavailable in this build/,
                 fn ->
                   GenerateTask.run([])
                 end
  end
end

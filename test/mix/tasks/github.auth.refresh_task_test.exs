defmodule Mix.Tasks.Github.Auth.RefreshTaskTest do
  use ExUnit.Case, async: false

  alias GitHubEx.TestSupport.ModuleTools
  alias Mix.Tasks.Github.Auth.Refresh, as: AuthRefreshTask

  setup do
    previous_shell = Mix.shell()
    Mix.shell(Mix.Shell.Process)
    Mix.Task.reenable("github.auth.refresh")
    Process.put(:github_auth_refresh_task_test_pid, self())

    on_exit(fn ->
      Process.delete(:github_auth_refresh_task_test_pid)
      Mix.shell(previous_shell)
    end)

    :ok
  end

  test "refreshes auth sources and regenerates when both modules are available" do
    restore_auth_sources =
      ModuleTools.replace!(
        GitHubEx.AuthSources,
        """
        defmodule GitHubEx.AuthSources do
          def refresh!() do
            send(Process.get(:github_auth_refresh_task_test_pid), :auth_sources_refresh)
            %{metadata: %{captured_at: "2026-03-15T00:00:00Z"}}
          end
        end
        """
      )

    restore_codegen =
      ModuleTools.replace!(
        GitHubEx.Codegen,
        """
        defmodule GitHubEx.Codegen do
          def generate!() do
            send(Process.get(:github_auth_refresh_task_test_pid), :codegen_generate)
            :ok
          end
        end
        """
      )

    on_exit(restore_auth_sources)
    on_exit(restore_codegen)

    AuthRefreshTask.run([])

    assert_receive :auth_sources_refresh
    assert_receive :codegen_generate

    assert_receive {:mix_shell, :info,
                    ["Refreshed GitHub Docs auth snapshots at 2026-03-15T00:00:00Z"]}
  end

  test "skips code generation when --no-generate is passed" do
    restore_auth_sources =
      ModuleTools.replace!(
        GitHubEx.AuthSources,
        """
        defmodule GitHubEx.AuthSources do
          def refresh!() do
            send(Process.get(:github_auth_refresh_task_test_pid), :auth_sources_refresh)
            %{metadata: %{captured_at: "2026-03-15T00:00:00Z"}}
          end
        end
        """
      )

    restore_codegen =
      ModuleTools.replace!(
        GitHubEx.Codegen,
        """
        defmodule GitHubEx.Codegen do
          def generate!() do
            send(Process.get(:github_auth_refresh_task_test_pid), :codegen_generate)
            :ok
          end
        end
        """
      )

    on_exit(restore_auth_sources)
    on_exit(restore_codegen)

    AuthRefreshTask.run(["--no-generate"])

    assert_receive :auth_sources_refresh
    refute_receive :codegen_generate
  end

  test "raises a clear error when GitHubEx.AuthSources is unavailable" do
    restore_auth_sources =
      ModuleTools.replace!(
        GitHubEx.AuthSources,
        """
        defmodule GitHubEx.AuthSources do
        end
        """
      )

    on_exit(restore_auth_sources)

    assert_raise Mix.Error,
                 ~r/GitHubEx\.AuthSources\.refresh!\/0 is unavailable in this build/,
                 fn ->
                   AuthRefreshTask.run([])
                 end
  end

  test "raises a clear error when GitHubEx.Codegen is unavailable" do
    restore_auth_sources =
      ModuleTools.replace!(
        GitHubEx.AuthSources,
        """
        defmodule GitHubEx.AuthSources do
          def refresh!(), do: %{metadata: %{captured_at: "2026-03-15T00:00:00Z"}}
        end
        """
      )

    restore_codegen =
      ModuleTools.replace!(
        GitHubEx.Codegen,
        """
        defmodule GitHubEx.Codegen do
        end
        """
      )

    on_exit(restore_auth_sources)
    on_exit(restore_codegen)

    assert_raise Mix.Error,
                 ~r/GitHubEx\.Codegen\.generate!\/0 is unavailable in this build/,
                 fn ->
                   AuthRefreshTask.run([])
                 end
  end
end

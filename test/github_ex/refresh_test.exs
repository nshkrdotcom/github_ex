defmodule GitHubEx.RefreshTest do
  use ExUnit.Case, async: false

  alias GitHubEx.TestSupport.ModuleTools

  @moduletag :tmp_dir

  @versions_url "https://api.github.com/versions"

  setup do
    Process.put(:github_refresh_test_pid, self())

    on_exit(fn ->
      Process.delete(:github_refresh_test_pid)
    end)

    :ok
  end

  test "run! fetches snapshots, writes metadata, and delegates to codegen", %{tmp_dir: tmp_dir} do
    spec_url = "https://example.test/api.github.com.json"
    paths = GitHubEx.Refresh.paths(project_root: tmp_dir, spec_url: spec_url)
    codegen_spec_path = paths.codegen_spec_path

    stub_finch_response(spec_url, %{
      "info" => %{"description" => "remove me", "title" => "GitHub API"},
      "paths" => %{
        "/user" => %{
          "get" => %{
            "responses" => %{
              "200" => %{"description" => "also removed"}
            }
          }
        }
      }
    })

    stub_finch_response(@versions_url, [%{"version" => "2026-03-10"}])

    restore_finch =
      ModuleTools.replace!(
        Finch,
        """
        defmodule Finch do
          def build(method, url), do: {method, url}

          def request({method, url}, _name) do
            send(Process.get(:github_refresh_test_pid), {:finch_request, method, url})

            Process.get({:github_refresh_response, url}) ||
              {:error, {:unexpected_url, url}}
          end
        end
        """
      )

    restore_codegen =
      ModuleTools.replace!(
        GitHubEx.Codegen,
        """
        defmodule GitHubEx.Codegen do
          def generate!(opts) do
            send(Process.get(:github_refresh_test_pid), {:codegen_generate, opts})
            :ok
          end
        end
        """
      )

    on_exit(restore_finch)
    on_exit(restore_codegen)

    metadata = GitHubEx.Refresh.run!(project_root: tmp_dir, spec_url: spec_url)

    assert_receive {:finch_request, :get, ^spec_url}
    assert_receive {:finch_request, :get, @versions_url}

    assert_receive {:codegen_generate, [project_root: ^tmp_dir, spec_path: ^codegen_spec_path]}

    assert metadata.spec_url == spec_url
    assert metadata.spec_filename == "api.github.com.2026-03-10.json"
    assert metadata.codegen_spec_filename == "api.github.com.2026-03-10.codegen.json"
    assert metadata.versions == [%{"version" => "2026-03-10"}]

    assert File.exists?(paths.spec_path)
    assert File.exists?(paths.codegen_spec_path)
    assert File.exists?(paths.metadata_path)

    codegen_spec = Jason.decode!(File.read!(paths.codegen_spec_path))
    refute get_in(codegen_spec, ["info", "description"])
    refute get_in(codegen_spec, ["paths", "/user", "get", "responses", "200", "description"])

    metadata_file = Jason.decode!(File.read!(paths.metadata_path))
    assert metadata_file["spec_url"] == spec_url
    assert metadata_file["versions"] == [%{"version" => "2026-03-10"}]
  end

  test "run! raises a clear error when GitHubEx.Codegen is unavailable", %{tmp_dir: tmp_dir} do
    spec_url = "https://example.test/api.github.com.json"

    stub_finch_response(spec_url, %{"paths" => %{}})
    stub_finch_response(@versions_url, [%{"version" => "2026-03-10"}])

    restore_finch =
      ModuleTools.replace!(
        Finch,
        """
        defmodule Finch do
          def build(method, url), do: {method, url}

          def request({_method, url}, _name) do
            Process.get({:github_refresh_response, url}) ||
              {:error, {:unexpected_url, url}}
          end
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

    on_exit(restore_finch)
    on_exit(restore_codegen)

    assert_raise RuntimeError,
                 ~r/GitHubEx\.Codegen\.generate!\/1 is unavailable in this build/,
                 fn ->
                   GitHubEx.Refresh.run!(project_root: tmp_dir, spec_url: spec_url)
                 end
  end

  defp stub_finch_response(url, payload) do
    Process.put(
      {:github_refresh_response, url},
      {:ok, %{__struct__: Finch.Response, status: 200, body: Jason.encode!(payload)}}
    )
  end
end

defmodule GitHubEx.ExamplesAuthRequirementsTest do
  use ExUnit.Case, async: true

  test "bundled example endpoints resolve to the expected fine-grained requirements" do
    get_authenticated = GitHubEx.AuthMatrix.lookup("GET", "/user")
    list_repos = GitHubEx.AuthMatrix.lookup("GET", "/user/repos")
    list_issues = GitHubEx.AuthMatrix.lookup("GET", "/repos/{owner}/{repo}/issues")
    list_pulls = GitHubEx.AuthMatrix.lookup("GET", "/repos/{owner}/{repo}/pulls")
    list_runs = GitHubEx.AuthMatrix.lookup("GET", "/repos/{owner}/{repo}/actions/runs")

    assert get_authenticated["fine_grained_permissions"] == []

    assert Enum.any?(
             get_authenticated["notes"],
             &String.contains?(&1, "no explicit fine-grained PAT permission")
           )

    assert permission_names(list_repos) == [{"Metadata", "read"}]
    assert permission_names(list_issues) == [{"Issues", "read"}]
    assert permission_names(list_pulls) == [{"Pull requests", "read"}]
    assert permission_names(list_runs) == [{"Actions", "read"}]
  end

  defp permission_names(operation) do
    operation["fine_grained_permissions"]
    |> Enum.map(&{&1["permission"], &1["access"]})
  end
end

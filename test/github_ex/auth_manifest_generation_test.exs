defmodule GitHubEx.AuthManifestGenerationTest do
  use ExUnit.Case, async: true

  alias GitHubEx.AuthParser

  @auth_manifest_path Path.expand("../../priv/generated/auth_manifest.json", __DIR__)
  @provider_ir_path Path.expand("../../priv/generated/provider_ir.json", __DIR__)
  @auth_sources_dir Path.expand("../../priv/upstream/github_docs_auth", __DIR__)

  test "auth manifest covers every generated operation exactly once" do
    auth_manifest = load_json(@auth_manifest_path)
    provider_ir = load_json(@provider_ir_path)

    assert auth_manifest["summary"]["operation_count"] == 1093
    assert length(auth_manifest["operations"]) == 1093

    assert Enum.map(auth_manifest["operations"], & &1["operation_id"]) |> Enum.sort() ==
             Enum.map(provider_ir["operations"], & &1["id"]) |> Enum.sort()
  end

  test "structured support counts match the pinned GitHub docs indexes" do
    auth_manifest = load_json(@auth_manifest_path)

    assert auth_manifest["summary"]["token_support_counts"] == %{
             "fine_grained_pat" => 855,
             "github_app_installation" => 887,
             "github_app_user" => 999,
             "oauth_application" => 5
           }
  end

  test "auth manifest omits volatile generation timestamps" do
    auth_manifest = load_json(@auth_manifest_path)

    refute Map.has_key?(auth_manifest, "generated_at")
    assert auth_manifest["spec_version"] == "2026-03-10"
  end

  test "all operations listed by GitHub's endpoint support pages exist in the SDK manifest" do
    generated_keys =
      @provider_ir_path
      |> load_json()
      |> Map.fetch!("operations")
      |> Enum.map(fn operation ->
        "#{String.upcase(operation["method"])} #{operation["path_template"]}"
      end)
      |> MapSet.new()

    for source_filename <- [
          "endpoints_fg_pat.md",
          "endpoints_github_app_installation.md",
          "endpoints_github_app_user.md"
        ] do
      keys =
        @auth_sources_dir
        |> Path.join(source_filename)
        |> File.read!()
        |> AuthParser.parse_endpoint_availability()
        |> Map.keys()
        |> MapSet.new()

      assert MapSet.difference(keys, generated_keys) == MapSet.new()
    end
  end

  test "oauth application endpoints are marked as special auth" do
    auth_manifest = load_json(@auth_manifest_path)

    oauth_application_ids =
      auth_manifest["operations"]
      |> Enum.filter(&get_in(&1, ["special_auth", "oauth_application"]))
      |> Enum.map(& &1["operation_id"])
      |> Enum.sort()

    assert oauth_application_ids == [
             "apps/check-token",
             "apps/delete-authorization",
             "apps/delete-token",
             "apps/reset-token",
             "apps/scope-token"
           ]
  end

  test "the check run conflict is preserved instead of erased" do
    auth_manifest = load_json(@auth_manifest_path)

    check_run =
      Enum.find(auth_manifest["operations"], &(&1["operation_id"] == "checks/create"))

    assert check_run["source_confidence"] == "conflict"
    assert get_in(check_run, ["token_support", "fine_grained_pat"]) == "conflict"

    assert check_run["fine_grained_permissions"] == [
             %{
               "access" => "write",
               "additional_permissions" => false,
               "permission" => "Checks",
               "scope_type" => "repository"
             }
           ]

    assert Enum.any?(
             check_run["notes"],
             &String.contains?(&1, "OpenAPI prose still says GitHub App only")
           )
  end

  defp load_json(path) do
    path
    |> File.read!()
    |> Jason.decode!()
  end
end

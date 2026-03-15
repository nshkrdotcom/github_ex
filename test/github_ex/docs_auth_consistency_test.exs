defmodule GitHubEx.DocsAuthConsistencyTest do
  use ExUnit.Case, async: true

  @readme_path Path.expand("../../README.md", __DIR__)
  @auth_guide_path Path.expand("../../guides/authentication-and-oauth.md", __DIR__)
  @app_guide_path Path.expand("../../guides/github-app-authentication.md", __DIR__)
  @getting_started_path Path.expand("../../guides/getting-started.md", __DIR__)
  @auth_matrix_path Path.expand("../../guides/auth-capability-matrix.md", __DIR__)
  @examples_readme_path Path.expand("../../examples/README.md", __DIR__)

  test "entry-point docs link to the auth guide and auth matrix" do
    readme = File.read!(@readme_path)
    auth_guide = File.read!(@auth_guide_path)
    app_guide = File.read!(@app_guide_path)
    getting_started = File.read!(@getting_started_path)
    examples_readme = File.read!(@examples_readme_path)

    assert readme =~ "(guides/authentication-and-oauth.md)"
    assert readme =~ "(guides/auth-capability-matrix.md)"
    assert readme =~ "(examples/README.md)"

    assert examples_readme =~ "(../guides/authentication-and-oauth.md)"
    assert examples_readme =~ "(../guides/auth-capability-matrix.md)"

    assert auth_guide =~ "(auth-capability-matrix.md)"
    assert auth_guide =~ "(../examples/README.md)"

    assert app_guide =~ "(auth-capability-matrix.md)"

    assert getting_started =~ "(authentication-and-oauth.md)"
    assert getting_started =~ "(auth-capability-matrix.md)"
  end

  test "docs pin the corrected bundled-example permissions" do
    readme = File.read!(@readme_path)
    auth_guide = File.read!(@auth_guide_path)
    examples_readme = File.read!(@examples_readme_path)

    for document <- [readme, auth_guide, examples_readme] do
      assert document =~ "Metadata: read"
      assert document =~ "Issues: read"
      assert document =~ "Pull requests: read"
      assert document =~ "Actions: read"
    end

    assert readme =~ "GET /user` currently needs no fine-grained PAT permissions"
    assert auth_guide =~ "GET /user` currently requires no fine-grained PAT permissions"
    assert examples_readme =~ "GET /user` | none"

    assert readme =~ "`Contents: read` is not required"
    assert auth_guide =~ "`Contents: read` is not required"
    assert examples_readme =~ "`Contents: read` is not required"

    refute readme =~ "`Profile: read`"
    refute auth_guide =~ "`Profile: read`"
    refute examples_readme =~ "`Profile: read`"
  end

  test "auth guide explains the conditional fine-grained PAT UI and classic pat fallback" do
    auth_guide = File.read!(@auth_guide_path)

    assert auth_guide =~
             "account permissions only appear when the current user is the resource owner"

    assert auth_guide =~
             "organization permissions only appear when the resource owner is an organization"

    assert auth_guide =~
             "repository permissions appear for both user-owned and organization-owned repositories"

    assert auth_guide =~ "pending"
    assert auth_guide =~ "Classic PAT is often the simpler choice"
    assert auth_guide =~ "browser approval screen and callback code"
    assert auth_guide =~ "enterprise-object access"
  end

  test "github app guide distinguishes app jwt, installation token, and app user token" do
    app_guide = File.read!(@app_guide_path)

    assert app_guide =~ "App JWT"
    assert app_guide =~ "Installation Access Token"
    assert app_guide =~ "GitHub App User Access Token"
    assert app_guide =~ "default runtime credential"
    assert app_guide =~ "How To Narrow An Installation Token"
    assert app_guide =~ "How To Debug 403s"
  end

  test "generated auth matrix guide explains confidence levels and lookup paths" do
    auth_matrix = File.read!(@auth_matrix_path)

    assert auth_matrix =~ "`structured`"
    assert auth_matrix =~ "`legacy_hint`"
    assert auth_matrix =~ "`unknown`"
    assert auth_matrix =~ "`conflict`"
    assert auth_matrix =~ "mix github.auth.lookup GET /user/repos"
    assert auth_matrix =~ "mix github.auth.lookup repos/list-for-authenticated-user"
    assert auth_matrix =~ "repos/list-for-authenticated-user"
    assert auth_matrix =~ "GET /user/repos"
  end
end

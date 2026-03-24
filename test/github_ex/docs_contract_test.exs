defmodule GitHubEx.DocsContractTest do
  use ExUnit.Case, async: true

  @public_docs [
    Path.expand("../../README.md", __DIR__),
    Path.expand("../../guides/regeneration-and-maintenance.md", __DIR__),
    Path.expand("../../guides/architecture-and-design-reference.md", __DIR__)
  ]

  test "handwritten docs describe the client bridge without linking hidden helpers" do
    violations =
      Enum.filter(@public_docs, fn path ->
        path
        |> File.read!()
        |> String.contains?("GitHubEx.Client.execute_generated_request/2")
      end)

    assert violations == []
  end
end

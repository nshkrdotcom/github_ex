%{
  configs: [
    %{
      name: "default",
      files: %{
        included: ["mix.exs", "lib/", "codegen/", "test/"],
        excluded: [~r"lib/github_ex/generated/"]
      },
      strict: true
    }
  ]
}

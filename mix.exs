Code.require_file("build_support/plt_fingerprint.ex", __DIR__)
Code.require_file("build_support/dependency_resolver.exs", __DIR__)

defmodule GitHubEx.MixProject do
  use Mix.Project

  alias GitHubEx.Build.DependencyResolver
  alias GitHubEx.Build.PltFingerprint

  @version "0.1.0"
  @source_url "https://github.com/nshkrdotcom/github_ex"

  def project do
    [
      app: :github_ex,
      version: @version,
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps(),
      dialyzer: dialyzer(),
      description: description(),
      package: package(),
      name: "GitHubEx",
      source_url: @source_url,
      homepage_url: @source_url,
      docs: docs()
    ]
  end

  defp elixirc_paths(:dev), do: if(include_tooling_deps?(), do: ["lib", "codegen"], else: ["lib"])

  defp elixirc_paths(:test),
    do:
      if(include_tooling_deps?(),
        do: ["lib", "test/support", "codegen"],
        else: ["lib", "test/support"]
      )

  defp elixirc_paths(_), do: ["lib"]

  def application do
    [
      extra_applications: [:logger, :crypto, :public_key, :inets],
      mod: {GitHubEx.Application, []}
    ]
  end

  defp deps do
    [
      pristine_runtime_dep(),
      codegen_deps(),
      {:oapi_generator,
       github: "nshkrdotcom/open-api-generator",
       branch: "doc-generator-fix",
       only: [:dev, :test],
       runtime: false},
      {:jason, "~> 1.4"},
      {:finch, "~> 0.20"},
      {:jose, "~> 1.11"},
      {:telemetry, "~> 1.2"},
      {:mox, "~> 1.2", only: :test},
      {:ex_doc, "~> 0.40", only: :dev, runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false}
    ]
    |> List.flatten()
  end

  defp pristine_runtime_dep do
    if use_hex_runtime_dep?() do
      {:pristine, "~> 0.2.0"}
    else
      DependencyResolver.pristine_runtime()
    end
  end

  defp codegen_deps do
    if include_tooling_deps?() do
      [
        DependencyResolver.pristine_codegen(),
        DependencyResolver.pristine_provider_testkit(only: :test)
      ]
    else
      []
    end
  end

  defp dialyzer do
    [
      plt_add_apps: [:ex_unit, :mix, :oapi_generator, :pristine, :pristine_codegen, :inets],
      plt_core_path: "priv/plts/core",
      plt_local_path: Path.join("priv/plts/project", project_plt_fingerprint())
    ]
  end

  defp project_plt_fingerprint do
    PltFingerprint.project(
      project_root: __DIR__,
      dependencies: path_dependencies()
    )
  end

  defp path_dependencies do
    deps()
    |> Enum.flat_map(&path_dependency/1)
  end

  defp path_dependency({app, opts}) when is_atom(app) and is_list(opts) do
    path_dependency(app, opts)
  end

  defp path_dependency({app, _requirement, opts}) when is_atom(app) and is_list(opts) do
    path_dependency(app, opts)
  end

  defp path_dependency(_dependency), do: []

  defp path_dependency(app, opts) do
    case Keyword.fetch(opts, :path) do
      {:ok, path} -> [%{app: app, path: Path.expand(path, __DIR__)}]
      :error -> []
    end
  end

  defp description do
    """
    Native Elixir SDK for the GitHub REST API with generated endpoint modules,
    OTP-friendly runtime defaults, OAuth helpers, GitHub App helpers,
    pagination utilities, and publication-ready docs.
    """
  end

  defp package do
    [
      name: "github_ex",
      description: description(),
      files: ~w(
        build_support/dependency_resolver.exs
        build_support/plt_fingerprint.ex
        lib/github_ex.ex
        lib/github_ex/application.ex
        lib/github_ex/app_auth.ex
        lib/github_ex/auth.ex
        lib/github_ex/auth_matrix.ex
        lib/github_ex/client.ex
        lib/github_ex/error.ex
        lib/github_ex/generated
        lib/github_ex/oauth.ex
        lib/github_ex/oauth_token_file.ex
        lib/github_ex/pagination.ex
        lib/github_ex/provider_profile.ex
        lib/github_ex/rate_limit_info.ex
        lib/github_ex/response.ex
        lib/github_ex/result_classifier.ex
        lib/github_ex/retry.ex
        lib/mix/tasks/github.auth.lookup.ex
        lib/mix/tasks/github.oauth.ex
        priv/generated/auth_manifest.json
        CHANGELOG.md
        LICENSE
        README.md
        mix.exs
      ),
      licenses: ["MIT"],
      links: %{
        "GitHub" => @source_url
      },
      maintainers: ["nshkrdotcom"]
    ]
  end

  defp docs do
    [
      main: "readme-1",
      assets: %{"assets" => "assets"},
      logo: "assets/github_ex.svg",
      canonical: "https://hexdocs.pm/github_ex",
      source_url: @source_url,
      source_ref: "v#{@version}",
      extras: extras(),
      groups_for_extras: groups_for_extras(),
      groups_for_modules: groups_for_modules()
    ]
  end

  defp extras do
    [
      "README.md",
      "guides/getting-started.md",
      "guides/client-configuration.md",
      "guides/authentication-and-oauth.md",
      "guides/auth-capability-matrix.md",
      "guides/github-app-authentication.md",
      "guides/pagination-and-rate-limits.md",
      "guides/common-workflows.md",
      "guides/architecture-and-design-reference.md",
      "guides/low-level-requests.md",
      "guides/regeneration-and-maintenance.md",
      "examples/README.md",
      "CHANGELOG.md",
      "LICENSE"
    ]
  end

  defp groups_for_extras do
    [
      {"Overview", ["README.md"]},
      {"Getting Started",
       [
         "guides/getting-started.md",
         "guides/client-configuration.md"
       ]},
      {"Authentication",
       [
         "guides/authentication-and-oauth.md",
         "guides/auth-capability-matrix.md",
         "guides/github-app-authentication.md"
       ]},
      {"Usage",
       [
         "guides/pagination-and-rate-limits.md",
         "guides/common-workflows.md"
       ]},
      {"Architecture", ["guides/architecture-and-design-reference.md"]},
      {"Advanced Usage", ["guides/low-level-requests.md"]},
      {"Examples", ["examples/README.md"]},
      {"Internals", ["guides/regeneration-and-maintenance.md"]},
      {"Release Notes", ["CHANGELOG.md", "LICENSE"]}
    ]
  end

  defp groups_for_modules do
    runtime_groups = [
      {"Core",
       [
         GitHubEx,
         GitHubEx.AppAuth,
         GitHubEx.Auth,
         GitHubEx.AuthMatrix,
         GitHubEx.Client,
         GitHubEx.Error,
         GitHubEx.OAuth,
         GitHubEx.OAuthTokenFile,
         GitHubEx.Pagination,
         GitHubEx.RateLimitInfo,
         GitHubEx.Response,
         GitHubEx.Retry
       ]},
      {"Generated Surface", generated_module_pattern()}
    ]

    published_task_group = [
      {"Tasks", [Mix.Tasks.Github.Auth.Lookup, Mix.Tasks.Github.Oauth]}
    ]

    repo_tooling_group =
      if include_tooling_deps?() do
        [
          {"Repo Tooling",
           [
             GitHubEx.Codegen,
             GitHubEx.Codegen.Provider,
             GitHubEx.Codegen.Plugins.Source,
             GitHubEx.Refresh,
             Mix.Tasks.Github.Auth.Refresh,
             Mix.Tasks.Github.Generate,
             Mix.Tasks.Github.Refresh
           ]}
        ]
      else
        []
      end

    runtime_groups ++ published_task_group ++ repo_tooling_group
  end

  defp generated_module_pattern do
    ~r/^GitHubEx\.(?!Application$|AppAuth$|Auth$|Build(?:\.|$)|Client$|Codegen(?:\.|$)|Error$|OAuth(?:\.|$)|OAuthTokenFile$|Pagination$|RateLimitInfo$|Refresh$|Response$|ResultClassifier$|Retry$)[A-Z]/
  end

  defp publishing_package? do
    Enum.any?(System.argv(), &(&1 in ["hex.build", "hex.publish"]))
  end

  defp use_hex_runtime_dep? do
    publishing_package?() or installing_as_dependency?() or force_hex_runtime_dep?()
  end

  defp include_tooling_deps? do
    not use_hex_runtime_dep?()
  end

  defp installing_as_dependency? do
    Enum.member?(Path.split(__DIR__), "deps")
  end

  defp force_hex_runtime_dep? do
    System.get_env("GITHUB_EX_HEX_DEPS") in ["1", "true", "TRUE", "yes", "YES"]
  end
end

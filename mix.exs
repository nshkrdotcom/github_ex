Code.require_file("build_support/plt_fingerprint.ex", __DIR__)

defmodule GitHubEx.MixProject do
  use Mix.Project

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

  defp elixirc_paths(:dev), do: ["lib", "codegen"]
  defp elixirc_paths(:test), do: ["lib", "test/support", "codegen"]
  defp elixirc_paths(_), do: ["lib"]

  def application do
    [
      extra_applications: [:logger, :crypto, :public_key, :inets],
      mod: {GitHubEx.Application, []}
    ]
  end

  defp deps do
    [
      {:pristine, "~> 0.1.0"},
      {:oapi_generator,
       github: "nshkrdotcom/open-api-generator",
       branch: "doc-generator-fix",
       only: [:dev, :test],
       runtime: false},
      {:jason, "~> 1.4"},
      {:finch, "~> 0.20"},
      {:jose, "~> 1.11"},
      {:telemetry, "~> 1.2"},
      {:mox, "~> 1.1", only: :test},
      {:ex_doc, "~> 0.38", only: :dev, runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false}
    ]
  end

  defp dialyzer do
    [
      plt_add_apps: [:ex_unit, :mix, :oapi_generator, :pristine, :inets],
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

  defp path_dependency?(%Mix.Dep{opts: opts}), do: is_binary(opts[:path])

  defp path_dependencies do
    if dependency_checkout?() do
      []
    else
      Mix.Dep.load_and_cache()
      |> Enum.filter(&path_dependency?/1)
      |> Enum.map(fn %Mix.Dep{app: app, opts: opts} ->
        %{app: app, path: Path.expand(opts[:path], __DIR__)}
      end)
    end
  end

  defp dependency_checkout? do
    __DIR__
    |> Path.split()
    |> Enum.member?("deps")
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
        assets
        build_support
        codegen
        config
        examples
        guides
        lib
        priv/generated
        priv/upstream
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
         "guides/common-workflows.md",
         "guides/low-level-requests.md"
       ]},
      {"Examples", ["examples/README.md"]},
      {"Internals", ["guides/regeneration-and-maintenance.md"]},
      {"Release Notes", ["CHANGELOG.md", "LICENSE"]}
    ]
  end

  defp groups_for_modules do
    [
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
      {"Tooling",
       [
         GitHubEx.Codegen,
         GitHubEx.Codegen.Renderer,
         GitHubEx.Refresh,
         Mix.Tasks.Github.Auth.Lookup,
         Mix.Tasks.Github.Auth.Refresh,
         Mix.Tasks.Github.Generate,
         Mix.Tasks.Github.Oauth,
         Mix.Tasks.Github.Refresh
       ]},
      {"Generated Surface", generated_module_pattern()}
    ]
  end

  defp generated_module_pattern do
    ~r/^GitHubEx\.(?!Application$|AppAuth$|Auth$|Build(?:\.|$)|Client$|Codegen(?:\.|$)|Error$|OAuth(?:\.|$)|OAuthTokenFile$|Pagination$|RateLimitInfo$|Refresh$|Response$|ResultClassifier$|Retry$)[A-Z]/
  end
end

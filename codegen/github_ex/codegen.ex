defmodule GitHubEx.Codegen do
  @moduledoc """
  Build-time generation workflow for the thin GitHub REST SDK package.
  """

  alias GitHubEx.AuthManifest
  alias GitHubEx.Codegen.Provider
  alias PristineCodegen.Compiler

  @default_codegen_spec_filename "api.github.com.2026-03-10.codegen.json"
  @default_full_spec_filename "api.github.com.2026-03-10.json"

  @type path_options :: keyword()
  @type state :: %{
          required(:compilation) => PristineCodegen.Compilation.t(),
          required(:ir) => PristineCodegen.ProviderIR.t(),
          required(:paths) => map()
        }

  @spec project_root() :: String.t()
  def project_root do
    Path.expand("../..", __DIR__)
  end

  @spec paths(path_options()) :: map()
  def paths(opts \\ []) when is_list(opts) do
    project_root = Keyword.get(opts, :project_root, project_root())
    upstream_dir = Keyword.get(opts, :upstream_dir, Path.join(project_root, "priv/upstream"))
    spec_dir = Keyword.get(opts, :spec_dir, Path.join(upstream_dir, "openapi"))

    %{
      project_root: project_root,
      upstream_dir: upstream_dir,
      spec_dir: spec_dir,
      generated_dir:
        Keyword.get(opts, :generated_dir, Path.join(project_root, "lib/github_ex/generated")),
      generated_artifact_dir:
        Keyword.get(opts, :generated_artifact_dir, Path.join(project_root, "priv/generated")),
      spec_path:
        Keyword.get(
          opts,
          :spec_path,
          Path.join(spec_dir, @default_codegen_spec_filename)
        ),
      full_spec_path:
        Keyword.get(
          opts,
          :full_spec_path,
          Path.join(spec_dir, @default_full_spec_filename)
        )
    }
  end

  @spec generated_dir(path_options()) :: String.t()
  def generated_dir(opts \\ []), do: paths(opts).generated_dir

  @spec generated_artifact_dir(path_options()) :: String.t()
  def generated_artifact_dir(opts \\ []), do: paths(opts).generated_artifact_dir

  @spec full_spec_path(path_options()) :: String.t()
  def full_spec_path(opts \\ []), do: paths(opts).full_spec_path

  @spec generate!(path_options()) :: state()
  def generate!(opts \\ []) when is_list(opts) do
    paths = paths(opts)
    prepare_dirs!(paths)
    ensure_spec!(paths.full_spec_path)

    {:ok, compilation} = Compiler.generate(Provider, opts)
    _manifest = AuthManifest.write!(compilation.provider_ir, opts)

    %{
      compilation: compilation,
      ir: compilation.provider_ir,
      paths: paths
    }
  end

  @spec verify(path_options()) :: :ok | {:error, map()}
  def verify(opts \\ []) when is_list(opts) do
    Compiler.verify(Provider, opts)
  end

  @spec emit_ir(path_options()) :: {:ok, String.t()}
  def emit_ir(opts \\ []) when is_list(opts) do
    Compiler.emit_ir(Provider, opts)
  end

  defp prepare_dirs!(paths) do
    File.mkdir_p!(paths.spec_dir)
    File.rm_rf!(paths.generated_dir)
    File.mkdir_p!(paths.generated_dir)
    File.rm_rf!(paths.generated_artifact_dir)
    File.mkdir_p!(paths.generated_artifact_dir)
  end

  defp ensure_spec!(path) do
    case File.stat(path) do
      {:ok, %File.Stat{}} ->
        :ok

      {:error, _reason} ->
        raise ArgumentError,
              "missing committed GitHub REST OpenAPI spec at #{path}; run mix github.refresh first"
    end
  end
end

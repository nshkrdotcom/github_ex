defmodule GitHubEx.Refresh do
  @moduledoc """
  Refresh the committed upstream GitHub REST OpenAPI description and regenerate
  the SDK surface.
  """

  @default_spec_filename "api.github.com.2026-03-10.json"
  @default_codegen_spec_filename "api.github.com.2026-03-10.codegen.json"
  @default_spec_url "https://raw.githubusercontent.com/github/rest-api-description/main/descriptions-next/api.github.com/api.github.com.2026-03-10.json"
  @versions_url "https://api.github.com/versions"

  @spec paths(keyword()) :: map()
  def paths(opts \\ []) when is_list(opts) do
    project_root = Keyword.get(opts, :project_root, project_root())
    upstream_dir = Keyword.get(opts, :upstream_dir, Path.join(project_root, "priv/upstream"))
    openapi_dir = Keyword.get(opts, :openapi_dir, Path.join(upstream_dir, "openapi"))
    spec_filename = Keyword.get(opts, :spec_filename, @default_spec_filename)

    %{
      codegen_spec_path:
        Keyword.get(
          opts,
          :codegen_spec_path,
          Path.join(openapi_dir, @default_codegen_spec_filename)
        ),
      metadata_path: Keyword.get(opts, :metadata_path, Path.join(openapi_dir, "metadata.json")),
      openapi_dir: openapi_dir,
      project_root: project_root,
      spec_filename: spec_filename,
      spec_path: Keyword.get(opts, :spec_path, Path.join(openapi_dir, spec_filename)),
      spec_url: Keyword.get(opts, :spec_url, @default_spec_url)
    }
  end

  @spec run!(keyword()) :: map()
  def run!(opts \\ []) when is_list(opts) do
    paths = paths(opts)
    File.mkdir_p!(paths.openapi_dir)

    download!(paths.spec_url, paths.spec_path)
    build_codegen_spec!(paths.spec_path, paths.codegen_spec_path)

    metadata = %{
      captured_at: DateTime.utc_now() |> DateTime.truncate(:second) |> DateTime.to_iso8601(),
      codegen_spec_filename: Path.basename(paths.codegen_spec_path),
      spec_filename: paths.spec_filename,
      spec_url: paths.spec_url,
      versions: fetch_json!(@versions_url)
    }

    File.write!(paths.metadata_path, Jason.encode_to_iodata!(metadata, pretty: true))

    if Keyword.get(opts, :generate?, true) do
      GitHubEx.Codegen.generate!(
        project_root: paths.project_root,
        spec_path: paths.codegen_spec_path
      )
    end

    metadata
  end

  defp project_root do
    Path.expand("../..", __DIR__)
  end

  defp download!(url, destination) do
    body = get_body!(url)
    File.write!(destination, body)
  end

  defp fetch_json!(url) do
    url
    |> get_body!()
    |> Jason.decode!()
  end

  defp get_body!(url) do
    request = Finch.build(:get, url)

    case Finch.request(request, GitHubEx.Finch) do
      {:ok, %Finch.Response{status: status, body: body}} when status >= 200 and status < 300 ->
        body

      {:ok, %Finch.Response{status: status, body: body}} ->
        raise "failed to fetch #{url}: HTTP #{status}: #{body}"

      {:error, reason} ->
        raise "failed to fetch #{url}: #{inspect(reason)}"
    end
  end

  defp build_codegen_spec!(source_path, destination_path) do
    source_path
    |> File.read!()
    |> Jason.decode!()
    |> prune_codegen_noise()
    |> then(&Jason.encode_to_iodata!(&1, pretty: false))
    |> then(&File.write!(destination_path, &1))
  end

  defp prune_codegen_noise(value) when is_map(value) do
    value
    |> Enum.reject(fn {key, _value} ->
      key in ["description", "example", "examples", "externalDocs", "x-github"]
    end)
    |> Enum.map(fn {key, nested_value} ->
      {key, prune_codegen_noise(nested_value)}
    end)
    |> Map.new()
  end

  defp prune_codegen_noise(value) when is_list(value) do
    Enum.map(value, &prune_codegen_noise/1)
  end

  defp prune_codegen_noise(value), do: value
end

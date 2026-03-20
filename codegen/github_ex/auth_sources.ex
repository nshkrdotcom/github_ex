defmodule GitHubEx.AuthSources do
  @moduledoc false

  alias GitHubEx.AuthParser

  @source_specs [
    %{
      key: :endpoints_fg_pat,
      filename: "endpoints_fg_pat.md",
      pathname:
        "/en/rest/authentication/endpoints-available-for-fine-grained-personal-access-tokens",
      title: "Endpoints available for fine-grained personal access tokens"
    },
    %{
      key: :endpoints_github_app_installation,
      filename: "endpoints_github_app_installation.md",
      pathname:
        "/en/rest/authentication/endpoints-available-for-github-app-installation-access-tokens",
      title: "Endpoints available for GitHub App installation access tokens"
    },
    %{
      key: :endpoints_github_app_user,
      filename: "endpoints_github_app_user.md",
      pathname: "/en/rest/authentication/endpoints-available-for-github-app-user-access-tokens",
      title: "Endpoints available for GitHub App user access tokens"
    },
    %{
      key: :permissions_fg_pat,
      filename: "permissions_fg_pat.md",
      pathname:
        "/en/rest/authentication/permissions-required-for-fine-grained-personal-access-tokens",
      title: "Permissions required for fine-grained personal access tokens"
    },
    %{
      key: :permissions_github_apps,
      filename: "permissions_github_apps.md",
      pathname: "/en/rest/authentication/permissions-required-for-github-apps",
      title: "Permissions required for GitHub Apps"
    },
    %{
      key: :differences_github_apps_vs_oauth_apps,
      filename: "differences_github_apps_vs_oauth_apps.md",
      pathname:
        "/en/apps/oauth-apps/building-oauth-apps/differences-between-github-apps-and-oauth-apps",
      title: "Differences between GitHub Apps and OAuth apps"
    },
    %{
      key: :managing_personal_access_tokens,
      filename: "managing_personal_access_tokens.md",
      pathname:
        "/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens",
      title: "Managing your personal access tokens"
    },
    %{
      key: :oauth_scopes,
      filename: "oauth_scopes.md",
      pathname: "/en/apps/oauth-apps/building-oauth-apps/scopes-for-oauth-apps",
      title: "Scopes for OAuth apps"
    },
    %{
      key: :github_app_installation_tokens,
      filename: "github_app_installation_tokens.md",
      pathname:
        "/en/apps/creating-github-apps/authenticating-with-a-github-app/generating-an-installation-access-token-for-a-github-app",
      title: "Generating an installation access token for a GitHub App"
    }
  ]
  @endpoint_prog_access_filename "endpoint_prog_access.json"

  @spec source_specs() :: [map()]
  def source_specs, do: @source_specs

  @spec paths(keyword()) :: map()
  def paths(opts \\ []) when is_list(opts) do
    project_root = Keyword.get(opts, :project_root, project_root())

    auth_dir =
      Keyword.get(opts, :auth_dir, Path.join(project_root, "priv/upstream/github_docs_auth"))

    spec_path =
      Keyword.get(
        opts,
        :spec_path,
        Path.join(project_root, "priv/upstream/openapi/api.github.com.2026-03-10.json")
      )

    %{
      auth_dir: auth_dir,
      endpoint_prog_access_path: Path.join(auth_dir, @endpoint_prog_access_filename),
      metadata_path: Path.join(auth_dir, "metadata.json"),
      project_root: project_root,
      snapshot_paths: Map.new(@source_specs, &{&1.key, Path.join(auth_dir, &1.filename)}),
      spec_path: spec_path
    }
  end

  @spec load!(keyword()) :: map()
  def load!(opts \\ []) when is_list(opts) do
    paths = paths(opts)

    %{
      endpoint_prog_access: paths.endpoint_prog_access_path |> File.read!() |> Jason.decode!(),
      metadata: paths.metadata_path |> File.read!() |> Jason.decode!(),
      snapshots:
        Map.new(@source_specs, fn spec ->
          {spec.key, File.read!(Map.fetch!(paths.snapshot_paths, spec.key))}
        end)
    }
  end

  @spec refresh!(keyword()) :: map()
  def refresh!(opts \\ []) when is_list(opts) do
    paths = paths(opts)
    File.mkdir_p!(paths.auth_dir)

    captured_at = DateTime.utc_now() |> DateTime.truncate(:second) |> DateTime.to_iso8601()

    Enum.each(@source_specs, fn spec ->
      File.write!(Map.fetch!(paths.snapshot_paths, spec.key), fetch_markdown!(spec.pathname))
    end)

    endpoint_prog_access =
      paths.spec_path
      |> File.read!()
      |> Jason.decode!()
      |> build_endpoint_prog_access_snapshot(captured_at)

    File.write!(
      paths.endpoint_prog_access_path,
      Jason.encode_to_iodata!(endpoint_prog_access, pretty: true)
    )

    metadata = %{
      captured_at: captured_at,
      endpoint_prog_access: %{
        page_count: endpoint_prog_access.page_count,
        snapshot: Path.basename(paths.endpoint_prog_access_path)
      },
      sources:
        Map.new(@source_specs, fn spec ->
          {Atom.to_string(spec.key),
           %{
             api_url: markdown_api_url(spec.pathname),
             pathname: spec.pathname,
             snapshot: spec.filename,
             title: spec.title,
             url: source_url(spec.pathname)
           }}
        end)
    }

    File.write!(paths.metadata_path, Jason.encode_to_iodata!(metadata, pretty: true))

    %{
      endpoint_prog_access: endpoint_prog_access,
      metadata: metadata,
      paths: paths
    }
  end

  defp project_root do
    Path.expand("../..", __DIR__)
  end

  defp fetch_markdown!(pathname) do
    pathname
    |> markdown_api_url()
    |> get_body!()
  end

  defp build_endpoint_prog_access_snapshot(spec, captured_at) do
    page_paths =
      spec
      |> endpoint_page_paths()
      |> Enum.sort()

    page_results =
      page_paths
      |> Task.async_stream(&fetch_page_prog_access!/1,
        max_concurrency: 8,
        ordered: true,
        timeout: :timer.seconds(60)
      )
      |> Enum.map(&task_result!/1)

    operations =
      page_results
      |> Enum.flat_map(& &1.operations)
      |> Enum.reduce(%{}, &put_operation!/2)

    %{
      captured_at: captured_at,
      operation_count: map_size(operations),
      operations: operations,
      page_count: length(page_paths),
      pages: Enum.map(page_results, &page_summary/1)
    }
  end

  defp endpoint_page_paths(spec) do
    spec
    |> Map.get("paths", %{})
    |> Enum.flat_map(fn {_path, methods} ->
      Enum.flat_map(methods, &operation_page_paths/1)
    end)
    |> Enum.uniq()
  end

  defp normalize_page_path(url) do
    uri = URI.parse(url)

    path =
      case uri.path do
        "/en/" <> _rest = path -> path
        "/" <> _rest = path -> "/en" <> path
        other -> raise "unsupported docs page path in #{url}: #{inspect(other)}"
      end

    path
  end

  defp task_result!({:ok, result}), do: result

  defp task_result!({:exit, reason}),
    do: raise("failed to fetch endpoint progAccess: #{inspect(reason)}")

  defp put_operation!(operation, acc) do
    key = AuthParser.normalize_endpoint_key(operation.method, operation.path)

    Map.update(acc, key, operation, fn existing ->
      if existing == operation do
        existing
      else
        raise "conflicting progAccess snapshot entries for #{key}"
      end
    end)
  end

  defp page_summary(result) do
    %{
      operation_count: length(result.operations),
      page_path: result.page_path,
      page_url: result.page_url
    }
  end

  defp operation_page_paths({method, operation})
       when method in ["get", "post", "put", "patch", "delete", "head", "options"] do
    case get_in(operation, ["externalDocs", "url"]) do
      nil -> []
      url -> [normalize_page_path(url)]
    end
  end

  defp operation_page_paths(_other), do: []

  defp fetch_page_prog_access!(page_path) do
    page_url = source_url(page_path)
    html = get_body!(page_url)

    next_data =
      case Regex.run(
             ~r/<script id="__NEXT_DATA__" type="application\/json">([\s\S]*?)<\/script>/,
             html,
             capture: :all_but_first
           ) do
        [json] -> Jason.decode!(json)
        _other -> raise "missing __NEXT_DATA__ payload for #{page_url}"
      end

    operations =
      next_data
      |> get_in(["props", "pageProps", "restOperations"])
      |> case do
        nil -> []
        rest_operations -> rest_operations
      end
      |> Enum.map(fn operation ->
        %{
          method: operation["verb"] |> to_string() |> String.upcase(),
          path: operation["requestPath"],
          page_path: page_path,
          page_url: page_url,
          prog_access: AuthParser.parse_prog_access(operation["progAccess"]),
          title: operation["title"]
        }
      end)

    %{
      operations: operations,
      page_path: page_path,
      page_url: page_url
    }
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

  defp markdown_api_url(pathname) do
    encoded_query = URI.encode_query(%{pathname: pathname})
    "https://docs.github.com/api/article/body?#{encoded_query}"
  end

  defp source_url(pathname) do
    "https://docs.github.com#{pathname}"
  end
end

defmodule GitHubEx.Packages do
  @moduledoc """
  Generated Github Ex operations for packages.
  """

  @delete_package_for_authenticated_user_partition_spec %{
    path: [{"package_type", :package_type}, {"package_name", :package_name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a package for the authenticated user\n\nDeletes a package owned by the authenticated user. You cannot delete a public package if any version of the package has more than 5,000 downloads. In this scenario, contact GitHub support for further assistance.\n\nOAuth app tokens and personal access tokens (classic) need the `read:packages` and `delete:packages` scopes to use this endpoint. For more information, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages).\""
  @spec delete_package_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def delete_package_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_delete_package_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_delete_package_for_authenticated_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @delete_package_for_authenticated_user_partition_spec)

    Pristine.Operation.new(%{
      id: "packages/delete-package-for-authenticated-user",
      method: :delete,
      path_template: "/user/packages/{package_type}/{package_name}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :packages, :delete_package_for_authenticated_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_package_for_org_partition_spec %{
    path: [
      {"package_type", :package_type},
      {"package_name", :package_name},
      {"org", :org}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a package for an organization\n\nDeletes an entire package in an organization. You cannot delete a public package if any version of the package has more than 5,000 downloads. In this scenario, contact GitHub support for further assistance.\n\nThe authenticated user must have admin permissions in the organization to use this endpoint. If the `package_type` belongs to a GitHub Packages registry that supports granular permissions, the authenticated user must also have admin permissions to the package. For the list of these registries, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#granular-permissions-for-userorganization-scoped-packages).\"\n\nOAuth app tokens and personal access tokens (classic) need the `read:packages` and `delete:packages` scopes to use this endpoint. For more information, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages).\""
  @spec delete_package_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_package_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_delete_package_for_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_delete_package_for_org_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_package_for_org_partition_spec)

    Pristine.Operation.new(%{
      id: "packages/delete-package-for-org",
      method: :delete,
      path_template: "/orgs/{org}/packages/{package_type}/{package_name}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :packages, :delete_package_for_org],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_package_for_user_partition_spec %{
    path: [
      {"package_type", :package_type},
      {"package_name", :package_name},
      {"username", :username}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a package for a user\n\nDeletes an entire package for a user. You cannot delete a public package if any version of the package has more than 5,000 downloads. In this scenario, contact GitHub support for further assistance.\n\nIf the `package_type` belongs to a GitHub Packages registry that supports granular permissions, the authenticated user must have admin permissions to the package. For the list of these registries, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#granular-permissions-for-userorganization-scoped-packages).\"\n\nOAuth app tokens and personal access tokens (classic) need the `read:packages` and `delete:packages` scopes to use this endpoint. For more information, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages).\""
  @spec delete_package_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_package_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_delete_package_for_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_delete_package_for_user_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_package_for_user_partition_spec)

    Pristine.Operation.new(%{
      id: "packages/delete-package-for-user",
      method: :delete,
      path_template: "/users/{username}/packages/{package_type}/{package_name}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :packages, :delete_package_for_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_package_version_for_authenticated_user_partition_spec %{
    path: [
      {"package_type", :package_type},
      {"package_name", :package_name},
      {"package_version_id", :package_version_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete a package version for the authenticated user\n\nDeletes a specific package version for a package owned by the authenticated user.  If the package is public and the package version has more than 5,000 downloads, you cannot delete the package version. In this scenario, contact GitHub support for further assistance.\n\nThe authenticated user must have admin permissions in the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `read:packages` and `delete:packages` scopes to use this endpoint. For more information, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages).\""
  @spec delete_package_version_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def delete_package_version_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_delete_package_version_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_delete_package_version_for_authenticated_user_operation(params)
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @delete_package_version_for_authenticated_user_partition_spec
      )

    Pristine.Operation.new(%{
      id: "packages/delete-package-version-for-authenticated-user",
      method: :delete,
      path_template: "/user/packages/{package_type}/{package_name}/versions/{package_version_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :packages, :delete_package_version_for_authenticated_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_package_version_for_org_partition_spec %{
    path: [
      {"package_type", :package_type},
      {"package_name", :package_name},
      {"org", :org},
      {"package_version_id", :package_version_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete package version for an organization\n\nDeletes a specific package version in an organization. If the package is public and the package version has more than 5,000 downloads, you cannot delete the package version. In this scenario, contact GitHub support for further assistance.\n\nThe authenticated user must have admin permissions in the organization to use this endpoint. If the `package_type` belongs to a GitHub Packages registry that supports granular permissions, the authenticated user must also have admin permissions to the package. For the list of these registries, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#granular-permissions-for-userorganization-scoped-packages).\"\n\nOAuth app tokens and personal access tokens (classic) need the `read:packages` and `delete:packages` scopes to use this endpoint. For more information, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages).\""
  @spec delete_package_version_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def delete_package_version_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_delete_package_version_for_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_delete_package_version_for_org_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @delete_package_version_for_org_partition_spec)

    Pristine.Operation.new(%{
      id: "packages/delete-package-version-for-org",
      method: :delete,
      path_template:
        "/orgs/{org}/packages/{package_type}/{package_name}/versions/{package_version_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :packages, :delete_package_version_for_org],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_package_version_for_user_partition_spec %{
    path: [
      {"package_type", :package_type},
      {"package_name", :package_name},
      {"username", :username},
      {"package_version_id", :package_version_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Delete package version for a user\n\nDeletes a specific package version for a user. If the package is public and the package version has more than 5,000 downloads, you cannot delete the package version. In this scenario, contact GitHub support for further assistance.\n\nIf the `package_type` belongs to a GitHub Packages registry that supports granular permissions, the authenticated user must have admin permissions to the package. For the list of these registries, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#granular-permissions-for-userorganization-scoped-packages).\"\n\nOAuth app tokens and personal access tokens (classic) need the `read:packages` and `delete:packages` scopes to use this endpoint. For more information, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages).\""
  @spec delete_package_version_for_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def delete_package_version_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_delete_package_version_for_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_delete_package_version_for_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @delete_package_version_for_user_partition_spec)

    Pristine.Operation.new(%{
      id: "packages/delete-package-version-for-user",
      method: :delete,
      path_template:
        "/users/{username}/packages/{package_type}/{package_name}/versions/{package_version_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.delete",
        telemetry_event: [:github_ex, :packages, :delete_package_version_for_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_all_package_versions_for_package_owned_by_authenticated_user_partition_spec %{
    path: [{"package_type", :package_type}, {"package_name", :package_name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"page", :page}, {"per_page", :per_page}, {"state", :state}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List package versions for a package owned by the authenticated user\n\nLists package versions for a package owned by the authenticated user.\n\nOAuth app tokens and personal access tokens (classic) need the `read:packages` scope to use this endpoint. For more information, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages).\""
  @spec get_all_package_versions_for_package_owned_by_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_all_package_versions_for_package_owned_by_authenticated_user(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    operation =
      build_get_all_package_versions_for_package_owned_by_authenticated_user_operation(params)

    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_get_all_package_versions_for_package_owned_by_authenticated_user(
          term(),
          map(),
          keyword()
        ) :: Enumerable.t()
  def stream_get_all_package_versions_for_package_owned_by_authenticated_user(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn ->
        build_get_all_package_versions_for_package_owned_by_authenticated_user_operation(params)
      end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          case Pristine.execute(runtime_client, operation, opts) do
            {:ok, response} ->
              items = List.wrap(Pristine.Operation.items(operation, response))
              {items, Pristine.Operation.next_page(operation, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_get_all_package_versions_for_package_owned_by_authenticated_user_operation(params)
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @get_all_package_versions_for_package_owned_by_authenticated_user_partition_spec
      )

    Pristine.Operation.new(%{
      id: "packages/get-all-package-versions-for-package-owned-by-authenticated-user",
      method: :get,
      path_template: "/user/packages/{package_type}/{package_name}/versions",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [
          :github_ex,
          :packages,
          :get_all_package_versions_for_package_owned_by_authenticated_user
        ],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: nil,
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
  end

  @get_all_package_versions_for_package_owned_by_org_partition_spec %{
    path: [
      {"package_type", :package_type},
      {"package_name", :package_name},
      {"org", :org}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"page", :page}, {"per_page", :per_page}, {"state", :state}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List package versions for a package owned by an organization\n\nLists package versions for a package owned by an organization.\n\nOAuth app tokens and personal access tokens (classic) need the `read:packages` scope to use this endpoint. For more information, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages).\""
  @spec get_all_package_versions_for_package_owned_by_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_all_package_versions_for_package_owned_by_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_all_package_versions_for_package_owned_by_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_get_all_package_versions_for_package_owned_by_org(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_get_all_package_versions_for_package_owned_by_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_get_all_package_versions_for_package_owned_by_org_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          case Pristine.execute(runtime_client, operation, opts) do
            {:ok, response} ->
              items = List.wrap(Pristine.Operation.items(operation, response))
              {items, Pristine.Operation.next_page(operation, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_get_all_package_versions_for_package_owned_by_org_operation(params)
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @get_all_package_versions_for_package_owned_by_org_partition_spec
      )

    Pristine.Operation.new(%{
      id: "packages/get-all-package-versions-for-package-owned-by-org",
      method: :get,
      path_template: "/orgs/{org}/packages/{package_type}/{package_name}/versions",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [
          :github_ex,
          :packages,
          :get_all_package_versions_for_package_owned_by_org
        ],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: nil,
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
  end

  @get_all_package_versions_for_package_owned_by_user_partition_spec %{
    path: [
      {"package_type", :package_type},
      {"package_name", :package_name},
      {"username", :username}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List package versions for a package owned by a user\n\nLists package versions for a public package owned by a specified user.\n\nOAuth app tokens and personal access tokens (classic) need the `read:packages` scope to use this endpoint. For more information, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages).\""
  @spec get_all_package_versions_for_package_owned_by_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_all_package_versions_for_package_owned_by_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_all_package_versions_for_package_owned_by_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_get_all_package_versions_for_package_owned_by_user(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_get_all_package_versions_for_package_owned_by_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_get_all_package_versions_for_package_owned_by_user_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          case Pristine.execute(runtime_client, operation, opts) do
            {:ok, response} ->
              items = List.wrap(Pristine.Operation.items(operation, response))
              {items, Pristine.Operation.next_page(operation, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_get_all_package_versions_for_package_owned_by_user_operation(params)
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @get_all_package_versions_for_package_owned_by_user_partition_spec
      )

    Pristine.Operation.new(%{
      id: "packages/get-all-package-versions-for-package-owned-by-user",
      method: :get,
      path_template: "/users/{username}/packages/{package_type}/{package_name}/versions",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [
          :github_ex,
          :packages,
          :get_all_package_versions_for_package_owned_by_user
        ],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: nil,
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
  end

  @get_package_for_authenticated_user_partition_spec %{
    path: [{"package_type", :package_type}, {"package_name", :package_name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a package for the authenticated user\n\nGets a specific package for a package owned by the authenticated user.\n\nOAuth app tokens and personal access tokens (classic) need the `read:packages` scope to use this endpoint. For more information, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages).\""
  @spec get_package_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_package_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_package_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_package_for_authenticated_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @get_package_for_authenticated_user_partition_spec)

    Pristine.Operation.new(%{
      id: "packages/get-package-for-authenticated-user",
      method: :get,
      path_template: "/user/packages/{package_type}/{package_name}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :packages, :get_package_for_authenticated_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_package_for_organization_partition_spec %{
    path: [
      {"package_type", :package_type},
      {"package_name", :package_name},
      {"org", :org}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a package for an organization\n\nGets a specific package in an organization.\n\nOAuth app tokens and personal access tokens (classic) need the `read:packages` scope to use this endpoint. For more information, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages).\""
  @spec get_package_for_organization(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_package_for_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_package_for_organization_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_package_for_organization_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_package_for_organization_partition_spec)

    Pristine.Operation.new(%{
      id: "packages/get-package-for-organization",
      method: :get,
      path_template: "/orgs/{org}/packages/{package_type}/{package_name}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :packages, :get_package_for_organization],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_package_for_user_partition_spec %{
    path: [
      {"package_type", :package_type},
      {"package_name", :package_name},
      {"username", :username}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a package for a user\n\nGets a specific package metadata for a public package owned by a user.\n\nOAuth app tokens and personal access tokens (classic) need the `read:packages` scope to use this endpoint. For more information, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages).\""
  @spec get_package_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_package_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_package_for_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_package_for_user_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_package_for_user_partition_spec)

    Pristine.Operation.new(%{
      id: "packages/get-package-for-user",
      method: :get,
      path_template: "/users/{username}/packages/{package_type}/{package_name}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :packages, :get_package_for_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_package_version_for_authenticated_user_partition_spec %{
    path: [
      {"package_type", :package_type},
      {"package_name", :package_name},
      {"package_version_id", :package_version_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a package version for the authenticated user\n\nGets a specific package version for a package owned by the authenticated user.\n\nOAuth app tokens and personal access tokens (classic) need the `read:packages` scope to use this endpoint. For more information, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages).\""
  @spec get_package_version_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_package_version_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_package_version_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_package_version_for_authenticated_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @get_package_version_for_authenticated_user_partition_spec
      )

    Pristine.Operation.new(%{
      id: "packages/get-package-version-for-authenticated-user",
      method: :get,
      path_template: "/user/packages/{package_type}/{package_name}/versions/{package_version_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :packages, :get_package_version_for_authenticated_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_package_version_for_organization_partition_spec %{
    path: [
      {"package_type", :package_type},
      {"package_name", :package_name},
      {"org", :org},
      {"package_version_id", :package_version_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a package version for an organization\n\nGets a specific package version in an organization.\n\nOAuth app tokens and personal access tokens (classic) need the `read:packages` scope to use this endpoint. For more information, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages).\""
  @spec get_package_version_for_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_package_version_for_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_package_version_for_organization_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_package_version_for_organization_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @get_package_version_for_organization_partition_spec)

    Pristine.Operation.new(%{
      id: "packages/get-package-version-for-organization",
      method: :get,
      path_template:
        "/orgs/{org}/packages/{package_type}/{package_name}/versions/{package_version_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :packages, :get_package_version_for_organization],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_package_version_for_user_partition_spec %{
    path: [
      {"package_type", :package_type},
      {"package_name", :package_name},
      {"package_version_id", :package_version_id},
      {"username", :username}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get a package version for a user\n\nGets a specific package version for a public package owned by a specified user.\n\nOAuth app tokens and personal access tokens (classic) need the `read:packages` scope to use this endpoint. For more information, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages).\""
  @spec get_package_version_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_package_version_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_package_version_for_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_package_version_for_user_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_package_version_for_user_partition_spec)

    Pristine.Operation.new(%{
      id: "packages/get-package-version-for-user",
      method: :get,
      path_template:
        "/users/{username}/packages/{package_type}/{package_name}/versions/{package_version_id}",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :packages, :get_package_version_for_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @list_docker_migration_conflicting_packages_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get list of conflicting packages during Docker migration for authenticated-user\n\nLists all packages that are owned by the authenticated user within the user's namespace, and that encountered a conflict during a Docker migration.\n\nOAuth app tokens and personal access tokens (classic) need the `read:packages` scope to use this endpoint."
  @spec list_docker_migration_conflicting_packages_for_authenticated_user(
          term(),
          map(),
          keyword()
        ) :: {:ok, term()} | {:error, term()}
  def list_docker_migration_conflicting_packages_for_authenticated_user(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    operation =
      build_list_docker_migration_conflicting_packages_for_authenticated_user_operation(params)

    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_docker_migration_conflicting_packages_for_authenticated_user(
          term(),
          map(),
          keyword()
        ) :: Enumerable.t()
  def stream_list_docker_migration_conflicting_packages_for_authenticated_user(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn ->
        build_list_docker_migration_conflicting_packages_for_authenticated_user_operation(params)
      end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          case Pristine.execute(runtime_client, operation, opts) do
            {:ok, response} ->
              items = List.wrap(Pristine.Operation.items(operation, response))
              {items, Pristine.Operation.next_page(operation, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_docker_migration_conflicting_packages_for_authenticated_user_operation(params)
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @list_docker_migration_conflicting_packages_for_authenticated_user_partition_spec
      )

    Pristine.Operation.new(%{
      id: "packages/list-docker-migration-conflicting-packages-for-authenticated-user",
      method: :get,
      path_template: "/user/docker/conflicts",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [
          :github_ex,
          :packages,
          :list_docker_migration_conflicting_packages_for_authenticated_user
        ],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: nil,
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
  end

  @list_docker_migration_conflicting_packages_for_organization_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get list of conflicting packages during Docker migration for organization\n\nLists all packages that are in a specific organization, are readable by the requesting user, and that encountered a conflict during a Docker migration.\n\nOAuth app tokens and personal access tokens (classic) need the `read:packages` scope to use this endpoint."
  @spec list_docker_migration_conflicting_packages_for_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_docker_migration_conflicting_packages_for_organization(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    operation =
      build_list_docker_migration_conflicting_packages_for_organization_operation(params)

    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_docker_migration_conflicting_packages_for_organization(
          term(),
          map(),
          keyword()
        ) :: Enumerable.t()
  def stream_list_docker_migration_conflicting_packages_for_organization(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn ->
        build_list_docker_migration_conflicting_packages_for_organization_operation(params)
      end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          case Pristine.execute(runtime_client, operation, opts) do
            {:ok, response} ->
              items = List.wrap(Pristine.Operation.items(operation, response))
              {items, Pristine.Operation.next_page(operation, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_docker_migration_conflicting_packages_for_organization_operation(params)
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @list_docker_migration_conflicting_packages_for_organization_partition_spec
      )

    Pristine.Operation.new(%{
      id: "packages/list-docker-migration-conflicting-packages-for-organization",
      method: :get,
      path_template: "/orgs/{org}/docker/conflicts",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [
          :github_ex,
          :packages,
          :list_docker_migration_conflicting_packages_for_organization
        ],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: nil,
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
  end

  @list_docker_migration_conflicting_packages_for_user_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Get list of conflicting packages during Docker migration for user\n\nLists all packages that are in a specific user's namespace, that the requesting user has access to, and that encountered a conflict during Docker migration.\n\nOAuth app tokens and personal access tokens (classic) need the `read:packages` scope to use this endpoint."
  @spec list_docker_migration_conflicting_packages_for_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_docker_migration_conflicting_packages_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_docker_migration_conflicting_packages_for_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_docker_migration_conflicting_packages_for_user(term(), map(), keyword()) ::
          Enumerable.t()
  def stream_list_docker_migration_conflicting_packages_for_user(
        client,
        params \\ %{},
        opts \\ []
      )
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_docker_migration_conflicting_packages_for_user_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          case Pristine.execute(runtime_client, operation, opts) do
            {:ok, response} ->
              items = List.wrap(Pristine.Operation.items(operation, response))
              {items, Pristine.Operation.next_page(operation, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_docker_migration_conflicting_packages_for_user_operation(params)
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @list_docker_migration_conflicting_packages_for_user_partition_spec
      )

    Pristine.Operation.new(%{
      id: "packages/list-docker-migration-conflicting-packages-for-user",
      method: :get,
      path_template: "/users/{username}/docker/conflicts",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [
          :github_ex,
          :packages,
          :list_docker_migration_conflicting_packages_for_user
        ],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: nil,
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
  end

  @list_packages_for_authenticated_user_partition_spec %{
    path: [],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"package_type", :package_type},
      {"visibility", :visibility},
      {"page", :page},
      {"per_page", :per_page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List packages for the authenticated user's namespace\n\nLists packages owned by the authenticated user within the user's namespace.\n\nOAuth app tokens and personal access tokens (classic) need the `read:packages` scope to use this endpoint. For more information, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages).\""
  @spec list_packages_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_packages_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_packages_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_packages_for_authenticated_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_packages_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_packages_for_authenticated_user_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          case Pristine.execute(runtime_client, operation, opts) do
            {:ok, response} ->
              items = List.wrap(Pristine.Operation.items(operation, response))
              {items, Pristine.Operation.next_page(operation, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_packages_for_authenticated_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @list_packages_for_authenticated_user_partition_spec)

    Pristine.Operation.new(%{
      id: "packages/list-packages-for-authenticated-user",
      method: :get,
      path_template: "/user/packages",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :packages, :list_packages_for_authenticated_user],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: nil,
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
  end

  @list_packages_for_organization_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"package_type", :package_type},
      {"visibility", :visibility},
      {"page", :page},
      {"per_page", :per_page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List packages for an organization\n\nLists packages in an organization readable by the user.\n\nOAuth app tokens and personal access tokens (classic) need the `read:packages` scope to use this endpoint. For more information, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages).\""
  @spec list_packages_for_organization(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def list_packages_for_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_packages_for_organization_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_packages_for_organization(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_packages_for_organization(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_packages_for_organization_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          case Pristine.execute(runtime_client, operation, opts) do
            {:ok, response} ->
              items = List.wrap(Pristine.Operation.items(operation, response))
              {items, Pristine.Operation.next_page(operation, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_packages_for_organization_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @list_packages_for_organization_partition_spec)

    Pristine.Operation.new(%{
      id: "packages/list-packages-for-organization",
      method: :get,
      path_template: "/orgs/{org}/packages",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :packages, :list_packages_for_organization],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: nil,
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
  end

  @list_packages_for_user_partition_spec %{
    path: [{"username", :username}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [
      {"package_type", :package_type},
      {"visibility", :visibility},
      {"page", :page},
      {"per_page", :per_page}
    ],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "List packages for a user\n\nLists all packages in a user's namespace for which the requesting user has access.\n\nOAuth app tokens and personal access tokens (classic) need the `read:packages` scope to use this endpoint. For more information, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages).\""
  @spec list_packages_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_packages_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_packages_for_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_packages_for_user(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_packages_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_packages_for_user_operation(params) end,
      fn
        nil ->
          {:halt, nil}

        %Pristine.Operation{} = operation ->
          case Pristine.execute(runtime_client, operation, opts) do
            {:ok, response} ->
              items = List.wrap(Pristine.Operation.items(operation, response))
              {items, Pristine.Operation.next_page(operation, response)}

            {:error, reason} ->
              raise "pagination failed: " <> inspect(reason)
          end
      end,
      fn _state -> :ok end
    )
  end

  defp build_list_packages_for_user_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_packages_for_user_partition_spec)

    Pristine.Operation.new(%{
      id: "packages/list-packages-for-user",
      method: :get,
      path_template: "/users/{username}/packages",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.read",
        telemetry_event: [:github_ex, :packages, :list_packages_for_user],
        timeout_ms: nil
      },
      pagination: %{
        default_limit: nil,
        items_path: nil,
        request_mapping: %{limit_param: "per_page"},
        response_mapping: %{link_header: "link"},
        strategy: :link_header
      }
    })
  end

  @restore_package_for_authenticated_user_partition_spec %{
    path: [{"package_type", :package_type}, {"package_name", :package_name}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"token", :token}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Restore a package for the authenticated user\n\nRestores a package owned by the authenticated user.\n\nYou can restore a deleted package under the following conditions:\n  - The package was deleted within the last 30 days.\n  - The same package namespace and version is still available and not reused for a new package. If the same package namespace is not available, you will not be able to restore your package. In this scenario, to restore the deleted package, you must delete the new package that uses the deleted package's namespace first.\n\nOAuth app tokens and personal access tokens (classic) need the `read:packages` and `write:packages` scopes to use this endpoint. For more information, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages).\""
  @spec restore_package_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def restore_package_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_restore_package_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_restore_package_for_authenticated_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @restore_package_for_authenticated_user_partition_spec)

    Pristine.Operation.new(%{
      id: "packages/restore-package-for-authenticated-user",
      method: :post,
      path_template: "/user/packages/{package_type}/{package_name}/restore",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :packages, :restore_package_for_authenticated_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @restore_package_for_org_partition_spec %{
    path: [
      {"package_type", :package_type},
      {"package_name", :package_name},
      {"org", :org}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"token", :token}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Restore a package for an organization\n\nRestores an entire package in an organization.\n\nYou can restore a deleted package under the following conditions:\n  - The package was deleted within the last 30 days.\n  - The same package namespace and version is still available and not reused for a new package. If the same package namespace is not available, you will not be able to restore your package. In this scenario, to restore the deleted package, you must delete the new package that uses the deleted package's namespace first.\n\nThe authenticated user must have admin permissions in the organization to use this endpoint. If the `package_type` belongs to a GitHub Packages registry that supports granular permissions, the authenticated user must also have admin permissions to the package. For the list of these registries, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#granular-permissions-for-userorganization-scoped-packages).\"\n\nOAuth app tokens and personal access tokens (classic) need the `read:packages` and `write:packages` scopes to use this endpoint. For more information, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages).\""
  @spec restore_package_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def restore_package_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_restore_package_for_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_restore_package_for_org_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @restore_package_for_org_partition_spec)

    Pristine.Operation.new(%{
      id: "packages/restore-package-for-org",
      method: :post,
      path_template: "/orgs/{org}/packages/{package_type}/{package_name}/restore",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :packages, :restore_package_for_org],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @restore_package_for_user_partition_spec %{
    path: [
      {"package_type", :package_type},
      {"package_name", :package_name},
      {"username", :username}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [{"token", :token}],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Restore a package for a user\n\nRestores an entire package for a user.\n\nYou can restore a deleted package under the following conditions:\n  - The package was deleted within the last 30 days.\n  - The same package namespace and version is still available and not reused for a new package. If the same package namespace is not available, you will not be able to restore your package. In this scenario, to restore the deleted package, you must delete the new package that uses the deleted package's namespace first.\n\nIf the `package_type` belongs to a GitHub Packages registry that supports granular permissions, the authenticated user must have admin permissions to the package. For the list of these registries, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#granular-permissions-for-userorganization-scoped-packages).\"\n\nOAuth app tokens and personal access tokens (classic) need the `read:packages` and `write:packages` scopes to use this endpoint. For more information, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages).\""
  @spec restore_package_for_user(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def restore_package_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_restore_package_for_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_restore_package_for_user_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @restore_package_for_user_partition_spec)

    Pristine.Operation.new(%{
      id: "packages/restore-package-for-user",
      method: :post,
      path_template: "/users/{username}/packages/{package_type}/{package_name}/restore",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :packages, :restore_package_for_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @restore_package_version_for_authenticated_user_partition_spec %{
    path: [
      {"package_type", :package_type},
      {"package_name", :package_name},
      {"package_version_id", :package_version_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Restore a package version for the authenticated user\n\nRestores a package version owned by the authenticated user.\n\nYou can restore a deleted package version under the following conditions:\n  - The package was deleted within the last 30 days.\n  - The same package namespace and version is still available and not reused for a new package. If the same package namespace is not available, you will not be able to restore your package. In this scenario, to restore the deleted package, you must delete the new package that uses the deleted package's namespace first.\n\nOAuth app tokens and personal access tokens (classic) need the `read:packages` and `write:packages` scopes to use this endpoint. For more information, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages).\""
  @spec restore_package_version_for_authenticated_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def restore_package_version_for_authenticated_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_restore_package_version_for_authenticated_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_restore_package_version_for_authenticated_user_operation(params)
       when is_map(params) do
    partition =
      Pristine.Operation.partition(
        params,
        @restore_package_version_for_authenticated_user_partition_spec
      )

    Pristine.Operation.new(%{
      id: "packages/restore-package-version-for-authenticated-user",
      method: :post,
      path_template:
        "/user/packages/{package_type}/{package_name}/versions/{package_version_id}/restore",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :packages, :restore_package_version_for_authenticated_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @restore_package_version_for_org_partition_spec %{
    path: [
      {"package_type", :package_type},
      {"package_name", :package_name},
      {"org", :org},
      {"package_version_id", :package_version_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Restore package version for an organization\n\nRestores a specific package version in an organization.\n\nYou can restore a deleted package under the following conditions:\n  - The package was deleted within the last 30 days.\n  - The same package namespace and version is still available and not reused for a new package. If the same package namespace is not available, you will not be able to restore your package. In this scenario, to restore the deleted package, you must delete the new package that uses the deleted package's namespace first.\n\nThe authenticated user must have admin permissions in the organization to use this endpoint. If the `package_type` belongs to a GitHub Packages registry that supports granular permissions, the authenticated user must also have admin permissions to the package. For the list of these registries, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#granular-permissions-for-userorganization-scoped-packages).\"\n\nOAuth app tokens and personal access tokens (classic) need the `read:packages` and `write:packages` scopes to use this endpoint. For more information, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages).\""
  @spec restore_package_version_for_org(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def restore_package_version_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_restore_package_version_for_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_restore_package_version_for_org_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @restore_package_version_for_org_partition_spec)

    Pristine.Operation.new(%{
      id: "packages/restore-package-version-for-org",
      method: :post,
      path_template:
        "/orgs/{org}/packages/{package_type}/{package_name}/versions/{package_version_id}/restore",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :packages, :restore_package_version_for_org],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @restore_package_version_for_user_partition_spec %{
    path: [
      {"package_type", :package_type},
      {"package_name", :package_name},
      {"username", :username},
      {"package_version_id", :package_version_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    query: [],
    headers: [],
    form_data: %{mode: :none}
  }

  @doc "Restore package version for a user\n\nRestores a specific package version for a user.\n\nYou can restore a deleted package under the following conditions:\n  - The package was deleted within the last 30 days.\n  - The same package namespace and version is still available and not reused for a new package. If the same package namespace is not available, you will not be able to restore your package. In this scenario, to restore the deleted package, you must delete the new package that uses the deleted package's namespace first.\n\nIf the `package_type` belongs to a GitHub Packages registry that supports granular permissions, the authenticated user must have admin permissions to the package. For the list of these registries, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#granular-permissions-for-userorganization-scoped-packages).\"\n\nOAuth app tokens and personal access tokens (classic) need the `read:packages` and `write:packages` scopes to use this endpoint. For more information, see \"[About permissions for GitHub Packages](https://docs.github.com/packages/learn-github-packages/about-permissions-for-github-packages#permissions-for-repository-scoped-packages).\""
  @spec restore_package_version_for_user(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def restore_package_version_for_user(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_restore_package_version_for_user_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_restore_package_version_for_user_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @restore_package_version_for_user_partition_spec)

    Pristine.Operation.new(%{
      id: "packages/restore-package-version-for-user",
      method: :post,
      path_template:
        "/users/{username}/packages/{package_type}/{package_name}/versions/{package_version_id}/restore",
      path_params: partition.path_params,
      query: partition.query,
      headers: partition.headers,
      body: partition.body,
      form_data: partition.form_data,
      request_schema: nil,
      response_schemas: %{},
      auth: %{
        use_client_default?: true,
        override: partition.auth,
        security_schemes: ["githubToken"]
      },
      runtime: %{
        circuit_breaker: "core_api",
        rate_limit_group: "github.integration",
        resource: "core_api",
        retry_group: "github.write",
        telemetry_event: [:github_ex, :packages, :restore_package_version_for_user],
        timeout_ms: nil
      },
      pagination: nil
    })
  end
end

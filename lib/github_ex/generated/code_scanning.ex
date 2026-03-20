defmodule GitHubEx.CodeScanning do
  @moduledoc """
  Generated Github Ex operations for code scanning.
  """

  @commit_autofix_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"alert_number", :alert_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Commit an autofix for a code scanning alert\n\nCommits an autofix for a code scanning alert.\n\nIf an autofix is committed as a result of this request, then this endpoint will return a 201 Created response.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories."
  @spec commit_autofix(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def commit_autofix(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_commit_autofix_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_commit_autofix_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @commit_autofix_partition_spec)

    Pristine.Operation.new(%{
      id: "code-scanning/commit-autofix",
      method: :post,
      path_template: "/repos/{owner}/{repo}/code-scanning/alerts/{alert_number}/autofix/commits",
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
        telemetry_event: [:github_ex, :code_scanning, :commit_autofix],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @create_autofix_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"alert_number", :alert_number}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Create an autofix for a code scanning alert\n\nCreates an autofix for a code scanning alert.\n\nIf a new autofix is to be created as a result of this request or is currently being generated, then this endpoint will return a 202 Accepted response.\n\nIf an autofix already exists for a given alert, then this endpoint will return a 200 OK response.\n\nOAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories."
  @spec create_autofix(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_autofix(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_create_autofix_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_create_autofix_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @create_autofix_partition_spec)

    Pristine.Operation.new(%{
      id: "code-scanning/create-autofix",
      method: :post,
      path_template: "/repos/{owner}/{repo}/code-scanning/alerts/{alert_number}/autofix",
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
        telemetry_event: [:github_ex, :code_scanning, :create_autofix],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @create_variant_analysis_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Create a CodeQL variant analysis\n\nCreates a new CodeQL variant analysis, which will run a CodeQL query against one or more repositories.\n\nGet started by learning more about [running CodeQL queries at scale with Multi-Repository Variant Analysis](https://docs.github.com/code-security/codeql-for-vs-code/getting-started-with-codeql-for-vs-code/running-codeql-queries-at-scale-with-multi-repository-variant-analysis).\n\nUse the `owner` and `repo` parameters in the URL to specify the controller repository that\nwill be used for running GitHub Actions workflows and storing the results of the CodeQL variant analysis.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint."
  @spec create_variant_analysis(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def create_variant_analysis(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_create_variant_analysis_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_create_variant_analysis_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @create_variant_analysis_partition_spec)

    Pristine.Operation.new(%{
      id: "code-scanning/create-variant-analysis",
      method: :post,
      path_template: "/repos/{owner}/{repo}/code-scanning/codeql/variant-analyses",
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
        telemetry_event: [:github_ex, :code_scanning, :create_variant_analysis],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_analysis_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"analysis_id", :analysis_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"confirm_delete", :confirm_delete}],
    headers: []
  }

  @doc "Delete a code scanning analysis from a repository\n\nDeletes a specified code scanning analysis from a repository.\n\nYou can delete one analysis at a time.\nTo delete a series of analyses, start with the most recent analysis and work backwards.\nConceptually, the process is similar to the undo function in a text editor.\n\nWhen you list the analyses for a repository,\none or more will be identified as deletable in the response:\n\n```\n\"deletable\": true\n```\n\nAn analysis is deletable when it's the most recent in a set of analyses.\nTypically, a repository will have multiple sets of analyses\nfor each enabled code scanning tool,\nwhere a set is determined by a unique combination of analysis values:\n\n* `ref`\n* `tool`\n* `category`\n\nIf you attempt to delete an analysis that is not the most recent in a set,\nyou'll get a 400 response with the message:\n\n```\nAnalysis specified is not deletable.\n```\n\nThe response from a successful `DELETE` operation provides you with\ntwo alternative URLs for deleting the next analysis in the set:\n`next_analysis_url` and `confirm_delete_url`.\nUse the `next_analysis_url` URL if you want to avoid accidentally deleting the final analysis\nin a set. This is a useful option if you want to preserve at least one analysis\nfor the specified tool in your repository.\nUse the `confirm_delete_url` URL if you are content to remove all analyses for a tool.\nWhen you delete the last analysis in a set, the value of `next_analysis_url` and `confirm_delete_url`\nin the 200 response is `null`.\n\nAs an example of the deletion process,\nlet's imagine that you added a workflow that configured a particular code scanning tool\nto analyze the code in a repository. This tool has added 15 analyses:\n10 on the default branch, and another 5 on a topic branch.\nYou therefore have two separate sets of analyses for this tool.\nYou've now decided that you want to remove all of the analyses for the tool.\nTo do this you must make 15 separate deletion requests.\nTo start, you must find an analysis that's identified as deletable.\nEach set of analyses always has one that's identified as deletable.\nHaving found the deletable analysis for one of the two sets,\ndelete this analysis and then continue deleting the next analysis in the set until they're all deleted.\nThen repeat the process for the second set.\nThe procedure therefore consists of a nested loop:\n\n**Outer loop**:\n* List the analyses for the repository, filtered by tool.\n* Parse this list to find a deletable analysis. If found:\n\n  **Inner loop**:\n  * Delete the identified analysis.\n  * Parse the response for the value of `confirm_delete_url` and, if found, use this in the next iteration.\n\nThe above process assumes that you want to remove all trace of the tool's analyses from the GitHub user interface, for the specified repository, and it therefore uses the `confirm_delete_url` value. Alternatively, you could use the `next_analysis_url` value, which would leave the last analysis in each set undeleted to avoid removing a tool's analysis entirely.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories."
  @spec delete_analysis(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_analysis(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_delete_analysis_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_delete_analysis_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_analysis_partition_spec)

    Pristine.Operation.new(%{
      id: "code-scanning/delete-analysis",
      method: :delete,
      path_template: "/repos/{owner}/{repo}/code-scanning/analyses/{analysis_id}",
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
        telemetry_event: [:github_ex, :code_scanning, :delete_analysis],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @delete_codeql_database_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"language", :language}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Delete a CodeQL database\n\nDeletes a CodeQL database for a language in a repository.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories."
  @spec delete_codeql_database(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def delete_codeql_database(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_delete_codeql_database_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_delete_codeql_database_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @delete_codeql_database_partition_spec)

    Pristine.Operation.new(%{
      id: "code-scanning/delete-codeql-database",
      method: :delete,
      path_template: "/repos/{owner}/{repo}/code-scanning/codeql/databases/{language}",
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
        telemetry_event: [:github_ex, :code_scanning, :delete_codeql_database],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_alert_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"alert_number", :alert_number}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get a code scanning alert\n\nGets a single code scanning alert.\n\nOAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories."
  @spec get_alert(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_alert(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_alert_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_alert_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_alert_partition_spec)

    Pristine.Operation.new(%{
      id: "code-scanning/get-alert",
      method: :get,
      path_template: "/repos/{owner}/{repo}/code-scanning/alerts/{alert_number}",
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
        telemetry_event: [:github_ex, :code_scanning, :get_alert],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_analysis_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"analysis_id", :analysis_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get a code scanning analysis for a repository\n\nGets a specified code scanning analysis for a repository.\n\nThe default JSON response contains fields that describe the analysis.\nThis includes the Git reference and commit SHA to which the analysis relates,\nthe datetime of the analysis, the name of the code scanning tool,\nand the number of alerts.\n\nThe `rules_count` field in the default response give the number of rules\nthat were run in the analysis.\nFor very old analyses this data is not available,\nand `0` is returned in this field.\n\nThis endpoint supports the following custom media types. For more information, see \"[Media types](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types).\"\n\n- **`application/sarif+json`**: Instead of returning a summary of the analysis, this endpoint returns a subset of the analysis data that was uploaded. The data is formatted as [SARIF version 2.1.0](https://docs.oasis-open.org/sarif/sarif/v2.1.0/cs01/sarif-v2.1.0-cs01.html). It also returns additional data such as the `github/alertNumber` and `github/alertUrl` properties.\n\nOAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories."
  @spec get_analysis(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_analysis(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_analysis_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_analysis_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_analysis_partition_spec)

    Pristine.Operation.new(%{
      id: "code-scanning/get-analysis",
      method: :get,
      path_template: "/repos/{owner}/{repo}/code-scanning/analyses/{analysis_id}",
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
        telemetry_event: [:github_ex, :code_scanning, :get_analysis],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_autofix_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"alert_number", :alert_number}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get the status of an autofix for a code scanning alert\n\nGets the status and description of an autofix for a code scanning alert.\n\nOAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories."
  @spec get_autofix(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_autofix(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_autofix_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_autofix_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_autofix_partition_spec)

    Pristine.Operation.new(%{
      id: "code-scanning/get-autofix",
      method: :get,
      path_template: "/repos/{owner}/{repo}/code-scanning/alerts/{alert_number}/autofix",
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
        telemetry_event: [:github_ex, :code_scanning, :get_autofix],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_codeql_database_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"language", :language}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get a CodeQL database for a repository\n\nGets a CodeQL database for a language in a repository.\n\nBy default this endpoint returns JSON metadata about the CodeQL database. To\ndownload the CodeQL database binary content, set the `Accept` header of the request\nto [`application/zip`](https://docs.github.com/rest/using-the-rest-api/getting-started-with-the-rest-api#media-types), and make sure\nyour HTTP client is configured to follow redirects or use the `Location` header\nto make a second request to get the redirect URL.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories."
  @spec get_codeql_database(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_codeql_database(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_codeql_database_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_codeql_database_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_codeql_database_partition_spec)

    Pristine.Operation.new(%{
      id: "code-scanning/get-codeql-database",
      method: :get,
      path_template: "/repos/{owner}/{repo}/code-scanning/codeql/databases/{language}",
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
        telemetry_event: [:github_ex, :code_scanning, :get_codeql_database],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_default_setup_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get a code scanning default setup configuration\n\nGets a code scanning default setup configuration.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories."
  @spec get_default_setup(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_default_setup(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_default_setup_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_default_setup_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_default_setup_partition_spec)

    Pristine.Operation.new(%{
      id: "code-scanning/get-default-setup",
      method: :get,
      path_template: "/repos/{owner}/{repo}/code-scanning/default-setup",
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
        telemetry_event: [:github_ex, :code_scanning, :get_default_setup],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_sarif_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"sarif_id", :sarif_id}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get information about a SARIF upload\n\nGets information about a SARIF upload, including the status and the URL of the analysis that was uploaded so that you can retrieve details of the analysis. For more information, see \"[Get a code scanning analysis for a repository](/rest/code-scanning/code-scanning#get-a-code-scanning-analysis-for-a-repository).\"\nOAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories."
  @spec get_sarif(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_sarif(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_sarif_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_sarif_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_sarif_partition_spec)

    Pristine.Operation.new(%{
      id: "code-scanning/get-sarif",
      method: :get,
      path_template: "/repos/{owner}/{repo}/code-scanning/sarifs/{sarif_id}",
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
        telemetry_event: [:github_ex, :code_scanning, :get_sarif],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_variant_analysis_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"codeql_variant_analysis_id", :codeql_variant_analysis_id}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get the summary of a CodeQL variant analysis\n\nGets the summary of a CodeQL variant analysis.\n\nOAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories."
  @spec get_variant_analysis(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def get_variant_analysis(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_variant_analysis_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_variant_analysis_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @get_variant_analysis_partition_spec)

    Pristine.Operation.new(%{
      id: "code-scanning/get-variant-analysis",
      method: :get,
      path_template:
        "/repos/{owner}/{repo}/code-scanning/codeql/variant-analyses/{codeql_variant_analysis_id}",
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
        telemetry_event: [:github_ex, :code_scanning, :get_variant_analysis],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @get_variant_analysis_repo_task_partition_spec %{
    path: [
      {"owner", :owner},
      {"repo", :repo},
      {"codeql_variant_analysis_id", :codeql_variant_analysis_id},
      {"repo_owner", :repo_owner},
      {"repo_name", :repo_name}
    ],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Get the analysis status of a repository in a CodeQL variant analysis\n\nGets the analysis status of a repository in a CodeQL variant analysis.\n\nOAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories."
  @spec get_variant_analysis_repo_task(term(), map(), keyword()) ::
          {:ok, term()} | {:error, term()}
  def get_variant_analysis_repo_task(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_get_variant_analysis_repo_task_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_get_variant_analysis_repo_task_operation(params) when is_map(params) do
    partition =
      Pristine.Operation.partition(params, @get_variant_analysis_repo_task_partition_spec)

    Pristine.Operation.new(%{
      id: "code-scanning/get-variant-analysis-repo-task",
      method: :get,
      path_template:
        "/repos/{owner}/{repo}/code-scanning/codeql/variant-analyses/{codeql_variant_analysis_id}/repos/{repo_owner}/{repo_name}",
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
        telemetry_event: [:github_ex, :code_scanning, :get_variant_analysis_repo_task],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @list_alert_instances_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"alert_number", :alert_number}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [{"page", :page}, {"per_page", :per_page}, {"ref", :ref}, {"pr", :pr}],
    headers: []
  }

  @doc "List instances of a code scanning alert\n\nLists all instances of the specified code scanning alert.\n\nOAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories."
  @spec list_alert_instances(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_alert_instances(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_alert_instances_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_alert_instances(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_alert_instances(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_alert_instances_operation(params) end,
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

  defp build_list_alert_instances_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_alert_instances_partition_spec)

    Pristine.Operation.new(%{
      id: "code-scanning/list-alert-instances",
      method: :get,
      path_template: "/repos/{owner}/{repo}/code-scanning/alerts/{alert_number}/instances",
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
        telemetry_event: [:github_ex, :code_scanning, :list_alert_instances],
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

  @list_alerts_for_org_partition_spec %{
    path: [{"org", :org}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [
      {"tool_name", :tool_name},
      {"tool_guid", :tool_guid},
      {"before", :before},
      {"after", :after},
      {"page", :page},
      {"per_page", :per_page},
      {"direction", :direction},
      {"state", :state},
      {"sort", :sort},
      {"severity", :severity},
      {"assignees", :assignees}
    ],
    headers: []
  }

  @doc "List code scanning alerts for an organization\n\nLists code scanning alerts for the default branch for all eligible repositories in an organization. Eligible repositories are repositories that are owned by organizations that you own or for which you are a security manager. For more information, see \"[Managing security managers in your organization](https://docs.github.com/organizations/managing-peoples-access-to-your-organization-with-roles/managing-security-managers-in-your-organization).\"\n\nThe authenticated user must be an owner or security manager for the organization to use this endpoint.\n\nOAuth app tokens and personal access tokens (classic) need the `security_events` or `repo`s cope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories."
  @spec list_alerts_for_org(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_alerts_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_alerts_for_org_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_alerts_for_org(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_alerts_for_org(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_alerts_for_org_operation(params) end,
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

  defp build_list_alerts_for_org_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_alerts_for_org_partition_spec)

    Pristine.Operation.new(%{
      id: "code-scanning/list-alerts-for-org",
      method: :get,
      path_template: "/orgs/{org}/code-scanning/alerts",
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
        telemetry_event: [:github_ex, :code_scanning, :list_alerts_for_org],
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

  @list_alerts_for_repo_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [
      {"tool_name", :tool_name},
      {"tool_guid", :tool_guid},
      {"page", :page},
      {"per_page", :per_page},
      {"ref", :ref},
      {"pr", :pr},
      {"direction", :direction},
      {"before", :before},
      {"after", :after},
      {"sort", :sort},
      {"state", :state},
      {"severity", :severity},
      {"assignees", :assignees}
    ],
    headers: []
  }

  @doc "List code scanning alerts for a repository\n\nLists code scanning alerts.\n\nThe response includes a `most_recent_instance` object.\nThis provides details of the most recent instance of this alert\nfor the default branch (or for the specified Git reference if you used `ref` in the request).\n\nOAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories."
  @spec list_alerts_for_repo(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_alerts_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_alerts_for_repo_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_alerts_for_repo(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_alerts_for_repo(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_alerts_for_repo_operation(params) end,
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

  defp build_list_alerts_for_repo_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_alerts_for_repo_partition_spec)

    Pristine.Operation.new(%{
      id: "code-scanning/list-alerts-for-repo",
      method: :get,
      path_template: "/repos/{owner}/{repo}/code-scanning/alerts",
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
        telemetry_event: [:github_ex, :code_scanning, :list_alerts_for_repo],
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

  @list_codeql_databases_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "List CodeQL databases for a repository\n\nLists the CodeQL databases that are available in a repository.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories."
  @spec list_codeql_databases(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_codeql_databases(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_codeql_databases_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_codeql_databases(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_codeql_databases(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_codeql_databases_operation(params) end,
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

  defp build_list_codeql_databases_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_codeql_databases_partition_spec)

    Pristine.Operation.new(%{
      id: "code-scanning/list-codeql-databases",
      method: :get,
      path_template: "/repos/{owner}/{repo}/code-scanning/codeql/databases",
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
        telemetry_event: [:github_ex, :code_scanning, :list_codeql_databases],
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

  @list_recent_analyses_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :none},
    form_data: %{mode: :none},
    query: [
      {"tool_name", :tool_name},
      {"tool_guid", :tool_guid},
      {"page", :page},
      {"per_page", :per_page},
      {"pr", :pr},
      {"ref", :ref},
      {"sarif_id", :sarif_id},
      {"direction", :direction},
      {"sort", :sort}
    ],
    headers: []
  }

  @doc "List code scanning analyses for a repository\n\nLists the details of all code scanning analyses for a repository,\nstarting with the most recent.\nThe response is paginated and you can use the `page` and `per_page` parameters\nto list the analyses you're interested in.\nBy default 30 analyses are listed per page.\n\nThe `rules_count` field in the response give the number of rules\nthat were run in the analysis.\nFor very old analyses this data is not available,\nand `0` is returned in this field.\n\n> [!WARNING]\n> **Closing down notice:** The `tool_name` field is closing down and will, in future, not be included in the response for this endpoint. The example response reflects this change. The tool name can now be found inside the `tool` field.\n\nOAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories."
  @spec list_recent_analyses(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def list_recent_analyses(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_list_recent_analyses_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  @spec stream_list_recent_analyses(term(), map(), keyword()) :: Enumerable.t()
  def stream_list_recent_analyses(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)

    Stream.resource(
      fn -> build_list_recent_analyses_operation(params) end,
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

  defp build_list_recent_analyses_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @list_recent_analyses_partition_spec)

    Pristine.Operation.new(%{
      id: "code-scanning/list-recent-analyses",
      method: :get,
      path_template: "/repos/{owner}/{repo}/code-scanning/analyses",
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
        telemetry_event: [:github_ex, :code_scanning, :list_recent_analyses],
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

  @update_alert_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}, {"alert_number", :alert_number}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Update a code scanning alert\n\nUpdates the status of a single code scanning alert.\nOAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories."
  @spec update_alert(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_alert(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_update_alert_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_update_alert_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @update_alert_partition_spec)

    Pristine.Operation.new(%{
      id: "code-scanning/update-alert",
      method: :patch,
      path_template: "/repos/{owner}/{repo}/code-scanning/alerts/{alert_number}",
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
        telemetry_event: [:github_ex, :code_scanning, :update_alert],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @update_default_setup_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Update a code scanning default setup configuration\n\nUpdates a code scanning default setup configuration.\n\nOAuth app tokens and personal access tokens (classic) need the `repo` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories."
  @spec update_default_setup(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def update_default_setup(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_update_default_setup_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_update_default_setup_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @update_default_setup_partition_spec)

    Pristine.Operation.new(%{
      id: "code-scanning/update-default-setup",
      method: :patch,
      path_template: "/repos/{owner}/{repo}/code-scanning/default-setup",
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
        telemetry_event: [:github_ex, :code_scanning, :update_default_setup],
        timeout_ms: nil
      },
      pagination: nil
    })
  end

  @upload_sarif_partition_spec %{
    path: [{"owner", :owner}, {"repo", :repo}],
    auth: {"auth", :auth},
    body: %{mode: :remaining},
    form_data: %{mode: :none},
    query: [],
    headers: []
  }

  @doc "Upload an analysis as SARIF data\n\nUploads SARIF data containing the results of a code scanning analysis to make the results available in a repository. For troubleshooting information, see \"[Troubleshooting SARIF uploads](https://docs.github.com/code-security/code-scanning/troubleshooting-sarif).\"\n\nThere are two places where you can upload code scanning results.\n - If you upload to a pull request, for example `--ref refs/pull/42/merge` or `--ref refs/pull/42/head`, then the results appear as alerts in a pull request check. For more information, see \"[Triaging code scanning alerts in pull requests](/code-security/secure-coding/triaging-code-scanning-alerts-in-pull-requests).\"\n - If you upload to a branch, for example `--ref refs/heads/my-branch`, then the results appear in the **Security** tab for your repository. For more information, see \"[Managing code scanning alerts for your repository](/code-security/secure-coding/managing-code-scanning-alerts-for-your-repository#viewing-the-alerts-for-a-repository).\"\n\nYou must compress the SARIF-formatted analysis data that you want to upload, using `gzip`, and then encode it as a Base64 format string. For example:\n\n```\ngzip -c analysis-data.sarif | base64 -w0\n```\n\nSARIF upload supports a maximum number of entries per the following data objects, and an analysis will be rejected if any of these objects is above its maximum value. For some objects, there are additional values over which the entries will be ignored while keeping the most important entries whenever applicable.\nTo get the most out of your analysis when it includes data above the supported limits, try to optimize the analysis configuration. For example, for the CodeQL tool, identify and remove the most noisy queries. For more information, see \"[SARIF results exceed one or more limits](https://docs.github.com/code-security/code-scanning/troubleshooting-sarif/results-exceed-limit).\"\n\n\n| **SARIF data**                   | **Maximum values** | **Additional limits**                                                            |\n|----------------------------------|:------------------:|----------------------------------------------------------------------------------|\n| Runs per file                    |         20         |                                                                                  |\n| Results per run                  |       25,000       | Only the top 5,000 results will be included, prioritized by severity.            |\n| Rules per run                    |       25,000       |                                                                                  |\n| Tool extensions per run          |        100         |                                                                                  |\n| Thread Flow Locations per result |       10,000       | Only the top 1,000 Thread Flow Locations will be included, using prioritization. |\n| Location per result\t             |       1,000        | Only 100 locations will be included.                                             |\n| Tags per rule\t                   |         20         | Only 10 tags will be included.                                                   |\n\n\nThe `202 Accepted` response includes an `id` value.\nYou can use this ID to check the status of the upload by using it in the `/sarifs/{sarif_id}` endpoint.\nFor more information, see \"[Get information about a SARIF upload](/rest/code-scanning/code-scanning#get-information-about-a-sarif-upload).\"\n\nOAuth app tokens and personal access tokens (classic) need the `security_events` scope to use this endpoint with private or public repositories, or the `public_repo` scope to use this endpoint with only public repositories.\n\nThis endpoint is limited to 1,000 requests per hour for each user or app installation calling it."
  @spec upload_sarif(term(), map(), keyword()) :: {:ok, term()} | {:error, term()}
  def upload_sarif(client, params \\ %{}, opts \\ [])
      when is_map(params) and is_list(opts) do
    runtime_client = GitHubEx.Client.pristine_client(client)
    operation = build_upload_sarif_operation(params)
    Pristine.execute(runtime_client, operation, opts)
  end

  defp build_upload_sarif_operation(params) when is_map(params) do
    partition = Pristine.Operation.partition(params, @upload_sarif_partition_spec)

    Pristine.Operation.new(%{
      id: "code-scanning/upload-sarif",
      method: :post,
      path_template: "/repos/{owner}/{repo}/code-scanning/sarifs",
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
        telemetry_event: [:github_ex, :code_scanning, :upload_sarif],
        timeout_ms: nil
      },
      pagination: nil
    })
  end
end

defmodule GitHubEx.Client do
  @moduledoc """
  Thin GitHub client configuration layered on top of Pristine runtime execution.
  """

  alias GitHubEx.Auth
  alias Pristine.Client, as: RuntimeClient
  alias Pristine.Operation
  alias Pristine.SDK.Context
  alias Pristine.SDK.OpenAPI.Client, as: OpenAPIClient

  @default_accept "application/vnd.github+json"
  @default_api_version "2026-03-10"
  @default_base_url "https://api.github.com"
  @default_breaker_group "core_api"
  @default_timeout_ms 60_000
  @default_retry %{
    initial_retry_delay_ms: 1_000,
    max_retries: 2,
    max_retry_delay_ms: 60_000
  }
  @retry_groups [
    "github.app_auth",
    "github.delete",
    "github.oauth",
    "github.read",
    "github.write"
  ]

  @type retry_settings :: %{
          required(:initial_retry_delay_ms) => pos_integer(),
          required(:max_retries) => non_neg_integer(),
          required(:max_retry_delay_ms) => pos_integer()
        }

  @type retry_config :: false | retry_settings()

  @type auth_override ::
          false
          | String.t()
          | {module(), keyword()}
          | [{module(), keyword()}]
          | map()
          | nil

  @type oauth2_config ::
          [
            {:token_source, {module(), keyword()} | module()}
            | {:allow_stale?, boolean()}
          ]

  @type generated_request_t :: %{
          required(:method) => atom(),
          required(:path_template) => String.t(),
          optional(:id) => String.t() | nil,
          optional(:path_params) => map(),
          optional(:query) => map(),
          optional(:body) => term() | nil,
          optional(:form_data) => term() | nil,
          optional(:headers) => map(),
          optional(:auth) => auth_override(),
          optional(:request_schema) => term() | nil,
          optional(:response_schemas) => map(),
          optional(:security) => [map()] | nil,
          optional(:resource) => String.t() | nil,
          optional(:retry) => String.t() | nil,
          optional(:circuit_breaker) => String.t() | nil,
          optional(:rate_limit) => String.t() | nil,
          optional(:telemetry) => term(),
          optional(:timeout) => pos_integer() | nil,
          optional(:typed_responses) => boolean(),
          optional(:opts) => keyword(),
          optional(:args) => map(),
          optional(:call) => {module(), atom()},
          optional(:pagination) => map() | nil
        }

  @type raw_request_t :: %{
          required(:method) => atom(),
          required(:path) => String.t(),
          optional(:path_params) => map(),
          optional(:query) => map(),
          optional(:body) => term() | nil,
          optional(:form_data) => term() | nil,
          optional(:headers) => map(),
          optional(:auth) => auth_override(),
          optional(:security) => [map()] | nil,
          optional(:request_schema) => term() | nil,
          optional(:response_schema) => term() | nil,
          optional(:id) => String.t() | nil,
          optional(:typed_responses) => boolean(),
          optional(:circuit_breaker) => String.t() | nil,
          optional(:rate_limit) => String.t() | nil,
          optional(:resource) => String.t() | nil,
          optional(:retry) => String.t() | nil,
          optional(:retry_opts) => keyword(),
          optional(:telemetry) => term(),
          optional(:timeout) => pos_integer() | nil,
          optional(:opts) => keyword(),
          optional(:use_default_auth) => boolean()
        }

  @type request_t :: raw_request_t()

  @type t :: %__MODULE__{
          accept: String.t(),
          api_version: String.t(),
          auth: auth_override(),
          base_url: String.t() | nil,
          context: Context.t() | nil,
          foundation: keyword() | nil,
          log_level: :debug | :info | :warn | :error | nil,
          logger: (atom(), String.t(), map() -> term()) | nil,
          oauth2: oauth2_config() | nil,
          pristine_client: RuntimeClient.t() | nil,
          retry: retry_config(),
          timeout_ms: pos_integer(),
          transport: module() | nil,
          transport_opts: keyword(),
          typed_responses: boolean(),
          user_agent: String.t()
        }

  defstruct [
    :accept,
    :api_version,
    :auth,
    :base_url,
    :context,
    :foundation,
    :log_level,
    :logger,
    :oauth2,
    :pristine_client,
    :retry,
    :timeout_ms,
    :transport,
    :transport_opts,
    :typed_responses,
    :user_agent
  ]

  @spec default_api_version() :: String.t()
  def default_api_version, do: @default_api_version

  @spec new(String.t(), keyword()) :: t()
  def new(auth, opts) when is_binary(auth) and is_list(opts) do
    new(Keyword.put(opts, :auth, auth))
  end

  @spec new(keyword()) :: t()
  def new(opts \\ []) when is_list(opts) do
    auth = Keyword.get(opts, :auth)
    oauth2 = normalize_oauth2(Keyword.get(opts, :oauth2))
    base_url = Keyword.get(opts, :base_url, config(:base_url, @default_base_url))
    api_version = Keyword.get(opts, :api_version, config(:api_version, @default_api_version))
    timeout_ms = Keyword.get(opts, :timeout_ms, config(:timeout_ms, @default_timeout_ms))
    typed_responses = Keyword.get(opts, :typed_responses, false)
    log_level = Keyword.get(opts, :log_level, :warn)
    logger = Keyword.get(opts, :logger)

    transport =
      Keyword.get(opts, :transport, config(:transport, Pristine.Adapters.Transport.Finch))

    transport_opts =
      normalize_transport_opts(
        transport,
        Keyword.get(opts, :transport_opts, []),
        Keyword.get(opts, :finch, GitHubEx.Finch)
      )

    client = %__MODULE__{
      accept: Keyword.get(opts, :accept, @default_accept),
      api_version: api_version,
      auth: normalize_auth(auth),
      base_url: base_url,
      foundation: normalize_foundation(Keyword.get(opts, :foundation)),
      log_level: log_level,
      logger: logger,
      oauth2: oauth2,
      retry: normalize_retry(Keyword.get(opts, :retry, config(:retry, @default_retry))),
      timeout_ms: timeout_ms,
      transport: transport,
      transport_opts: transport_opts,
      typed_responses: typed_responses,
      user_agent: Keyword.get(opts, :user_agent, config(:user_agent, default_user_agent()))
    }

    context = build_context(client)
    runtime_client = RuntimeClient.from_context(context)
    %{client | pristine_client: runtime_client, context: context}
  end

  @spec pristine_client(t() | RuntimeClient.t()) :: RuntimeClient.t()
  def pristine_client(%RuntimeClient{} = client), do: client
  def pristine_client(%__MODULE__{pristine_client: %RuntimeClient{} = client}), do: client

  def pristine_client(other) do
    raise ArgumentError, "expected GitHubEx.Client or Pristine.Client, got: #{inspect(other)}"
  end

  @doc false
  @spec runtime_execute_opts(t() | RuntimeClient.t(), keyword()) :: keyword()
  def runtime_execute_opts(%RuntimeClient{}, opts) when is_list(opts), do: opts

  def runtime_execute_opts(%__MODULE__{typed_responses: typed_responses}, opts)
      when is_list(opts) do
    Keyword.put_new(opts, :typed_responses, typed_responses)
  end

  @doc false
  @spec runtime_operation(t() | RuntimeClient.t(), Operation.t(), keyword()) :: Operation.t()
  def runtime_operation(client = %RuntimeClient{}, %Operation{} = operation, opts)
      when is_list(opts) do
    operation
    |> maybe_disable_operation_schemas(Keyword.get(opts, :typed_responses, false))
    |> normalize_runtime_operation(client)
  end

  def runtime_operation(
        client = %__MODULE__{typed_responses: typed_responses},
        %Operation{} = operation,
        opts
      )
      when is_list(opts) do
    operation
    |> maybe_disable_operation_schemas(Keyword.get(opts, :typed_responses, typed_responses))
    |> normalize_runtime_operation(client)
  end

  @spec request(t() | RuntimeClient.t(), request_t()) :: {:ok, term()} | {:error, term()}
  def request(client, request) when is_map(request) do
    if raw_request?(request) do
      execute_raw_request(client, request)
    else
      raise ArgumentError, "expected raw request spec, got: #{inspect(request)}"
    end
  end

  def request(other, _request) do
    raise ArgumentError, "expected GitHubEx.Client or Pristine.Client, got: #{inspect(other)}"
  end

  @doc false
  @spec request_opts(map()) :: keyword()
  def request_opts(params) when is_map(params) do
    case Map.get(params, :request_opts) || Map.get(params, "request_opts") do
      opts when is_list(opts) -> opts
      nil -> []
      other -> raise ArgumentError, "request_opts must be a keyword list, got: #{inspect(other)}"
    end
  end

  def request_opts(_params), do: []

  @doc false
  @spec drop_request_controls(map()) :: map()
  def drop_request_controls(params) when is_map(params) do
    params
    |> Map.delete(:request_opts)
    |> Map.delete("request_opts")
  end

  def drop_request_controls(params), do: params

  @spec default_request_auth(t()) :: auth_override()
  def default_request_auth(%__MODULE__{auth: auth}) when not is_nil(auth), do: auth

  def default_request_auth(%__MODULE__{oauth2: oauth2}) when is_list(oauth2),
    do: Auth.oauth2(oauth2)

  def default_request_auth(%__MODULE__{}), do: nil

  @doc false
  @spec execute_generated_request(t() | RuntimeClient.t(), generated_request_t()) ::
          {:ok, term()} | {:error, term()}
  def execute_generated_request(client, request) when is_map(request) do
    if generated_request?(request) do
      typed_runtime? = typed_runtime_enabled?(client, request)

      request_spec =
        request
        |> normalize_generated_request()
        |> OpenAPIClient.to_request_spec()
        |> prepare_request_spec(client, typed_runtime?, Map.get(request, :use_default_auth, true))

      execute_opts =
        request[:opts]
        |> normalize_execute_opts()
        |> maybe_put(:retry_opts, request[:retry_opts])
        |> maybe_put(:typed_responses, typed_runtime?)

      Pristine.execute_request(request_spec, client_context(client), execute_opts)
    else
      raise ArgumentError, "expected generated request spec, got: #{inspect(request)}"
    end
  end

  defp execute_raw_request(client, request) do
    typed_runtime? = typed_runtime_enabled?(client, request)

    request_spec =
      request
      |> Map.put(:form_data, normalize_form_data(request[:form_data]))
      |> maybe_disable_raw_schemas(typed_runtime?)
      |> build_raw_request_spec(client)

    execute_opts =
      request[:opts]
      |> normalize_execute_opts()
      |> maybe_put(:retry_opts, request[:retry_opts])
      |> maybe_put(:typed_responses, typed_runtime?)

    Pristine.execute_request(request_spec, client_context(client), execute_opts)
  end

  defp build_raw_request_spec(request, client) do
    path = request[:path]
    resource = request[:resource] || resource_group(path)
    use_default_auth? = Map.get(request, :use_default_auth, true)
    auth = resolve_request_auth(client, request[:auth], use_default_auth?)

    %{
      id: request[:id] || "#{request[:method]} #{path}",
      method: request[:method],
      path: path,
      path_params: request[:path_params] || %{},
      query: request[:query] || %{},
      headers: request[:headers] || %{},
      body: request[:body],
      form_data: request[:form_data],
      request_schema: request[:request_schema],
      response_schema: request[:response_schema],
      auth: auth,
      use_default_auth: use_default_auth?,
      security: request[:security] || default_raw_security(path, use_default_auth?),
      resource: resource,
      retry: request[:retry] || retry_group(request[:method], resource),
      circuit_breaker: resolve_circuit_breaker(client, request[:circuit_breaker], resource),
      rate_limit: request[:rate_limit] || "github.integration",
      telemetry: request[:telemetry],
      timeout: request[:timeout]
    }
  end

  defp build_context(%__MODULE__{} = client) do
    base_opts = [
      auth: default_auth_modules(client),
      base_url: client.base_url,
      default_timeout: client.timeout_ms,
      headers: %{
        "Accept" => client.accept,
        "User-Agent" => client.user_agent,
        "X-GitHub-Api-Version" => client.api_version
      },
      error_module: GitHubEx.Error,
      log_level: client.log_level,
      logger: client.logger,
      package_version: package_version(),
      provider_profile: GitHubEx.ProviderProfile.profile(),
      response_wrapper: GitHubEx.Response,
      result_classifier: GitHubEx.ResultClassifier,
      retry: retry_profile(client.retry),
      serializer: Pristine.Adapters.Serializer.JSON,
      transport: client.transport,
      transport_opts: client.transport_opts
    ]

    Pristine.foundation_context(Keyword.merge(base_opts, client.foundation || []))
  end

  defp default_raw_security(_path, false), do: nil
  defp default_raw_security("/applications/" <> _rest, _use_default_auth?), do: nil
  defp default_raw_security(_path, _use_default_auth?), do: [%{"githubToken" => []}]

  defp client_context(%RuntimeClient{context: context}), do: context
  defp client_context(%__MODULE__{context: context}), do: context

  defp prepare_request_spec(request_spec, client, typed_runtime?, use_default_auth?) do
    path = request_spec[:path] || request_spec[:path_template]
    resource = request_spec[:resource] || resource_group(path)
    auth = resolve_request_auth(client, request_spec[:auth], use_default_auth?)

    request_spec
    |> Map.put(:auth, auth)
    |> Map.put(:headers, request_spec[:headers] || %{})
    |> Map.put(:query, request_spec[:query] || %{})
    |> Map.put(:form_data, normalize_form_data(request_spec[:form_data]))
    |> maybe_disable_schemas(typed_runtime?)
    |> Map.put(:resource, resource)
    |> Map.put(:retry, request_spec[:retry] || retry_group(request_spec[:method], resource))
    |> Map.put(:rate_limit, request_spec[:rate_limit] || "github.integration")
    |> Map.put(
      :circuit_breaker,
      resolve_circuit_breaker(client, request_spec[:circuit_breaker], resource)
    )
  end

  defp resolve_request_auth(%__MODULE__{} = client, nil, true), do: default_request_auth(client)
  defp resolve_request_auth(_client, auth, _use_default_auth), do: auth

  defp typed_runtime_enabled?(client, request) do
    default =
      case client do
        %__MODULE__{typed_responses: typed_responses} -> typed_responses
        %RuntimeClient{} -> false
      end

    Map.get(request, :typed_responses, request_typed_responses(request[:args], default))
  end

  defp request_typed_responses(args, default) when is_map(args) do
    cond do
      is_boolean(Map.get(args, :typed_responses)) ->
        Map.get(args, :typed_responses)

      is_boolean(Map.get(args, "typed_responses")) ->
        Map.get(args, "typed_responses")

      true ->
        default
    end
  end

  defp request_typed_responses(_args, default), do: default

  defp maybe_disable_schemas(request_spec, true), do: request_spec

  defp maybe_disable_schemas(request_spec, false) do
    request_spec
    |> Map.put(:request_schema, nil)
    |> Map.put(:response_schema, nil)
  end

  defp maybe_disable_raw_schemas(request, true), do: request

  defp maybe_disable_raw_schemas(request, false) do
    request
    |> Map.put(:request_schema, nil)
    |> Map.put(:response_schema, nil)
  end

  defp maybe_disable_operation_schemas(%Operation{} = operation, true), do: operation

  defp maybe_disable_operation_schemas(%Operation{} = operation, false) do
    %Operation{operation | request_schema: nil, response_schemas: %{}}
  end

  defp normalize_runtime_operation(%Operation{} = operation, client) do
    resource = operation.runtime[:resource]

    circuit_breaker =
      resolve_circuit_breaker(client, operation.runtime[:circuit_breaker], resource)

    %Operation{
      operation
      | form_data: normalize_form_data(operation.form_data),
        runtime: Map.put(operation.runtime, :circuit_breaker, circuit_breaker)
    }
  end

  defp normalize_execute_opts(nil), do: []

  defp normalize_execute_opts(opts) when is_list(opts) do
    if Keyword.keyword?(opts) do
      opts
    else
      raise ArgumentError, "request opts must be a keyword list"
    end
  end

  defp normalize_execute_opts(_opts) do
    raise ArgumentError, "request opts must be a keyword list"
  end

  defp normalize_generated_request(request) when is_map(request) do
    request
    |> Map.put_new(:opts, [])
    |> Map.put_new(:headers, %{})
    |> Map.put_new(:query, %{})
    |> Map.put_new(:path_params, %{})
    |> Map.put_new(:request_schema, nil)
    |> Map.put_new(:response_schemas, %{})
  end

  defp normalize_retry(false), do: false
  defp normalize_retry(nil), do: @default_retry
  defp normalize_retry(retry) when retry == [] or retry == %{}, do: @default_retry

  defp normalize_retry(retry) when is_list(retry) do
    retry
    |> Enum.into(%{}, fn {key, value} -> {normalize_retry_key!(key), value} end)
    |> normalize_retry()
  end

  defp normalize_retry(retry) when is_map(retry) do
    normalized =
      Map.new(retry, fn {key, value} ->
        {normalize_retry_key!(key), value}
      end)

    %{
      initial_retry_delay_ms:
        Map.get(normalized, :initial_retry_delay_ms, @default_retry.initial_retry_delay_ms),
      max_retries: Map.get(normalized, :max_retries, @default_retry.max_retries),
      max_retry_delay_ms:
        Map.get(normalized, :max_retry_delay_ms, @default_retry.max_retry_delay_ms)
    }
  end

  defp normalize_retry(_retry) do
    raise ArgumentError, "retry must be false, a map, or a keyword list"
  end

  defp normalize_retry_key!("initial_retry_delay_ms"), do: :initial_retry_delay_ms
  defp normalize_retry_key!("max_retries"), do: :max_retries
  defp normalize_retry_key!("max_retry_delay_ms"), do: :max_retry_delay_ms
  defp normalize_retry_key!(:initial_retry_delay_ms), do: :initial_retry_delay_ms
  defp normalize_retry_key!(:max_retries), do: :max_retries
  defp normalize_retry_key!(:max_retry_delay_ms), do: :max_retry_delay_ms

  defp normalize_retry_key!(key) do
    raise ArgumentError,
          "unknown retry option #{inspect(key)}; supported keys are :initial_retry_delay_ms, :max_retries, :max_retry_delay_ms"
  end

  defp retry_profile(false), do: false

  defp retry_profile(%{} = retry) do
    [
      adapter: GitHubEx.Retry,
      policies: retry_policies(retry)
    ]
  end

  defp retry_policies(%{
         initial_retry_delay_ms: initial_retry_delay_ms,
         max_retries: max_retries,
         max_retry_delay_ms: max_retry_delay_ms
       }) do
    policy_opts = [
      max_attempts: max_retries,
      backoff: [
        base_ms: initial_retry_delay_ms,
        jitter: 0.25,
        jitter_strategy: :factor,
        max_ms: max_retry_delay_ms,
        strategy: :exponential
      ]
    ]

    Map.new(@retry_groups, &{&1, policy_opts})
  end

  defp normalize_auth(nil), do: nil
  defp normalize_auth(auth) when is_binary(auth), do: auth
  defp normalize_auth(false), do: false

  defp normalize_auth({module, opts} = auth)
       when is_atom(module) and is_list(opts),
       do: auth

  defp normalize_auth(auth) when is_list(auth) do
    if Enum.all?(auth, &match?({module, opts} when is_atom(module) and is_list(opts), &1)) do
      auth
    else
      raise ArgumentError, "invalid auth configuration: #{inspect(auth)}"
    end
  end

  defp normalize_auth(auth) when is_map(auth), do: normalize_auth_map(auth)

  defp normalize_auth(other) do
    raise ArgumentError, "invalid auth configuration: #{inspect(other)}"
  end

  defp default_auth_modules(%__MODULE__{} = client) do
    case default_request_auth(client) do
      nil ->
        []

      false ->
        []

      token when is_binary(token) ->
        [Auth.bearer(token)]

      {module, opts} ->
        [{module, opts}]

      modules when is_list(modules) ->
        modules

      %{"client_id" => client_id, "client_secret" => client_secret} ->
        [Auth.basic(client_id, client_secret)]

      %{client_id: client_id, client_secret: client_secret} ->
        [Auth.basic(client_id, client_secret)]

      _other ->
        []
    end
  end

  defp normalize_transport_opts(Pristine.Adapters.Transport.Finch, opts, finch)
       when is_list(opts) do
    Keyword.put_new(opts, :finch, finch)
  end

  defp normalize_transport_opts(_transport, opts, _finch) when is_list(opts), do: opts
  defp normalize_transport_opts(_transport, _opts, _finch), do: []

  defp normalize_oauth2(nil), do: nil

  defp normalize_oauth2(opts) when is_list(opts) do
    case Keyword.get(opts, :token_source) do
      nil ->
        raise ArgumentError, "oauth2 token_source is required"

      _token_source ->
        opts
        |> Keyword.take([:token_source, :allow_stale?])
    end
  end

  defp normalize_oauth2(_other) do
    raise ArgumentError, "oauth2 must be a keyword list"
  end

  defp normalize_foundation(nil), do: nil
  defp normalize_foundation(opts) when is_list(opts), do: opts

  defp normalize_foundation(other) do
    raise ArgumentError, "foundation must be a keyword list, got: #{inspect(other)}"
  end

  defp normalize_form_data(nil), do: %{}

  defp normalize_form_data(form_data) when is_map(form_data) do
    Map.new(form_data, fn {key, value} -> {key, normalize_form_data_value(value)} end)
  end

  defp normalize_form_data(_form_data), do: %{}

  defp normalize_form_data_value(%{} = value) do
    normalized = Map.new(value, fn {key, item} -> {to_string(key), item} end)

    cond do
      Map.has_key?(normalized, "filename") and Map.has_key?(normalized, "data") and
          Map.has_key?(normalized, "content_type") ->
        {normalized["filename"], normalized["data"], normalized["content_type"]}

      Map.has_key?(normalized, "filename") and Map.has_key?(normalized, "data") ->
        {normalized["filename"], normalized["data"]}

      true ->
        value
    end
  end

  defp normalize_form_data_value(value), do: value

  defp normalize_auth_map(%{} = auth) do
    Map.new(auth, fn {key, value} -> {to_string(key), value} end)
  end

  defp maybe_put(opts, _key, nil), do: opts
  defp maybe_put(opts, _key, value) when value == [], do: opts
  defp maybe_put(opts, key, value), do: Keyword.put(opts, key, value)

  defp generated_request?(request) when is_map(request) do
    Map.has_key?(request, :method) and Map.has_key?(request, :path_template)
  end

  defp raw_request?(request) when is_map(request) do
    Map.has_key?(request, :method) and Map.has_key?(request, :path)
  end

  defp resolve_circuit_breaker(%RuntimeClient{} = client, nil, resource) do
    circuit_breaker_name(client.base_url, resource)
  end

  defp resolve_circuit_breaker(%RuntimeClient{} = client, breaker, _resource)
       when is_binary(breaker) do
    if explicit_circuit_breaker_name?(breaker) do
      breaker
    else
      circuit_breaker_name(client.base_url, breaker)
    end
  end

  defp resolve_circuit_breaker(%RuntimeClient{} = client, _breaker, resource) do
    circuit_breaker_name(client.base_url, resource)
  end

  defp resolve_circuit_breaker(%__MODULE__{} = client, breaker, resource) do
    resolve_circuit_breaker(client.pristine_client, breaker, resource)
  end

  defp explicit_circuit_breaker_name?(value), do: String.contains?(value, ":")

  defp resource_group("/applications/" <> _rest), do: "oauth_application"

  defp resource_group("/app/installations/" <> rest) do
    if String.ends_with?(rest, "/access_tokens"), do: "app_auth", else: "app_api"
  end

  defp resource_group("/app" <> _rest), do: "app_api"
  defp resource_group(_path), do: "core_api"

  defp retry_group(_method, "oauth_application"), do: "github.oauth"
  defp retry_group(_method, "app_auth"), do: "github.app_auth"
  defp retry_group(method, _resource) when method in [:get, :head], do: "github.read"
  defp retry_group(:delete, _resource), do: "github.delete"
  defp retry_group(_method, _resource), do: "github.write"

  defp circuit_breaker_name(base_url, resource) do
    host =
      case URI.parse(base_url) do
        %URI{host: nil} -> base_url
        %URI{host: host} -> host
      end

    group =
      case resource do
        "oauth_application" -> "oauth"
        "app_auth" -> "app_auth"
        _other -> @default_breaker_group
      end

    "github:#{host}:#{group}"
  end

  defp default_user_agent do
    "github-ex-elixir/#{package_version()}"
  end

  defp package_version do
    case Application.spec(:github_ex, :vsn) do
      nil -> "dev"
      vsn -> List.to_string(vsn)
    end
  end

  defp config(key, default) do
    Application.get_env(:github_ex, key, default)
  end
end

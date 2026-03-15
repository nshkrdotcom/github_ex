defmodule GitHubEx.GeneratedSupport do
  @moduledoc false

  @type key_spec :: {String.t(), atom()}
  @type payload_mode :: :none | :remaining | {:key, key_spec()}

  @spec execute(GitHubEx.Client.t(), map(), map()) ::
          {:ok, term()} | {:error, GitHubEx.Error.t()}
  def execute(%GitHubEx.Client{} = client, params, spec)
      when is_map(params) and is_map(spec) do
    request_opts = GitHubEx.Client.request_opts(params)

    auth =
      case spec[:auth_strategy] do
        :oauth_application -> GitHubEx.Client.oauth_application_request_auth(params)
        _other -> Map.get(params, :auth) || Map.get(params, "auth")
      end

    params =
      case spec[:auth_strategy] do
        :oauth_application -> GitHubEx.Client.drop_oauth_application_credentials(params)
        _other -> GitHubEx.Client.drop_request_controls(params) |> drop_auth(params)
      end

    {path_params, params} = take_entries(params, Map.get(spec, :path, []))
    {query, params} = take_entries(params, Map.get(spec, :query, []))
    {headers, params} = take_entries(params, Map.get(spec, :headers, []))
    {body, params} = take_payload(params, Map.get(spec, :body_mode, :none))
    {form_data, _params} = take_payload(params, Map.get(spec, :form_data_mode, :none))

    GitHubEx.Client.execute_generated_request(client, %{
      args: params,
      auth: auth,
      body: body,
      call: Map.fetch!(spec, :call),
      circuit_breaker: Map.get(spec, :circuit_breaker),
      form_data: form_data,
      headers: headers,
      method: Map.fetch!(spec, :method),
      opts: request_opts,
      path_params: path_params,
      path_template: Map.fetch!(spec, :path_template),
      query: query,
      rate_limit: Map.get(spec, :rate_limit),
      resource: Map.get(spec, :resource),
      retry: Map.get(spec, :retry),
      use_default_auth: Map.get(spec, :use_default_auth, true)
    })
  end

  defp take_payload(params, :none), do: {%{}, params}
  defp take_payload(params, :remaining), do: {stringify_map(params), %{}}

  defp take_payload(params, {:key, key_spec}) do
    case take_value(params, key_spec) do
      {nil, params} -> {%{}, params}
      {value, params} -> {normalize_payload(value), params}
    end
  end

  defp take_entries(params, keys) do
    Enum.reduce(keys, {%{}, params}, fn key, {acc, params} ->
      case take_value(params, key) do
        {nil, params} ->
          {acc, params}

        {value, params} ->
          {Map.put(acc, elem(key, 0), value), params}
      end
    end)
  end

  defp take_value(params, {string_key, atom_key}) do
    cond do
      Map.has_key?(params, atom_key) ->
        {Map.fetch!(params, atom_key), Map.delete(params, atom_key)}

      Map.has_key?(params, string_key) ->
        {Map.fetch!(params, string_key), Map.delete(params, string_key)}

      true ->
        {nil, params}
    end
  end

  defp drop_auth(params, original_params) do
    params
    |> Map.delete(:auth)
    |> Map.delete("auth")
    |> maybe_restore_typed_responses(original_params)
  end

  defp maybe_restore_typed_responses(params, original_params) do
    cond do
      Map.has_key?(original_params, :typed_responses) ->
        Map.put(params, :typed_responses, Map.fetch!(original_params, :typed_responses))

      Map.has_key?(original_params, "typed_responses") ->
        Map.put(params, "typed_responses", Map.fetch!(original_params, "typed_responses"))

      true ->
        params
    end
  end

  defp normalize_payload(value) when is_map(value), do: stringify_map(value)
  defp normalize_payload(value) when is_list(value), do: Enum.map(value, &normalize_payload/1)
  defp normalize_payload(value), do: value

  defp stringify_map(value) when is_map(value) do
    Map.new(value, fn {key, item} -> {to_string(key), normalize_payload(item)} end)
  end

  defp stringify_map(value), do: value
end

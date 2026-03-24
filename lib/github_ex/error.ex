defmodule GitHubEx.Error do
  @moduledoc """
  GitHub-specific error type returned by `GitHubEx.Client` and the generated
  endpoint wrappers.
  """

  alias GitHubEx.ProviderProfile
  alias Pristine.Error, as: RuntimeError

  @retryable_codes [
    :api_connection,
    :bad_gateway,
    :gateway_timeout,
    :rate_limited,
    :request_timeout,
    :server_error,
    :service_unavailable
  ]
  @type code ::
          :api_connection
          | :bad_gateway
          | :conflict
          | :forbidden
          | :gateway_timeout
          | :invalid_request
          | :not_found
          | :rate_limited
          | :request_timeout
          | :response_error
          | :server_error
          | :service_unavailable
          | :test_env_error
          | :unauthorized
          | :unavailable_for_legal_reasons
          | :unprocessable_entity
          | :validation
          | :unknown

  @type t :: %__MODULE__{
          additional_data: map() | nil,
          body: term(),
          code: code(),
          documentation_url: String.t() | nil,
          headers: map(),
          message: String.t(),
          request_id: String.t() | nil,
          retry_after_ms: non_neg_integer() | nil,
          status: integer() | nil
        }

  defexception [
    :additional_data,
    :body,
    :code,
    :documentation_url,
    :headers,
    :message,
    :request_id,
    :retry_after_ms,
    :status
  ]

  @spec new(code(), String.t(), keyword()) :: t()
  def new(code, message, opts \\ []) do
    %__MODULE__{
      additional_data: Keyword.get(opts, :additional_data),
      body: Keyword.get(opts, :body),
      code: code,
      documentation_url: Keyword.get(opts, :documentation_url),
      headers: normalize_headers(Keyword.get(opts, :headers, %{})),
      message: message,
      request_id: Keyword.get(opts, :request_id),
      retry_after_ms: Keyword.get(opts, :retry_after_ms),
      status: Keyword.get(opts, :status)
    }
  end

  @spec from_response(Pristine.SDK.Response.t() | map(), term(), non_neg_integer() | nil) :: t()
  def from_response(%{status: _status} = response, body, retry_after_ms) do
    from_response(response, body, retry_after_ms, [])
  end

  @spec from_response(
          Pristine.SDK.Response.t() | map(),
          term(),
          non_neg_integer() | nil,
          keyword()
        ) :: t()
  def from_response(%{status: _status} = response, body, retry_after_ms, _opts) do
    response
    |> RuntimeError.from_response(
      body: body,
      retry_after_ms: retry_after_ms,
      profile: ProviderProfile.profile()
    )
    |> from_runtime_error()
  end

  @spec connection_error(term()) :: t()
  def connection_error(reason) do
    new(:api_connection, format_reason(reason), body: %{reason: inspect(reason)})
  end

  @spec validation_error(term(), term()) :: t()
  def validation_error(reason, body) do
    new(:validation, "Validation error: #{inspect(reason)}", body: body)
  end

  @spec retryable?(t()) :: boolean()
  def retryable?(%__MODULE__{code: code}), do: code in @retryable_codes

  @impl true
  def message(%__MODULE__{code: code, message: message, request_id: nil}) do
    "[#{code}] #{message}"
  end

  def message(%__MODULE__{code: code, message: message, request_id: request_id}) do
    "[#{code}] #{message} (request_id: #{request_id})"
  end

  defp from_runtime_error(%RuntimeError{} = error) do
    %__MODULE__{
      additional_data: normalize_additional_data(error.additional_data),
      body: error.body,
      code: error.provider_code || :response_error,
      documentation_url: error.documentation_url,
      headers: normalize_headers(error.headers),
      message: error.message || "HTTP #{error.status}",
      request_id: error.request_id,
      retry_after_ms: error.retry_after_ms,
      status: error.status
    }
  end

  defp normalize_headers(headers) when is_map(headers) do
    Map.new(headers, fn {key, value} -> {to_string(key), value} end)
  end

  defp normalize_headers(headers) when is_list(headers) do
    Map.new(headers, fn {key, value} -> {to_string(key), value} end)
  end

  defp normalize_headers(_headers), do: %{}

  defp normalize_additional_data(nil), do: nil
  defp normalize_additional_data(errors), do: %{"errors" => errors}

  defp format_reason(reason) do
    cond do
      is_struct(reason) and function_exported?(reason.__struct__, :message, 1) ->
        Exception.message(reason)

      is_binary(reason) ->
        reason

      is_atom(reason) ->
        Atom.to_string(reason)

      true ->
        inspect(reason)
    end
  end
end

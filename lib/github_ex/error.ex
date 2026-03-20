defmodule GitHubEx.Error do
  @moduledoc """
  GitHub-specific error type returned by `GitHubEx.Client` and the generated
  endpoint wrappers.
  """

  alias GitHubEx.RateLimitInfo

  @retryable_codes [
    :api_connection,
    :bad_gateway,
    :gateway_timeout,
    :rate_limited,
    :request_timeout,
    :server_error,
    :service_unavailable
  ]
  @status_codes %{
    400 => :invalid_request,
    401 => :unauthorized,
    403 => :forbidden,
    404 => :not_found,
    409 => :conflict,
    422 => :unprocessable_entity,
    451 => :unavailable_for_legal_reasons,
    500 => :server_error,
    502 => :bad_gateway,
    503 => :service_unavailable,
    504 => :gateway_timeout
  }

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

  @spec from_response(Pristine.Response.t() | map(), term(), non_neg_integer() | nil) :: t()
  def from_response(%{status: _status} = response, body, retry_after_ms) do
    headers = Map.get(response, :headers, %{})
    body = normalize_body(body)

    retry_after_ms =
      retry_after_ms ||
        if RateLimitInfo.rate_limited?(Map.get(response, :status), headers) do
          RateLimitInfo.retry_after_ms(headers)
        end

    %__MODULE__{
      additional_data: additional_data(body),
      body: body,
      code: code_from_status(Map.get(response, :status), headers),
      documentation_url: documentation_url(body),
      headers: normalize_headers(headers),
      message: message_from_body(body) || "HTTP #{Map.get(response, :status)}",
      request_id: request_id(headers),
      retry_after_ms: retry_after_ms,
      status: Map.get(response, :status)
    }
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

  defp code_from_status(status, headers) do
    if RateLimitInfo.rate_limited?(status, headers) do
      :rate_limited
    else
      Map.get(@status_codes, status, :response_error)
    end
  end

  defp normalize_body(nil), do: nil

  defp normalize_body(body) when is_binary(body) do
    case Jason.decode(body) do
      {:ok, decoded} -> normalize_body(decoded)
      {:error, _} -> %{"message" => body}
    end
  end

  defp normalize_body(body) when is_map(body) do
    Map.new(body, fn {key, value} -> {to_string(key), value} end)
  end

  defp normalize_body(body), do: body

  defp additional_data(%{"errors" => errors}) when is_list(errors), do: %{"errors" => errors}
  defp additional_data(_body), do: nil

  defp documentation_url(%{"documentation_url" => value}) when is_binary(value), do: value
  defp documentation_url(_body), do: nil

  defp message_from_body(%{"message" => message}) when is_binary(message), do: message
  defp message_from_body(_body), do: nil

  defp normalize_headers(headers) when is_map(headers) do
    Map.new(headers, fn {key, value} -> {to_string(key), value} end)
  end

  defp normalize_headers(headers) when is_list(headers) do
    Map.new(headers, fn {key, value} -> {to_string(key), value} end)
  end

  defp normalize_headers(_headers), do: %{}

  defp request_id(headers) do
    RateLimitInfo.header_value(headers, "x-github-request-id")
  end

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

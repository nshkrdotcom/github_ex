defmodule GitHubEx.RateLimitInfo do
  @moduledoc """
  Helpers for GitHub rate-limit and pagination headers.
  """

  alias GitHubEx.Retry

  @type info :: %{
          limit: non_neg_integer() | nil,
          remaining: non_neg_integer() | nil,
          resource: String.t() | nil,
          reset_at: DateTime.t() | nil,
          reset_epoch: non_neg_integer() | nil,
          retry_after_ms: non_neg_integer() | nil,
          used: non_neg_integer() | nil
        }

  @spec info(map() | list()) :: info()
  def info(headers) do
    reset_epoch = integer_header(headers, "x-ratelimit-reset")
    retry_after_ms = retry_after_ms(headers)

    %{
      limit: integer_header(headers, "x-ratelimit-limit"),
      remaining: integer_header(headers, "x-ratelimit-remaining"),
      resource: header_value(headers, "x-ratelimit-resource"),
      reset_at: reset_datetime(reset_epoch),
      reset_epoch: reset_epoch,
      retry_after_ms: retry_after_ms,
      used: integer_header(headers, "x-ratelimit-used")
    }
  end

  @spec retry_after_ms(map() | list()) :: non_neg_integer() | nil
  def retry_after_ms(headers) do
    Retry.parse_retry_after(headers) || reset_delta_ms(headers)
  end

  @spec rate_limited?(integer() | nil, map() | list()) :: boolean()
  def rate_limited?(status, headers) when status in [403, 429] do
    status == 429 or integer_header(headers, "x-ratelimit-remaining") == 0 or
      has_retry_after_header?(headers)
  end

  def rate_limited?(_status, _headers), do: false

  @spec links(map() | list()) :: %{optional(String.t()) => String.t()}
  def links(headers) do
    headers
    |> header_value("link")
    |> parse_link_header()
  end

  @spec parse_link_header(String.t() | nil) :: %{optional(String.t()) => String.t()}
  def parse_link_header(value) when is_binary(value) do
    value
    |> String.split(",")
    |> Enum.reduce(%{}, fn part, acc ->
      case Regex.run(~r/<([^>]+)>;\s*rel="([^"]+)"/, String.trim(part), capture: :all_but_first) do
        [url, rel] -> Map.put(acc, rel, url)
        _ -> acc
      end
    end)
  end

  def parse_link_header(_value), do: %{}

  @spec query_params_from_next(map() | list()) :: map() | nil
  def query_params_from_next(headers) do
    case links(headers)["next"] do
      nil ->
        nil

      url ->
        case URI.parse(url) do
          %URI{query: nil} -> %{}
          %URI{query: query} -> URI.decode_query(query)
        end
    end
  end

  @spec header_value(map() | list(), String.t()) :: String.t() | nil
  def header_value(headers, name) when is_map(headers) do
    downcased_name = String.downcase(name)

    Enum.find_value(headers, fn {key, value} ->
      if String.downcase(to_string(key)) == downcased_name and is_binary(value), do: value
    end)
  end

  def header_value(headers, name) when is_list(headers) do
    downcased_name = String.downcase(name)

    Enum.find_value(headers, fn
      {key, value} when is_binary(value) ->
        if String.downcase(to_string(key)) == downcased_name, do: value

      _ ->
        nil
    end)
  end

  def header_value(_headers, _name), do: nil

  defp integer_header(headers, name) do
    case header_value(headers, name) do
      nil ->
        nil

      value ->
        case Integer.parse(value) do
          {integer, _rest} when integer >= 0 -> integer
          _ -> nil
        end
    end
  end

  defp has_retry_after_header?(headers) do
    not is_nil(header_value(headers, "retry-after")) or
      not is_nil(header_value(headers, "retry-after-ms"))
  end

  defp reset_delta_ms(headers) do
    case integer_header(headers, "x-ratelimit-reset") do
      reset_epoch when is_integer(reset_epoch) ->
        now_epoch = DateTime.utc_now() |> DateTime.to_unix()
        max(reset_epoch - now_epoch, 0) * 1_000

      _other ->
        nil
    end
  end

  defp reset_datetime(nil), do: nil

  defp reset_datetime(epoch) when is_integer(epoch) do
    case DateTime.from_unix(epoch) do
      {:ok, datetime} -> datetime
      _ -> nil
    end
  end
end

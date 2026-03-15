defmodule GitHubEx.Response do
  @moduledoc """
  Public wrapped response metadata for callers that need headers, pagination
  links, rate-limit information, or elapsed timing alongside decoded data.
  """

  alias GitHubEx.RateLimitInfo

  @type t :: %__MODULE__{
          data: term(),
          elapsed_ms: non_neg_integer() | nil,
          headers: map(),
          links: %{optional(String.t()) => String.t()},
          method: atom() | nil,
          rate_limit: RateLimitInfo.info(),
          retries: non_neg_integer() | nil,
          status: integer() | nil,
          url: String.t() | nil
        }

  defstruct [
    :data,
    :elapsed_ms,
    :headers,
    :links,
    :method,
    :rate_limit,
    :retries,
    :status,
    :url
  ]

  @spec new(Pristine.SDK.Response.t() | map(), keyword()) :: t()
  def new(response, opts \\ []) when is_map(response) and is_list(opts) do
    headers = normalize_headers(Map.get(response, :headers, %{}))

    %__MODULE__{
      data: Keyword.get(opts, :data),
      elapsed_ms: Keyword.get(opts, :elapsed_ms),
      headers: headers,
      links: RateLimitInfo.links(headers),
      method: Keyword.get(opts, :method),
      rate_limit: RateLimitInfo.info(headers),
      retries: Keyword.get(opts, :retries),
      status: Map.get(response, :status),
      url: Keyword.get(opts, :url)
    }
  end

  @spec next_url(t()) :: String.t() | nil
  def next_url(%__MODULE__{links: links}) when is_map(links), do: links["next"]

  defp normalize_headers(headers) when is_map(headers) do
    Map.new(headers, fn {key, value} -> {to_string(key), value} end)
  end

  defp normalize_headers(headers) when is_list(headers) do
    Map.new(headers, fn {key, value} -> {to_string(key), value} end)
  end

  defp normalize_headers(_headers), do: %{}
end

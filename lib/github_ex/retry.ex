defmodule GitHubEx.Retry do
  @moduledoc false

  @behaviour Pristine.Ports.Retry

  alias Pristine.Adapters.Retry.Foundation, as: FoundationRetry
  @retry_after_reset_at_headers ["x-ratelimit-reset"]

  @impl true
  def with_retry(fun, opts), do: FoundationRetry.with_retry(fun, opts)

  @impl true
  def should_retry?(response), do: FoundationRetry.should_retry?(response)

  @impl true
  def build_policy(opts \\ []), do: FoundationRetry.build_policy(opts)

  @impl true
  def build_backoff(opts \\ []), do: FoundationRetry.build_backoff(opts)

  @impl true
  @spec parse_retry_after(map() | list()) :: non_neg_integer() | nil
  def parse_retry_after(response_or_headers) do
    headers =
      case response_or_headers do
        %{headers: headers} -> headers
        %{"headers" => headers} -> headers
        headers -> headers
      end

    FoundationRetry.parse_retry_after(
      headers,
      reset_at_headers: @retry_after_reset_at_headers
    )
  end
end

defmodule GitHubEx.ResultClassifier do
  @moduledoc false

  @behaviour Pristine.Ports.ResultClassifier

  alias GitHubEx.RateLimitInfo
  alias Pristine.Core.ResultClassification

  @retryable_groups ["github.app_auth", "github.delete", "github.oauth", "github.read"]
  @upstream_failure_statuses [500, 502, 503, 504]

  @impl true
  def classify({:ok, %{status: status, headers: headers}}, endpoint, _context, _opts)
      when status in [403, 429] do
    retryable = RateLimitInfo.rate_limited?(status, headers)
    retry_after_ms = if retryable, do: RateLimitInfo.retry_after_ms(headers), else: nil

    ResultClassification.normalize(%{
      retry?: retryable and retry_group(endpoint) in @retryable_groups,
      retry_after_ms: retry_after_ms,
      limiter_backoff_ms: retry_after_ms,
      breaker_outcome: :ignore,
      telemetry: telemetry(endpoint, :rate_limited, retryable, :ignore)
    })
  end

  def classify({:ok, %{status: status, headers: headers}}, endpoint, _context, _opts)
      when status in @upstream_failure_statuses do
    retryable = retry_group(endpoint) in @retryable_groups

    ResultClassification.normalize(%{
      retry?: retryable,
      retry_after_ms: RateLimitInfo.retry_after_ms(headers),
      breaker_outcome: :failure,
      telemetry: telemetry(endpoint, :upstream_failure, retryable, :failure)
    })
  end

  def classify({:ok, %{status: status}}, endpoint, _context, _opts)
      when status >= 400 and status < 500 do
    ignore(endpoint, :client_error)
  end

  def classify({:ok, %{status: status}}, endpoint, _context, _opts)
      when status >= 200 and status < 400 do
    success(endpoint, :success)
  end

  def classify({:error, :circuit_open}, endpoint, _context, _opts) do
    ResultClassification.normalize(%{
      retry?: false,
      breaker_outcome: :ignore,
      telemetry: telemetry(endpoint, :circuit_open, false, :ignore)
    })
  end

  def classify({:error, reason}, endpoint, _context, _opts) do
    retryable = retryable_transport_error?(reason)

    ResultClassification.normalize(%{
      retry?: retryable and retry_group(endpoint) in @retryable_groups,
      breaker_outcome: :failure,
      telemetry: telemetry(endpoint, :transport_error, retryable, :failure)
    })
  end

  def classify(_result, endpoint, _context, _opts), do: ignore(endpoint, :ignored)

  defp success(endpoint, classification) do
    ResultClassification.normalize(%{
      retry?: false,
      breaker_outcome: :success,
      telemetry: telemetry(endpoint, classification, false, :success)
    })
  end

  defp ignore(endpoint, classification) do
    ResultClassification.normalize(%{
      retry?: false,
      breaker_outcome: :ignore,
      telemetry: telemetry(endpoint, classification, false, :ignore)
    })
  end

  defp retry_group(endpoint) do
    Map.get(endpoint, :retry) || Map.get(endpoint, "retry") || "github.write"
  end

  defp retryable_transport_error?(%{__struct__: Mint.TransportError}), do: true
  defp retryable_transport_error?(%{__struct__: Mint.HTTPError}), do: true
  defp retryable_transport_error?(:timeout), do: true
  defp retryable_transport_error?(_reason), do: false

  defp telemetry(endpoint, classification, retryable, breaker_outcome) do
    %{
      breaker_outcome: breaker_outcome,
      classification: classification,
      resource: Map.get(endpoint, :resource),
      retry_group: retry_group(endpoint),
      retryable: retryable
    }
  end
end

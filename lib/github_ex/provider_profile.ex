defmodule GitHubEx.ProviderProfile do
  @moduledoc false

  alias Pristine.Adapters.Retry.Foundation, as: FoundationRetry
  alias Pristine.SDK.ProviderProfile, as: RuntimeProviderProfile

  @retryable_groups ["github.app_auth", "github.delete", "github.oauth", "github.read"]
  @retry_after_reset_at_headers ["x-ratelimit-reset"]
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

  @spec profile() :: RuntimeProviderProfile.t()
  def profile do
    RuntimeProviderProfile.new!(
      provider: :github,
      default_retry_group: "github.write",
      retryable_groups: @retryable_groups,
      transport_retry_groups: @retryable_groups,
      rate_limit_retry_groups: @retryable_groups,
      rate_limit_detector: &rate_limited?/3,
      retry_after_reset_at_headers: @retry_after_reset_at_headers,
      status_code_map: @status_codes,
      request_id_headers: ["x-github-request-id"],
      documentation_url_fields: ["documentation_url"],
      additional_data_fields: ["errors"],
      rate_limit_code: :rate_limited,
      response_error_code: :response_error,
      connection_code: :api_connection,
      validation_code: :validation
    )
  end

  @spec rate_limited?(integer(), map(), term()) :: boolean()
  def rate_limited?(status, headers, _context_data) when status in [403, 429] do
    status == 429 or
      RuntimeProviderProfile.header_value(headers, "x-ratelimit-remaining") == "0" or
      not is_nil(
        FoundationRetry.parse_retry_after(
          headers,
          reset_at_headers: @retry_after_reset_at_headers
        )
      )
  end

  def rate_limited?(_status, _headers, _context_data), do: false
end

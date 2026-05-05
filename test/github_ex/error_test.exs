defmodule GitHubEx.ErrorTest do
  use ExUnit.Case, async: true

  alias GitHubEx.Error
  alias Pristine.Response

  test "maps structured github errors" do
    response =
      Response.new(
        status: 403,
        headers: %{
          "retry-after" => "4",
          "x-github-request-id" => "req_123"
        },
        body:
          Jason.encode!(%{
            "documentation_url" =>
              "https://docs.github.com/rest/overview/resources-in-the-rest-api",
            "message" => "You have exceeded a secondary rate limit."
          })
      )

    error = Error.from_response(response, response.body, nil)

    assert error.code == :rate_limited
    assert error.request_id == "req_123"
    assert error.documentation_url =~ "docs.github.com"
    assert error.retry_after_ms == 4_000
    assert Error.retryable?(error)
  end

  test "connection_error preserves the failure reason" do
    error = Error.connection_error(:timeout)

    assert error.code == :api_connection
    assert error.message == "timeout"
  end

  test "unknown http statuses use the bounded response error code" do
    response =
      Response.new(
        status: 418,
        headers: %{"x-github-request-id" => "req_teapot"},
        body: Jason.encode!(%{"message" => "provider added a new response state"})
      )

    error = Error.from_response(response, response.body, nil)

    assert error.code == :response_error
    assert error.status == 418
    assert error.request_id == "req_teapot"
  end
end

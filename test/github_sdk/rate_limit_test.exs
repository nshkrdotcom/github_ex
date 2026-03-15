defmodule GitHubSDK.RateLimitInfoTest do
  use ExUnit.Case, async: true

  alias GitHubSDK.RateLimitInfo

  test "parses link headers into rel urls" do
    headers = %{
      "link" =>
        ~s(<https://api.github.com/user/repos?page=2>; rel="next", <https://api.github.com/user/repos?page=4>; rel="last")
    }

    assert RateLimitInfo.links(headers) == %{
             "last" => "https://api.github.com/user/repos?page=4",
             "next" => "https://api.github.com/user/repos?page=2"
           }

    assert RateLimitInfo.query_params_from_next(headers) == %{"page" => "2"}
  end

  test "parses standard rate limit headers" do
    now = DateTime.utc_now() |> DateTime.to_unix()

    info =
      RateLimitInfo.info(%{
        "x-ratelimit-limit" => "5000",
        "x-ratelimit-remaining" => "4999",
        "x-ratelimit-reset" => Integer.to_string(now + 120),
        "x-ratelimit-resource" => "core",
        "x-ratelimit-used" => "1"
      })

    assert info.limit == 5000
    assert info.remaining == 4999
    assert info.resource == "core"
    assert info.used == 1
    assert info.retry_after_ms >= 119_000
    assert %DateTime{} = info.reset_at
  end

  test "detects rate limiting on retry-after and remaining zero" do
    assert RateLimitInfo.rate_limited?(429, %{})
    assert RateLimitInfo.rate_limited?(403, %{"retry-after" => "5"})
    assert RateLimitInfo.rate_limited?(403, %{"x-ratelimit-remaining" => "0"})
    refute RateLimitInfo.rate_limited?(403, %{"x-ratelimit-remaining" => "5"})
  end
end

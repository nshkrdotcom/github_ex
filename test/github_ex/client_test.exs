defmodule GitHubEx.ClientTest do
  use ExUnit.Case, async: true

  alias GitHubEx.{Client, Response, TestTransport}
  alias Pristine.SDK.Response, as: SDKResponse

  test "raw requests use default auth and can return wrapped responses" do
    client =
      Client.new(
        auth: "secret_token",
        transport: TestTransport,
        transport_opts: [
          test_pid: self(),
          response: fn request, _context ->
            assert request.url == "https://api.github.com/user"
            assert request.headers["Authorization"] == "Bearer secret_token"
            assert request.headers["Accept"] == "application/vnd.github+json"
            assert request.headers["X-GitHub-Api-Version"] == "2026-03-10"

            {:ok,
             SDKResponse.new(
               status: 200,
               headers: %{"x-ratelimit-limit" => "5000", "x-ratelimit-remaining" => "4999"},
               body: Jason.encode!(%{"login" => "octocat"})
             )}
          end
        ]
      )

    assert {:ok, %Response{} = response} =
             Client.request(client, %{
               method: :get,
               path: "/user",
               opts: [response: :wrapped]
             })

    assert response.data == %{"login" => "octocat"}
    assert response.rate_limit.limit == 5000
  end
end

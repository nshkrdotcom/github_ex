defmodule GitHubEx.ResponseTest do
  use ExUnit.Case, async: true

  alias GitHubEx.Response
  alias Pristine.Core.Response, as: TransportResponse

  test "unknown response statuses remain integer metadata" do
    response =
      Response.new(
        %TransportResponse{
          status: 299,
          headers: %{"link" => ~s(<https://api.github.test/user?page=2>; rel="next")},
          body: "{}"
        },
        data: %{"ok" => true},
        method: :get,
        url: "https://api.github.test/user"
      )

    assert response.status == 299
    assert response.method == :get
    assert response.data == %{"ok" => true}
    assert response.links["next"] == "https://api.github.test/user?page=2"
  end
end

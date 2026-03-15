defmodule GitHubEx.PaginationTest do
  use ExUnit.Case, async: true

  alias GitHubEx.{Pagination, Response}

  test "collect_api follows the next link header" do
    list_fun = fn _client, params ->
      send(self(), {:page_params, params})

      case Map.get(params, "page") do
        nil ->
          {:ok,
           %Response{
             data: [%{"id" => 1}, %{"id" => 2}],
             headers: %{
               "link" => ~s(<https://api.github.com/user/repos?page=2&per_page=2>; rel="next")
             },
             links: %{"next" => "https://api.github.com/user/repos?page=2&per_page=2"}
           }}

        "2" ->
          {:ok, %Response{data: [%{"id" => 3}], headers: %{}, links: %{}}}
      end
    end

    assert {:ok, [%{"id" => 1}, %{"id" => 2}, %{"id" => 3}]} =
             Pagination.collect_api(list_fun, :client, %{"per_page" => 2})

    assert_receive {:page_params, %{"per_page" => 2, "request_opts" => [response: :wrapped]}}

    assert_receive {:page_params,
                    %{
                      "page" => "2",
                      "per_page" => "2",
                      "request_opts" => [response: :wrapped]
                    }}
  end

  test "reduce_api supports selecting a nested item key" do
    list_fun = fn _client, _params ->
      {:ok, %Response{data: %{"items" => [%{"id" => 1}, %{"id" => 2}]}, headers: %{}, links: %{}}}
    end

    assert {:ok, [1, 2]} =
             Pagination.reduce_api(
               list_fun,
               :client,
               %{},
               [],
               fn item, acc ->
                 {:cont, [item["id"] | acc]}
               end,
               item_key: "items"
             )
             |> then(fn {:ok, ids} -> {:ok, Enum.reverse(ids)} end)
  end
end

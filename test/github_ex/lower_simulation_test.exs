defmodule GitHubEx.LowerSimulationTest do
  use ExUnit.Case, async: false

  alias GitHubEx.{Client, Response}
  alias Pristine.Adapters.Transport.LowerSimulation

  @config_key :transport_simulation_profiles

  setup do
    previous_github_transport = Application.get_env(:github_ex, :transport)
    previous_github_base_url = Application.get_env(:github_ex, :base_url)
    previous_pristine_config = Application.get_env(:pristine, @config_key)

    on_exit(fn ->
      restore_env(:github_ex, :transport, previous_github_transport)
      restore_env(:github_ex, :base_url, previous_github_base_url)
      restore_env(:pristine, @config_key, previous_pristine_config)
    end)

    Application.put_env(:github_ex, :transport, LowerSimulation)
    Application.put_env(:github_ex, :base_url, "http://127.0.0.1:1")

    :ok
  end

  test "raw requests consume Pristine lower simulation through configured transport" do
    Application.put_env(:pristine, @config_key,
      required?: true,
      profiles: %{
        "github.repos.get" => [
          scenario_ref: "phase5prelim://github/repos-get",
          body: ~s({"id":42,"name":"github_ex","full_name":"nshkrdotcom/github_ex"}),
          headers: %{"content-type" => "application/json", "x-ratelimit-limit" => "5000"}
        ]
      }
    )

    client = Client.new(auth: "secret_token")

    assert client.transport == LowerSimulation

    assert {:ok, %Response{} = response} =
             Client.request(client, %{
               id: "github.repos.get",
               method: :get,
               path: "/repos/{owner}/{repo}",
               path_params: %{owner: "nshkrdotcom", repo: "github_ex"},
               response_schema: nil,
               opts: [response: :wrapped]
             })

    assert response.data["full_name"] == "nshkrdotcom/github_ex"
    assert response.rate_limit.limit == 5000
  end

  test "missing lower simulation profile fails before provider HTTP egress" do
    Application.put_env(:pristine, @config_key, required?: true, profiles: %{})

    client = Client.new(auth: "secret_token")

    assert {:error, %GitHubEx.Error{code: :api_connection, body: %{reason: reason}}} =
             Client.request(client, %{
               id: "github.repos.get",
               method: :get,
               path: "/repos/{owner}/{repo}",
               path_params: %{owner: "nshkrdotcom", repo: "github_ex"},
               response_schema: nil
             })

    assert reason =~ "pristine_simulation_profile_required"
  end

  defp restore_env(app, key, nil), do: Application.delete_env(app, key)
  defp restore_env(app, key, value), do: Application.put_env(app, key, value)
end

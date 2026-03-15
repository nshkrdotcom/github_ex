defmodule GitHubEx.AuthMatrix do
  @moduledoc """
  Runtime lookup helper for the generated auth capability matrix.
  """

  @manifest_path Path.expand("../../priv/generated/auth_manifest.json", __DIR__)
  @manifest_cache_key {__MODULE__, :manifest}
  @index_cache_key {__MODULE__, :index}

  @type operation_record :: map()

  @spec manifest() :: map()
  def manifest do
    case :persistent_term.get(@manifest_cache_key, :missing) do
      :missing ->
        loaded = @manifest_path |> File.read!() |> Jason.decode!()
        :persistent_term.put(@manifest_cache_key, loaded)
        loaded

      loaded ->
        loaded
    end
  end

  @spec summary() :: map()
  def summary do
    manifest()["summary"]
  end

  @spec all() :: [operation_record()]
  def all do
    manifest()["operations"] || []
  end

  @spec lookup(String.t()) :: operation_record() | nil
  def lookup(operation_id) when is_binary(operation_id) do
    case parse_method_path_lookup(operation_id) do
      {:ok, method, path} -> lookup(method, path)
      :error -> Map.get(index_by_operation_id(), operation_id)
    end
  end

  @spec lookup(atom() | String.t(), String.t()) :: operation_record() | nil
  def lookup(method, path) when is_binary(path) do
    Map.get(index_by_method_path(), normalize_method_path(method, path))
  end

  defp index_by_operation_id do
    manifest()
    |> Map.fetch!("operations")
    |> Map.new(&{&1["operation_id"], &1})
  end

  defp index_by_method_path do
    case :persistent_term.get(@index_cache_key, :missing) do
      :missing ->
        index =
          manifest()
          |> Map.fetch!("operations")
          |> Map.new(fn operation ->
            {normalize_method_path(operation["method"], operation["path"]), operation}
          end)

        :persistent_term.put(@index_cache_key, index)
        index

      index ->
        index
    end
  end

  defp normalize_method_path(method, path) do
    "#{method |> to_string() |> String.upcase()} #{path}"
  end

  defp parse_method_path_lookup(value) do
    case String.split(value, ~r/\s+/, parts: 2, trim: true) do
      [method, path] when method in ~w(GET POST PUT PATCH DELETE HEAD OPTIONS) ->
        {:ok, method, path}

      _other ->
        :error
    end
  end
end

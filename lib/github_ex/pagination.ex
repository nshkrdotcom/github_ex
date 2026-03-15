defmodule GitHubEx.Pagination do
  @moduledoc """
  Link-header pagination helpers for GitHub list endpoints.
  """

  alias GitHubEx.{Client, RateLimitInfo, Response}

  @type reduce_step(acc) :: {:cont, acc} | {:halt, acc}

  @spec collect_api(
          (Client.t(), map() -> {:ok, term()} | {:error, term()}),
          Client.t(),
          map(),
          keyword()
        ) ::
          {:ok, [term()]} | {:error, term()}
  def collect_api(list_fun, client, first_page_args, opts \\ [])
      when is_function(list_fun, 2) and is_map(first_page_args) and is_list(opts) do
    with {:ok, results} <-
           reduce_api(
             list_fun,
             client,
             first_page_args,
             [],
             fn item, acc ->
               {:cont, [item | acc]}
             end,
             opts
           ) do
      {:ok, Enum.reverse(results)}
    end
  end

  @spec reduce_api(
          (Client.t(), map() -> {:ok, term()} | {:error, term()}),
          Client.t(),
          map(),
          acc,
          (term(), acc -> reduce_step(acc)),
          keyword()
        ) :: {:ok, acc} | {:error, term()}
        when acc: var
  def reduce_api(list_fun, client, first_page_args, acc, reducer, opts \\ [])
      when is_function(list_fun, 2) and is_map(first_page_args) and is_function(reducer, 2) do
    first_page_args
    |> reduce_items(acc, reducer, fn params ->
      fetch_paginated_page(list_fun, client, params, opts)
    end)
  end

  @spec iterate_api(
          (Client.t(), map() -> {:ok, term()} | {:error, term()}),
          Client.t(),
          map(),
          keyword()
        ) ::
          Enumerable.t()
  def iterate_api(list_fun, client, first_page_args, opts \\ [])
      when is_function(list_fun, 2) and is_map(first_page_args) and is_list(opts) do
    Stream.resource(
      fn -> first_page_args end,
      fn
        :done ->
          {:halt, :done}

        params ->
          case fetch_paginated_page(list_fun, client, params, opts) do
            {:ok, results, next_params} -> {results, next_params}
            {:error, error} -> raise error
          end
      end,
      fn _state -> :ok end
    )
  end

  defp reduce_items(params, acc, reducer, fetch_page) do
    case fetch_page.(params) do
      {:ok, results, next_params} ->
        case reduce_page(results, acc, reducer) do
          {:cont, next_acc} when next_params == :done ->
            {:ok, next_acc}

          {:cont, next_acc} ->
            reduce_items(next_params, next_acc, reducer, fetch_page)

          {:halt, next_acc} ->
            {:ok, next_acc}
        end

      {:error, _error} = error ->
        error
    end
  end

  defp reduce_page(results, acc, reducer) do
    Enum.reduce_while(results, {:cont, acc}, fn result, {_status, current_acc} ->
      case reducer.(result, current_acc) do
        {:cont, next_acc} -> {:cont, {:cont, next_acc}}
        {:halt, next_acc} -> {:halt, {:halt, next_acc}}
      end
    end)
  end

  defp fetch_paginated_page(list_fun, client, params, opts) do
    params = put_response_wrapper(params)

    case list_fun.(client, params) do
      {:ok, %Response{} = response} ->
        results = extract_items(response.data, opts)

        case next_page_params(params, response) do
          nil -> {:ok, results, :done}
          next_params -> {:ok, results, next_params}
        end

      {:ok, other} ->
        {:ok, extract_items(other, opts), :done}

      {:error, _error} = error ->
        error
    end
  end

  defp put_response_wrapper(params) do
    request_opts =
      params
      |> Client.request_opts()
      |> Keyword.put(:response, :wrapped)

    params
    |> Client.drop_request_controls()
    |> Map.put("request_opts", request_opts)
  end

  defp next_page_params(params, %Response{headers: headers}) do
    case RateLimitInfo.query_params_from_next(headers) do
      nil -> nil
      query_params -> Map.merge(stringify_keys(params), query_params)
    end
  end

  defp extract_items(data, opts) when is_list(opts) do
    cond do
      extractor = Keyword.get(opts, :extract) ->
        extractor.(data)

      item_key = Keyword.get(opts, :item_key) ->
        extract_by_key(data, item_key)

      is_list(data) ->
        data

      is_map(data) ->
        cond do
          is_list(Map.get(data, "items")) -> Map.get(data, "items")
          is_list(Map.get(data, :items)) -> Map.get(data, :items)
          true -> [data]
        end

      true ->
        [data]
    end
  end

  defp extract_by_key(data, item_key) when is_map(data) do
    Map.get(data, item_key) || Map.get(data, to_string(item_key)) || []
  end

  defp extract_by_key(_data, _item_key), do: []

  defp stringify_keys(map) do
    Map.new(map, fn {key, value} -> {to_string(key), value} end)
  end
end

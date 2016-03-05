# Write a GenServer that can store any valid Elixir term, given a key. Here are a few operations to get you started:
# • Cache.write(:stooges, ["Larry", "Curly", "Moe"])
# • Cache.read(:stooges)
# • Cache.delete(:stooges)
# • Cache.clear
# • Cache.exist?(:stooges)
defmodule Cache.Worker do
  use GenServer

  @name CW
### Client API
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts ++ [name: CW])
  end

  def write(key, list) do
    GenServer.call(@name, {:write, key, list})
  end

  def read(key) do
    GenServer.call(@name, {:read, key})
  end

  def delete(key) do
    GenServer.call(@name, {:delete, key})
  end

  def clear do
    GenServer.cast(@name, :clear)
  end

  def exist?(key) do
    GenServer.call(@name, {:exist?, key})
  end

### Server Callbacks
  def init(:ok) do
    {:ok, %{}}
  end

  def handle_call({:write, key, list}, _from, stats) do
    new_stats = update_stats(stats, {key, list})
    {:reply, list, new_stats}
  end
  def handle_call({:read, key}, _from, stats) do
    case get_key(stats, key) do
      {:ok, list} ->
        {:reply, list, stats}
      _ ->
        {:reply, :error, stats}
    end
  end
  def handle_call({:delete, key}, _from, old_stats) do
    new_stats = Map.delete(old_stats, key)
    {:reply, key, new_stats}
  end
  def handle_call({:exist?, key}, _from, stats) do
    case key_exist(stats, key) do
      true ->
        {:reply, true, stats}
      false ->
        {:reply, false, stats}
    end
  end

  def handle_cast(:clear, _list) do
    {:noreply, %{}}
  end

### Private
  defp update_stats(old_stats, {key, list}) do
    case key_exist(old_stats, key) do
      true ->
        Map.update!(old_stats, key, &(&1 ++ list))
      false ->
        Map.put_new(old_stats, key, list)
    end
  end

  defp get_key(stats, key) do
    case Map.has_key?(stats, key) do
      true ->
        result = Map.fetch!(stats, key)
        {:ok, result}
      false ->
        :error
    end
  end

  defp key_exist(map, key) do
    Map.has_key?(map, key)
  end
end

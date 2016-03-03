defmodule FridgeServer do
  use GenServer

### Public Api
  def start_link do
    {:ok, pid} = :gen_server.start_link(__MODULE__, [], [])
    pid
  end

  def store(server, item) do
    :gen_server.call server, {:store, item}
  end

  def take(server, item) do
    :gen_server.call server, {:take, item}
  end

## Callbacks
  def init(items) do
    { :ok, items }
  end

  def handle_call({:store, item}, _from, items) do
    { :reply, :ok, [item|items] }
  end

  def handle_call({:take, item}, _from, items) do
    case Enum.member?(items, item) do
      true ->
        { :reply, {:ok, item}, items }
      false ->
        { :reply, :not_found, items }
    end
  end
end

defmodule FridgeServerTest do
  use ExUnit.Case

  test "putting something into the fridge" do
    fridge = FridgeServer.start_link
    assert :ok == FridgeServer.store(fridge, :bacon)
  end

  test "removing something from the fridge" do
    fridge = FridgeServer.start_link
    FridgeServer.store(fridge, :bacon)
    assert {:ok, :bacon} = FridgeServer.take(fridge, :bacon)
  end

  test "taking something from the fride that isn't there" do
    fridge = FridgeServer.start_link
    assert :not_found == FridgeServer.take(fridge, :bacon)
  end
end

defmodule CallEvery_10.Periodically do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    Process.send_after(self(), :work, 10000)
    {:ok, state}
  end

  def handle_info(:work, state) do
    # Do the work here ;)
    IO.puts "Hello"
    Process.send_after(self(), :work, 10000)
    {:noreply, state}
  end
end

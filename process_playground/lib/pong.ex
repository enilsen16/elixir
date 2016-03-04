defmodule Pong do
  def start do
    await
  end

  def await do
    receive do
      {:ping, pid} -> Process.send(pid, {:pong, self}, [])
    end
    await
  end
end

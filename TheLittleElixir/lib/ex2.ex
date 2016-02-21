defmodule EX2 do
  def ping do
    receive do
      {sender, :ping} ->
        send(sender ,{self, :pong})
      _ ->
        IO.puts "Errors!"
    end
  end

  def pong do
    receive do
      {sender, :pong} ->
        send(sender, {self, :ping})
      _ ->
        IO.puts "Errors!"
    end
  end
end

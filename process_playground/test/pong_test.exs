defmodule PongTest do
  use ExUnit.Case

  test "it responds to a pong with a pong" do
    pong = spawn_link(Pong, :start, [])
    Process.send pong, {:ping, self}, []
    assert_receive {:pong, ^pong}
  end

  test "it responds to two pongs with two pongs" do
    pong = spawn_link(Pong, :start, [])
    Process.send pong, {:ping, self}, []
    assert_receive {:pong, ^pong}
    Process.send pong, {:ping, self}, []
    assert_receive {:pong, ^pong}
  end
end

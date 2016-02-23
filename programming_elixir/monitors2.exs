# Use spawn_link to start a process, and have that process send a message to the parent and then exit immediately. Meanwhile, sleep for 500 ms in the parent, then receive as many messages as are waiting. Trace what you receive.

defmodule Monitors2 do
  import(:timer, only: [sleep: 1])

  def baby(pid) do
    send(pid, :hello)
    send(pid, :hello2)
    # exit(:boom)
    raise("boom")
  end

  def any_messages do
    receive do
      msg ->
        IO.puts "#{inspect msg}"
        any_messages
      after 500 ->
        IO.puts "No more :/"
    end
  end

  def main do
    # Process.flag(:trap_exit, true)
    spawn_monitor(Monitors2, :baby, [self])
    send(self, :heyo)
    sleep 500
    any_messages
  end
end

Monitors2.main

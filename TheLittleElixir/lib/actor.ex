defmodule Erik do
  def example do
    receive do
      { sender, msg } ->
        send sender, { :ok, "Confused yet? #{msg}" }
        example
    end
  end
end

pid = spawn(Erik, :example, [])
send pid, { self, "Maybe..." }

receive do
  { :ok, message } -> IO.puts message
end

send pid, { self, "K yep, definitely" }

receive do
  { :ok, message } -> IO.puts message
end

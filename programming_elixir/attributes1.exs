defmodule Hello do
  @attr "one"
  def first, do: @attr
  @attr "two"
  def second, do: @attr
end


IO.puts "#{Hello.first} #{Hello.second}"

defmodule Sum do
  def values(dict) do
    dict |> Dict.values |> Enum.sum
  end
end

hd = [ one: 1, two: 2, three: 3 ] |> Enum.into HashDict.new
IO.puts Sum.values(hd)

map = [one: 1, two: 2, three: 3 ] |> Enum.into HashDict.new
IO.puts Sum.values(map)

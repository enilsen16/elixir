defmodule Ex2 do
  def execute do
     IO.gets("Word, please? ")
        |> String.strip
        |> String.to_char_list
        |> _count(0)
  end

  defp _count([ head | tail ], acc), do: _count(tail, acc + 1)
  defp _count([], 0), do: execute
  defp _count([], acc), do: IO.puts acc
end

defmodule MyList do
  def sum(list), do: _sum(list, 0)

  defp _sum([], total), do: total
  defp _([ head | tail ], total), do: _sum(tail, head+total)
end

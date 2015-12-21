defmodule MyList do
  def reduce([], value, _) do
    value
  end
  def reduce([head | tail], value, func) do
    reduce(tail, func.(head, value), func)
  end

  def mapsum([], _func), do: 0
  def mapsum([ head | tail ], func) do
    func.(head) + mapsum(tail, func)
  end

  def max([(x)]), do: x
  def max([ head | tail ]) do
    Kernel.max(head, max(tail) )
  end

  def caesar([], _n), do: []
  def caesar([ head | tail ], n) when head+n <= 122, do: [ head+n | caesar(tail, n) ]
  def caesar([ head | tail ], n), do: [ head+n-26 | caesar(tail, n) ]
end

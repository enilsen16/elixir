# defmodule MyList do
#   def span(from, to) when from === (to + 1), do: []
#   def span(from, to) when from <= to do
#     [ from | span(from + 1, to) ]
#   end
#   def span(from, to) when from > to do
#     "Fail"
#   end
# end

defmodule MyList do
  def span(from, to) when from === to, do: [to]
  def span(from, to) when from < to do
    [ from | span(from + 1, to) ]
  end
  def span(from, to) when from > to do
    "Fail"
  end
end

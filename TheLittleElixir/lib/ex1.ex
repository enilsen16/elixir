defmodule Math do
  def sum(list) do
    Enum.reduce(list, 0, fn (x, acc) -> x + acc end)
  end
end

[1,[[2],3]]
  |> List.flatten
  |> Enum.map(fn(x) -> x*x  end)
  |> Enum.reverse

defmodule IPV4 do
  def parse(header) do
    << version :: size(4),
       ihl :: size(4),
       dscp :: size(6),
       ecn :: size(2),
       tl :: size(16),
       id :: size(16),
       fl :: size(3),
       frag_off :: size(13),
       ttl :: size(8),
       protocol :: size(8),
       checksum :: size(16),
       source_add :: size(32),
       dest_add :: size(32),
       _rest :: binary >> = to_binary(header)
      IO.puts "#{checksum} - #{tl}"
  end
end

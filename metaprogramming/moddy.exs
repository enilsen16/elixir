defmodule Mo do
  # some code here (maybe, if you need it)
  defmacro times_n(n) do
    quote do
      def unquote(:"times_#{n}")(n) do
        unquote(n) * n
      end
    end
  end
end

defmodule Moddy do
  require Mo
  Mo.times_n(2)
  Mo.times_n(4)
end

IO.puts Moddy.times_2(4) # 8
IO.puts Moddy.times_4(5) # 20

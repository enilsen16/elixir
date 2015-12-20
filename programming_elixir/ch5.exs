# # sum = fn (a, b) -> a + b end
# # sum.(1,2)
# #
#
# list_concat = fn a,b ->
#   a ++ b
# end
#
# sum = fn a,b,c ->
#   a + b + c
# end
#
# pair_tuple_to_list = fn (a) ->
#   Tuple.to_list(a)
# end
#
# greeter = fn name -> (fn -> "Hello #{name}" end) end
# dave_greeter = greeeter.("Dave")
# dave_greeter.()

greeter = fn nice ->
  greeting = cond do
    nice == true -> "Hello, "
    nice != true -> "Fuck you "
  end
  fn name ->
    "#{greeting}#{name}"
  end
end

greet1 = greeter.(true)
greet2 = greeter.(false)
greet1.("Erik")
greet2.("Sunny")

  # prefix = fn first ->
  #   fn second ->
  #     "#{first} #{second}"
  #   end
  # end

# Enum.map [1,2,3,4], &(&1 + 2)
# Enum.each [1,2,3,4], &(IO.inspect(&1))

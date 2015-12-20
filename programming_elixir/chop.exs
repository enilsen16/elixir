defmodule Chop do

  def helper(actual, _, current_guess) when actual === current_guess do
    "The answer is #{current_guess}"
  end

  def helper(actual, range, current_guess) when actual < current_guess do
    IO.puts "The current guess is #{current_guess}"
    a.._ = range
    x = div(current_guess - a, 2) + a
    helper(actual, a..current_guess, x)
  end

  def helper(actual, range, current_guess) when actual > current_guess do
    IO.puts "The current guess is #{current_guess}"
    _..b = range
    x = div(b - current_guess, 2) + current_guess
    helper(actual, (current_guess..b), x)
  end

  def guess(actual, range) do
    _..b = range
    helper(actual, range, div(b, 2))
  end
end

# c "programming_elixir/default_params2.exs"
# Chop.guess(273, 1..1000)

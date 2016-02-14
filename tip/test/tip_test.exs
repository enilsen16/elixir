defmodule TipTest do
  use Pavlov.Case, async: true
  import Pavlov.Syntax.Expect

  test "the truth" do
    expect(1) |> not_to_eq(2)
  end

  test "calcuate works" do
    expect(Tip.calculate_tip(100, 15)) |> to_eq(15.0)
  end
end

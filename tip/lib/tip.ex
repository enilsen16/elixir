defmodule Tip do
  def execute do
    total = user_input_total
    tip = user_input_tip
    tip_to_pay = calculate_tip(total, tip)
    pay = total + tip_to_pay
    IO.puts Enum.join(["Tip: $", tip_to_pay], "")
    IO.puts Enum.join(["Total: $", pay], "")
  end

  def calculate_tip(total, tip) do
    percent = tip / 100
    total * percent
  end

  defp user_input_tip do
    tip_rate = IO.gets "How much would you like to tip? "
    String.to_integer(String.strip(tip_rate))
  end

  defp user_input_total do
    total = IO.gets "How much is your bill? "
    String.to_integer(String.strip(total))
  end
end

defmodule Tip do
  def execute do
    { bill, _ } = get_bill()
    { tax, _ } = get_tax()
    IO.inspect calculate_tip(bill, tax)
  end

  def calculate_tip(total, tip) do
    percent = tip / 100
    Float.round(total * percent, 2)
  end

  def get_bill do
    bill = IO.gets "What is your total? "
    check_input [ bill: bill ]
  end

  def get_tax do
    tax = IO.gets "What percentage would you like to tip? "
    check_input [ tax: tax ]
  end

  defp check_input([ tax: tax_percent ]), do: Float.parse tax_percent
  defp check_input([ bill: bill_amount ]), do: Float.parse bill_amount
end

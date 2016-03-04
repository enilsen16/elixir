defmodule XYComponent do
  use GenEvent

  ## Public API

  def get_position(entity) do
    :gen_event.call(entity, XYComponent, :get_position)
  end

  ### GenEvent API
  def init(position) do
    { :ok, position }
  end

  def handle_call(:get_position, position) do
    {:ok, position, position}
  end

  def handle_event({:move, {:y, new_y}}, {x, _}) do
    {:ok, {x, new_y}}
  end

  def handle_event({:move, {:x, new_x}}, {_, y}) do
    {:ok, {new_x, y}}
  end
end

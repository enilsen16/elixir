defmodule Attendee do
  # @derive Access - Depricated since 1.1.0
  # @behaviour Access - Depricated as well
  defstruct name: "", over_18: false
  # Takes a struct and redifines it to use Maps fetch
  defdelegate [fetch(t, key), get_and_update(t, key, list)], to: Map
end

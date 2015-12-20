defmodule Hello do
  @author "Dave Thomas"

  def get_author do
    @author
  end
end

IO.puts "Example was written by #{Hello.get_author}"

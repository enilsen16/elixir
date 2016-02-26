defmodule Ping do

  def main do
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get "https://www.wikipedia.org/wiki/Star_Wars"
     body |> Floki.find(".div-col a") |> Floki.attribute("href") |> Enum.filter(fn(x) -> String.starts_with?(x, "/wiki/") end )
  end
end

defmodule Ping do

  def main do
    {:ok, %HTTPoison.Response{body: body}} = HTTPoison.get "http://www.imdb.com/title/tt3219604/?ref_=tt_rec_tti"
    body
      |> Floki.find("#title_recs a")
      |> Floki.attribute("href")
      |> Enum.filter(fn(x) -> String.starts_with?(x, "/title/") end )
      |> List.first
  end
end

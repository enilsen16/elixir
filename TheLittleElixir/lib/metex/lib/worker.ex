defmodule Metex.Worker do

  def loop do
    receive do
      {sender_pid, location} ->
        send(sender_pid, {:ok, temperature_of(location)})
      _ ->
        IO.puts "Unknown message"
    end
    loop
  end

  def temperature_of(location) do
    result = url_for(location) |> HTTPoison.get |> parse_response
    case result do
      {:ok, temp } -> "#{location}: #{temp} °C"
      :error -> temperature_of location
      :not_found -> "#{location} not found"
    end
  end

  defp url_for(location) do
    # Used an api key from the tutorial
    URI.encode("http://api.openweathermap.org/data/2.5/weather?q=#{location}&appid=44db6a862fba0b067b1930da0d769e98")
  end

  defp parse_response({:ok, %HTTPoison.Response{body: body, status_code: 200}}) do
    body |> JSON.decode! |> compute_temperature
  end
  defp parse_response({:ok, %HTTPoison.Response{body: body, status_code: 429}}) do
    :error
  end
  defp parse_response(_), do: :not_found

  defp compute_temperature(json) do
    try do
      temp = (json["main"]["temp"] - 273.15) |> Float.round(1)
      {:ok, temp}
    rescue
      _ -> :not_found
    end
  end
end

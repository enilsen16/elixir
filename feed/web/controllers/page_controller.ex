defmodule Feed.PageController do
  use Feed.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

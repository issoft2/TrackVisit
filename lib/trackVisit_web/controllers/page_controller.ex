defmodule TrackVisitWeb.PageController do
  use TrackVisitWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

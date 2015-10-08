defmodule ApiJson.PageController do
  use ApiJson.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

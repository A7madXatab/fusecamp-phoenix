defmodule FusecampPhoenixWeb.PageController do
  use FusecampPhoenixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

defmodule Wavelength.PageController do
  use Wavelength.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

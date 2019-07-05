defmodule EshortnerWeb.ShortnerController do
  use EshortnerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.json", links: []) 
  end
end

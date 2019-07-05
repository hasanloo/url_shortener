defmodule EshortnerWeb.Router do
  use EshortnerWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", EshortnerWeb do
    pipe_through :api

    get "/", ShortnerController, :index
  end
end

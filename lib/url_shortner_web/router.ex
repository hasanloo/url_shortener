defmodule UrlShortenerWeb.Router do
  use UrlShortenerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", UrlShortenerWeb do
    pipe_through :api

    post "/link", LinkController, :create
  end

  scope "/r", UrlShortenerWeb do
    pipe_through :browser

    get "/:short_code", LinkController, :redirect_url
  end
end

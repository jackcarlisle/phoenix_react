defmodule PhoenixReactWeb.Router do
  use PhoenixReactWeb, :router

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

  scope "/api", PhoenixReactWeb do
    pipe_through :api

    resources "/languages", LanguageController, except: [:new, :edit]
  end

  scope "/", PhoenixReactWeb do
    pipe_through :browser # Use the default browser stack

    get "/*path", PageController, :index
  end

end

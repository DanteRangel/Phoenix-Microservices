defmodule Microservice1Web.Router do
  use Microservice1Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Microservice1Web do
    pipe_through :api

    get "hola", TestController, :index
  end
end

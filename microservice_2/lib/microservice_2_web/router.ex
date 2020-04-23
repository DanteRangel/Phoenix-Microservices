defmodule Microservice2Web.Router do
  use Microservice2Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Microservice2Web do
    pipe_through :api

    get "hola", TestController, :index
  end
end

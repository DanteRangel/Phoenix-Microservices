defmodule Microservice2Web.TestController do
  use Microservice2Web, :controller

  action_fallback Microservice2Web.FallbackController

  def index(conn, _params) do
    json(conn, %{hola: "Mundo 2"})
  end
end

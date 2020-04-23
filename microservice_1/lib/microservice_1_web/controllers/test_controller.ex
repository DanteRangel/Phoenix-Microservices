defmodule Microservice1Web.TestController do
  use Microservice1Web, :controller

  action_fallback Microservice1Web.FallbackController

  def index(conn, _params) do
    json(conn, %{hola: "Mundo 1"})
  end
end

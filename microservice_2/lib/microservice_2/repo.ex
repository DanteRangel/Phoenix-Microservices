defmodule Microservice2.Repo do
  use Ecto.Repo,
    otp_app: :microservice_2,
    adapter: Ecto.Adapters.Postgres
end

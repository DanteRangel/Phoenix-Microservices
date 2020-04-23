defmodule Microservice1.Repo do
  use Ecto.Repo,
    otp_app: :microservice_1,
    adapter: Ecto.Adapters.Postgres
end

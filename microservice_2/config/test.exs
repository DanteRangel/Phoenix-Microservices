use Mix.Config

# Configure your database
config :microservice_2, Microservice2.Repo,
  username: System.get_env("PGUSER", "danterangel"),
  password: System.get_env("PGPASSWORD", "postgres"),
  database: System.get_env("PGDATABASE", "dev_api"),
  hostname: System.get_env("PGHOST", "localhost"),
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :microservice_2, Microservice2Web.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

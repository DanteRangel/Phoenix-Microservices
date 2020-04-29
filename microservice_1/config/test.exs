use Mix.Config

# Configure your database
config :microservice_1, Microservice1.Repo,
  username: System.get_env("PGUSER"),
  password: System.get_env("PGPASSWORD"),
  database: System.get_env("PGDATABASE"),
  hostname: System.get_env("PGHOST"),
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :microservice_1, Microservice1Web.Endpoint,
  http: [port: 4002],
  server: false

config :microservice_1, Microservice1.Mailer,
  adapter: Bamboo.TestAdapter,
  server: "smtp.gmail.com",
  port: 587,
  username: System.get_env("MAIL_USERNAME"),
  password: System.get_env("MAIL_PASSWORD"),
  tls: :if_available, # can be `:always` or `:never`
  allowed_tls_versions: ["tlsv1", "tlsv1.1", "tlsv1.2"], # or {":system", ALLOWED_TLS_VERSIONS"} w/ comma seprated values (e.g. "tlsv1.1,tlsv1.2")
  ssl: false, # can be `true`
  retries: 1
# Print only warnings and errors during test
config :logger, level: :warn

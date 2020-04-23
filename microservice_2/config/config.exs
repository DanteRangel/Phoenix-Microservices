# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :microservice_2,
  ecto_repos: [Microservice2.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :microservice_2, Microservice2Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "el0jokJiLfdGrq7zxDEeuJfPTd/Wed+kCTpeOS7j5ti4kWx7gFLASvRTD5ODh96u",
  render_errors: [view: Microservice2Web.ErrorView, accepts: ~w(json)],
  pubsub: [name: Microservice2.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "I43W+n7F"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

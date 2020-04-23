# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :microservice_1,
  ecto_repos: [Microservice1.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :microservice_1, Microservice1Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "zf0IgQrEa9hMvfUm/GS8lzl3pfpFDDTdmdW7QBVUpAgFAh6JottctKM2XeharFXz",
  render_errors: [view: Microservice1Web.ErrorView, accepts: ~w(json)],
  pubsub: [name: Microservice1.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "K9kW6uXe"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

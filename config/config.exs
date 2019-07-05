# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :eshortner,
  ecto_repos: [Eshortner.Repo]

# Configures the endpoint
config :eshortner, EshortnerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Aah6AXiOIhZPh4yO3fY5S64RNs3jMRUKyl7Sr1mw0+V2+gOoKZGi8+01fP50pJIO",
  render_errors: [view: EshortnerWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Eshortner.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

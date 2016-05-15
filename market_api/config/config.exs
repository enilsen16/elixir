# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :market_api,
  ecto_repos: [MarketApi.Repo]

# Configures the endpoint
config :market_api, MarketApi.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "SJkJ6s1wqd5QQR7zZpDLN4Gff7eA0pNfMaTv2uVhY7uxIkKrMsLR/X45jqZCbI9G",
  render_errors: [view: MarketApi.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MarketApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :plug, :mimes, %{
  "application/vnd.api+json" => ["json-api"]
}

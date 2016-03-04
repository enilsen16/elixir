# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :phoenix_commerce, PhoenixCommerce.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "MWh5vSpeHnhbrnpk+TwcJHigLd/f3UkNygrfoOdn5TaGulcfQWEF/Q7/vAAI43zq",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: PhoenixCommerce.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Configure phoenix generators
config :phoenix, :generators,
  migration: true,
  binary_id: false

  config :arc,
  virtual_host: true,
  bucket: "phoenix-commerce-1"

config :ex_aws,
  access_key_id: "",
  secret_access_key: "",
  region: "us-west-2"

config :ex_aws, :s3,
  scheme: "https://",
  host: "s3-us-west-2.amazonaws.com"
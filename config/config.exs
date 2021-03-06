# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :wavelength, Wavelength.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "2fxyYwnqDa8ieF2ejtcKZ4we1S0ekQ4R5LtST7RTAVMRsSwjgZBDwcN4+EpUB1Hi",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: Wavelength.PubSub,
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

config :kafka_ex,
  brokers: [{"192.168.99.100", 9092}],
  consumer_group: "kafka_ex",
  disable_default_worker: true,
  sync_timeout: 1000 #Timeout used synchronous requests from kafka. Defaults to 1000ms.

import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :treefi, TreeFi.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "treefi_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :treefi, TreeFiWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "4m3Fog+AtnW9mRcKBd0vbZz8SjpE3B+NsMyGaF9gZ4s3dcTtJUvVIY+aZzj0mbIm",
  server: false

# In test we don't send emails.
config :treefi, TreeFi.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters.
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

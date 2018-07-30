use Mix.Config

# Configure your database
config :rsvp, Rsvp.Repo,
    adapter: Ecto.Adapters.Postgres,
    hostname: "localhost",
    database: "rsvp",
    username: "postgres",
    password: "postgres"

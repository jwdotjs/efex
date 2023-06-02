import Config

config :efex, EfexWeb.Endpoint,
  secret_key_base: "zzzzzzzzyyyxxxwwwuuuvvvtttsssrr/L2d0poebWOGq7xcylDXSd7PYMq6CYMrz",
  http: [port: 4141],
  url: [scheme: "http", host: "localhost", port: 4141]

config :efex, Efex.Repo,
  adapter: Ecto.Adapters.Postgres,
  ssl: false,
  pool_size: 10,
  url: System.get_env("DATABASE_URL", "postgres://db:db@localhost:5429/db")

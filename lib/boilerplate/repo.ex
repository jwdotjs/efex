defmodule Efex.Repo do
  use Ecto.Repo,
    otp_app: :efex,
    adapter: Ecto.Adapters.Postgres
end

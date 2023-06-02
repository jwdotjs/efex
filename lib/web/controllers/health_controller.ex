defmodule EfexWeb.HealthController do
  use Phoenix.Controller

  def ping(conn, _params) do
    conn
    |> put_status(200)
    |> json(%{message: "pong"})
  end
end

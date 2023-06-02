defmodule Efex.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    Supervisor.start_link(
      [
        Efex.Repo,
        {Finch, name: Efex.Finch},
        EfexWeb.Endpoint
      ],
      strategy: :one_for_one,
      name: Efex.Supervisor
    )
  end
end

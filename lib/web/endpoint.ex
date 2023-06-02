defmodule EfexWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :efex

  plug(Plug.RequestId)

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()
  )

  plug(Plug.MethodOverride)
  plug(Plug.Head)

  plug(
    Plug.Session,
    store: :cookie,
    key: "_efex",
    signing_salt: "9Abcdefg"
  )

  plug(EfexWeb.Router)
end

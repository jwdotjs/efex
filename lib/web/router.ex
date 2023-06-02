defmodule EfexWeb.Router do
  use Phoenix.Router

  scope "/", EfexWeb do
    get("/ping", HealthController, :ping)
    post("/slack/incoming-event", WebhookController, :slack_incoming_event)
  end
end

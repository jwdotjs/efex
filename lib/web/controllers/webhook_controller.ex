defmodule EfexWeb.WebhookController do
  use Phoenix.Controller

  def slack_incoming_event(conn, %{
        "challenge" => challenge,
        "token" => _token,
        "type" => "url_verification"
      }) do
    # Todo verify authenticity of request before responding - https://api.slack.com/authentication/verifying-requests-from-slack

    conn
    |> put_status(200)
    |> json(%{challenge: challenge})
  end

  def slack_incoming_event(
        conn,
        %{
          "api_app_id" => _api_app_id,
          "authorizations" => _authorizations,
          "event" => event,
          "type" => "event_callback"
        }
      ) do
    # Todo verify authenticity of request before acting on this event - https://api.slack.com/authentication/verifying-requests-from-slack

    Efex.Slack.handle_incoming_event(event)

    conn
    |> put_status(200)
    |> json(%{message: "ok"})
  end
end

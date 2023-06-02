defmodule Efex.Slack do
  @doc """
  "event" => %{
    "blocks" => [
      %{
        "block_id" => "5OFp",
        "elements" => [
          %{
            "elements" => [%{"text" => "hi", "type" => "text"}],
            "type" => "rich_text_section"
          }
        ],
        "type" => "rich_text"
      }
    ],
    "channel" => "C0000000000",
    "channel_type" => "channel",
    "client_msg_id" => "some-uuid",
    "event_ts" => "1685737237.022049",
    "team" => "T0000000000",
    "text" => "hi",
    "ts" => "1685737237.022049",
    "type" => "message",
    "user" => "U00000000000"
  },
  """

  def handle_incoming_event(%{"bot_id" => _bot_id}) do
    # Don't allow infinite loops and don't respond to bots
    :noop
  end

  def handle_incoming_event(%{"type" => "message"} = event) do
    IO.inspect(event)
    bot_preferences = Application.get_env(:efex, :bot_preferences)

    Efex.Slack.HttpClient.api_call("chat.postMessage", %{
      username: bot_preferences |> Keyword.get(:username),
      icon_emoji: bot_preferences |> Keyword.get(:icon_emoji),
      text: "hello world",
      channel: event["channel"],
      # Replies in the thread (Creates a thread if it doesn't exist)
      thread_ts: Map.get(event, "thread_ts", event["ts"])
    })
  end

  def handle_incoming_event(%{"type" => "app_mention"} = event) do
    # Todo, this is when the bot is tagged directly, but it comes in separately than a `message`
    :noop
  end
end

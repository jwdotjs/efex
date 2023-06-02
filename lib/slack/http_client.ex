defmodule Efex.Slack.HttpClient do
  use Tesla

  plug(Tesla.Middleware.FormUrlencoded, [])
  plug(Tesla.Middleware.Headers, [])

  # adapter(Tesla.Adapter.Hackney, recv_timeout: 120_000, pool: false)

  require Logger

  def base_url, do: Application.get_env(:efex, :slack) |> Keyword.get(:base_url)
  defp oauth_token, do: Application.get_env(:efex, :slack) |> Keyword.get(:oauth_token)

  @doc """
  Valid methods:

  "chat.postMessage"

  Valid payloads:

  %{
    text: "hello there",
    channel: "...",
  }
  """
  def api_call(method, payload) do
    "#{base_url()}/#{method}"
    |> post(
      payload,
      headers: [
        {"Authorization", "Bearer " <> oauth_token()},
        {"Content-Type", "application/x-www-form-urlencoded"}
      ]
    )
    |> case do
      {:ok, %{status: 200, body: body}} ->
        {:ok, body}

      {_ok_or_error, %{status: status_code, body: body}} ->
        Logger.warning(
          "Slack API call failed with status code of #{status_code} and body of #{inspect(body)}"
        )

        {:error, :api_call_failed}
    end
  end
end

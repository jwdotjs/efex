import Config

DotenvParser.load_file(".env")

config :efex, :slack,
  base_url: System.get_env("SLACK_BASE_URL", "https://slack.com/api/"),
  oauth_token: System.get_env("SLACK_OAUTH_TOKEN", "")

import Config

env = System.get_env("MIX_ENV") || "dev"

if env == "dev" do
  DotenvParser.load_file(".env")
end

config :efex,
  redis_url: System.get_env("REDIS_URL", "redis://:redis@localhost:6329")

config :efex, :slack,
  base_url: System.get_env("SLACK_BASE_URL", "https://slack.com/api/"),
  oauth_token: System.get_env("SLACK_OAUTH_TOKEN", "")

config :efex, :bot_preferences,
  username: System.get_env("BOT_USERNAME", "Efex"),
  icon_emoji: System.get_env("BOT_EMOJI", ":whale:")

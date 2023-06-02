defmodule Efex.MixProject do
  use Mix.Project

  def project do
    [
      app: :efex,
      version: "0.1.0",
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :runtime_tools],
      mod: {Efex.Application, []}
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:dotenv_parser, "~> 2.0", only: [:dev]},
      {:ecto_sql, "~> 3.10"},
      {:finch, "~> 0.13"},
      {:jason, "~> 1.4"},
      {:postgrex, "~> 0.17.1"},
      {:phoenix, "~> 1.7.3"},
      {:phoenix_ecto, "~> 4.4"},
      {:redix, "~> 1.2"},
      {:tesla, "~> 1.7"},
      {:plug_cowboy, "~> 2.5"}
    ]
  end

  defp aliases do
    []
  end
end

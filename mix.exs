defmodule PceraBot.MixProject do
  use Mix.Project

  def project do
    [
      app: :pcera_bot,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {PceraBot, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_gram, "~> 0.6.2"},
      {:jason, ">= 1.0.0"},
      {:wakeonlan, "~> 0.1.0"}
    ]
  end
end

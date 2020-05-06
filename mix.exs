defmodule Soic.MixProject do
  use Mix.Project

  def project do
    [
      app: :soic,
      version: "0.1.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def escript do
    [main_module: Soic.CLI]
  end

  defp deps do
    [
      {:httpoison, "~> 1.6"},
      {:floki, "~> 0.26.0"}
    ]
  end
end

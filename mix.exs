defmodule Processmon.Mixfile do
  use Mix.Project

  def project do
    [app: :processmon,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  defp aliases do
  [
    test: "test --no-start" #(2)
  ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :porcelain, :cowboy, :poison],
    mod: {Processmon, []}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [ {:porcelain, "~> 2.0"},
      {:cowboy, github: "extend/cowboy", tag: "2.0.0-pre.3"},
      {:poison, "~> 3.0"},
      {:distillery, "~> 1.0"} ]
  end
end

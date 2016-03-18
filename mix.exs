defmodule Monolith.Mixfile do
  use Mix.Project

  def project do
    [app: :monolith,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases,
     deps: deps]
  end

  def aliases do
    [c: ["deps.get", "deps.compile", "compile", "docs"],
     r: ["clean", "c"],
     lint: ["dialyzer", "inch", "credo list"]]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
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
    [{:earmark, "~> 0.2.1"},

     {:ex_doc, "~> 0.11.4", only: :dev},
     {:dialyxir, "~> 0.3.3", only: :dev},
     {:credo, "~> 0.3.7", only: :dev},
     {:inch_ex, "~> 0.5.1", only: :dev},

     {:mock, "~> 0.1.3", only: :test}]
  end
end

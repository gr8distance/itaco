defmodule Itaco.MixProject do
  use Mix.Project

  def project do
    [
      app: :itaco,
      version: "1.0.0",
      elixir: "~> 1.11",
      description: "itaco is a wrapper that assists ecto",
      start_permanent: Mix.env() == :prod,
      package: [
        maintainers: ["gr8distance"],
        licenses: ["MIT"],
        links: %{"GitHub" => "https://github.com/gr8distance/itaco"}
      ],
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end
end

defmodule Mix.Tasks.Monolith.Init do
  use Mix.Task

  @moduledoc """
  Initializes your static site project.

  This actually means, that the necessary folder structure is created and
  populated.

  In this project the following folders will be created:
  * `priv/posts/`: Holds all the nice articles you have published.
  * `priv/drafts/`: Holds all the nice articles you have not yet published.
  * `priv/pages/`: Holds all the pages, that are not articles. ie an about-page.
  * `priv/templates/`: Holds the templates for the sites.

  This task does not accept any arguments and will fail when you provide some.
  """

  @shortdoc "Initializes your project."

  @doc false
  def run(args)
  def run([]), do: Monolith.init_project
  def run(_) do
    IO.puts "No arguments accepted."
    System.halt(1)
  end
end

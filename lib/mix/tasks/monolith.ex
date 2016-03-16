defmodule Mix.Tasks.Monolith do
  use Mix.Task

  @moduledoc """
  Please use one of the following sub-tasks:

  * `monolith.init`: Initializes a project
  """

  @doc false
  def run(_args), do: Mix.Task.run("help", ["monolith"])
end

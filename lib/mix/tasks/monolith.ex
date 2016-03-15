defmodule Mix.Tasks.Monolith do
  use Mix.Task
  use Ra

  banner """
  This is an example task.

  Use it like:
      $ mix monolith <command> <args>
  """

  command :init, "Initialize the site", Monolith.Tasks.init
  command :compile, "Compiles the site", Monolith.Tasks.compile
  command :server, "Starts a server which delivers the site", Monolith.Tasks.server
  command :watch, "Recompiles as files change and keeps a server running", Monolith.Tasks.watch
  command :deploy, "Compiles and deploys the site as configured", Monolith.Tasks.deploy

  parse
end

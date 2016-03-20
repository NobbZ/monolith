defmodule Mix.Tasks.Monolith.New do
  use Mix.Task

  @version Mix.Project.config[:version]

  @shortdoc "Creates a new Monolith v#{@version} project"
  @moduledoc """
  Creates a new Monolith project from scratch.

  # Usage:

  `mix monolith.new <path> [options]`

  ## Options

  * `--app :string`: The name of the generated app.
  * `--title :string`: The projects site main title.
  * `--module :string`: The name of the projects “main”-module.

  If these are not provided, their value will be tried to guess from the given
  path.

  The following options do specify the kind of deployment. You can specify as
  many as you want, but each at most once. If none is given, `--manually` is
  assumed.

  * `--ghpages :string`: Specifies GitHub-pages as deployment-target. Takes the
    users or (qualified) repository name, the site shall be deployed to.
  * `--ftp :string`: enables deployment to an FTP-Server. It takes the servers
    URL where you can ommit the protocol.
  * `--manually`: Do not try to automatically deploy anything. Any invocation
    of `mix monolith.deploy` will result in an error.
  """

  def run([]) do
    Mix.shell.error "You need to specify at least `<path>`!"
    Mix.Task.run "help", ["monolith.new"]
  end

  def run([path]) do
    app = path |> Path.expand |> Path.basename
    title = app
      |> String.split("_")
      |> Enum.map(&String.capitalize/1)
      |> Enum.join(" ")
    module = app |> Mix.Utils.camelize
    run([path, "--app", app, "--title", title, "--module", module, "--manually"])
  end

  def run([path|args]) do
    {opts, args, invalid} = OptionParser.parse(args, switches: [app: :string, manually: :boolean])
    Mix.shell.info inspect path
    Mix.shell.info inspect opts
    Mix.shell.info inspect args
    Mix.shell.info inspect invalid
  end
end

  

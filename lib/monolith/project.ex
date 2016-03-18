defmodule Monolith.Project do
  require EEx

  @moduledoc """
  This module does contain functions which are needed to handle Monolith
  projects.
  """

  @doc """
  Initializes a project.

  To do this, there are some folders created (below `./priv/`) and inside these
  folders there are some example and template files created.
  """
  @spec init() :: boolean()
  def init() do
    IO.puts Mix.Project.get()
    create_folders()
    create_templates()
  end

  defp create_folders() do
    ["posts", "drafts", "pages", "templates"]
    |> Enum.map(&("./priv/#{&1}"))
    |> Enum.map(&Mix.Generator.create_directory/1)
    |> Enum.all?(&(&1 == :ok))
  end

  defp create_templates() do
    Mix.Generator.create_file("./priv/templates/post.md.eex", post_md_eex)
  end

  EEx.function_from_file(:defp, :post_md_eex, "./priv/templates/templates/post.md.eex")
end

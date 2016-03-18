defmodule Monolith.Project do
  require EEx

  @folder_names ["posts", "drafts", "pages", "templates"]
  @folders Enum.map(@folder_names, &("./priv/#{&1}"))

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
    create_folders()
    create_gitkeep()
    create_templates()
  end

  defp create_folders() do
    @folder_names
    |> Enum.map(&Mix.Generator.create_directory/1)
    |> Enum.all?(&(&1 == :ok))
  end

  defp create_gitkeep() do
    @folder_names
    |> Enum.map(&Mix.Generator.create_file("#{&1}/.gitkeep", ""))
  end

  defp create_templates() do
    Mix.Generator.create_file("./priv/templates/post.md.eex", post_md_eex)
  end

  EEx.function_from_file(:defp, :post_md_eex, "./priv/templates/templates/post.md.eex")
end

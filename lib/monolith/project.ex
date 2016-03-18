defmodule Monolith.Project do
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
  end

  defp create_folders() do
    ["posts", "drafts", "pages", "templates"]
    |> Enum.map(&("./priv/#{&1}"))
    |> Enum.map(&File.mkdir_p/1)
    |> Enum.all?(&(&1 == :ok))
  end
end

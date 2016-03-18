defmodule Monolith.Project do
  require Logger

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

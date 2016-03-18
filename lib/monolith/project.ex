defmodule Monolith.Project do
  require Logger

  @spec init() :: boolean()
  def init() do
    create_folders()
  end

  defp create_folders() do
    folders = Enum.map(["posts", "drafts", "pages", "templates"], &("./priv/#{&1}"))
    for folder <- folders do
      Logger.info "Creating `#{folder}`"
      case File.mkdir_p(folder) do
        {:error, reason} ->
          Logger.error "Could not create #{folder}: #{reason}"
          {:error, reason}
        :ok -> :ok
      end
    end
    |> Enum.all?(&(&1 == :ok))
  end
end

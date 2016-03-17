ExUnit.start()

defmodule TestHelper do
  def cleanup do
    folders = Enum.map(["posts", "drafts", "pages", "templates"], &("./priv/#{&1}"))
    for folder <- folders, do: File.rm_rf folder
  end
end

defmodule Monolith.ProjectTest do
  use ExUnit.Case, async: false

  setup do
    on_exit fn -> TestHelper.cleanup end
  end

  test "Directory structure is created" do
    Monolith.Project.init()

    folders = Enum.map(["posts", "drafts", "pages", "templates"], &("./priv/#{&1}"))
    for folder <- folders, do: assert File.dir?(folder)
  end 
end

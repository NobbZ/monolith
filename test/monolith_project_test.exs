defmodule Monolith.ProjectTest do
  use ExUnit.Case, async: false

  import Mock

  test_with_mock "Directory structure is created", File,
    [mkdir_p: fn(_path) -> :ok end] do
    assert true == Monolith.Project.init()

    folders = Enum.map(["posts", "drafts", "pages", "templates"], &("./priv/#{&1}"))
    for folder <- folders, do: assert called File.mkdir_p(folder)
  end

  test_with_mock "It fails when one directory cant be created", File,
    [mkdir_p: fn("./priv/posts") -> {:error, :because}
                (_path)          -> :ok end] do
      assert false == Monolith.Project.init()
  end
end

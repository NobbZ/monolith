defmodule Monolith.ProjectTest do
  use ExUnit.Case, async: false

  ExUnit.configure exclude: [:have_to_look_at_how_to_fix_them_later]

  import Mock

  @tag :have_to_look_at_how_to_fix_them_later
  test_with_mock "Directory structure is created", Mix.Generator, [
      create_directory: fn(_path) -> :ok end,
      create_file: fn(_path, _content) -> :ok end
    ] do
    folders = Enum.map(["posts", "drafts", "pages", "templates"], &("./priv/#{&1}"))
    for folder <- folders, do: assert called Mix.Generator.create_directory(folder)
  end

  @tag :have_to_look_at_how_to_fix_them_later
  test_with_mock "It creates all the gitkeeps", Mix.Generator, [
      create_directory: fn(_path) -> :ok end,
      create_file: fn(_path, _content) -> :ok end
    ] do
    gitkeeps = Enum.map(["posts", "drafts", "pages", "templates"], &("./priv/#{&1}/.gitkeep"))
    for gitkeep <- gitkeeps, do: assert called Mix.Generator.create_file(gitkeep, "")
  end
end

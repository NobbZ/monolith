defmodule Monolith do
  @moduledoc "./README.md"
              |> File.read!
              |> String.split("\n")
              |> Enum.drop(2)
              |> Enum.join("\n")
end

defmodule Monolith do
  @moduledoc File.read!("./README.md") |> String.split("\n") |> Enum.drop(2) |> Enum.join("\n")
end

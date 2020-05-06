defmodule Soic.Size do
  @moduledoc """
  Helpers for get terminal size.
  """

  def screen_size do
    {num("lines"), num("cols")}
  end

  def row_size do
    num("lines")
  end

  def column_size do
    num("cols")
  end

  defp num(subcommand) do
    case System.cmd("tput", [subcommand]) do
      {text, 0} ->
        text
        |> String.trim()
        |> String.to_integer()

      _ ->
        0
    end
  end
end

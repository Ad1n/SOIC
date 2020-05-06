defmodule Soic.Color do
  @moduledoc """
  Console colorizators.
  """

  alias Soic.Size

  @background_color 232

  @doc """
  Resets terminal colors to default values.
  """
  def reset do
    IO.write(IO.ANSI.reset())
  end

  @doc """
  Changes row background color and return carriage to the start of the line.
  """
  def draw_background do
    IO.write(IO.ANSI.color_background(@background_color) <> input_box(Size.column_size()) <> "\r")
  end

  defp input_box(size) do
    String.duplicate(" ", size)
  end

  @doc """
  Prints colored string in terminal.
  """
  def code(code, text) do
    IO.ANSI.color(code) <> text <> IO.ANSI.reset()
  end

  @doc """
  Prints all color variants.
  """
  def draw do
    Enum.each(0..255, fn code ->
      IO.puts(code(code, "Code #{code}"))
      Process.sleep(1)
    end)
  end
end

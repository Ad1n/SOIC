defmodule Soic.IO do
  alias Soic.{Color, Size}

  @question_color 55
  @link_color 3

  def loading do
    IO.puts("Loading...")
  end

  def print_suggestions(questions) do
    Enum.each(questions, fn el ->
      {target, index} = el
      {_, [{_, link}], [q]} = target

      Color.draw_background()
      IO.puts(Color.code(@question_color, "#{index}.  " <> q))
      Color.draw_background()
      IO.puts(Color.code(@link_color, link <> "\n\n"))
    end)
  end
end

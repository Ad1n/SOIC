defmodule Soic.CLI do
  alias Soic.{IO, Color}

  def main(args) do
    IO.loading()

    {params, question_list, _} = Soic.parse_args(args)

    Soic.do_request(question_list)
    |> Soic.parse_questions()
    |> Soic.filter_size(params[:num])
    |> IO.print_suggestions()

    Color.reset()
  end
end

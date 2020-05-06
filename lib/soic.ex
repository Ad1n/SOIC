defmodule Soic do
  @source_link "https://www.stackexchange.com/search?q="
  @output_word_separator "+"
  @headers [{"X-Frame-Options", "SAMEORIGIN"}]
  @default_count 10

  def do_request(question_list) do
    {_status, resp} =
      prepare_request(question_list)
      |> HTTPoison.get(@headers, follow_redirect: true)

    {:ok, document} = Floki.parse_document(resp.body)
    document
  end

  def filter_size(questions, count \\ @default_count) do
    Enum.take_while(Enum.with_index(questions), fn x ->
      {_el, index} = x

      case count do
        nil ->
          index < @default_count

        _ ->
          index < count
      end
    end)
  end

  def parse_args(args) do
    OptionParser.parse(args, strict: [n: :integer, num: :integer], aliases: [n: :num])
  end

  def parse_questions(doc) do
    doc |> Floki.find(".result-link") |> Floki.find("a")
  end

  def prepare_request(question) do
    @source_link <> Enum.join(question, @output_word_separator)
  end
end

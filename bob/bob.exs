defmodule Teenager do
  @responses %{
    :question => "Sure.",
    :yell     => "Whoa, chill out!",
    :nothing  => "Fine. Be that way!",
    :other    => "Whatever."
  }

  def hey(input) do
    input |> detect_input |> get_response
  end

  defp detect_input(input) do
    cond do
      is_question? input -> :question
      is_silence? input  -> :nothing
      is_yell? input     -> :yell
      true               -> :other
    end
  end

  defp is_question?(input), do: String.ends_with?(input, "?")

  defp is_yell?(input) do
    Regex.match?(~r/\p{L}+/, input) && String.upcase(input) == input
  end

  defp is_silence?(input), do: String.strip(input) |> String.length == 0

  defp get_response(type), do: @responses[type]
end

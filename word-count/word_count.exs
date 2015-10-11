defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence |> sanitize_sentence |> split_sentence |> count_words
  end

  defp sanitize_sentence(sentence) do
    sentence |>
    String.replace(~r/[\!@#\$\.\,\;\:\&\%\^\*]/u, "") |>
    String.replace(~r/\s+/, " ") |>
    String.downcase
  end

  defp split_sentence(sentence) do
    String.split(sentence, ~r/(\ |_)/)
  end

  defp count_words(words) do
    Enum.reduce(words, %{}, fn(key, acc) ->
      update_value acc, key
    end)
  end

  defp update_value(dict, key) do
    Dict.update(dict, key, 1, &(&1 + 1))
  end
end


defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    Enum.filter candidates, fn(candidate) ->
      stringToDict(candidate) == stringToDict(base) &&
      String.downcase(candidate) !== String.downcase(base)
    end
  end

  defp stringToDict(string) do
    string |>
    String.split("") |>
    Enum.reduce(%{}, fn (a,b) ->
      Dict.update(b, String.downcase(a), 1, &(&1 + 1))
    end)
  end
end

defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) do
    cond do
      a === b        -> :equal
      sublist?(a, b) -> :sublist
      sublist?(b, a) -> :superlist
      true           -> :unequal
    end
  end

  defp sublist?(_, []), do: false
  defp sublist?([], _), do: true
  defp sublist?(a, b), do: check_chain a, b, a, b

  defp check_chain([c|ta], [c|tb], a, b), do: check_chain ta, tb, a, b
  defp check_chain([], _, _, _), do: true
  defp check_chain(_, _, a, [_|t]), do: sublist?(a, t)
end

defmodule DNA do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> DNA.hamming_distance('AAGTCATA', 'TAGCGATC')
  4
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) when length(strand1) == length(strand2) do
    length(strand1) - length(list_difference(strand1, strand2))
  end
  def hamming_distance(_, _), do: nil

  defp list_difference(list1, list2) do
    Enum.zip(list1, list2) |>
    Enum.filter( fn(tuple) ->
      elem(tuple, 0) === elem(tuple, 1)
    end)
  end
end

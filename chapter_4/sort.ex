defmodule Sort do

  def ascending([]), do: []
  def ascending([a]), do: [a]
  def ascending(list) when is_list(list) do
    half_number = div(Enum.count(list), 2) #returns an integer for Enum.split
    {list_a, list_b} = Enum.split(list, half_number)
    merge(ascending(list_a), ascending(list_b))
  end
  def ascending(_list) do
    {:error, "not a list"}
  end

  defp merge(list_a, []), do: list_a
  defp merge([], list_b), do: list_b
  defp merge([head_a | tail_a], list_b = [head_b |_tail_b]) when head_a <= head_b do
    [head_a | merge(tail_a, list_b)]
  end
  defp merge(list_a = [head_a | _tail_a], [head_b | tail_b]) when head_a > head_b do
    [head_b | merge(list_a, tail_b)]
  end
end





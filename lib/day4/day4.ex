defmodule AdventOfCode.Day4 do
  def solve(phrase) when is_binary(phrase), do: solve([phrase])

  def solve(phrases) when is_list(phrases) do
    phrases
    |> Stream.map(&String.split/1)
    |> Stream.reject(&is_not_uniq/1)
    |> Enum.count
  end

  def is_not_uniq(enumarable) do
    enumarable
    |> Stream.transform(MapSet.new(), &({[MapSet.member?(&2, &1)], MapSet.put(&2, &1)}))
    |> Enum.any?()
  end
end
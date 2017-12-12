defmodule AdventOfCode.Day4 do
  def solve(phrase, part) when is_binary(phrase), do: solve([phrase], part)

  def solve(phrase, :part1) do
    phrases
    |> Stream.map(&String.split/1)
    |> Stream.reject(&is_not_uniq/1)
    |> Enum.count()
  end

  def solve(phrases, :part2) do
    phrases
    |> Stream.map(&String.split/1)
    |> Stream.reject(&has_anagrams/1)
    |> Enum.count()
  end

  def has_anagrams(words) do
    words
    |> Stream.map(&String.to_charlist/1)
    |> Stream.map(&MapSet.new/1)
    |> permutations
    |> Stream.filter(fn {a, b} -> MapSet.equal?(a, b) end)
    |> Enum.any?()
  end

  def permutations(input) do
    for {a, i} <- Stream.with_index(input),
        b <- Stream.drop(input, i + 1),
        do: {a, b}
  end

  def is_not_uniq(enumarable) do
    enumarable
    |> Stream.transform(MapSet.new(), &{[MapSet.member?(&2, &1)], MapSet.put(&2, &1)})
    |> Enum.any?()
  end

  def read(file_name) do
    File.stream!(file_name)
    |> Stream.map(&String.trim/1)
  end
end
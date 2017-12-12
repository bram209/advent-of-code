defmodule AdventOfCode.Day4 do
  def solve(phrase, part) when is_binary(phrase), do: solve([phrase], part)
  
  def solve(phrases, :part1), do: _solve(phrases, &is_not_uniq/1)
  def solve(phrases, :part2), do: _solve(phrases, &has_anagrams/1)

  defp _solve(phrases, reject_fun) do
    phrases
    |> Stream.map(&String.split/1)
    |> Stream.reject(reject_fun)
    |> Enum.count()
  end

  def has_anagrams(words) do
    words
    |> Enum.map(&String.to_charlist/1)
    |> Enum.map(&Enum.sort/1)
    |> permutations()
    |> Stream.filter(fn {a, b} -> a == b end)
    |> Enum.any?()
  end

  def is_not_uniq(enumarable) do
    enumarable
    |> Stream.transform(MapSet.new(), &{[MapSet.member?(&2, &1)], MapSet.put(&2, &1)})
    |> Enum.any?()
  end

  def permutations(input) do
    for {a, i} <- Enum.with_index(input),
        b <- Enum.drop(input, i + 1),
        do: {a, b}
  end

  def read(file_name) do
    File.stream!(file_name)
    |> Stream.map(&String.trim/1)
  end
end
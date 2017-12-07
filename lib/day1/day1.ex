defmodule AdventOfCode.Day1 do
  def solve1(string) do
    string
    |> digits
    |> sum
  end

  def solve2(string) do
    digits = string |> digits
    sum(digits, Integer.floor_div(length(digits), 2))
  end

  def sum(digits, step \\ 1) do
    digits
    |> Stream.cycle()
    |> Stream.drop(step)
    |> Stream.zip(digits)
    |> Stream.filter(fn {x, y} -> x == y end)
    |> Stream.map(fn {x, _} -> x end)
    |> Enum.sum()
  end

  def digits(string) do
    string
    |> String.codepoints()
    |> Enum.map(&String.to_integer/1)
  end
end
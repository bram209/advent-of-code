defmodule AdventOfCode.Day1 do
  def solve(string) do
    string
    |> digits
    |> sum
  end

  def sum(digits) do
    digits
    |> Stream.cycle
    |> Stream.drop(1)
    |> Stream.zip(digits)
    |> Enum.filter(fn {x, y} -> x == y end)
    |> Enum.map(fn {x, _} -> x end)
    |> Enum.sum()
  end

  def digits(string) do
    string
    |> String.codepoints()
    |> Enum.map(&String.to_integer/1)
  end
end
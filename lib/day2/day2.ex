defmodule AdventOfCode.Day2 do
  def solve(input, :part1), do: solve(input, &checksum1/1)
  def solve(input, :part2), do: solve(input, &checksum2/1)

  def solve(input, compute_checksum) do
    input
    |> Stream.map(&compute_checksum.(&1))
    |> Enum.sum
  end

  def checksum1(row) do
    abs(Enum.min(row) - Enum.max(row))
  end

  def checksum2(row) do
    row
    |> permutations
    |> Enum.map(fn {a,b} -> {max(a, b), min(a,b)} end)
    |> Enum.filter(fn {a, b} -> rem(a, b) == 0 end)
    |> Enum.map(fn {a, b} -> Integer.floor_div(a, b) end)
    |> Enum.sum
  end

  def permutations(input) do
    for {a, i} <- Enum.with_index(input),
        b <- Enum.drop(input, i + 1), # Make sure to have unique combinations. For example, we don't want {1,2} AND {2,1}, we neither want {1,1}, {2,2} etc
        do: {a, b}
  end

  def parse(file_name) do
    File.stream!(file_name)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.split/1)
    |> Stream.map(fn row -> Enum.map(row, &String.to_integer/1) end)
  end
end
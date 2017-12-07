defmodule AdventOfCode.Day2 do
  def sum(input) do
    input
    |> Stream.map(&{Enum.min(&1), Enum.max(&1)})
    |> Stream.map(fn {min, max} -> abs(min - max) end) # TODO improve performance by calculating min and max in one go -> Reduce?
    |> Enum.sum    
  end

  def parse(file_name) do
    File.stream!(file_name)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&String.split/1)
    |> Stream.map(fn row -> Enum.map(row, &String.to_integer/1) end)
  end
end
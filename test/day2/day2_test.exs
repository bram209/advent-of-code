defmodule AdventOfCode.Day2Test do
  use ExUnit.Case

  alias AdventOfCode.Day2

  @example [
    [5, 1, 9, 5],
    [7, 5, 3],
    [2, 4, 6, 8]
  ]

  test "solving the example should produce a sum of 18 (8 + 4 + 6)" do
    assert Day2.sum(@example) == 18
  end
end
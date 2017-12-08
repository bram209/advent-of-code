defmodule AdventOfCode.Day3Test do
  use ExUnit.Case

  alias AdventOfCode.Day3

  test "data from square 1 is carried 0 steps" do
    assert Day3.solve(1) == 0
  end

  test "data is carried the correct amount of steps" do
    assert Day3.solve(12) == 3
    assert Day3.solve(23) == 2
    assert Day3.solve(1024) == 31
  end
end
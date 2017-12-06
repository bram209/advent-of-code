defmodule AdventOfCode.Day1Test do
  use ExUnit.Case
  
  test "1122 produces a sum of 3 (1 + 2)" do
    assert AdventOfCode.Day1.solve("1122") == 3
  end

  test "each digit matches the next" do
    assert AdventOfCode.Day1.solve("1111") == 4
  end

  test "no digit matches the next" do
    assert AdventOfCode.Day1.solve("1234") == 0
  end

  test "last digit matches the first" do
    assert AdventOfCode.Day1.solve("91212129") == 9
  end
end
defmodule AdventOfCode.Day1Test do
  use ExUnit.Case

  alias AdventOfCode.Day1

  test "converts a string into a list of digits" do
    assert Day1.digits("588548") == [5, 8, 8, 5, 4, 8]
  end

  test "1122 produces a sum of 3 (1 + 2)" do
    assert Day1.solve1("1122") == 3
  end

  test "each digit matches the next" do
    assert Day1.solve1("1111") == 4
  end

  test "no digit matches the next" do
    assert AdventOfCode.Day1.solve1("1234") == 0
  end

  test "last digit matches the first" do
    assert AdventOfCode.Day1.solve1("91212129") == 9
  end

  test "all four digits match the digit 2 items ahead" do
    assert AdventOfCode.Day1.solve2("1212") == 6
  end

  test "every comparison is between a 1 and a 2" do
    assert AdventOfCode.Day1.solve2("1221") == 0
  end

  test "both 2s match each other, but no other digit has a match" do
    assert AdventOfCode.Day1.solve2("123425") == 4
  end

  test "123123 produces 12" do
    assert AdventOfCode.Day1.solve2("123123") == 12
  end

  test "12131415 produces 4" do
    assert AdventOfCode.Day1.solve2("12131415") == 4
  end
end
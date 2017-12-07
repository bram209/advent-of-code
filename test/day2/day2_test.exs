defmodule AdventOfCode.Day2Test do
  use ExUnit.Case

  alias AdventOfCode.Day2

  @example1 [
    [5, 1, 9, 5],
    [7, 5, 3],
    [2, 4, 6, 8]
  ]

  @example2 [
    [5, 9, 2, 8],
    [9, 4, 7, 3],
    [3, 8, 6, 5]
  ]

  test "solving part 1 with the example should produce a sum of 18 (8 + 4 + 6)" do
    assert Day2.solve(@example1, :part1) == 18
  end

  test "solving part 2 with the example should produce a sum of 9 (4 + 3 + 2)" do
    assert Day2.solve(@example2, :part2) == 9
  end

  test "creates the correct checksum for part 1" do
    assert Day2.checksum1([2, 4, 9, 3]) == 7 # 9 - 2
    assert Day2.checksum1([9, 4, 2, 3]) == 7 # 9 - 2
  end

  test "creates the correct checksum for part 2" do
    assert Day2.checksum2([5, 9, 2, 8]) == 4 # 8/2
    assert Day2.checksum2([2, 4, 8, 3]) == 8 # 8/4 + 8/2 + 4/2
    assert Day2.checksum2([9, 2, 2, 11]) == 0 # Duplicate values 
  end

  test "creates the correct permutations" do
    assert Day2.permutations([1, 5, 8, 2]) == [{1, 5}, {1, 8}, {1, 2}, {5, 8}, {5, 2}, {8, 2}]
  end
end
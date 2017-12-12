defmodule AdventOfCode.Day4Test do
  use ExUnit.Case

  alias AdventOfCode.Day4

  # Part 1
  test "pass phrase is unique" do
    assert Day4.solve("aa bb cc dd ee", :part1) == 1
    assert Day4.solve("aa bb cc dd aaa", :part1) == 1
  end

  test "pass phrase with duplicate values is not unique" do
    assert Day4.solve("aa bb cc dd aa", :part1) == 0
  end

  test "2 out of 3 phrases are unique" do
    assert Day4.solve(["aa bb cc dd aaa", "aa bb cc dd ee", "aa bb cc dd aa"], :part1) == 2
  end

  # Part 2
  test "pass phrase has no anagrams" do
    assert Day4.solve("abcde fghij", :part2) == 1
    assert Day4.solve("a ab abc abd abf abj", :part2) == 1
    assert Day4.solve("iiii oiii ooii oooi oooo", :part2) == 1
  end

  test "pass phrase has anagrams" do
    assert Day4.solve(["oiii ioii iioi iiio", "abcde xyz ecdab"], :part2) == 0
  end

end
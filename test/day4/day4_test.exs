defmodule AdventOfCode.Day4Test do
  use ExUnit.Case

  alias AdventOfCode.Day4

  test "pass phrase is valid" do
    assert Day4.solve("aa bb cc dd ee") == 1
    assert Day4.solve("aa bb cc dd aaa") == 1
  end

  test "pass phrase with duplicate values is not valid" do
    assert Day4.solve("aa bb cc dd aa") == 0
  end

  test "2 out of 3 phrases are correct" do
    assert Day4.solve(["aa bb cc dd aaa", "aa bb cc dd ee", "aa bb cc dd aa"]) == 2
  end
end
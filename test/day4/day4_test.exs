defmodule AdventOfCode.Day4Test do
  use ExUnit.Case

  alias AdventOfCode.Day4

  test "pass phrase is valid" do
    assert Day4.solve("aa bb cc dd ee") == true
    assert Day4.solve("aa bb cc dd aaa") == true
  end

  test "pass phrase with duplicate values is not valid" do
    assert Day4.solve("aa bb cc dd aa") == false
  end
end
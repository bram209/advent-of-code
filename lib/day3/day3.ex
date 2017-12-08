defmodule AdventOfCode.Day3 do
  defmodule Square do
    defstruct [:value, :x, :y]
  end

  # 17 16 15 14 13
  # 18 5  4  3  12
  # 19 6  1  2  11
  # 20 7  8  9  10
  # 21 22 23 24 25
  # right(1) up(size-2), left(size-1), down(size-1), right(size-1)

  def solve(input) when input == 1, do: 0

  def solve(input) when is_number(input) and input > 1 do
    build_path()
    |> Stream.drop_while(&(&1.value != input))
    |> Enum.take(1)
    |> Enum.map(&(abs(&1.x) + abs(&1.y)))
    |> hd()
  end

  # Maps the infinite spiral stream, that emits relative coordinates, to squares
  def build_path do
    build_spiral()
    |> Stream.scan(%Square{value: 1, x: 0, y: 0}, fn {delta_x, delta_y},%Square{value: value, x: x, y: y} ->
         %Square{value: value + 1, x: x + delta_x, y: y + delta_y}
       end)
  end

  # Generate an infinite spiral stream
  def build_spiral do
    Stream.resource(
      fn -> 3 end,
      fn box_size -> {spiral_steps(box_size), box_size + 2} end,
      fn _ -> :ok end
    )
    |> Stream.flat_map(fn {repeat, cords} -> for _ <- 1..repeat, do: cords end)
  end

  # right(1) up(size-2), left(size-1), down(size-1), right(size-1)
  def spiral_steps(box_size) do
    [
      {1, {1, 0}},
      {box_size - 2, {0, -1}},
      {box_size - 1, {-1, 0}},
      {box_size - 1, {0, 1}},
      {box_size - 1, {1, 0}}
    ]
  end
end
defmodule AdventOfCode.Day3 do
  defmodule Square do
    defstruct [:value, :x, :y]
  end

  def solve(input, _) when input == 1, do: 0
  def solve(input, part) when is_number(input) and input > 1, do: _solve(input, part)

  defp _solve(input, :part1) do
    build_path(:part1)
    |> Enum.find(&(&1.value == input))
    |> to_distance
  end

  defp _solve(input, :part2) do
    build_path(:part2)
    |> Stream.map(&(&1.value))
    |> Enum.find(&(&1 > input))
  end

  def to_distance(value), do: abs(value.x) + abs(value.y)

  # Maps the infinite spiral stream, that emits relative coordinates, to squares
  def build_path(:part1) do
    build_spiral()
    |> Stream.scan(%Square{value: 1, x: 0, y: 0}, fn {delta_x, delta_y}, %Square{value: value, x: x, y: y} ->
         %Square{value: value + 1, x: x + delta_x, y: y + delta_y}
       end)
  end

  def build_path(:part2) do
    build_spiral()
    |> Stream.transform({%{{0, 0} => 1}, %Square{value: 1, x: 0, y: 0}}, fn {delta_x, delta_y}, {mem, %Square{ x: x, y: y }} ->
         cords = {x + delta_x, y + delta_y}
         value = sum_neighbours(mem, cords)
         transformed = %Square{value: value, x: x + delta_x, y: y + delta_y}

         {
           [transformed],
           {Map.put(mem, cords, value), transformed}
         }
       end)
  end

  def sum_neighbours(mem, {x_loc, y_loc}) do
    for(i <- (x_loc - 1)..(x_loc + 1), do: for(j <- (y_loc - 1)..(y_loc + 1), do: {i, j}))
    |> List.flatten()
    |> Stream.map(&Map.get(mem, &1))
    |> Stream.filter(&(&1 != nil))
    |> Enum.sum()
  end

  # Generate an infinite spiral stream
  def build_spiral() do
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
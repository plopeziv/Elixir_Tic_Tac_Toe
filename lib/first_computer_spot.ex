defmodule FirstComputerSpot do

  def take_first_available_spot(board, token) do
    replace_first_spot(board, token, [])
  end

  def replace_first_spot([head|tail], token, traversed_spots)do
    if elem(head, 1) == token or elem(head, 1) == "X" do
      replace_first_spot(tail, token, [head|traversed_spots])

    else
      Enum.reverse(traversed_spots) ++ [
          {elem(head, 0), "X"}|tail]
    end
  end

  def replace_first_spot([], _token, _traversed_spots)do
    IO.puts("Cat's Game!")
  end
end

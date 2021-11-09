import WinningCombo

defmodule FirstComputerSpot do

  def take_first_available_spot(board, token) do

    if WinningCombo.is_win(board) == true do
      IO.puts("Game Over!")

    else
      IO.puts("Computer's Turn!")
      replace_first_spot(board, token, [])

    end
  end

  def replace_first_spot([head|tail], token, traversed_spots)do
    if elem(head, 1) == token or elem(head, 1) == "X" do
      replace_first_spot(tail, token, [head|traversed_spots])

    else
      Enum.reverse(traversed_spots) ++ [
          {elem(head, 0), "X"}|tail]
    end
  end

  def replace_first_spot([], token, traversed_spots)do
    IO.puts("Cat's Game!")
  end
end

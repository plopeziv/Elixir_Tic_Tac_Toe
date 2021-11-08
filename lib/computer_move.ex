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

  def replace_first_spot([head|tail], token, recursive_list)do
    if elem(head, 1) == token or elem(head, 1) == "X" do
      replace_first_spot(tail, token, [head|recursive_list])

    else
      Enum.reverse(recursive_list) ++ [
          {elem(head, 0), "X"}|tail]
    end
  end

  def replace_first_spot([], token, recursive_list)do
    IO.puts("Cat's Game!")
  end
end

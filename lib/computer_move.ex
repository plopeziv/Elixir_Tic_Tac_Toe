defmodule ComputerMove do

  def takeFirstAvailableSpot(board, token) do
    import WinningCombo

    if WinningCombo.isWin(board) == true do
      IO.puts("Game Over!")

    else
      replaceFirstSpot(board, token, [])

    end
  end

  def replaceFirstSpot([head|tail], token, recursiveList)do
    if elem(head, 1) == token or elem(head, 1) == "X" do
      replaceFirstSpot(tail, token, [head|recursiveList])

    else
      Enum.reverse(recursiveList) ++ [
          {elem(head, 0), "X"}|tail]
    end
  end

  def replaceFirstSpot([], token, recursiveList)do
    IO.puts("Cat's Game!")
  end
end

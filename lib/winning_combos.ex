defmodule WinningCombo do

  def isWin(board) do
    topRow = [board[:spotOne], board[:spotTwo], board[:spotThree]]
    middleRow = [board[:spotFour], board[:spotFive], board[:spotSix]]
    bottomRow = [board[:spotSeven], board[:spotEight], board[:spotNine]]
    leftColumn = [board[:spotOne], board[:spotFour], board[:spotSeven]]
    middleColumn = [board[:spotTwo], board[:spotFive], board[:spotEight]]
    rightColumn = [board[:spootThree], board[:spootSix], board[:spotNine]]
    diagonalTopLeft = [board[:spotOne], board[:spotFive], board[:spotNine]]
    diagonalTopRight = [board[:spotThree], board[:spotFive], board[:spotSeven]]

    winningCombos = [topRow, middleRow, bottomRow,
                    leftColumn, middleColumn, rightColumn,
                    diagonalTopLeft, diagonalTopRight]

    resultsList = Enum.map(winningCombos,
        fn x -> isAllSameToken(x) end)


    Enum.member?(resultsList, true)
  end

  def gameOver(board, userToken) do
    cond do
      isWin(board) == true ->
        IO.puts("Game Over!")

      catsGame(board, userToken) == true ->
        IO.puts("Cat's Game!")

      true ->
        false
    end

  end

  def catsGame(board, userToken) do
    inputArray = _ValidInputArray(board, userToken,  [])

    if length(inputArray) ==  0 do
      true
    else
      false
    end
  end

  def isAllSameToken(arraySequence) do
    Enum.count(Enum.uniq(arraySequence)) == 1
  end

  def _ValidInputArray([head|tail], token, recursiveList) do
    if elem(head, 1) == token or elem(head, 1) == "X" do
      _ValidInputArray(tail, token, recursiveList)

    else
      _ValidInputArray(tail, token, [elem(head, 1)| recursiveList])
    end

  end

  def _ValidInputArray([], token, recursiveList) do
    recursiveList
  end

end

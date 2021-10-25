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

  def isAllSameToken(arraySequence) do
    Enum.count(Enum.uniq(arraySequence)) == 1
  end


end

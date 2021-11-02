import GetUserMove
import FirstComputerSpot
import WinningCombo

defmodule ElixirTicTacToe do

  def playTicTacToe(inputList) do

    _singleTurn(inputList, "A")

  end

  def _printBoard(inputList) do
    printedBoard = "\n #{inputList[:spotOne]} | #{inputList[:spotTwo]} | #{inputList[:spotThree]} "<>
                    "\n---+---+---\n "<>
                    "#{inputList[:spotFour]} | #{inputList[:spotFive]} | #{inputList[:spotSix]} "<>
                    "\n---+---+---\n "<>
                    "#{inputList[:spotSeven]} | #{inputList[:spotEight]} | #{inputList[:spotNine]} \n"

    IO.puts printedBoard
  end

  def _singleTurn(inputList, playerToken) do

    if WinningCombo.isWin(inputList) == true do
      IO.puts("Game Over!")

    else
      _printBoard(inputList)

      userBoard = getMove(inputList, playerToken)
      _printBoard(userBoard)

      computerBoard = takeFirstAvailableSpot(userBoard, playerToken)
      _printBoard(computerBoard)
    end
  end
end

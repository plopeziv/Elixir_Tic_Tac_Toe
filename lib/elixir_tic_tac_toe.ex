import GetUserMove
import FirstComputerSpot
import WinningCombo

defmodule ElixirTicTacToe do

  def playTicTacToe(inputList) do

    _gameLoop(inputList, "A")

  end

  def _printBoard(inputList) do
    printedBoard = "\n #{inputList[:spotOne]} | #{inputList[:spotTwo]} | #{inputList[:spotThree]} "<>
                    "\n---+---+---\n "<>
                    "#{inputList[:spotFour]} | #{inputList[:spotFive]} | #{inputList[:spotSix]} "<>
                    "\n---+---+---\n "<>
                    "#{inputList[:spotSeven]} | #{inputList[:spotEight]} | #{inputList[:spotNine]} \n"

    IO.puts printedBoard
  end

  def _gameLoop(inputList, playerToken) do

    if gameOver(inputList, playerToken) == false do
      _printBoard(inputList)

      userBoard = _userTurn(inputList, playerToken)

      if gameOver(userBoard, playerToken) == false do
        _gameLoop(_computerTurn(userBoard, playerToken), playerToken)
      end
    end
  end

  def _computerTurn(inputList, playerToken) do
    computerBoard = takeFirstAvailableSpot(inputList, playerToken)
    _printBoard(computerBoard)

    computerBoard
  end

  def _userTurn(inputList, playerToken) do
    userBoard = getMove(inputList, playerToken)
    _printBoard(userBoard)

    userBoard
  end
end

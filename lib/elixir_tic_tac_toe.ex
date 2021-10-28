defmodule ElixirTicTacToe do

  def printBoard(inputList) do
    printedBoard = "\n #{inputList[:spotOne]} | #{inputList[:spotTwo]} | #{inputList[:spotThree]} "<>
                    "\n---+---+---\n "<>
                    "#{inputList[:spotFour]} | #{inputList[:spotFive]} | #{inputList[:spotSix]} "<>
                    "\n---+---+---\n "<>
                    "#{inputList[:spotSeven]} | #{inputList[:spotEight]} | #{inputList[:spotNine]} \n"

    IO.puts printedBoard
  end

  def playTicTacToe(inputList) do
    Code.require_file "get_user_move.ex", __DIR__

    printBoard(inputList)
    printBoard(GetUserMove.getMove(inputList, "A"))

  end
end

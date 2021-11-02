import GetUserMove

defmodule ElixirTicTacToe do

  def _printBoard(inputList) do
    printedBoard = "\n #{inputList[:spotOne]} | #{inputList[:spotTwo]} | #{inputList[:spotThree]} "<>
                    "\n---+---+---\n "<>
                    "#{inputList[:spotFour]} | #{inputList[:spotFive]} | #{inputList[:spotSix]} "<>
                    "\n---+---+---\n "<>
                    "#{inputList[:spotSeven]} | #{inputList[:spotEight]} | #{inputList[:spotNine]} \n"

    IO.puts printedBoard
  end

  def playTicTacToe(inputList) do

    _printBoard(inputList)

    _printBoard(getMove(inputList, "A"))

  end
end

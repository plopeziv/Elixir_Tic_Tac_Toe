defmodule ElixirTicTacToe do

  def printBoard(inputList) do
    printedBoard = "\n #{inputList[:spotOne]} | #{inputList[:spotTwo]} | #{inputList[:spotThree]} "<>
                    "\n---+---+---\n "<>
                    "#{inputList[:spotFour]} | #{inputList[:spotFive]} | #{inputList[:spotSix]} "<>
                    "\n---+---+---\n "<>
                    "#{inputList[:spotSeven]} | #{inputList[:spotEight]} | #{inputList[:spotNine]} \n"

    IO.puts printedBoard
  end
end

possibleInputs = %{spotOne: "1", spotTwo: "2", spotThree: "3",
spotFour: "4", spotFive: "5", spotSix: "6",
spotSeven: "7", spotEight: "8", spotNine: "9"}

ElixirTicTacToe.printBoard(possibleInputs)

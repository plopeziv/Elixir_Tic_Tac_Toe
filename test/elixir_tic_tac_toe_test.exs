import ElixirTicTacToe

defmodule ElixirTicTacToeTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest ElixirTicTacToe

  test "Print Board" do

    expectedOutput = ""<>
    "\n 1 | 2 | X "<>
    "\n---+---+---"<>
    "\n 4 | X | 6 "<>
    "\n---+---+---"<>
    "\n X | 8 | 9 "<>
    "\n\n"
    possibleInputs = [spotOne: "1", spotTwo: "2", spotThree: "X",
                      spotFour: "4", spotFive: "X", spotSix: "6",
                      spotSeven: "X", spotEight: "8", spotNine: "9"]

    assert capture_io(fn -> ElixirTicTacToe._printBoard(possibleInputs) end) == expectedOutput
  end
end

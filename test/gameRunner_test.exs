defmodule GameRunnerTest do
  use ExUnit.Case, async: false
  import ExUnit.CaptureIO
  doctest ElixirTicTacToe

  test "Runs a Single Turn" do

    playerToken = "A"

    possibleInputs = [spotOne: "1", spotTwo: "2", spotThree: "3",
    spotFour: "4", spotFive: "5", spotSix: "6",
    spotSeven: "7", spotEight: "8", spotNine: "9"]

    expectedOutput = ""<>
    "\n 1 | 2 | 3 "<>
    "\n---+---+---"<>
    "\n 4 | 5 | 6 "<>
    "\n---+---+---"<>
    "\n 7 | 8 | 9 "<>
    "\n\n"


      assert capture_io( fn ->
        ElixirTicTacToe.playTicTacToe(possibleInputs)end) == expectedOutput

  end
end

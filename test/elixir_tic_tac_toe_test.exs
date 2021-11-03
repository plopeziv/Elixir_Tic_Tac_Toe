defmodule ElixirTicTacToeTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import Mock
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

  test "Computer Turn prints computer board" do
    expectedOutput = "Computer's Turn!\n"<>
    ""<>
    "\n X | 2 | X "<>
    "\n---+---+---"<>
    "\n 4 | 5 | 6 "<>
    "\n---+---+---"<>
    "\n X | 8 | 9 "<>
    "\n\n"

    possibleInputs = [spotOne: "1", spotTwo: "2", spotThree: "X",
                      spotFour: "4", spotFive: "5", spotSix: "6",
                      spotSeven: "X", spotEight: "8", spotNine: "9"]

    assert capture_io(fn -> ElixirTicTacToe._computerTurn(possibleInputs, "A") end) == expectedOutput
  end

  test "Computer Turn returns replaced List" do
    possibleInputs = [spotOne: "1", spotTwo: "2", spotThree: "X",
    spotFour: "4", spotFive: "5", spotSix: "6",
    spotSeven: "X", spotEight: "8", spotNine: "9"]

    assert ElixirTicTacToe._computerTurn(possibleInputs, "A") == [
      spotOne: "X", spotTwo: "2", spotThree: "X",
      spotFour: "4", spotFive: "5", spotSix: "6",
      spotSeven: "X", spotEight: "8", spotNine: "9"]
  end




  test "User turn should return augmented list" do
    possibleInputs = [spotOne: "1", spotTwo: "2", spotThree: "X",
    spotFour: "4", spotFive: "5", spotSix: "6",
    spotSeven: "X", spotEight: "8", spotNine: "9"]

    Mock.with_mock IO, [:passthrough], [gets: fn(_prompt) -> "5" end] do
      returnValue = ElixirTicTacToe._userTurn(possibleInputs, "A")
      assert returnValue == [spotOne: "1", spotTwo: "2", spotThree: "X",
      spotFour: "4", spotFive: "A", spotSix: "6",
      spotSeven: "X", spotEight: "8", spotNine: "9"]
    end
  end

  test "Computer Win initiates Game Over!" do
    possibleInputs = [spotOne: "1", spotTwo: "X", spotThree: "X",
    spotFour: "4", spotFive: "5", spotSix: "6",
    spotSeven: "7", spotEight: "8", spotNine: "9"]

    expectedOutput = "\n 1 | X | X " <>
    "\n---+---+---" <>
    "\n 4 | 5 | 6 " <>
    "\n---+---+---" <>
    "\n 7 | 8 | 9 \n\n" <>
    "\n 1 | X | X " <>
    "\n---+---+---" <>
    "\n 4 | A | 6 " <>
    "\n---+---+---" <>
    "\n 7 | 8 | 9 \n" <>
    "\nComputer's Turn!\n"<>
    "\n X | X | X " <>
    "\n---+---+---" <>
    "\n 4 | A | 6 " <>
    "\n---+---+---" <>
    "\n 7 | 8 | 9 \n" <>
    "\nGame Over!\n"

    Mock.with_mock IO, [:passthrough], [gets: fn(_prompt) -> "5" end] do
      assert capture_io(fn -> ElixirTicTacToe.playTicTacToe(possibleInputs)end) == expectedOutput
    end
  end

  test "User win initiates Game Over!" do
    possibleInputs = [spotOne: "1", spotTwo: "A", spotThree: "A",
    spotFour: "4", spotFive: "5", spotSix: "6",
    spotSeven: "7", spotEight: "8", spotNine: "9"]

    expectedOutput = "\n 1 | A | A " <>
    "\n---+---+---" <>
    "\n 4 | 5 | 6 " <>
    "\n---+---+---" <>
    "\n 7 | 8 | 9 \n\n" <>
    "\n A | A | A " <>
    "\n---+---+---" <>
    "\n 4 | 5 | 6 " <>
    "\n---+---+---" <>
    "\n 7 | 8 | 9 \n\n" <>
    "Game Over!\n"

    Mock.with_mock IO, [:passthrough], [gets: fn(_prompt) -> "1" end] do
      assert capture_io(fn -> ElixirTicTacToe.playTicTacToe(possibleInputs)end) == expectedOutput
    end
  end
end

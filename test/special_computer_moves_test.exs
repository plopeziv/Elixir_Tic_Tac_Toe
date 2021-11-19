defmodule SpecialComputerMovesTest do
  use ExUnit.Case
  doctest SpecialComputerMoves

  test "Spot Five gets taken if Empty" do
    board = [
      spotOne: "T", spotTwo: "X", spotThree: "T",
      spotFour: "4", spotFive: "5", spotSix: "6",
      spotSeven: "7", spotEight: "X", spotNine: "9"
    ]

    expected_outcome = [
        spotOne: "T", spotTwo: "X", spotThree: "T",
        spotFour: "4", spotFive: "X", spotSix: "6",
        spotSeven: "7", spotEight: "X", spotNine: "9"
      ]

    user_token = "T"

    assert SpecialComputerMoves.take_spot_five(board, user_token) == expected_outcome
  end

  test "take_spot_five does nothing if spotFive is taken by computer" do
    board = [
      spotOne: "T", spotTwo: "2", spotThree: "T",
      spotFour: "4", spotFive: "X", spotSix: "6",
      spotSeven: "7", spotEight: "X", spotNine: "9"
    ]

    user_token = "T"

    assert SpecialComputerMoves.take_spot_five(board, user_token) == board
  end

  test "take_spot_five does nothing if spotFive is taken by user" do
    board = [
      spotOne: "T", spotTwo: "2", spotThree: "T",
      spotFour: "4", spotFive: "T", spotSix: "6",
      spotSeven: "7", spotEight: "X", spotNine: "9"
    ]

    user_token = "T"

    assert SpecialComputerMoves.take_spot_five(board, user_token) == board
  end

end

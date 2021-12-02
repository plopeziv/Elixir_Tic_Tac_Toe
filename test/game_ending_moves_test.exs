defmodule GameEndingMovesTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest GameEndingMoves

  test "Computer should win game" do
    board = [
      spotOne: "1", spotTwo: "2", spotThree: "3",
      spotFour: "4", spotFive: "X", spotSix: "6",
      spotSeven: "X", spotEight: "8", spotNine: "9"
    ]

    expected_output = [
      spotOne: "1", spotTwo: "2", spotThree: "X",
      spotFour: "4", spotFive: "X", spotSix: "6",
      spotSeven: "X", spotEight: "8", spotNine: "9"
    ]

    assert GameEndingMoves.win_game(board, "T") == expected_output
  end

  test "Win game returns same board when no winning moves" do
    board  = [
      spotOne: "1", spotTwo: "2", spotThree: "3",
      spotFour: "4", spotFive: "5", spotSix: "6",
      spotSeven: "7", spotEight: "8", spotNine: "9"
    ]

    assert GameEndingMoves.win_game(board, "T") == board
  end

  test "Computer should Defend a Loss" do
    board = [
      spotOne: "1", spotTwo: "2", spotThree: "3",
      spotFour: "4", spotFive: "T", spotSix: "6",
      spotSeven: "X", spotEight: "T", spotNine: "9"
    ]

    expected_output = [
      spotOne: "1", spotTwo: "X", spotThree: "3",
      spotFour: "4", spotFive: "T", spotSix: "6",
      spotSeven: "X", spotEight: "T", spotNine: "9"
    ]

    assert GameEndingMoves.defend_loss(board, "T") == expected_output
  end

  test "Defend Loss returns same board when no winning moves" do
    board  = [
      spotOne: "1", spotTwo: "2", spotThree: "3",
      spotFour: "4", spotFive: "5", spotSix: "6",
      spotSeven: "7", spotEight: "8", spotNine: "9"
    ]

    assert GameEndingMoves.defend_loss(board, "T") == board
  end

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

    assert GameEndingMoves.take_spot_five(board, user_token) == expected_outcome
  end

  test "take_spot_five does nothing if spotFive is taken by computer" do
    board = [
      spotOne: "T", spotTwo: "2", spotThree: "T",
      spotFour: "4", spotFive: "X", spotSix: "6",
      spotSeven: "7", spotEight: "X", spotNine: "9"
    ]

    user_token = "T"

    assert GameEndingMoves.take_spot_five(board, user_token) == board
  end

  test "take_spot_five does nothing if spotFive is taken by user" do
    board = [
      spotOne: "T", spotTwo: "2", spotThree: "T",
      spotFour: "4", spotFive: "T", spotSix: "6",
      spotSeven: "7", spotEight: "X", spotNine: "9"
    ]

    user_token = "T"

    assert GameEndingMoves.take_spot_five(board, user_token) == board
  end

  test "Computer Takes First Available Spot" do
    board = [
      spotOne: "O", spotTwo: "2", spotThree: "3",
      spotFour: "4", spotFive: "5", spotSix: "6",
      spotSeven: "X", spotEight: "8", spotNine: "O"
    ]

    user_token ="O"

    assert GameEndingMoves.take_first_available_spot(board, user_token) == [
      spotOne: "O", spotTwo: "X", spotThree: "3",
      spotFour: "4", spotFive: "5", spotSix: "6",
      spotSeven: "X", spotEight: "8", spotNine: "O"
    ]

  end

  test "Replace First Spot Returns New Board" do
    board = [
      spotOne: "O", spotTwo: "X", spotThree: "O",
      spotFour: "4", spotFive: "5", spotSix: "6",
      spotSeven: "7", spotEight: "8", spotNine: "9"
    ]

    user_token = "O"

    assert GameEndingMoves._replace_first_spot(board, user_token, []) == [
      spotOne: "O", spotTwo: "X", spotThree: "O",
      spotFour: "X", spotFive: "5", spotSix: "6",
      spotSeven: "7", spotEight: "8", spotNine: "9"
    ]
  end

  test "Replace First Spot Realizes Cats Game" do
    board = [
      spotOne: "O", spotTwo: "X", spotThree: "O",
      spotFour: "X", spotFive: "X", spotSix: "O",
      spotSeven: "X", spotEight: "O", spotNine: "X"
    ]

    user_token = "O"

    assert capture_io(fn -> GameEndingMoves._replace_first_spot(board, user_token, []) end) == "Cat's Game!\n"
  end

  test "Function will replace first diffence in a key-pair list" do
  board_1 = [
    spotOne: "1", spotTwo: "2", spotThree: "3",
    spotFour: "4", spotFive: "5", spotSix: "6",
    spotSeven: "7", spotEight: "8", spotNine: "9"
  ]

  board_2 = [
    spotOne: "1", spotTwo: "2", spotThree: "3",
    spotFour: "4", spotFive: "5", spotSix: "T",
    spotSeven: "T", spotEight: "8", spotNine: "9"
  ]

  expected_output = [
    spotOne: "1", spotTwo: "2", spotThree: "3",
    spotFour: "4", spotFive: "5", spotSix: "X",
    spotSeven: "7", spotEight: "8", spotNine: "9"
  ]

  assert GameEndingMoves._replace_first_difference(board_1, board_2) == expected_output
  end

end

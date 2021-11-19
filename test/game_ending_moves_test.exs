defmodule GameEndingMovesTest do
  use ExUnit.Case, async: false
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

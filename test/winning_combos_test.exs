defmodule WinningComboTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest WinningCombo

  test "returns true if row is a winning combo" do
    board = %{
      spotOne: "O", spotTwo: "O", spotThree: "O",
      spotFour: "4", spotFive: "5", spotSix: "6",
      spotSeven: "7", spotEight: "8", spotNine: "9"
    }

    assert WinningCombo.is_win(board) == true
  end

  test "returns true if Column winning combo" do
    board = [
      spotOne: "O", spotTwo: "X", spotThree: "3",
      spotFour: "O", spotFive: "5", spotSix: "6",
      spotSeven: "O", spotEight: "8", spotNine: "9"
    ]
    assert WinningCombo.is_win(board) == true
  end

  test "returns true if Diagonal winning combo" do
    board = [
      spotOne: "O", spotTwo: "X", spotThree: "3",
      spotFour: "X", spotFive: "O", spotSix: "6",
      spotSeven: "7", spotEight: "8", spotNine: "O"
    ]
    assert WinningCombo.is_win(board) == true
  end

  test "returns false if no winning combo" do
    board = [
      spotOne: "O", spotTwo: "O", spotThree: "3",
      spotFour: "4", spotFive: "5", spotSix: "6",
      spotSeven: "7", spotEight: "8", spotNine: "9"
    ]
    assert WinningCombo.is_win(board) == false
  end

  test "is_all_same_token returns false with different tokens" do
    array_sequence = [1, "5", 7]

    assert WinningCombo.is_all_same_token(array_sequence) == false
  end

  test "is_all_same_token returns true with single tokens" do
    array_sequence = ["a", "a", "a"]

    assert WinningCombo.is_all_same_token(array_sequence) == true
  end

  test "Create array for Cat's Game" do
    board = [
      spotOne: "a", spotTwo: "X", spotThree: "a",
      spotFour: "4", spotFive: "5", spotSix: "6",
      spotSeven: "7", spotEight: "X", spotNine: "9"
    ]

    user_token = "a"

    assert WinningCombo._valid_input_array(board, user_token, []) == [
      "9", "7", "6", "5", "4"
    ]
  end

  test "Cats game detected" do
    board = [
      spotOne: "a", spotTwo: "X", spotThree: "a",
      spotFour: "X", spotFive: "a", spotSix: "a",
      spotSeven: "X", spotEight: "a", spotNine: "X"
    ]

    user_token = "a"

    assert WinningCombo.cats_game(board, user_token) == true
  end

  test "Cats game NOT detected" do
    board = [
      spotOne: "a", spotTwo: "X", spotThree: "a",
      spotFour: "X", spotFive: "a", spotSix: "a",
      spotSeven: "X", spotEight: "X", spotNine: "9"
    ]

    user_token = "a"

    assert WinningCombo.cats_game(board, user_token) == false
  end

  test "Game over Returns Cats Game!" do
    board = [
      spotOne: "X", spotTwo: "X", spotThree: "a",
      spotFour: "a", spotFive: "a", spotSix: "X",
      spotSeven: "X", spotEight: "X", spotNine: "a"
    ]

    user_token = "a"

    assert capture_io(fn -> WinningCombo.game_over(board, user_token) end) == "Cat's Game!\n"
  end

  test "Game over Returns Game Over!" do
    board = [
      spotOne: "a", spotTwo: "X", spotThree: "a",
      spotFour: "X", spotFive: "a", spotSix: "a",
      spotSeven: "X", spotEight: "X", spotNine: "a"
    ]

    user_token = "a"

    assert capture_io(fn -> WinningCombo.game_over(board, user_token) end) == "Game Over!\n"
  end

  test "Game over Returns false" do
    board = [
      spotOne: "a", spotTwo: "X", spotThree: "a",
      spotFour: "X", spotFive: "a", spotSix: "a",
      spotSeven: "X", spotEight: "X", spotNine: "9"
    ]

    user_token = "a"

    assert WinningCombo.game_over(board, user_token) == false
  end

end

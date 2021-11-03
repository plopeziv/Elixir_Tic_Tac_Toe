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

    assert WinningCombo.isWin(board) == true
  end

  test "returns true if Column winning combo" do
    board = [
      spotOne: "O", spotTwo: "X", spotThree: "3",
      spotFour: "O", spotFive: "5", spotSix: "6",
      spotSeven: "O", spotEight: "8", spotNine: "9"
    ]
    assert WinningCombo.isWin(board) == true
  end

  test "returns true if Diagonal winning combo" do
    board = [
      spotOne: "O", spotTwo: "X", spotThree: "3",
      spotFour: "X", spotFive: "O", spotSix: "6",
      spotSeven: "7", spotEight: "8", spotNine: "O"
    ]
    assert WinningCombo.isWin(board) == true
  end

  test "returns false if no winning combo" do
    board = [
      spotOne: "O", spotTwo: "O", spotThree: "3",
      spotFour: "4", spotFive: "5", spotSix: "6",
      spotSeven: "7", spotEight: "8", spotNine: "9"
    ]
    assert WinningCombo.isWin(board) == false
  end

  test "isAllSameToken returns false with different tokens" do
    arraySequence = [1, "5", 7]

    assert WinningCombo.isAllSameToken(arraySequence) == false
  end

  test "isAllSameToken returns true with single tokens" do
    arraySequence = ["a", "a", "a"]

    assert WinningCombo.isAllSameToken(arraySequence) == true
  end

  test "Create array for Cat's Game" do
    board = [
      spotOne: "a", spotTwo: "X", spotThree: "a",
      spotFour: "4", spotFive: "5", spotSix: "6",
      spotSeven: "7", spotEight: "X", spotNine: "9"
    ]

    userToken = "a"

    assert WinningCombo._ValidInputArray(board, userToken, []) == [
      "9", "7", "6", "5", "4"
    ]
  end

  test "Cats game detected" do
    board = [
      spotOne: "a", spotTwo: "X", spotThree: "a",
      spotFour: "X", spotFive: "a", spotSix: "a",
      spotSeven: "X", spotEight: "a", spotNine: "X"
    ]

    userToken = "a"

    assert WinningCombo.catsGame(board, userToken) == true
  end

  test "Cats game NOT detected" do
    board = [
      spotOne: "a", spotTwo: "X", spotThree: "a",
      spotFour: "X", spotFive: "a", spotSix: "a",
      spotSeven: "X", spotEight: "X", spotNine: "9"
    ]

    userToken = "a"

    assert WinningCombo.catsGame(board, userToken) == false
  end

  test "Game over Returns Cats Game!" do
    board = [
      spotOne: "X", spotTwo: "X", spotThree: "a",
      spotFour: "a", spotFive: "a", spotSix: "X",
      spotSeven: "X", spotEight: "X", spotNine: "a"
    ]

    userToken = "a"

    assert capture_io(fn -> WinningCombo.gameOver(board, userToken) end) == "Cat's Game!\n"
  end

  test "Game over Returns Game Over!" do
    board = [
      spotOne: "a", spotTwo: "X", spotThree: "a",
      spotFour: "X", spotFive: "a", spotSix: "a",
      spotSeven: "X", spotEight: "X", spotNine: "a"
    ]

    userToken = "a"

    assert capture_io(fn -> WinningCombo.gameOver(board, userToken) end) == "Game Over!\n"
  end

  test "Game over Returns false" do
    board = [
      spotOne: "a", spotTwo: "X", spotThree: "a",
      spotFour: "X", spotFive: "a", spotSix: "a",
      spotSeven: "X", spotEight: "X", spotNine: "9"
    ]

    userToken = "a"

    assert WinningCombo.gameOver(board, userToken) == false
  end

end

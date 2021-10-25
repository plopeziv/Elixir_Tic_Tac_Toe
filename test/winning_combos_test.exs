defmodule WinningComboTest do
  use ExUnit.Case
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

end

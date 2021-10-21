defmodule WinningComboTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest WinningCombo

  test "top row is a winning combo" do
    board = %{
      spotOne: "O", spotTwo: "O", spotThree: "O",
      spotFour: "4", spotFive: "5", spotSix: "6",
      spotSeven: "7", spotEight: "8", spotNine: "9"
    }
    assert WinningCombo.isWin(board) == true
  end

  test "returns true if winning combo 2" do
    board = %{
      spotOne: "O", spotTwo: "X", spotThree: "3",
      spotFour: "O", spotFive: "5", spotSix: "6",
      spotSeven: "O", spotEight: "8", spotNine: "9"
    }
    assert WinningCombo.isWin(board) == true
  end

  test "returns true if winning combo 3" do
    board = %{
      spotOne: "O", spotTwo: "X", spotThree: "3",
      spotFour: "X", spotFive: "O", spotSix: "6",
      spotSeven: "7", spotEight: "8", spotNine: "O"
    }
    assert WinningCombo.isWin(board) == true
  end

  test "returns false if no winning combo 1" do
    board = %{
      spotOne: "O", spotTwo: "O", spotThree: "3",
      spotFour: "4", spotFive: "5", spotSix: "6",
      spotSeven: "7", spotEight: "8", spotNine: "9"
    }
    assert WinningCombo.isWin(board) == false
  end

  test "returns false if no winning combo 2" do
    board = %{
      spotOne: "O", spotTwo: "2", spotThree: "O",
      spotFour: "4", spotFive: "5", spotSix: "6",
      spotSeven: "7", spotEight: "8", spotNine: "9"
    }
    assert WinningCombo.isWin(board) == false
  end
end

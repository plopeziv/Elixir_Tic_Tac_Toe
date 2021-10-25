defmodule ComputerMoveTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest ComputerMove

  test "Replace First Spot Returns New Board" do
    board = [
      spotOne: "O", spotTwo: "X", spotThree: "O",
      spotFour: "4", spotFive: "5", spotSix: "6",
      spotSeven: "7", spotEight: "8", spotNine: "9"
    ]

    userToken = "O"

    assert ComputerMove.replaceFirstSpot(board, userToken, []) == [
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

    userToken = "O"

    assert capture_io(fn -> ComputerMove.replaceFirstSpot(board, userToken, []) end) == "Cat's Game!\n"
  end

  test "Computer Realizes Game is Won" do
    board = [
      spotOne: "O", spotTwo: "O", spotThree: "O",
      spotFour: "4", spotFive: "5", spotSix: "6",
      spotSeven: "7", spotEight: "8", spotNine: "9"
    ]

    userToken = "O"

    assert capture_io(fn -> ComputerMove.takeFirstAvailableSpot(board, userToken) end) == "Game Over!\n"
  end

  test "Computer Takes First Available Spot" do
    board = [
      spotOne: "O", spotTwo: "2", spotThree: "3",
      spotFour: "4", spotFive: "5", spotSix: "6",
      spotSeven: "X", spotEight: "8", spotNine: "O"
    ]

    userToken ="O"

    assert ComputerMove.takeFirstAvailableSpot(board, userToken) == [
      spotOne: "O", spotTwo: "X", spotThree: "3",
      spotFour: "4", spotFive: "5", spotSix: "6",
      spotSeven: "X", spotEight: "8", spotNine: "O"
    ]

  end



end

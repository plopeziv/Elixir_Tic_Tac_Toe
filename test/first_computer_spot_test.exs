defmodule FirstComputerSpotTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest FirstComputerSpot

  test "Replace First Spot Returns New Board" do
    board = [
      spotOne: "O", spotTwo: "X", spotThree: "O",
      spotFour: "4", spotFive: "5", spotSix: "6",
      spotSeven: "7", spotEight: "8", spotNine: "9"
    ]

    user_token = "O"

    assert FirstComputerSpot.replace_first_spot(board, user_token, []) == [
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

    assert capture_io(fn -> FirstComputerSpot.replace_first_spot(board, user_token, []) end) == "Cat's Game!\n"
  end

  test "Computer Takes First Available Spot" do
    board = [
      spotOne: "O", spotTwo: "2", spotThree: "3",
      spotFour: "4", spotFive: "5", spotSix: "6",
      spotSeven: "X", spotEight: "8", spotNine: "O"
    ]

    user_token ="O"

    assert FirstComputerSpot.take_first_available_spot(board, user_token) == [
      spotOne: "O", spotTwo: "X", spotThree: "3",
      spotFour: "4", spotFive: "5", spotSix: "6",
      spotSeven: "X", spotEight: "8", spotNine: "O"
    ]

  end
end

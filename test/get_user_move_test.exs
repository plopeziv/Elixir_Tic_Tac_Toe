defmodule GetUserMoveTest do
  use ExUnit.Case, async: false
  import ExUnit.CaptureIO
  import Mock
  doctest GetUserMove

  test "Get Valid User Move" do
    board = [
      spotOne: "T", spotTwo: "X", spotThree: "T",
      spotFour: "4", spotFive: "5", spotSix: "6",
      spotSeven: "7", spotEight: "X", spotNine: "9"
    ]

    userToken = "T"

    assert GetUserMove.getMove(board, userToken) == [
      spotOne: "T", spotTwo: "X", spotThree: "T",
      spotFour: "4", spotFive: "T", spotSix: "6",
      spotSeven: "7", spotEight: "X", spotNine: "9"
    ]

  end

  test_with_mock "Gather User Input", IO, [:passthrough], ["3"] do

  end

end

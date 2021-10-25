defmodule GetUserMoveTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  doctest GetUserMove

  test "Get Valid User Move" do
    board = [
      spotOne: "T", spotTwo: "X", spotThree: "T",
      spotFour: "4", spotFive: "X", spotSix: "6",
      spotSeven: "7", spotEight: "8", spotNine: "9"
    ]

    userToken = "T"

    assert GetUserMove.getMove(board, userToken) == [
      spotOne: "T", spotTwo: "X", spotThree: "T",
      spotFour: "4", spotFive: "X", spotSix: "6",
      spotSeven: "7", spotEight: "T", spotNine: "9"
    ]

  end

end

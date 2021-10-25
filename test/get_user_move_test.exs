defmodule GetUserMoveTest do
  use ExUnit.Case, async: false
  # import ExUnit.CaptureIO
  import Mock
  doctest GetUserMove

  test "Get Valid User Move" do
    board = [
      spotOne: "T", spotTwo: "X", spotThree: "T",
      spotFour: "4", spotFive: "5", spotSix: "6",
      spotSeven: "7", spotEight: "X", spotNine: "9"
    ]

    userToken = "T"

    Mock.with_mock IO, [gets: fn(_prompt) -> "5\n" end] do
      assert GetUserMove.getMove(board, userToken) == [
        spotOne: "T", spotTwo: "X", spotThree: "T",
        spotFour: "4", spotFive: "T", spotSix: "6",
        spotSeven: "7", spotEight: "X", spotNine: "9"
      ]
    end

  end

  test "Gather User Input and Slugify" do
    Mock.with_mock IO, [gets: fn(_prompt) -> "3\n" end] do
      result = GetUserMove._slugInput()
      assert result == "3"
    end

  end

  test "Create a Valid Input Array" do
    board = [
      spotOne: "a", spotTwo: "X", spotThree: "a",
      spotFour: "4", spotFive: "5", spotSix: "6",
      spotSeven: "7", spotEight: "X", spotNine: "9"
    ]

    userToken = "a"

    assert GetUserMove._createValidInputArray(board, userToken, []) == [
      "9", "7", "6", "5", "4"
    ]
  end

end

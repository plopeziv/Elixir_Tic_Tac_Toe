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

  test "Input Checker Returns False When Element NOT in Array" do
    array = [ 4, 5, 6, 7]

    assert GetUserMove._inputChecker(array, "a") == false
  end

  test "Input Checker Returns True When Element IN Array" do
    array = [4, 5, 6, 7]

    assert GetUserMove._inputChecker(array, 7) == 7
  end

  test "Replacement Function Replaces Value in Key Pair" do
    array = [spotOne: "1", spotTwo: "2", spotThree: "3", spotFour: "4"]

    userToken = "a"
    chosenSpot = "3"

    assert GetUserMove._replacementFunction(array, userToken, chosenSpot, []) == [
      spotOne: "1", spotTwo: "2", spotThree: "a", spotFour: "4"
    ]
  end

  test "Replacement Function Bug Message" do
    assert capture_io(fn -> GetUserMove._replacementFunction([], "a", "3", [])
        end) == "Something Went Wrong, Replacement Not Found!\n"
  end

end

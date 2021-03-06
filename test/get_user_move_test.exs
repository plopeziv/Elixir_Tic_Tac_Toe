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

    user_token = "T"

    Mock.with_mock IO, [gets: fn(_prompt) -> "5\n" end] do
      assert GetUserMove.get_move(board, user_token) == [
        spotOne: "T", spotTwo: "X", spotThree: "T",
        spotFour: "4", spotFive: "T", spotSix: "6",
        spotSeven: "7", spotEight: "X", spotNine: "9"
      ]
    end

  end

  test "Create a Valid Input Array" do
    board = [
      spotOne: "a", spotTwo: "X", spotThree: "a",
      spotFour: "4", spotFive: "5", spotSix: "6",
      spotSeven: "7", spotEight: "X", spotNine: "9"
    ]

    user_token = "a"

    assert GetUserMove._create_valid_input_array(board, user_token, []) == [
      "9", "7", "6", "5", "4"
    ]
  end

  test "Replacement Function Replaces Value in Key Pair" do
    array = [spotOne: "1", spotTwo: "2", spotThree: "3", spotFour: "4"]

    user_token = "a"
    chosen_spot = "3"

    assert GetUserMove._replacement_function(array, user_token, chosen_spot, []) == [
      spotOne: "1", spotTwo: "2", spotThree: "a", spotFour: "4"
    ]
  end

  test "Replacement Function Bug Message" do
    assert capture_io(fn -> GetUserMove._replacement_function([], "a", "3", [])
        end) == "Something Went Wrong, Replacement Not Found!\n"
  end

end

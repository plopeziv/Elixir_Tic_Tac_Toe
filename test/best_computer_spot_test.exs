defmodule BestComputerSpotTest do
  use ExUnit.Case
  doctest BestComputerSpot

  test "Best computer spot takes spot 5" do
    board = [
      spotOne: "1", spotTwo: "2", spotThree: "3",
      spotFour: "4", spotFive: "5", spotSix: "6",
      spotSeven: "7", spotEight: "8", spotNine: "9"
    ]

    expected_output = [
      spotOne: "1", spotTwo: "2", spotThree: "3",
      spotFour: "4", spotFive: "X", spotSix: "6",
      spotSeven: "7", spotEight: "8", spotNine: "9"
    ]

    player_token = "a"

    assert BestComputerSpot.get_best_spot(board, player_token) == expected_output
  end

  test "BestComputerSpot with 5 taken" do
    board = [
      spotOne: "1", spotTwo: "2", spotThree: "3",
      spotFour: "4", spotFive: "a", spotSix: "6",
      spotSeven: "7", spotEight: "8", spotNine: "9"
    ]

    expected_output = [
      spotOne: "X", spotTwo: "2", spotThree: "3",
      spotFour: "4", spotFive: "a", spotSix: "6",
      spotSeven: "7", spotEight: "8", spotNine: "9"
    ]

    player_token = "a"

    assert BestComputerSpot.get_best_spot(board, player_token) == expected_output
  end

end

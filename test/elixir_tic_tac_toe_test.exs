defmodule ElixirTicTacToeTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import Mock
  doctest ElixirTicTacToe

  test "Player setup returns player token for new player" do
    Mock.with_mocks([
      {GetUserMove, [:passthrough],
        [_slug_input: fn(_prompt) -> "Y" end]},
      {GetTokens, [:passthrough],
        [return_new_player_token: fn() -> "D" end]},
    ]) do
      assert ElixirTicTacToe._player_setup() == "D"
    end
  end

  test "Player setup returns player token for exisiting player" do
    Mock.with_mocks([
      {GetUserMove, [:passthrough],
        [_slug_input: fn(_prompt) -> "n" end]},
      {GetTokens, [:passthrough],
        [return_player_token: fn() -> "D" end]},
    ]) do
      assert ElixirTicTacToe._player_setup() == "D"
    end
  end

  test "Is New Player returns Yes or no" do
    Mock.with_mock IO, [:passthrough], [gets: fn(_prompt) -> "Y\n" end] do
      assert ElixirTicTacToe._yes_no_checker("This is a prompt :") == "Y"
    end
  end

  test "Print Board" do

    expected_output = ""<>
    "\n 1 | 2 | X "<>
    "\n---+---+---"<>
    "\n 4 | X | 6 "<>
    "\n---+---+---"<>
    "\n X | 8 | 9 "<>
    "\n\n"
    possible_inputs = [spotOne: "1", spotTwo: "2", spotThree: "X",
                      spotFour: "4", spotFive: "X", spotSix: "6",
                      spotSeven: "X", spotEight: "8", spotNine: "9"]

    assert capture_io(fn -> ElixirTicTacToe._print_board(possible_inputs) end) == expected_output
  end

  test "Computer Turn prints computer board" do
    expected_output = "\n 1 | 2 | X "<>
    "\n---+---+---"<>
    "\n 4 | X | 6 "<>
    "\n---+---+---"<>
    "\n X | 8 | 9 "<>
    "\n\n"

    possible_inputs = [spotOne: "1", spotTwo: "2", spotThree: "X",
                      spotFour: "4", spotFive: "5", spotSix: "6",
                      spotSeven: "X", spotEight: "8", spotNine: "9"]

    assert capture_io(fn -> ElixirTicTacToe._computer_turn(possible_inputs, "A") end) == expected_output
  end

  test "Computer Turn returns replaced List" do
    possible_inputs = [spotOne: "1", spotTwo: "2", spotThree: "X",
    spotFour: "4", spotFive: "5", spotSix: "6",
    spotSeven: "X", spotEight: "8", spotNine: "9"]

    assert ElixirTicTacToe._computer_turn(possible_inputs, "A") == [
      spotOne: "1", spotTwo: "2", spotThree: "X",
      spotFour: "4", spotFive: "X", spotSix: "6",
      spotSeven: "X", spotEight: "8", spotNine: "9"]
  end

  test "Computer Win initiates Game Over!" do
    possible_inputs = [spotOne: "1", spotTwo: "X", spotThree: "X",
    spotFour: "4", spotFive: "5", spotSix: "6",
    spotSeven: "7", spotEight: "8", spotNine: "9"]

    expected_output = "\nYour Turn!\n" <>
    "\n 1 | X | X " <>
    "\n---+---+---" <>
    "\n 4 | 5 | 6 " <>
    "\n---+---+---" <>
    "\n 7 | 8 | 9 \n\n" <>
    "\n 1 | X | X " <>
    "\n---+---+---" <>
    "\n 4 | A | 6 " <>
    "\n---+---+---" <>
    "\n 7 | 8 | 9 \n" <>
    "\nComputer's Turn!\n"<>
    "\n X | X | X " <>
    "\n---+---+---" <>
    "\n 4 | A | 6 " <>
    "\n---+---+---" <>
    "\n 7 | 8 | 9 \n" <>
    "\nGame Over!\n"

    Mock.with_mocks([
      {IO, [:passthrough], [gets: fn(_prompt) -> "5" end]}
    ]) do
      assert capture_io(fn -> ElixirTicTacToe._game_loop(possible_inputs, "A")end) == expected_output
    end
  end

  test "Computer turn initiates Cat's Game!" do
    possible_inputs = [spotOne: "X", spotTwo: "A", spotThree: "A",
    spotFour: "A", spotFive: "5", spotSix: "X",
    spotSeven: "X", spotEight: "8", spotNine: "A"]

    expected_output = "\nYour Turn!\n" <>
    "\n X | A | A " <>
    "\n---+---+---" <>
    "\n A | 5 | X " <>
    "\n---+---+---" <>
    "\n X | 8 | A \n\n" <>
    "\n X | A | A " <>
    "\n---+---+---" <>
    "\n A | A | X " <>
    "\n---+---+---" <>
    "\n X | 8 | A \n\n" <>
    "Computer's Turn!\n" <>
    "\n X | A | A " <>
    "\n---+---+---" <>
    "\n A | A | X " <>
    "\n---+---+---" <>
    "\n X | X | A \n\n" <>
    "Cat's Game!\n"


    Mock.with_mocks([
      {IO, [:passthrough], [gets: fn(_prompt) -> "5" end]}
     ]) do
      assert capture_io(fn -> ElixirTicTacToe._game_loop(possible_inputs, "A")end) == expected_output
    end
  end

  test "User turn should return augmented list" do
    possible_inputs = [spotOne: "1", spotTwo: "2", spotThree: "X",
    spotFour: "4", spotFive: "5", spotSix: "6",
    spotSeven: "X", spotEight: "8", spotNine: "9"]

    Mock.with_mock IO, [:passthrough], [gets: fn(_prompt) -> "5" end] do
      return_value = ElixirTicTacToe._user_turn(possible_inputs, "A")
      assert return_value == [spotOne: "1", spotTwo: "2", spotThree: "X",
      spotFour: "4", spotFive: "A", spotSix: "6",
      spotSeven: "X", spotEight: "8", spotNine: "9"]
    end
  end

  test "User win initiates Game Over!" do
    possible_inputs = [spotOne: "1", spotTwo: "A", spotThree: "A",
    spotFour: "4", spotFive: "5", spotSix: "6",
    spotSeven: "7", spotEight: "8", spotNine: "9"]

    expected_output = "\nYour Turn!\n" <>
    "\n 1 | A | A " <>
    "\n---+---+---" <>
    "\n 4 | 5 | 6 " <>
    "\n---+---+---" <>
    "\n 7 | 8 | 9 \n\n" <>
    "\n A | A | A " <>
    "\n---+---+---" <>
    "\n 4 | 5 | 6 " <>
    "\n---+---+---" <>
    "\n 7 | 8 | 9 \n\n" <>
    "Game Over!\n"

    Mock.with_mocks([
      {IO, [:passthrough], [gets: fn(_prompt) -> "1" end]}
    ])do
      assert capture_io(fn -> ElixirTicTacToe._game_loop(possible_inputs, "A")end) == expected_output
    end
  end

  test "User turn initiates Cat's Game!" do
    possible_inputs = [spotOne: "X", spotTwo: "A", spotThree: "A",
    spotFour: "A", spotFive: "5", spotSix: "X",
    spotSeven: "X", spotEight: "X", spotNine: "A"]

    expected_output = "\nYour Turn!\n" <>
    "\n X | A | A " <>
    "\n---+---+---" <>
    "\n A | 5 | X " <>
    "\n---+---+---" <>
    "\n X | X | A \n\n" <>
    "\n X | A | A " <>
    "\n---+---+---" <>
    "\n A | A | X " <>
    "\n---+---+---" <>
    "\n X | X | A \n\n" <>
    "Cat's Game!\n"

    Mock.with_mocks([
      {IO, [:passthrough],
        [gets: fn(_prompt) -> "5" end]},
      ])do
      assert capture_io(fn -> ElixirTicTacToe._game_loop(possible_inputs, "A")end) == expected_output
    end
  end

  test "Lets See if this works" do
    possible_inputs = [spotOne: "X", spotTwo: "A", spotThree: "A",
    spotFour: "A", spotFive: "5", spotSix: "X",
    spotSeven: "X", spotEight: "X", spotNine: "A"]

    expected_output = "\nYour Turn!\n" <>
    "\n X | A | A " <>
    "\n---+---+---" <>
    "\n A | 5 | X " <>
    "\n---+---+---" <>
    "\n X | X | A \n\n" <>
    "\n X | A | A " <>
    "\n---+---+---" <>
    "\n A | A | X " <>
    "\n---+---+---" <>
    "\n X | X | A \n\n" <>
    "Cat's Game!\n"

    io = MockIo.new()
    io.set_input_values.(["5", "6"])

    Mock.with_mocks([
      {IO, [:passthrough],
        [gets: fn(_prompt) -> io.gets.() end]},
      ])do
      assert capture_io(fn -> ElixirTicTacToe._game_loop(possible_inputs, "A")end) == expected_output
    end
  end
end

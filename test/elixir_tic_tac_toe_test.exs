defmodule ElixirTicTacToeTest do
  use ExUnit.Case
  import ExUnit.CaptureIO
  import Mock
  doctest ElixirTicTacToe

  test "Player setup returns player token for new player" do
    Mock.with_mocks([
      {IoFunctions, [:passthrough],
        [slug_input: fn(_prompt) -> "Y" end]},
      {GetTokens, [:passthrough],
        [return_new_player_token: fn() -> "D" end]},
    ]) do
      assert ElixirTicTacToe._player_setup() == "D"
    end
  end

  test "Player setup returns player token for exisiting player" do
    Mock.with_mocks([
      {IoFunctions, [:passthrough],
        [slug_input: fn(_prompt) -> "n" end]},
      {GetTokens, [:passthrough],
        [return_player_token: fn() -> "D" end]},
    ]) do
      assert ElixirTicTacToe._player_setup() == "D"
    end
  end

  test "Replay game thanks player after selecting no to replay" do
    Mock.with_mock IO, [:passthrough], [gets: fn(_prompt) -> "n" end] do
      assert capture_io(
        fn -> ElixirTicTacToe._replay_game("A")end
        ) == "Thank you for playing!\n"
    end
  end

  test "Replay calls game loop twice" do
    io = MockIo.new()
    io.set_input_values.(["Y", "Y", "N"])

    Mock.with_mocks([
      {IO, [:passthrough],
        [gets: fn(_prompt) -> io.gets.() end]},

      {GameLoop, [:passthrough],
        [_game_loop: fn(_new_board, _token) -> IO.puts("A")end]}
      ])do

        assert capture_io(
          fn -> ElixirTicTacToe._replay_game("A") end
          ) == "A\nA\nThank you for playing!\n"
    end
  end
end

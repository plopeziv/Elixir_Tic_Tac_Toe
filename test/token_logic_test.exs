defmodule GetTokensTest do
  use ExUnit.Case, async: false
  import ExUnit.CaptureIO
  import Mock
  doctest GetTokens

  test "Return Player Token returns appropriate token" do
    Mock.with_mocks(
      [{QueryAdapters, [:passthrough],
      [_is_player_in_db: fn(_person) -> true end,
      _query_player_token: fn(_person) -> "M" end]},
      {IO, [],
      [gets: fn(_prompt) -> "Matt\n" end,
      puts: fn (_prompt) -> "Welcome!" end]}
    ])do
      assert GetTokens.return_player_token() == "M"
    end
  end

  test "Return New Player Token returns a new token" do

    Mock.with_mocks(
      [{IO, [], [gets: fn(_prompt) -> "Chris\n" end]},
      {TokenHelpers, [:passthrough], [_create_token: fn(_prompt) -> "C" end]},
      ]) do
      assert GetTokens.return_new_player_token == "C"
    end
  end

  test "Retrieve Token gives token of an available player" do

    Mock.with_mock QueryAdapters, [:passthrough],
      [
      _is_player_in_db: fn(_person) -> true end,
      _query_player_token: fn(_person) -> "Z" end
      ]do

      assert GetTokens.retrieve_token("Stacey") == "Z"
    end

  end

  test "Retrieve Token welcomes user" do
    Mock.with_mock QueryAdapters, [:passthrough],
      [
      _is_player_in_db: fn(_person) -> true end,
      _query_player_token: fn(_person) -> "D" end
      ]do
      assert capture_io(fn -> GetTokens.retrieve_token("Dave")
        end) == "Welcome Dave! You will play as D\n"
    end
  end

  test "Retrieve Token returns O as spot" do
    Mock.with_mock QueryAdapters, [:passthrough],
      [
      _is_player_in_db: fn(_person) -> false end
      ]do
        assert GetTokens.retrieve_token("Stacey") == "O"
      end
  end

  test "Retrieve Token prompts user as O" do
    Mock.with_mock QueryAdapters, [:passthrough],
      [
      _is_player_in_db: fn(_person) -> false end
      ]do
      assert capture_io(fn -> GetTokens.retrieve_token("Stacey")
        end) == "Player not found! User will play as O\n"
    end
  end
end

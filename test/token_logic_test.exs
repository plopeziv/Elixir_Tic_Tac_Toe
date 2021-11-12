defmodule GetTokensTest do
  use ExUnit.Case, async: false
  import ExUnit.CaptureIO
  import Mock
  doctest GetTokens

  test "Return Token returns appropriate token" do
    Mock.with_mock IO, [:passthrough], [gets: fn(_prompt) -> "Matt\n" end] do
      assert GetTokens.return_token() == "M"
    end
  end

  test "Retrieve Token gives token of an available player" do

    Mock.with_mock QueryAdapters, [:passthrough],
      [
      _is_player_in_db: fn(person) -> true end,
      _query_player_token: fn(person) -> "Z" end
      ]do

      assert GetTokens.retrieve_token("Stacey") == "Z"
    end

  end

  test "Retrieve Token welcomes user" do
    assert capture_io(fn -> GetTokens.retrieve_token("Dave")
      end) == "Welcome Dave! You will play as D\n"
  end

  test "Retrieve Token returns O as spot" do
    assert GetTokens.retrieve_token("Stacey") == "O"
  end

  test "Retrieve Token prompts user as O" do
    assert capture_io(fn -> GetTokens.retrieve_token("Stacey")
      end) == "Player not found! User will play as O\n"
  end

  test "Gather User Input and Slugify" do
    Mock.with_mock IO, [gets: fn(_prompt) -> "Jake\n" end] do
      result = GetUserMove._slug_input("This is a test string")
      assert result == "Jake"
    end

  end
end

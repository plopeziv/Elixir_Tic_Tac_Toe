defmodule GetTokensTest do
  use ExUnit.Case, async: false
  import ExUnit.CaptureIO
  import Mock
  doctest GetTokens

  test "Retrieve Token gives token of an available player" do
    assert GetTokens.retrieve_token("Dave")  == "D"
  end

  test "Retrieve Token welcomes user" do
    assert capture_io(fn -> GetTokens.retrieve_token("Dave")
      end) == "Welcome Dave! You will play as D\n"
  end

  test "Retrieve Token returns O as spot" do
    assert GetTokens.retrieve_token("Stacey") == "O"
  end

  test "Retriev Token prompts user as O" do
    assert capture_io(fn -> GetTokens.retrieve_token("Stacey")
      end) == "Player not found! User will play as O\n"
  end

  test "Gather User Input and Slugify" do
    Mock.with_mock IO, [gets: fn(_prompt) -> "3\n" end] do
      result = GetUserMove._slug_input("This is a test string")
      assert result == "3"
    end

  end

  # Query Code Starts Here This Code will be mocked and  injected for above

  test "Query for Player" do
    assert GetTokens._query_player_token("Matt") == "M"
  end

  test "Is player in database returns True" do
    assert GetTokens._is_player_in_db("Pedro") == true
  end

  test "Is player in database returns False" do
    assert GetTokens._is_player_in_db("Sunny") == false
  end

end

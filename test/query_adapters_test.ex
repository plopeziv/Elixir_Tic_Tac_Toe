defmodule QueryAdaptersTest do
  use ExUnit.Case, async: false
  # import ExUnit.CaptureIO
  # import Mock
  doctest QueryAdapters

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

defmodule GetTokensTest do
  use ExUnit.Case, async: false
  import ExUnit.CaptureIO
  import Mock
  doctest GetTokens

  test "First Query" do

    assert GetTokens.testQuery() == "Pedro"
  end

  test "Query for Player" do
    assert GetTokens.queryPlayerToken("Matt") == "M"
  end

end

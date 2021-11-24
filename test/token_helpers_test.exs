defmodule TokenHelpersTest do
  use ExUnit.Case, async: false
  import Mock
  doctest TokenHelpers

  test "Gather User Input and Slugify" do
    Mock.with_mock IO, [gets: fn(_prompt) -> "Jake\n" end] do
      result = TokenHelpers._slug_input("This is a test string")
      assert result == "Jake"
    end
  end

  test "Input Checker returns token if not in array" do
    array = [ "1", "2", "3", "4",
              "5", "6", "7", "8",
              "9", "X", "x"]

    assert TokenHelpers._input_excluder(array, "a") == "a"
  end

  test "Input Checker loops until valid token is selected" do
    array = [ "1", "2", "3", "4",
              "5", "6", "7", "8",
              "9", "X", "x"]

    Mock.with_mock IO, [gets: fn(_prompt) -> "A\n" end] do
      assert TokenHelpers._input_excluder(array, "7") == "A"
    end
  end

  test "Create Token returns a token" do
    Mock.with_mock IO, [gets: fn(_prompt) -> "A\n" end] do
      assert TokenHelpers._create_token("this is a prompt") == "A"
    end
  end

end

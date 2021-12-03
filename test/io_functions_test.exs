defmodule IoFunctionsTest do
  use ExUnit.Case, async: false
  import Mock
  doctest IoFunctions

  test "Gather User Input and Slugify" do
    Mock.with_mock IO, [gets: fn(_prompt) -> "Jake\n" end] do
      result = IoFunctions.slug_input("This is a test string")
      assert result == "Jake"
    end
  end

  test "Input Checker Loops Unitl Valid Input Is Selected" do
    array = [ "4", "5", "6", "7"]

    Mock.with_mock IO, [gets: fn(_prompt) -> "6\n" end] do
      assert IoFunctions.input_checker(array, "a") == "6"
    end
  end

  test "Input Checker Returns True When Element IN Array" do
    array = [4, 5, 6, 7]

    assert IoFunctions.input_checker(array, 7) == 7
  end

  test "Input Excluder returns token if not in array" do
    array = [ "1", "2", "3", "4",
              "5", "6", "7", "8",
              "9", "X", "x"]

    assert IoFunctions.input_excluder(array, "a") == "a"
  end

  test "Input Excluder loops until valid token is selected" do
    array = [ "1", "2", "3", "4",
              "5", "6", "7", "8",
              "9", "X", "x"]

    Mock.with_mock IO, [gets: fn(_prompt) -> "A\n" end] do
      assert IoFunctions.input_excluder(array, "7") == "A"
    end
  end

end

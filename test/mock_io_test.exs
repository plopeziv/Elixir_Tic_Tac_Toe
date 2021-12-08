defmodule MockIoTest do
  use ExUnit.Case
  doctest MockIo

  test "mock io" do
    io = MockIo.new()
    io.set_input_values.(["Y", "N"])
    assert io.gets.() == "Y"
    assert io.gets.() == "N"
    assert io.gets.() == nil
  end
end

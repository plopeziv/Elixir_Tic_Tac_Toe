defmodule MemoryRepositoryTest do
  use ExUnit.Case
  doctest MemoryRepository

  test "can create and get a player" do
    repo = MemoryRepository.new()
    repo.create_player.(%{ name: "Dave", token: "D" })

    dave = repo.get_player_by_name.("Dave")

    assert dave.token == "D"
  end
end

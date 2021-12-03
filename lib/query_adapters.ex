defmodule QueryAdapters do
  import Ecto.Query

  def query_player_token(player) do
    [head|_tail]= TTT.Player |> where(playerName: ^player) |> TTT.Repo.all

    head.token
  end

  def is_player_in_db(player) do
    query = from player in TTT.Player, where: player.playerName == ^player

    TTT.Repo.exists?(query)
  end

  def create_player(player, marker) do
    if is_player_in_db(player) == false do
      new_player = %TTT.Player{playerName: player, token: marker}

      TTT.Repo.insert(new_player)
    end
  end

  def remove_player(player) do
    if is_player_in_db(player) == true do
      old_player = TTT.Player |> TTT.Repo.get_by(playerName: player)

      TTT.Repo.delete(old_player)
    end

  end
end

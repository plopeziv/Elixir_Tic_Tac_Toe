defmodule QueryAdapters do
  import Ecto.Query

  def _query_player_token(player) do
    [head|_tail]= TTT.Player |> where(playerName: ^player) |> TTT.Repo.all

    head.token
  end

  def _is_player_in_db(player) do
    query = from player in TTT.Player, where: player.playerName == ^player

    TTT.Repo.exists?(query)
  end
end

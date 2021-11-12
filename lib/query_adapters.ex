defmodule QueryAdapters do
  import Ecto.Query

  def _query_player_token(person) do
    [head|_tail]= TTT.Player |> where(playerName: ^person) |> TTT.Repo.all

    head.token
  end

  def _is_player_in_db(person) do
    query = from player in TTT.Player, where: player.playerName == ^person

    TTT.Repo.exists?(query)
  end
end

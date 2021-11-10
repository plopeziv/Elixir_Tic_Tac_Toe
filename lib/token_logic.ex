defmodule GetTokens do
  def testQuery() do
    [head|_tail] = TTT.Player |> TTT.Repo.all

    head.playerName
  end

  def queryPlayerToken(person) do
    require Ecto.Query

    [head|_tail]= TTT.Player |> Ecto.Query.where(playerName: ^person) |> TTT.Repo.all

    head.token
  end

end

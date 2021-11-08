defmodule GetTokens do
  def testQuery() do
    [head|tail] = TTT.Player |> TTT.Repo.all

    head.playerName
  end

  def queryPlayerToken(person) do
    require Ecto.Query

    [head|tail]= TTT.Player |> Ecto.Query.where(playerName: "Matt") |> TTT.Repo.all

    head.token
  end

end

defmodule GetTokens do
  import Ecto.Query

  def return_token() do
    player = _slug_input("Please enter your player ID")

    retrieve_token(player)

  end

  def retrieve_token(person) do
    if _is_player_in_db(person) do
      token = _query_player_token(person)
      IO.puts("Welcome #{person}! You will play as #{token}")

      token

    else
      token = "O"
      IO.puts("Player not found! User will play as #{token}")

      token
    end
  end

  def _slug_input(message_prompt) do
    input = IO.gets(message_prompt)
    if input == :eof do
      raise "End of File! Check for propper mocks and imports"
    else
      String.trim(input)
    end
  end

  def _query_player_token(person) do
    [head|_tail]= TTT.Player |> where(playerName: ^person) |> TTT.Repo.all

    head.token
  end

  def _is_player_in_db(person) do
    query = from player in TTT.Player, where: player.playerName == ^person

    TTT.Repo.exists?(query)
  end
end

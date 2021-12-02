defmodule GetTokens do
  import QueryAdapters
  import TokenHelpers

  def return_player_token() do
    player = slug_input("Please enter your player's name : ")

    retrieve_token(player)
  end

  def return_new_player_token() do
    create_token("Please enter your desired token: ")
  end

  def retrieve_token(player) do
    if is_player_in_db(player) do
      token = query_player_token(player)
      IO.puts("Welcome #{player}! You will play as #{token}")

      token

    else
      token = "O"
      IO.puts("Player not found! User will play as #{token}")

      token
    end
  end
end

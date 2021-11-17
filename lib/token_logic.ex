defmodule GetTokens do
  import QueryAdapters

  def return_token() do
    player = _slug_input("Please enter your player's name : ")

    retrieve_token(player)

  end

  def retrieve_token(player) do
    if QueryAdapters._is_player_in_db(player) do
      token = QueryAdapters._query_player_token(player)
      IO.puts("Welcome #{player}! You will play as #{token}")

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
end

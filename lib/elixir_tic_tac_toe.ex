import GameLoop
import GetTokens

defmodule ElixirTicTacToe do

  def play_TTT(board) do

    game_token = _player_setup()

    game_loop(board, game_token)

    _replay_game(game_token)

  end

  def _player_setup() do
    if yes_no_checker("Would you like to play as a new player? (Y/N): ") == "Y" do
      return_new_player_token()
    else
      return_player_token()
    end
  end


  def _replay_game(token) do
    if yes_no_checker("Do you want to play again? (Y/N): ") == "Y" do

      clean_board = [
        spotOne: "1", spotTwo: "2", spotThree: "3",
        spotFour: "4", spotFive: "5", spotSix: "6",
        spotSeven: "7", spotEight: "8", spotNine: "9"]

      game_loop(clean_board, token)
      _replay_game(token)
    else
      IO.puts("Thank you for playing!")
    end
  end
end

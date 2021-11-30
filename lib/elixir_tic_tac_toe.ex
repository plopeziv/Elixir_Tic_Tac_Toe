import GetUserMove
import BestComputerSpot
import WinningCombo

defmodule ElixirTicTacToe do

  def play_TTT(board) do

    game_token = _player_setup()

    _game_loop(board, game_token)

    _replay_game(game_token)

  end

  def _player_setup() do
    if _yes_no_checker("Would you like to play as a new player? (Y/N): ") == "Y" do
      GetTokens.return_new_player_token()
    else
      GetTokens.return_player_token()
    end
  end

  def _yes_no_checker(command_prompt)do
    slug = GetUserMove._input_checker(["Y", "y", "N", "n"],
      GetUserMove._slug_input(command_prompt))

    String.capitalize(slug)
  end

  def _print_board(board) do
    printed_board = "\n #{board[:spotOne]} | #{board[:spotTwo]} | #{board[:spotThree]} "<>
                    "\n---+---+---\n "<>
                    "#{board[:spotFour]} | #{board[:spotFive]} | #{board[:spotSix]} "<>
                    "\n---+---+---\n "<>
                    "#{board[:spotSeven]} | #{board[:spotEight]} | #{board[:spotNine]} \n"

    IO.puts printed_board
  end

  def _game_loop(board, player_token) do

    if is_game_over(board, player_token) == false do
      IO.puts("\nYour Turn!")
      _print_board(board)

      user_board = _user_turn(board, player_token)

      if is_game_over(user_board, player_token) == false do
        IO.puts("Computer's Turn!")
        _game_loop(_computer_turn(user_board, player_token), player_token)
      end
    end
  end

  def _computer_turn(board, player_token) do
    computer_board = get_best_spot(board, player_token)
    _print_board(computer_board)

    computer_board
  end

  def _user_turn(board, player_token) do
    user_board = get_move(board, player_token)
    _print_board(user_board)

    user_board
  end

  def _replay_game(token) do
    if _yes_no_checker("Do you want to play again? (Y/N): ") == "Y" do
      clean_board = [
        spotOne: "1", spotTwo: "2", spotThree: "3",
        spotFour: "4", spotFive: "5", spotSix: "6",
        spotSeven: "7", spotEight: "8", spotNine: "9"]

      _game_loop(clean_board, token)
      _replay_game(token)
    else
      IO.puts("Thank you for playing!")
    end
  end
end


import IoFunctions
import GetUserMove
import BestComputerSpot
import WinningCombo

defmodule GameLoop do

  def _yes_no_checker(command_prompt)do

    slug = GetUserMove.input_checker(["Y", "y", "N", "n"],
      GetUserMove.slug_input(command_prompt))
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
end

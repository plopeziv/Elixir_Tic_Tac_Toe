import GetUserMove
import FirstComputerSpot
import WinningCombo

defmodule ElixirTicTacToe do

  def play_TTT(input_list) do

    _game_loop(input_list, "A")

  end

  def _print_board(input_list) do
    printed_board = "\n #{input_list[:spotOne]} | #{input_list[:spotTwo]} | #{input_list[:spotThree]} "<>
                    "\n---+---+---\n "<>
                    "#{input_list[:spotFour]} | #{input_list[:spotFive]} | #{input_list[:spotSix]} "<>
                    "\n---+---+---\n "<>
                    "#{input_list[:spotSeven]} | #{input_list[:spotEight]} | #{input_list[:spotNine]} \n"

    IO.puts printed_board
  end

  def _game_loop(input_list, player_token) do

    if is_game_over(input_list, player_token) == false do
      _print_board(input_list)

      user_board = _user_turn(input_list, player_token)

      if is_game_over(user_board, player_token) == false do
        _game_loop(_computer_turn(user_board, player_token), player_token)
      end
    end
  end

  def _computer_turn(input_list, player_token) do
    computer_board = take_first_available_spot(input_list, player_token)
    _print_board(computer_board)

    computer_board
  end

  def _user_turn(input_list, player_token) do
    user_board = get_move(input_list, player_token)
    _print_board(user_board)

    user_board
  end
end

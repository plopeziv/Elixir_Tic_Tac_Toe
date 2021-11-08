import GetUserMove
import FirstComputerSpot
import WinningCombo

defmodule ElixirTicTacToe do

  def play_TTT(board) do

    _game_loop(board, "A")

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
      _print_board(board)

      user_board = _user_turn(board, player_token)

      if is_game_over(user_board, player_token) == false do
        _game_loop(_computer_turn(user_board, player_token), player_token)
      end
    end
  end

  def _computer_turn(board, player_token) do
    computer_board = take_first_available_spot(board, player_token)
    _print_board(computer_board)

    computer_board
  end

  def _user_turn(board, player_token) do
    user_board = get_move(board, player_token)
    _print_board(user_board)

    user_board
  end
end

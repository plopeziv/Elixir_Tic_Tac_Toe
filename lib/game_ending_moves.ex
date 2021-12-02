defmodule GameEndingMoves do
  import WinningCombo

  def win_game(board, token) do

    possible_boards = Enum.map(board, fn value_pair->
      if elem(value_pair,1) !=  "X" and elem(value_pair,1) != token do
        Keyword.replace(board, elem(value_pair, 0),"X")
      else
        board
      end
    end)

    Enum.reduce_while(possible_boards, [], fn (newBoard, _accum) ->
      if is_win(newBoard) == true,
      do: {:halt, newBoard},
      else: {:cont, board}
    end)
  end

  def defend_loss(board, token) do
    possible_boards = Enum.map(board, fn value_pair->
      if elem(value_pair,1) !=  "X" and elem(value_pair,1) != token do
        Keyword.replace(board, elem(value_pair, 0), token)
      else
        board
      end
    end)

    Enum.reduce_while(possible_boards, [], fn (newBoard, _accum) ->
      if is_win(newBoard) == true,
      do: {:halt, _replace_first_difference(board, newBoard)},
      else: {:cont, board}
    end)
  end

  def take_spot_five(board, user_token) do
    {current_marker, new_board} = Keyword.get_and_update(board, :spotFive,
      fn current_value ->  {current_value,"X"} end)

    if current_marker == "X" or current_marker == user_token do
      board
    else
      new_board
    end
  end

  def _replace_first_difference(board, newBoard) do

    winning_boards = Enum.map(board, fn value_pair ->
      if elem(value_pair,1 ) != newBoard[elem(value_pair, 0)] do
        Keyword.replace(board, elem(value_pair, 0), "X")
      end
      end)

    Enum.reduce_while(winning_boards, [], fn(newBoard, _accum) ->
      if newBoard != nil,
      do: {:halt, newBoard},
      else: {:cont, board}

    end)

  end
end

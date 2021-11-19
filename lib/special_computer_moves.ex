defmodule SpecialComputerMoves do

  def take_spot_five(board, user_token) do
    {current_marker, new_board} = Keyword.get_and_update(board, :spotFive,
      fn current_value ->  {current_value,"X"} end)

    if current_marker == "X" or current_marker == user_token do
      board
    else
      new_board
    end
  end
end

defmodule SpecialCombos do

  def take_spot_five(board, user_token) do
    {old_value, new_board} = Keyword.get_and_update(board, :spotFive,
      fn current_value ->  {current_value,"X"} end)

    if old_value == "X" or old_value == user_token do
      board
    else
      new_board
    end
  end
end

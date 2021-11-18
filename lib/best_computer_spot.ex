defmodule BestComputerSpot do
  import SpecialComputerMoves
  import FirstComputerSpot
  import GameEndingMoves

  def get_best_spot(board, token)do

    Enum.reduce_while(_assign_priority_list(), [], fn (function, accum) ->
      if board != function.(board,  token),
      do: {:halt, accum ++ function.(board, token)},
      else: {:cont, accum}
    end)

  end

  def _assign_priority_list() do
    priority1 =  fn (board, token) -> win_game(board, token) end
    priority2 =  fn (board, token) -> defend_loss(board, token) end
    priority3 =  fn (board, token) -> take_spot_five(board, token) end
    priority4 =  fn (board, token) -> take_first_available_spot(board,  token) end

    [priority1, priority2, priority3,  priority4]
  end
end

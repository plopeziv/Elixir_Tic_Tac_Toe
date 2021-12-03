defmodule BestComputerSpot do
  import ComputerMoves

  def get_best_spot(board, token)do

    Enum.reduce_while(
      [&win_game/2, &defend_loss/2,
        &take_spot_five/2, &take_first_available_spot/2],
      [],
      fn (function, accum) ->
        if board != function.(board,  token),
        do: {:halt, accum ++ function.(board, token)},
        else: {:cont, accum}
    end)
  end
end

defmodule BestComputerSpot do
  import SpecialComputerMoves
  import FirstComputerSpot
  import GameEndingMoves

  def get_best_spot(board, token)do
    boardList = [
      win_game(board, token),
      defend_loss(board, token),
      take_spot_five(board, token),
      take_first_available_spot(board,  token)
    ]

    Enum.reduce_while(boardList, [], fn (newBoard, accum) ->
      if board != newBoard,
      do: {:halt, accum ++ newBoard},
      else: {:cont, accum}
    end)

  end
end

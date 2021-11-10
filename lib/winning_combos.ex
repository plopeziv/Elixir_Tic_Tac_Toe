defmodule WinningCombo do

  def is_win(board) do
    top_row = [board[:spotOne], board[:spotTwo], board[:spotThree]]
    middle_row = [board[:spotFour], board[:spotFive], board[:spotSix]]
    bottom_row = [board[:spotSeven], board[:spotEight], board[:spotNine]]
    left_column = [board[:spotOne], board[:spotFour], board[:spotSeven]]
    middle_column = [board[:spotTwo], board[:spotFive], board[:spotEight]]
    right_column = [board[:spootThree], board[:spootSix], board[:spotNine]]
    diagonal_top_left = [board[:spotOne], board[:spotFive], board[:spotNine]]
    diagonal_top_right = [board[:spotThree], board[:spotFive], board[:spotSeven]]

    winning_combos = [top_row, middle_row, bottom_row,
                    left_column, middle_column, right_column,
                    diagonal_top_left, diagonal_top_right]

    result_list = Enum.map(winning_combos,
        fn x -> is_all_same_token(x) end)


    Enum.member?(result_list, true)
  end

  def is_game_over(board, user_token) do
    cond do
      is_win(board) == true ->
        IO.puts("Game Over!")

      is_cats_game(board, user_token) == true ->
        IO.puts("Cat's Game!")

      true ->
        false
    end

  end

  def is_cats_game(board, user_token) do
    inputArray = _valid_input_array(board, user_token,  [])

    if length(inputArray) ==  0 do
      true
    else
      false
    end
  end

  def is_all_same_token(array_sequence) do
    Enum.count(Enum.uniq(array_sequence)) == 1
  end

  def _valid_input_array([head|tail], token, traversed_spots) do
    if elem(head, 1) == token or elem(head, 1) == "X" do
      _valid_input_array(tail, token, traversed_spots)

    else
      _valid_input_array(tail, token, [elem(head, 1)| traversed_spots])
    end

  end

  def _valid_input_array([], _token, traversed_spots) do
    traversed_spots
  end

end

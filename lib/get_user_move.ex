defmodule GetUserMove do
  def get_move(board, token) do
    raw_input = _slug_input("Please choose an empty game space. ")
    checked_input = _input_checker(
            _create_valid_input_array(board, token, []), raw_input)

    _replacement_function(board, token, checked_input, [])

  end

  def _slug_input(message_prompt) do
    input = IO.gets(message_prompt)
    if input == :eof do
      raise "End of File! Check for propper mocks and imports"
    else
      String.trim(input)
    end
  end

  def _create_valid_input_array([head|tail], token, traversed_spots) do
    if elem(head, 1) == token or elem(head, 1) == "X" do
      _create_valid_input_array(tail, token, traversed_spots)

    else
      _create_valid_input_array(tail, token, [elem(head, 1)| traversed_spots])
    end

  end

  def _create_valid_input_array([], token, traversed_spots) do
    traversed_spots
  end

  def _input_checker(array, test_element) do
    if Enum.member?(array, test_element) do
      test_element

    else
      _input_checker(array, _slug_input("Invalid Input: Please choose an empty game space. "))
    end
  end

  def _replacement_function([head|tail], token, selected_spot, traversed_spots) do

    if elem(head, 1) != selected_spot do
      _replacement_function(tail, token, selected_spot, [head|traversed_spots])
    else
      Enum.reverse(traversed_spots) ++ [
        {elem(head, 0), token}|tail
      ]
    end
  end

  def _replacement_function([], token, selected_spot, traversed_spots) do
    IO.puts("Something Went Wrong, Replacement Not Found!")
  end

end

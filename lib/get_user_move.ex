defmodule GetUserMove do
  def get_move(board, token) do
    raw_input = _slug_input("Your Turn! Please choose an empty game space. ")
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

  def _create_valid_input_array([head|tail], token, recursive_list) do
    if elem(head, 1) == token or elem(head, 1) == "X" do
      _create_valid_input_array(tail, token, recursive_list)

    else
      _create_valid_input_array(tail, token, [elem(head, 1)| recursive_list])
    end

  end

  def _create_valid_input_array([], token, recursive_list) do
    recursive_list
  end

  def _input_checker(array, test_element) do
    if Enum.member?(array, test_element) do
      test_element

    else
      _input_checker(array, _slug_input("Invalid Input: Please choose an empty game space. "))
    end
  end

  def _replacement_function([head|tail], token, selected_spot, recursive_list) do

    if elem(head, 1) != selected_spot do
      _replacement_function(tail, token, selected_spot, [head|recursive_list])
    else
      Enum.reverse(recursive_list) ++ [
        {elem(head, 0), token}|tail
      ]
    end
  end

  def _replacement_function([], token, selected_spot, recursive_list) do
    IO.puts("Something Went Wrong, Replacement Not Found!")
  end

end

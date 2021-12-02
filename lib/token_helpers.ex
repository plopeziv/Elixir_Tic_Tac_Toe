defmodule TokenHelpers do
  def slug_input(message_prompt) do
    input = IO.gets(message_prompt)
    if input == :eof do
      raise "End of File! Check for propper mocks and imports"
    else
      String.trim(input)
    end
  end

  def create_token(message_prompt) do
    reserved_markers = [ "1", "2", "3", "4",
                         "5", "6", "7", "8",
                         "9", "X", "x"]

    _input_excluder(reserved_markers, slug_input(message_prompt))
  end

  def _input_excluder(array, test_element) do
    if Enum.member?(array, test_element) == false do
      test_element

    else
      _input_excluder(array, slug_input("Invalid Input: Please choose an available option. "))
    end
  end
end

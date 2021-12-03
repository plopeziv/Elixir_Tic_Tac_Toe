defmodule IoFunctions do
  def slug_input(message_prompt) do
    input = IO.gets(message_prompt)
    if input == :eof do
      raise "End of File! Check for propper mocks and imports"
    else
      String.trim(input)
    end
  end

  def input_checker(array, test_element) do
    if Enum.member?(array, test_element) do
      test_element

    else
      input_checker(array, slug_input("Invalid Input: Please choose an available option. "))
    end
  end

  def input_excluder(array, slug) do
    if Enum.member?(array, slug) == false do
      slug

    else
      input_excluder(array, slug_input("Invalid Input: Please choose an available option. "))
    end
  end
end

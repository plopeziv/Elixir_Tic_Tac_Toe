defmodule IoFunctions do
  def slug_input(message_prompt) do
    input = IO.gets(message_prompt)
    if input == :eof do
      raise "End of File! Check for propper mocks and imports"
    else
      String.trim(input)
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

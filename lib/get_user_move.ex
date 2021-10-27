defmodule GetUserMove do
  def getMove(board, token) do
    raw_input = _slugInput("Your Turn! Please choose an empty game space. ")

    checked_input = _inputChecker(
            _createValidInputArray(board, token, []), raw_input)

    _replacementFunction(board, token, checked_input, [])

  end

  def _slugInput(string) do
    returnedInput = IO.gets(string)

    String.trim(returnedInput)
  end

  def _createValidInputArray([head|tail], token, recursiveList) do
    if elem(head, 1) == token or elem(head, 1) == "X" do
      _createValidInputArray(tail, token, recursiveList)

    else
      _createValidInputArray(tail, token, [elem(head, 1)| recursiveList])
    end

  end

  def _createValidInputArray([], token, recursiveList) do
    recursiveList
  end

  def _inputChecker(array, testElement) do
    if Enum.member?(array, testElement) do
      testElement

    else
      _inputChecker(array, _slugInput("Invalid Input: Please choose an empty game space. "))
    end
  end

  def _replacementFunction([head|tail], token, replacement, recursiveList) do

    if elem(head, 1) != replacement do
      _replacementFunction(tail, token, replacement, [head|recursiveList])
    else
      Enum.reverse(recursiveList) ++ [
        {elem(head, 0), token}|tail
      ]
    end
  end

  def _replacementFunction([], token, replacement, recursiveList) do
    IO.puts("Something Went Wrong, Replacement Not Found!")
  end

end

defmodule GetUserMove do
  def getMove(board, token) do

    raw_input = _slugInput()

    # Check for Valid input

    # Replace appropriate  Space
  end

  def _slugInput() do
    returnedInput = IO.gets("Your Turn! Please choose an empty game space. ")

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

end

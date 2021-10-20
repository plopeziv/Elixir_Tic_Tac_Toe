defmodule ElixirTicTacToe do
  @moduledoc """
  Documentation for `ElixirTicTacToe`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ElixirTicTacToe.hello()
      :world

  """
  def hello do
    :world
  end

  def printBoard(inputList) do
    printedBoard = "\n #{inputList[:spotOne]} | #{inputList[:spotTwo]} | #{inputList[:spotThree]} "<>
                    "\n---+---+---\n "<>
                    "#{inputList[:spotFour]} | #{inputList[:spotFive]} | #{inputList[:spotSix]} "<>
                    "\n---+---+---\n "<>
                    "#{inputList[:spotSeven]} | #{inputList[:spotEight]} | #{inputList[:spotNine]} \n"

    IO.puts printedBoard
  end
end

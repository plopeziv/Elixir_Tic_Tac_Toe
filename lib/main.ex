import ElixirTicTacToe

defmodule Main do

  def main() do
    # {opts,_,_}= OptionParser.parse(args,switches: [file: :string],aliases: [f: :file])
    # IO.inspect opts #here I just inspect the options to stdout
    play_TTT()

  end
end

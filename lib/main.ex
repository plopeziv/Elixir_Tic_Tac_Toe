import ElixirTicTacToe

defmodule Main do

  def main(args) do
    # {opts,_,_}= OptionParser.parse(args,switches: [file: :string],aliases: [f: :file])
    # IO.inspect opts #here I just inspect the options to stdout

    TTT.Application.start(:normal, args)

    play_TTT([spotOne: "1", spotTwo: "2", spotThree: "3",
    spotFour: "4", spotFive: "5", spotSix: "6",
    spotSeven: "7", spotEight: "8", spotNine: "9"])
  end
end

import Main

defmodule Mix.Tasks.TicTacToe do
  use Mix.Task

  def run(_) do
    Mix.Task.run("app.start")

    main()
  end
end

defmodule TTT.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias TTT.Repo

      import Ecto
      import Ecto.Query
      import TTT.RepoCase

      # and any other stuff
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(TTT.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(TTT.Repo, {:shared, self()})
    end

    :ok
  end
end

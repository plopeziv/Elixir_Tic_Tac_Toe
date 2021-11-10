defmodule TTT.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create  table(:gamePlayers)  do
      add :playerName, :string
      add :token,  :string
    end

  end
end

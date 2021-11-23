defmodule TTT.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create  table(:gamePlayers)  do
      add :playerName, :string, primary_key: true
      add :token,  :string
    end

    create(unique_index(:gamePlayers, [:playerName]))

  end
end

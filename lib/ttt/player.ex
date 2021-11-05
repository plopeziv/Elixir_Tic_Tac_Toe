defmodule TTT.Player do
  use Ecto.Schema

  schema "gamePlayers" do
    field :playerName, :string
    field :Token, :string
  end

  def changeset(player,  params \\ %{}) do
    player
    |>Ecto.Changeset.cast(params,  [:playerName,  :Token])
    |>Ecto.Changeset.validate_required([:playerName,  :Token])
  end
end

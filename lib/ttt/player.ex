defmodule TTT.Player do
  use Ecto.Schema

  schema "gamePlayers" do
    field :playerName, :string
    field :token, :string
  end

  def changeset(player,  params \\ %{}) do
    player
    |>Ecto.Changeset.cast(params,  [:playerName,  :token])
    |>Ecto.Changeset.validate_required([:playerName,  :token])
  end
end

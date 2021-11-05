defmodule TTT.Repo do
  use Ecto.Repo,
    otp_app: :elixir_tic_tac_toe,
    adapter: Ecto.Adapters.Postgres
end

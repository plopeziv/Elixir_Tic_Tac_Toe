use Mix.Config

config :elixir_tic_tac_toe, TTT.Repo,
  database: "elixir_tic_tac_toe_repo",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

import_config "#{Mix.env()}.exs"

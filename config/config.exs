import Config

config :elixir_tic_tac_toe, TTT.Repo,
  database: "elixir_tic_tac_toe_repo",
  hostname: "localhost"

config :elixir_tic_tac_toe, ecto_repos: [TTT.Repo]

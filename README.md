# ElixirTicTacToe

This application runs a user vs computer Tic-Tac-Toe command line game. To play simply followw the command prompts and submit a response by typing on the kyboard followed by the enter button. This game was created as a sister to its python counter part, using functional programming principals. 

## Installation

In order to play Elixir Tic Tac Toe, Mix, Erlang, and Elixir must be installed locally. Elixir Tic Tac Toe was designed in an environment requiring Elixir 1.12 and greater. To install Elixir, use the ```brew isntall elixir``` command with Homebrew. For machines without Homebrew, please reference the Elixir website for specific machine install instructions. The website can be found at https://elixir-lang.org/install.html. 

With Mix installed, the following command will install hex to your local environment. If hex is already installed, this step can be omitted. 

Note: The --force flag only needs to be used during automated setups, such as continous intigration platforms.

```
mix local.hex --force
```

The following commands will install dependencies for both the game and test suite. Just like before, the --force flag is only necessary for automated setups. Installation dependencies can be  seen in the mix.exs file. 

```
mix deps.get
mix local.rebar --force
```

Finally, the test suite can be ran using ```mix test```. At this point, Elixir Tic Tac Toe should be fully  installed. 

## Database Installation
Ecto applications run with the assumption that Postgresql is already installed on your machine. For Mac users, homebrew installation is recommended using ``` brew install postgresql ```  and following the prompts in https://wiki.postgresql.org/wiki/Homebrew. For all other users follow the installation method of choice as dictated by the  Postgresql doccumentation for your specific machine. 

With Postgresql installed run the folloing commands. The first will create your database, while the second will insert a gamePlayers table and migrate said database. 

Note: It is important that the command variable after migration is written exactly such that the Tic Tac Toe repo can find the table. 

```
mix ecto.create 

mix ecto.gen.migration create_players
```

If you wish to populate the database with default users, players can be updated in the iex ripple; outside of the Tic Tac Toe game. To enter the ripple, use the ```iex -S mix``` command. To insert new players, enter iex and augment the following code.

```
players = [
  %TTT.Player{playerName: "Player 1", token: "@"},
  %TTT.Player{playerName: "Player 2", token: "b"},
  %TTT.Player{playerName: "Player 3", token: "C"},
]

Enum.each(players, fn (player) -> TTT.Repo.insert(player) end)
```

Note: When deciding on default tokens, keep in mind that integers and "X" are already taken and  will be rejected. It is also best practice to use a single character as your token marker. 

Deleting and updating records is also available using the iex ripple. More information on this and database setup can be found in the hex tutorial documentation located at https://hexdocs.pm/ecto/getting-started.html

## Running the Game
To run Elixir Tic Tac Toe run the following command in the parent directory. 

```
mix tic_tac_toe
```

While operating, the selection of spaces can be done via keyboad. Simply type your desired space followed by the enter key. Then follow the pompts until game end. 

## Testing
While inside the elixir_tic_tac_toe directory, run the command below.

```elixir
mix test
```

Note: To run the test continously ```mix test.watch``` is also available. This will refresh the test suite after changes to a file are saved. 

## Contributors

The initial Tic-Tac-Toe program was created by Pedro Lopez uunder the guidance and oversight of Dave Torre & Matt Readout. 

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

## Running the Game
To run Elixir Tic Tac Toe run the following command in the parent directory. 

```
mix tic_tac_toe
```

While operating, the selection of spaces can be done via keyboad. Simply type your desired space followed by the enter key. Then follow the pompts until game end. 

## Running the Game
While in the lib directory, enter the initiation command below.

```elixir
elixir elixir_tic_tac_toe.ex
```

## Testing
While inside the elixir_tic_tac_toe directory, run the command below.

```elixir
mix test
```

Note: To run the test continously ```mix test.watch``` is also available. This will refresh the test suite after changes to a file are saved. 

## Contributors

The initial Tic-Tac-Toe program was created by Pedro Lopez uunder the guidance and oversight of Dave Torre & Matt Readout. 

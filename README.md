# ElixirTicTacToe

This application runs a user vs computer Tic-Tac-Toe command line game. To play simply followw the command prompts and submit a response by typing on the kyboard followed by the enter button. This game was created as a sister to its python counter part, using functional programming principals. 

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `elixir_tic_tac_toe` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:elixir_tic_tac_toe, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/elixir_tic_tac_toe](https://hexdocs.pm/elixir_tic_tac_toe).

## Running the Game
To start you must first create an executable. To do this, run the following command in the parent directory.

```
mix escript.build
```

A succesful build will have teh following prompt. 

```
Generated escript elixir_tic_tac_toe with MIX_ENV=dev
```

Once the excutable is created, run the executable in the parent directory
```
./elixir_tic_tac_toe
```
Note: The executable must be updated with mix escript.build every time there is a change to your source code. 

## Testing
While inside the elixir_tic_tac_toe directory, run the command below.

```elixir
mix test
```

## Contributors

The initial Tic-Tac-Toe program was created by Pedro Lopez uunder the guidance and oversight of Dave Torre & Matt Readout. 

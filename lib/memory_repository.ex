defmodule MemoryRepository do

  def new do
    {:ok, pid} = Agent.start_link(fn -> default_data() end)
    %{
      create_player: fn (player) ->
        Agent.update(pid, fn(repo) ->
          %{ repo | players: repo.players ++ [player] }
        end)
      end,
      get_player_by_name: fn (name) ->
        Agent.get(pid, fn(repo) ->
          Enum.find(repo.players, fn (player) -> player.name == name end)
        end)
      end,
    }
  end

  def default_data do
    %{
      players: [
        %{ name: "Pedro", token: "P" },
        %{ name: "Matt", token: "M" }
      ]
    }
  end
end

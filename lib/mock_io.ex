defmodule MockIo do

  def new do
    {:ok, pid} = Agent.start_link(fn -> [] end)
    %{
      set_input_values: fn (values) ->
        Agent.update(pid, fn(_n) -> values end)
      end,
      gets: fn () ->
        values = Agent.get_and_update(pid, fn(values) ->
          if length(values) > 0 do
            {values, tl(values)}
          else
            {values, values}
          end
        end)

        if (length(values) > 0) do
          hd(values)
        else
          nil
        end
      end,
    }
  end
end

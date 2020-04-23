defmodule Api.Supervisors.Publisher do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    {:ok, channel} = Api.Supervisors.Connection.open_channel()
    Process.link(channel.pid)
    {:ok, channel}
  end
end

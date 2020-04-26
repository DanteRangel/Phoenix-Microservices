defmodule Api.Supervisors.Customers.SmsReceiver do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    {:ok, channel} = Api.Supervisors.Connection.open_channel()
    Process.link(channel.pid)

    {:ok, channel}
  end

  def child_spec(arg) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [arg]},
      type: :worker
    }
  end
end

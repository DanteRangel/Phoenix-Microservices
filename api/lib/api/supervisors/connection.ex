defmodule Api.Supervisors.Connection do
  use GenServer
  require Logger

  def start_link() do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    {:ok, connect()}
  end

  defp connect() do
    case AMQP.Connection.open() do
      {:ok, conn} ->
        Process.monitor(conn.pid)
        conn  # this will be our state
      {:error, err} ->
        Logger.error("failed to connect: #{inspect err}")
        :timer.sleep(1000)
        connect() # keep trying
    end
  end

  # we get this message because of the call to monitor we did
  def handle_info({:DOWN, _, :process, _pid, reason}, _) do
    Logger.error("queue connection is down: #{inspect reason}")
    {:noreply, connect()}
  end

  def open_channel() do
    GenServer.call(__MODULE__, :open_channel)
  end

  def handle_call(:open_channel, _from, conn) do
    {:reply, AMQP.Channel.open(conn), conn}
  end
end

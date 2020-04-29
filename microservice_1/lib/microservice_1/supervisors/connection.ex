defmodule Microservice1.Supervisors.Connection do
  use GenServer
  require Logger
  @host System.get_env("RABBITHOST")
  @username System.get_env("RABBITUSER")
  @password System.get_env("RABBITPASSWORD")

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    {:ok, connect()}
  end

  defp connect() do
    case AMQP.Connection.open("amqp://#{@username}:#{@password}@#{@host}") do
      {:ok, conn} ->
        Process.monitor(conn.pid)
        IO.puts("Conexion ....... RABBITMQ")
        IO.inspect(conn)
        IO.puts("Conexion ....... RABBITMQ")
        conn  # this will be our state
      {:error, _err} ->
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

  def child_spec(arg) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [arg]},
      type: :worker
    }
  end
end

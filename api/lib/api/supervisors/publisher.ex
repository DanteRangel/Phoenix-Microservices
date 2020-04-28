defmodule Api.Supervisors.Publisher do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    {:ok, channel} = Api.Supervisors.Connection.open_channel()
    Process.link(channel.pid)
    {:ok, channel}
  end

  def send_email(id) do
    GenServer.call(__MODULE__, {:send_email, id})
  end

  def handle_call({:send_email, id}, _from, channel) do
    AMQP.Exchange.declare(channel, "email.send.new", :fanout)
    publish = AMQP.Basic.publish(channel, "email.send.new", "", id)
    IO.puts " [x] Sent '#{id}'"
    {:reply, publish, channel}
  end

  def child_spec(arg) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [arg]},
      type: :worker
    }
  end
end

defmodule Microservice1.Supervisors.Worker do
  use GenServer
  use Supervisor

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    children = [
      Microservice1.Supervisors.SmsConsumer
    ]
    Supervisor.start_link(children, strategy: :one_for_one)
  end

  def child_spec(arg) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [arg]},
      type: :worker
    }
  end
end

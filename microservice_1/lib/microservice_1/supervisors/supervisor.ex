defmodule Microservice1.Supervisors.Supervisor do
  use Supervisor
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(_) do
    children = [
      Microservice1.Supervisors.Connection,
      Microservice1.Supervisors.Worker
    ]

    Supervisor.start_link(children, strategy: :rest_for_one)
  end

  def child_spec(arg) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [arg]},
      type: :supervisor
    }
  end
end

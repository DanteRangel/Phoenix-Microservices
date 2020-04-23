defmodule Api.Supervisors.Worker do
  use Supervisor

  def start_link() do
    Supervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_) do
    children = [
      worker(Api.Supervisors.Publisher, []),
      # worker(Api.Supervisors.Consumers.Spice, []),
      # worker(Api.Supervisors.Consumers.Saiyans, []),
    ]
    supervise(children, strategy: :one_for_one)
  end
end

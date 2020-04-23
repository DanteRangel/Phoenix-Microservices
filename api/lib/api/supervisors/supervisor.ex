defmodule Api.Supervisors.Supervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def init(_) do
    children = [
      %{
        id: Api.Supervisors.Connection,
        start: {Api.Supervisors.Connection, :start_link, []}
      },
      %{
        id: Api.Supervisors.Worker,
        start: {Api.Supervisors.Worker, :start_link, []}
      }
    ]

    opts = [strategy: :one_for_one, name: Api.Supervisors.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

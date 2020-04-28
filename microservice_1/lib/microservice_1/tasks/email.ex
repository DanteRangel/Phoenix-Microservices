defmodule Microservice1.Tasks.Email do
  alias Microservice1.Accounts
  use GenServer
  use Task

  def start_link(arg) do
    Task.start_link(__MODULE__, :run, [arg])
  end

  def run(id) do
    user = Accounts.get_user!(id)
    Microservice1.Mails.Login.welcome_email(user.email, "Info ......" , "asdasdasdas") |> Microservice1.Mailer.deliver_now
  end
end

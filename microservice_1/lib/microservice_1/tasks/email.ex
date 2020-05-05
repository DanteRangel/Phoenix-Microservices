defmodule Microservice1.Tasks.Email do
  alias Microservice1.Accounts
  use GenServer
  use Task

  def start_link(arg) do
    Task.start_link(__MODULE__, :run, [arg])
  end

  def run(id) do
    user = Accounts.get_user!(id)
    try do
      Microservice1.Mails.Login.welcome_email(user.email, "Info ......" , "asdasdasdas") |> Microservice1.Mailer.deliver_now
    rescue
      error in Bamboo.SMTPAdapter.SMTPError ->
        case error.raw do
          {:retries_exceeded, _} ->
            IO.inspect("I can do some stuff when this error match")
          _ ->
            IO.inspect "I don't care about these ones"
        end
        # Here, I can re-raise the error
        raise error
    end

  end
end

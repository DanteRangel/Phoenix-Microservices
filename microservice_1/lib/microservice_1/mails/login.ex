defmodule Microservice1.Mails.Login do
  import Bamboo.Email

  def welcome_email do
    new_email(
      to: "new.user@gmail.com",
      from: System.get_env("MAIL_USERNAME"),
      subject: "Welcome to the app.",
      html_body: "<strong>Thanks for joining!</strong>",
      text_body: "Thanks for joining!"
    )
  end

  def welcome_email(recipient) do
    new_email(
      to: recipient,
      from: System.get_env("MAIL_USERNAME"),
      subject: "Welcome to the class",
      html_body: "<strong>Thank you for joining! Your spot is reserved</strong>",
      text_body: "You are awesome. "
    )
  end

  def welcome_email(recipient, subject ,msg) do
    IO.inspect(recipient)
    IO.inspect(subject)
    username = System.get_env("MAIL_USERNAME")
    IO.inspect(username)
    IO.inspect(msg)
    new_email(
      to: recipient,
      from: username,
      subject: subject,
      html_body: msg,
      text_body: msg
    )
  end
end

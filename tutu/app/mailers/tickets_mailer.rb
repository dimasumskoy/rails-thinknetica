class TicketsMailer < ApplicationMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: t('.buy_mail_subject'))
  end

  def cancel_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: t('.cancel_mail_subject'))
  end
end

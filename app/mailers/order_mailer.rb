class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.notify_order.subject
  #
  def notify_order
    mail to: "#{current_user.email}", Subject:"Your CelAstro Airlines Ticket Order Status"
  end
end

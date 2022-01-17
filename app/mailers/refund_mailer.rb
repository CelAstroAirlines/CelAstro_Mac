class RefundMailer < ApplicationMailer
  def notify_refund(email)
    mail to: "#{current_user.email}", Subject:"Your CelAstro Airlines Ticket Order Status"
  end
end

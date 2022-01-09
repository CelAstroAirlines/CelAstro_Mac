class OrderMailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    OrderMailer.notify_order('#{current_user.email}').deliver
  end
end

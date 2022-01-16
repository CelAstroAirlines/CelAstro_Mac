class OrderMailJob < ApplicationJob
  queue_as :default

  def perform(*args)
    OrderMailer.notify_order('#{@user.email}').deliver
  end
end

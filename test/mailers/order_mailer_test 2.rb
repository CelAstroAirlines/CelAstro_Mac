require "test_helper"

class OrderMailerTest < ActionMailer::TestCase
  test "notify_order" do
    mail = OrderMailer.notify_order
    assert_equal "Notify order", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

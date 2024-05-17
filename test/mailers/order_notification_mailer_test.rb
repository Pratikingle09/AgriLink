require "test_helper"

class OrderNotificationMailerTest < ActionMailer::TestCase
  test "checkout_notification" do
    mail = OrderNotificationMailer.checkout_notification
    assert_equal "Checkout notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

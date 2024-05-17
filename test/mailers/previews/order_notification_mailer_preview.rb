# Preview all emails at http://localhost:3000/rails/mailers/order_notification_mailer
class OrderNotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_notification_mailer/checkout_notification
  def checkout_notification
    OrderNotificationMailer.checkout_notification
  end

end

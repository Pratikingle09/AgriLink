class OrderNotificationMailer < ApplicationMailer
  def checkout_notification(object)
    @object = object 
    user = User.find(@object.user_id)

    mail to: user.email , subject: "Confirmation mail for your purches"
  end
end

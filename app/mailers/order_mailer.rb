class OrderMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def receipt(user, order)
    @user = user
    @order = order
    @item = @order.line_items
    mail(to: @user.email, subject: "Confirmation of your order #{@order.id}")
  end
end

class UserMailer < ApplicationMailer
	default from: "no-reply@jungle.com"
	
	def receipt_email(order)
		@order = order
		@url = "http://localhost:3000/orders/#{@order.id}"
		mail(to: @order.email, subject: 'Thank you for your purchause, this is  your Jungle receipt.')
	end
end

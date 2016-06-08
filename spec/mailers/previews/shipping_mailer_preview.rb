# Preview all emails at http://localhost:3000/rails/mailers/shipping_mailer
class ShippingMailerPreview < ActionMailer::Preview
	def mail_to_buyer_preview
		ShippingMailer.mail_to_buyer(Order.first)
	end 

	def mail_to_seller_preview
		ShippingMailer.mail_to_seller(Order.first)
	end
end

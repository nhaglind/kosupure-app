class ShippingMailer < ApplicationMailer
	default from: "kosupureio@gmail.com"

	def mail_to_buyer(order)
		@user = order.buyer
		@listing = order.listing
		mail(to: @user.email, subject: "Thanks for purchasing #{@listing.name}!")
	end

	def mail_to_seller(order)
		@order = order
		@user = order.seller
		@buyer = order.buyer
		@listing = order.listing
		mail(to: @user.email, subject: "Your #{@listing.name} has been sold!")
	end
end

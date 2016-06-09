class ShippingMailer < ApplicationMailer
	default from: "kosupureio@gmail.com"
	include ActionView::Helpers::NumberHelper

	def mail_to_buyer(order)
		@order = order
		@amount = number_to_currency((@order.listing.price * @order.ordered_amount), :unit => "$")
		mail(to: @order.buyer.email, subject: "Thanks for purchasing #{@order.listing.name}!")
	end

	def mail_to_seller(order)
		@order = order
		@amount = number_to_currency((@order.listing.price * @order.ordered_amount), :unit => "$")

		mail(to: @order.seller.email, subject: "Your #{@order.listing.name} has been sold!")
	end
end

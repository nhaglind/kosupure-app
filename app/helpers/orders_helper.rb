module OrdersHelper
	def order_image_through_listing(listing)
		if listing.images.any?
			image_tag listing.images[0].url
		else
			image_tag "default.png"
		end
	end

	def order_image(order)
		if order.listing
			if order.listing.images.any?
				image_tag order.listing.images[0].to_s
			else
				image_tag "default.png"
			end
		else
				image_tag "default.png"
		end
	end
end

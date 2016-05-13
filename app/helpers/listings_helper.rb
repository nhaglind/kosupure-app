module ListingsHelper
	def listing_link(listing)
		if listing.images.any?
			link_to image_tag(listing.images[0].url), listing
		else
			link_to image_tag("default.jpg"), listing
		end
	end
end

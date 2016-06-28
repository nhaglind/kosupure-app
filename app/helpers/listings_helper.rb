module ListingsHelper
	def listing_link(listing)
		if listing.images.any?
			link_to image_tag(listing.images[0].url), listing
		else
			link_to image_tag("default.png"), listing
		end
	end

	def search_placeholder
		if params[:category].blank?
			"Search for items"
		else
			"Search within #{Category.find_by_id(params[:category]).name}"
		end
	end

	def hidden_category
		if params[:category].present?
			hidden_field_tag("category", params[:category])
		else
			""
		end
	end

	def category_count(category)
		if params[:keyword].present?
			" (#{Listing.no_zeroes.keyword(params[:keyword]).where(category_id: category).count}) "
		end
	end

end

require 'faker'

FactoryGirl.define do
	factory :listing do |f|
		f.name { Faker::Commerce.product_name }
		f.description { Faker::Hipster.sentence }
		f.price { Faker::Commerce.price }
		f.quantity { Faker::Number.between(10,20).abs }
		# f.user { Faker::Name.name }

		factory :listing_with_order do 
			after(:create) do |listing|
				create(:order, listing: listing)
			end
		end
	end
end

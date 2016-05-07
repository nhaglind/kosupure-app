require 'faker'

FactoryGirl.define do
	factory :listing do |f|
		f.name { Faker::Commerce.product_name }
		f.description { Faker::Hipster.sentence }
		f.price { Faker::Commerce.price }
		f.quantity { Faker::Number.between(10,20).abs }
		f.trade { Faker::Boolean.boolean }
		f.images { "https://www.dropbox.com/s/hr04f58uh8pcowb/accept_trades.jpg?raw=1" }
		# f.user { Faker::Name.name }

		factory :listing_with_order do 
			after(:create) do |listing|
				create(:order, listing: listing)
			end
		end
	end
end

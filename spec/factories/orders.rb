require 'faker'

FactoryGirl.define do
	factory :order do |f|
		f.address { Faker::Address.street_address }
		f.city { Faker::Address.city }
		f.state { Faker::Address.state }
		f.ordered_amount { Faker::Number.between(1,10) }
	end
end

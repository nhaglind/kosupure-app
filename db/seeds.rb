# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

#create some categories
10.times do 
	Category.create(name: Faker::Commerce.department) 
end

#create some sub categories
20.times do 
	Category.create(name: Faker::Commerce.department, parent_id: Faker::Number.between(1, 10)) 
end

#create some users
100.times do |i|
	User.create(name: Faker::Name.name, email: Faker::Internet.email('##{i}user'), password: Faker::Internet.password(6)) 
end

#create a bunch of listings
500.times do 
	Listing.create(name: Faker::Commerce.product_name, 
												description: Faker::Hipster.sentence, 
												price: Faker::Commerce.price, 
												quantity: Faker::Number.between(1,10),
												trade: Faker::Boolean.boolean,
												user_id: Faker::Number.between(1,100),
												category_id: Faker::Number.between(1,30))
end

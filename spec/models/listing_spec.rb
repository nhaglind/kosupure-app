require 'rails_helper'

describe Listing do
	context 'validations' do 
		it 'has a valid factory' do
			expect(FactoryGirl.create(:listing)).to be_valid
		end

		it 'is invalid without name' do
			expect(FactoryGirl.build(:listing, name: nil)).not_to be_valid
		end

		it 'is invalid without description' do
			expect(FactoryGirl.build(:listing, description: nil)).not_to be_valid
		end

		it 'is invalid without price' do
			expect(FactoryGirl.build(:listing, price: nil)).not_to be_valid
		end

		it 'is invalid without quantity' do
			expect(FactoryGirl.build(:listing, quantity: nil)).not_to be_valid
		end

		it 'is invalid with non-numeric price' do
			expect(FactoryGirl.build(:listing, price: "a")).not_to be_valid
		end

		it 'is invalid with non-numeric quantity' do
			expect(FactoryGirl.build(:listing, quantity: "a")).not_to be_valid
		end

	end

end
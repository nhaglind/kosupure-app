require 'rails_helper'

describe Order do
	context 'validations' do
		it 'has a valid factory' do
			expect(FactoryGirl.create(:order)).to be_valid
		end

		it 'is invalid without address' do
			expect(FactoryGirl.build(:order, address: nil)).not_to be_valid
		end

		it 'is invalid without city' do
			expect(FactoryGirl.build(:order, city: nil)).not_to be_valid
		end

		it 'is invalid without state' do
			expect(FactoryGirl.build(:order, state: nil)).not_to be_valid
		end

		it 'is invalid without ordered amount' do
			expect(FactoryGirl.build(:order, ordered_amount: nil)).not_to be_valid
		end
	end
	
	context '.decrease_quantity' do
			it 'decreases listing quantity by ordered amount' do
				listing = FactoryGirl.create(:listing)
				order = FactoryGirl.create(:order, listing: listing)
				expect{ order.decrease_quantity }.to change(listing, :quantity).by(-order.ordered_amount)
			end

			it 'destroys the listing when quantity is 0' do
				listing = FactoryGirl.create(:listing)
				order = FactoryGirl.create(:order, listing: listing, ordered_amount: listing.quantity)
				expect { order.decrease_quantity }.to change(Listing, :count)
			end
	end

end
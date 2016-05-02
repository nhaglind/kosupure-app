require 'rails_helper'

describe User do
	context 'validations' do
		it 'has a valid factory' do
			expect(FactoryGirl.create(:user)).to be_valid
		end

		it 'is invalid with duplicate email' do
			FactoryGirl.create(:user, email: "test@test.com")
			expect(FactoryGirl.build(:user, email: "test@test.com")).not_to be_valid
		end
	end	
end
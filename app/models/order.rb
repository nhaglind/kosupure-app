class Order < ActiveRecord::Base
	belongs_to :listing
  belongs_to :buyer, class_name: "User"
  belongs_to :seller, class_name: "User"

  validates :address, :city, :state, :ordered_amount, presence: true

  def decrease_quantity
  	self.listing.decrement!(:quantity, self.ordered_amount)

  	if self.listing.quantity == 0
  		self.listing.destroy
  	end
  end
end
class Category < ActiveRecord::Base
	has_many :listings
	belongs_to :parent_category, :class_name => 'Category'
	has_many :subcategories, :dependent => :destroy, :class_name => 'Category', :foreign_key => "parent_id"

	def self.find_all_subs(id)
		where(parent_id: id).ids
	end
end

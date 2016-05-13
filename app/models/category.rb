class Category < ActiveRecord::Base
	has_many :listings
	belongs_to :parent_category, :class_name => 'Category'
	has_many :subcategories, :dependent => :destroy, :class_name => 'Category', :foreign_key => "parent_id"

	def self.find_all_subs(id)
		child = where(parent_id: id).ids
		child.each do |c|
			where(parent_id: c).ids.each{|i| child.insert(child.index(c) + 1, i) }
		end
	end
end

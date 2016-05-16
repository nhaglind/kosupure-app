class Category < ActiveRecord::Base
	has_many :listings
	belongs_to :parent_category, :class_name => 'Category'
	has_many :subcategories, :dependent => :destroy, :class_name => 'Category', :foreign_key => "parent_id"

	scope :sub_display, -> (category_id) { where(parent_id: category_id) }
	scope :only_parents, -> { where(parent_id: nil) }

	def self.find_all_heirs(id)
		child = where(parent_id: id).ids
		child.each do |c|
			where(parent_id: c).ids.each{|i| child.insert(child.index(c) + 1, i) }
		end
	end

	def to_param
		[id, name.parameterize].join("-")
	end

end

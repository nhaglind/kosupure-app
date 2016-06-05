class Listing < ActiveRecord::Base

  mount_uploaders :images, ImageUploader

  validates :name, :description, :price, presence: true
  validates :price, :quantity, numericality: { greater_than: 0 }

  belongs_to :user
  belongs_to :category
  has_many :orders

  scope :no_zeroes, -> { where("quantity > 0") }
  scope :keyword, -> (keyword) { where("name ILIKE ? OR description ILIKE ?", "%#{keyword}%", "%#{keyword}%") }
  scope :category, -> (category) { where category_id: category }
  scope :ordering, -> (order = "created_at DESC") { order(order) }
  scope :named, -> (name) { where(user: name) }
  # scope :paging, ->  (page) { paginate(:page => page, :per_page => 12) }

  def to_param
  	[id, name.parameterize].join("-")
  end
end


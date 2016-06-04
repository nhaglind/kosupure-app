class Listing < ActiveRecord::Base

  mount_uploaders :images, ImageUploader

  validates :name, :description, :price, presence: true
  validates :price, :quantity, numericality: { greater_than: 0 }

  belongs_to :user
  belongs_to :category
  has_many :orders

  scope :no_zeroes, -> { where("quantity > 0") }
  scope :paginate_default, ->  (page) { paginate(:page => page, :per_page => 12) }

  def self.order_default(order = "created_at DESC")
    if order.nil?
      order("created_at DESC")
    else
      order(order)
    end
  end

  def self.search(keyword)
  	where("name ILIKE ? OR description ILIKE ?", "%#{keyword}%", "%#{keyword}%")
  end

  def to_param
  	[id, name.parameterize].join("-")
  end
end


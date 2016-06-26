class Listing < ActiveRecord::Base

  mount_uploaders :images, ImageUploader

  validates :name, :description, :price, :category_id, presence: true
  validates :price, :quantity, numericality: { greater_than: 0 }

  validates_length_of :images, maximum: 5, too_long: ": maximum number of images is 5"
  # validates :validate_images, file_size: { less_than_or_equal_to: 1.megabyte }
  validate :validate_images

  belongs_to :user
  belongs_to :category
  has_many :orders

  scope :no_zeroes, -> { where("quantity > 0") }
  scope :keyword, -> (keyword) { where("name ILIKE ? OR description ILIKE ?", "%#{keyword}%", "%#{keyword}%") }
  scope :category, -> (category) { where category_id: category }
  scope :ordering, -> (order) { reorder(order) }
  scope :named, -> (name) { where(user: name) }
  # scope :paging, ->  (page) { paginate(:page => page, :per_page => 12) }

  def validate_images
    images.each do |image|
      if image.present?
        errors.add(:images, "cannot exceed 1 megabyte") if image.size >= 1000000
      end
    end
  end

  def to_param
  	[id, name.parameterize].join("-")
  end
end


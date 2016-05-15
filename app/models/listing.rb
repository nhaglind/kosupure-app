class Listing < ActiveRecord::Base

  mount_uploaders :images, ImageUploader

  validates :name, :description, :price, presence: true
  validates :price, :quantity, numericality: { greater_than: 0 }

  belongs_to :user
  belongs_to :category
  has_many :orders

  def self.search(keyword)
  	where("name ILIKE ? OR description ILIKE ?", "%#{keyword}%", "%#{keyword}%")
  end
end
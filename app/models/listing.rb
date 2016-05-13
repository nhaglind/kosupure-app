class Listing < ActiveRecord::Base
  mount_uploaders :images, ImageUploader

  validates :name, :description, :price, :images, presence: true
  validates :price, :quantity, numericality: { greater_than: 0 }

  belongs_to :user
  belongs_to :category
  has_many :orders

end
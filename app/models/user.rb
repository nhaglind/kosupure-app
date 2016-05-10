class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:stripe_connect]

  validates :name, presence: true

  has_many :listings, dependent: :destroy
  has_many :sales, class_name: "Order", foreign_key: "seller_id"
  has_many :purchases, class_name: "Order", foreign_key: "buyer_id"

  def self.from_omniauth
  	self.update_attributes({
			provider: request.env["omniauth.auth"].provider,
			uid: request.env["omniauth.auth"].uid,
			access_code: request.env["omniauth.auth"].credentials.token
			publishable_key: request.env["omniauth.auth"].info.stripe_publishable_key
			})
  end
end

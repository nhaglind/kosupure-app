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

  def omniauthize(auth)
  	self.update_attributes({
			provider: auth.provider,
			uid: auth.uid,
			access_code: auth.credentials.token,
			publishable_key: auth.info.stripe_publishable_key
			})
  end

end

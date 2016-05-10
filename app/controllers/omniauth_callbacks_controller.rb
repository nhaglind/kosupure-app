class OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def stripe_connect
		@user = current_user
		@user.from_omniauth
	end
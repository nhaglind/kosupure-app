class OmniauthCallbacksController < Devise::OmniauthCallbacksController

	def stripe_connect
		@user = current_user
		@user.omniauthize(request.env["omniauth.auth"])
		redirect_to new_listing_path
	end

end
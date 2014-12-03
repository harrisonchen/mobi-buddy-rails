class WishlistController < ApplicationController
	respond_to :json

	before_filter :authenticate_user_from_token!
	before_filter :authenticate_user!

	def index
		respond_with(Wishlist.where(user_id: current_user.id)[0].items)
	end
end

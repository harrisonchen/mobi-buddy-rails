class WishlistController < ApplicationController
	respond_to :json

	def index
		respond_with(Wishlist.where(user_id: params[:user_id])[0].items)
	end
end

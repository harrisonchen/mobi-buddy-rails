class ItemsController < ApplicationController
	respond_to :json

	before_filter :authenticate_user_from_token!
	before_filter :authenticate_user!

	def create
		item = Item.create(wishlist_id: current_user.wishlist.id, name: params[:name] || "")

		render :json => { success: true, item: { id: item.id, name: item.name, wishlist_id: item.wishlist_id } }
	end

	def destroy
		Item.find_by_id(params[:id]).destroy

		render :json => { success: true }
	end
end

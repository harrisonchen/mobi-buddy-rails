class ItemsController < ApplicationController
	respond_to :json

	def create
		item = Item.create(wishlist_id: params[:wishlist_id], name: params[:name])

		render :json => { success: true, item: { id: item.id, name: item.name, wishlist_id: item.wishlist_id } }
	end

	def destroy
		Item.find_by_id(params[:id]).destroy

		render :json => { success: true }
	end
end

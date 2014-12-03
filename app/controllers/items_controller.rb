class ItemsController < ApplicationController
	respond_to :json

	before_filter :authenticate_user_from_token!
	before_filter :authenticate_user!

	def create
		item = Item.create(wishlist_id: current_user.wishlist.id,
											 name: params[:name] || "",
											 price: params[:price],
											 category: params[:category],
											 image_url: params[:image_url],
											 lat: params[:lat],
											 long: params[:long],
											 store_name: params[:store_name])

		render :json => { success: true, item: item.as_json }
	end

	def destroy
		Item.find_by_id(params[:id]).destroy

		render :json => { success: true }
	end
end

class ItemsController < ApplicationController
	respond_to :json

	before_filter :authenticate_user_from_token!
	before_filter :authenticate_user!

	def create
		if !current_user.wishlist.items.exists?(name: params[:name])
			item = Item.create(wishlist_id: current_user.wishlist.id,
												 name: params[:name] || "",
												 price: params[:price],
												 category: params[:category],
												 image_url: params[:image_url],
												 store_name: params[:store_name],
												 lat: params[:lat],
												 long: params[:long])

			render :json => { success: true, item: item.as_json }
		else
			render :json => { success: false }
		end
	end

	def destroy
		current_user.wishlist.items.find_by_id(params[:id]).destroy

		render :json => { success: true }
	end
end

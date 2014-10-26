class GasController < ApplicationController
	before_action :authenticate_user!, only: []

	respond_to :json

	def index
		@gas_stations = Gas.all.order("id DESC")
	end

  def nearbyGas
  	@lat = params["lat"].to_f
  	@long = params["long"].to_f
  	@gas = Gas.where(lat: (@lat-5)..(@lat+5), long: (@long-5)..(@long+5))
  	puts @gas
  	respond_with(@gas)
  end

  def create
  	@gas_stations = Gas.new(gas_params)

  	if(@gas_stations.save)
  		respond_to do |format|
  			format.json { render json: @gas_stations }
  		end
  	end
  end

  private

  	def gas_params
  		params.require(:gas).permit(:station, :country, :region, :city, :address,
  																:lat, :long, :reg_price, :mid_price, :pre_price,
  																:diesel_price, :reg_update, :mid_update, :pre_update,
  																:diesel_update)
  	end
end

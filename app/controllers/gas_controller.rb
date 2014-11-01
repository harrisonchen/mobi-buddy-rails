class GasController < ApplicationController
	before_action :authenticate_user!, only: []

	respond_to :json

	def index
		@gas_stations = Gas.all.order("id DESC")
	end

  def nearbyGas
  	# GET request
    lat = params["lat"]
    long = params["long"]
    dist = params["dist"]
    sortBy = params["sortBy"]
    url = "http://api.mygasfeed.com/stations/radius/" + lat +
          "/" + long + "/" + dist + "/reg/" + sortBy + "/xfakzg0s3n.json"
    request = Typhoeus.get(url)
    response = JSON.parse(request.response_body)
    respond_with(response)
  end

  def updateGas
    # POST request
    stationid = params["stationid"]
    price = params["price"]
    fueltype = params["fueltype"]
    url = "http://api.mygasfeed.com/locations/price/xfakzg0s3n.json"
    body = { price: price, fueltype: fueltype, stationid: stationid }
    request = Typhoeus.post(url, body: body)
    response = JSON.parse(request.response_body)
    respond_with(response)
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

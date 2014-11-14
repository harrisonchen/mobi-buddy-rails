class GasController < ApplicationController
  skip_before_filter :authenticate_user_from_token!,
                       only: [:index, :nearbyGas, :findGasBy, :getBrand]
  skip_before_filter :authenticate_user!,
                       only: [:index, :nearbyGas, :findGasBy, :getBrand]
	respond_to :json

	def index
		@gas_stations = Gas.all.order("id DESC")
	end

  def nearbyGas
    lat = params["lat"]
    long = params["long"]
    dist = params["dist"]
    sortBy = params["sortBy"] || "reg"
    url = "http://api.mygasfeed.com/stations/radius/" + lat +
          "/" + long + "/" + dist + "/reg/price/xfakzg0s3n.json"
    request = Typhoeus.get(url)
    response = JSON.parse(request.response_body)
    stations = response["stations"]
    responseHash = { stations: [] }
    for station in stations
      if entry = Gas.find_by_id(station["id"])
        responseHash[:stations].push(entry)
      else
        g = Gas.create(station)
        responseHash[:stations].push(g)
      end
    end
    sort(responseHash, sortBy)
    respond_with(responseHash)
  end

  def sort(response, sortBy)
    response[:stations].sort_by! do |item|
      case sortBy
      when "reg"
        item[:reg_price]
      when "mid"
        item[:mid_price]
      when "pre"
        item[:pre_price]
      when "diesel"
        item[:diesel_price]
      when "distance"
        item[:distance]
      when "price"
        item[:reg_price]
      end
    end
  end

  def search

  end

  def updateGas
    stationid = params["stationid"]
    price = params["price"]
    fueltype = params["fueltype"]
    entry = Gas.find_by_id(stationid)
    if entry
      case fueltype
      when "reg"
        entry.update(reg_price: price)
      when "mid"
        entry.update(mid_price: price)
      when "pre"
        entry.update(pre_price: price)
      end
    end
    respond_with(entry)
  end

  def findGasBy
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

  def getBrands
    url = "http://api.mygasfeed.com/stations/brands/xfakzg0s3n.json"
    request = Typhoeus.get(url)
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

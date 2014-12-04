namespace :gas do
  desc "TODO"
  task populate: :environment do
  	lat = 49.137414
  	long = -125.438493
  	dist = 25

  	while lat > 26.114363
  		while long < -67.079119
		  	url = "http://api.mygasfeed.com/stations/radius/" + lat.to_s +
		          "/" + long.to_s + "/" + dist.to_s + "/reg/price/xfakzg0s3n.json"
		    request = Typhoeus.get(url)
		    stations = JSON.parse(request.response_body)["stations"]
		    for station in stations
		    	if !Gas.exists?(id: station["id"])
		    		Gas.create(station)
		    	end
		    end

		    long += 0.4
		    puts "Latitude: #{lat.to_s} Longitude: #{long.to_s}"
		  end

  		long = -125.438493
		  lat -= 0.4
		   puts "Latitude: #{lat.to_s} Longitude: #{long.to_s}"
	  end
  end

end

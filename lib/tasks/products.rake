namespace :products do
  desc "TODO"
  task faker: :environment do
  	foodNames = {
  		0 => "Apple",
  		1 => "Banana",
  		2 => "Cigar",
  		3 => "Eclair",
  		4 => "Mochi",
  		5 => "Chicken",
  		6 => "Steak",
  		7 => "Pork",
  		8 => "Lamb",
  		9 => "Egg"
  	}
  	foodPrices = {
  		0 => 1.20,
  		1 => 1.20,
  		2 => 3.70,
  		3 => 1.20,
  		4 => 2.70,
  		5 => 2.20,
  		6 => 5.70,
  		7 => 2.70,
  		8 => 5.70,
  		9 => 1.70
  	}
  	groceryStores = {
  		0 => "Ralphs",
  		1 => "Food4Less",
  		2 => "Walmart",
  		3 => "Costco",
  		4 => "WholeFoods",
  		5 => "StaterBros"
  	}
  	for i in 0..50
  		foodNum = rand(foodNames.length)
  		groceryNum = rand(groceryStores.length)
  		product = Product.create({
  			name: foodNames[foodNum],
  			store_name: groceryStores[groceryNum],
  			lat: (33.8843756 + (rand(999999)*2.0/10000000)),
  			long: (-117.3280882 + (rand(999999)*2.0/10000000)),
  			price: (foodPrices[foodNum] + (rand(60)*1.0/100))
  		})
  		puts product
  	end
  end

end

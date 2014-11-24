namespace :users do
  desc "TODO"
  task add_wishlist: :environment do
  	for user in User.all
  		if !user.wishlist
  			Wishlist.create(user_id: user.id)
  		end
  	end
  end

end

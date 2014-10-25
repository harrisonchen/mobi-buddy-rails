namespace :gas do
  desc "TODO"
  task populate: :environment do
  	for i in (0...100) do
  		FactoryGirl.create(:gas)
  	end
  end

end

class HomeController < ApplicationController
	skip_before_filter :authenticate_user_from_token!,
                       only: [:index, :nearbyGas, :findGasBy, :getBrand]
  skip_before_filter :authenticate_user!,
                       only: [:index, :nearbyGas, :findGasBy, :getBrand]
  def index
  end
end

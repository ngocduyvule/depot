class StoreController < ApplicationController
  def index
	@products = Product.all
	@time = Time.now
	session[:counter] ||= 0
	@count = session[:counter] += 1
  end

end

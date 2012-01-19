class StoreController < ApplicationController
  skip_before_filter :authorize
  
  def index
	  @products = Product.all
	  @cart = current_cart
	  @time = Time.now
	  session[:counter] ||= 0
	  @count = session[:counter] += 1
  end

end

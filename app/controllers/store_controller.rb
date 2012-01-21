class StoreController < ApplicationController
  skip_before_filter :authorize
  
  def index
    if params[:set_locale]
      redirect_to store_path(locale: params[:set_locale])
    else
      @products = Product.all
      @cart = current_cart
      @time = Time.now
      session[:counter] ||= 0
      @count = session[:counter] += 1
    end
  end

end

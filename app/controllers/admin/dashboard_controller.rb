class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_BASIC_AUTHENTICATE_NAME"], password: ENV["HTTP_BASIC_AUTHENTICATE_PASSWORD"]
  
  def show
    @product_count = Product.all.count
    @category_count = Category.all.count
  end
end

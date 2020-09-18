class ProductsController < ApplicationController
  

  def index
    # uses MODEL
    @products = Product.all.order(created_at: :desc)
    # VIEW
    #render :indes # implicit
  end

  def show
    @product = Product.find params[:id]
    @msg = "Hellooooo"
    render 'show'  # implicit
  end

end

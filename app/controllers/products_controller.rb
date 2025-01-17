class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find(params[:id])
    @review = Review.new
    @rate = @product.reviews.average(:rating)
  end

end

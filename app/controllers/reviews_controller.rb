class ReviewsController < ApplicationController
  def create
    @review = Product.find(params[:product_id]).reviews.new(review_params)

    if @review.save
        redirect_to "/"
      else
        redirect_to "/register"
    end  
  end
  private
  def review_params
    puts params
    params.require(:review).permit(:description, :rating)
  end
end

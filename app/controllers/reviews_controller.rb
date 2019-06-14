class ReviewsController < ApplicationController
  def create
    @review = Product.find(params[:product_id]).reviews.new(review_params)
    @review.user_id = current_user.id
    
    if @review.save
        redirect_to "/products/#{@review.product_id}"
      else
        redirect_to "/products/#{@review.product_id}"
    end  
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
 
    redirect_to "/products/#{@review.product_id}"
  end

  private
  def review_params
    puts params
    params.require(:review).permit(:description, :rating)
  end

end

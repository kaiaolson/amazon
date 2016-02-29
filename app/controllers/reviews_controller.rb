class ReviewsController < ApplicationController
  def create
    @product = Product.find params[:product_id]
    review_params = params.require(:review).permit(:body)
    @review = Review.new review_params
    @review.product = @product
    respond_to do |format|
      if @review.save
        format.html { redirect_to product_path(@product), notice: "Review created!"}
        format.js   { render :create_success }
      else
        format.html { render "/products/show", alert: "Review not created!" }
        format.js   { render "alert('Review not created!');"}
      end
    end
  end

  def destroy
    review = Review.find params[:id]
    review.destroy
    redirect_to product_path(params[:product_id]), notice: "Review deleted!"
  end
end

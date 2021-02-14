class ReviewsController < ApplicationController

  def new
    @item = Item.find(params[:item_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to item_path()
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:score, :text, :image).merge(user_id: current_user.id)
  end

end

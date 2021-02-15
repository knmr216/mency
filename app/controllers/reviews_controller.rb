class ReviewsController < ApplicationController
  before_action :move_to_index, only: :new

  def new
    @item = Item.find(params[:item_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to item_path(params[:item_id])
    else
      @item = Item.find(params[:item_id])
      render :new
    end
  end

  private

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

  def review_params
    params.require(:review).permit(:score, :text, :image).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end

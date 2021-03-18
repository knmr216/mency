class ItemsController < ApplicationController
  before_action :move_to_index, only: :new

  def index
    @items = Item.includes(:brand, :reviews).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @reviews = @item.reviews.includes(:user)
  end

  private

  def move_to_index
    redirect_to root_path unless brand_signed_in?
  end

  def item_params
    params.require(:item).permit(:name, :category_id, :capacity, :unit_id, :price, :introduction, :image).merge(brand_id: current_brand.id)
  end

end
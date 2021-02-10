class ItemsController < ApplicationController
  

  def index
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

  private

  def item_params
    params.require(:item).permit(:name, :category_id, :capacity, :unit_id, :price, :introduction).merge(brand_id: current_brand.id)
  end

end

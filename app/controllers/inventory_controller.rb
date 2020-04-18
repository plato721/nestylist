class InventoryController < ApplicationController
  # get index
  def index
    @items = Item.items_for(current_user)
  end

  def create
    item = Item.create(item_params)
    @items = Item.items_for(current_user)

    render :index
  end

  private
  def item_params
    params.require(:item).permit(:name).merge(user: current_user)
  end
end

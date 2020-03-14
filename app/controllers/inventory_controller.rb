class InventoryController < ApplicationController
  # get index
  def index
    @items = Item.items_for(current_user)
  end
end

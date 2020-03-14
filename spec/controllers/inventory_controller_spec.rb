require 'rails_helper'

describe InventoryController do
  context 'get index' do
    it "assigns the user's items" do
      user = create(:user)
      items = create_list(:item, 2, user: user)
      sign_in(user)

      get :index

      expect(assigns :items).to match_array(Item.items_for(user))
    end

    it "doesn't have any items if not logged in" do
      get :index

      expect(assigns :items).to be_nil
    end
  end
end

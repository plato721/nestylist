require 'rails_helper'

RSpec.describe Shop, type: :model do
  context "seeds" do
    it "creates an 'any' shop" do
      shop = described_class.find_by(name: 'Any')
      expect(shop).to be_a(Shop)
    end
  end

  context "associated with item" do
    it "has many items" do
      shop = create :shop
      items = create_list :item, 3

      shop.items << items

      expect(shop.items).to match_array(items)
    end
  end
end

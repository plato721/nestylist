require 'rails_helper'

RSpec.describe Shop, type: :model do
  context "seeds" do
    it "creates an 'any' shop" do
      shop = described_class.find_by(name: 'Any')
      expect(shop).to be_a(Shop)
    end
  end
end

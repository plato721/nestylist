require 'rails_helper'

describe Item do
  describe "factory -" do
    before :all do
      @item = create :item
    end

    after :all do
      @item.destroy
    end

    it "is the thing" do
      expect(@item.is_a? Item).to be_truthy
    end

    it "has a name" do
      expect(@item.name.is_a? String).to be_truthy
      expect(@item.name).to_not be_blank
    end
  end

  it "can have a user" do
    user = create :user
    item = create :item

    item.user = user
    item.save

    expect(item.user).to eq(user)
  end

  it "has a unique name per user" do
    user = create :user
    item = create :item, name: 'tuna', user: user

    item2 = Item.new(name: 'tuna', user: user)

    expect(item2).to_not be_valid
  end

  it "is not unique between user" do
    users = create_list :user, 2
    item = create :item, name: 'green eggs', user: users.first
    item_2 = build :item, name: 'green eggs', user: users.second
    item_3 = build :item, name: 'green eggs', user: nil

    items = [item, item_2, item_3]
    expect(items.all? { |item| item.valid?} ).to be_truthy
    expect(items.all? { |item| item.name == 'green eggs' }).to be_truthy
  end

  it "is not unique via case sensitivity" do
    item = create :item, name: 'ham'
    item_2 = Item.new(name: 'Ham')

    expect(item_2).to_not be_valid
  end

  context "scopes: " do
    describe ".items_for(user) - " do
      let(:user_1){ create(:user) }
      let(:user_2){ create(:user) }

      it "scopes to the user" do
        items = create_list(:item, 2, user: user_1)

        user_1_items = described_class.items_for(user_1)
        user_2_items = described_class.items_for(user_2)

        expect(user_1_items).to match_array(items)
        expect(user_2_items).to be_blank

        user_1_items.each do |item|
          expect(item.user).to eq(user_1)
        end
      end

      it "scopes to another user" do
        items = create_list(:item, 3, user: user_2)

        user_1_items = described_class.items_for(user_1)
        user_2_items = described_class.items_for(user_2)

        expect(user_1_items).to be_blank
        expect(user_2_items).to match_array(items)

        user_2_items.each do |item|
          expect(item.user).to eq(user_2)
        end
      end
    end
  end
end

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

  it "is not unqiue between user" do
    users = create_list :user, 2
    item = create :item, name: 'green eggs', user: users.first
    item_2 = build :item, name: 'green eggs', user: users.second
    item_3 = build :item, name: 'green eggs', user: nil

    items = [item, item_2, item_3]
    expect(items.all? { |item| item.valid?} ).to be_truthy
    expect(items.all? { |item| item.name == 'green eggs' }).to be_truthy
  end
end

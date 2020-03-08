require 'rails_helper'

describe Item do
  describe 'factory -' do
    before :all do
      @item = create :item
    end

    it 'is the thing' do
      expect(@item.is_a? Item).to be_truthy
    end

    it 'has a name' do
      expect(@item.name.is_a? String).to be_truthy
      expect(@item.name).to_not be_blank
    end
  end

  it 'can have a user' do
    user = create :user
    item = create :item

    item.user = user
    item.save

    expect(item.user).to eq(user)
  end
end

require 'rails_helper'

describe Test::UsersController, type: :controller do
  it "crashes hard unless test/dev - VERY IMPORTANT" do
    allow(Rails.env).to receive(:test?){ false }
    allow(Rails.env).to receive(:development?){ false }

    expect{
      get :destroy_username, params: { username: 'moses' }, xhr: true
    }.to raise_error(SecurityError)
  end
end

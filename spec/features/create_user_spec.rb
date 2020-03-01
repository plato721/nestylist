require 'rails_helper'

feature 'Create User' do
  it "a new user can sign up with a username and password" do
    visit root_path
    find('#nav-sign-up').click
    fill_in :user_username, with: 'leeroy_jenkins'
    fill_in :user_password, with: 'Password1!'
    fill_in :user_password_confirmation, with: 'Password1!'
    find("[type=submit]").click
    expect(page).to have_content("successful")
    expect(page).to have_content("Logged in")
  end
end

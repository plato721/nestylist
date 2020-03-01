require 'rails_helper'

describe "Log in and log out - " do
  let!(:user){ FactoryBot.create :user }
  it "with a FactoryBot user" do
    visit root_path
    find("#nav-sign-in").click
    fill_in :user_login, with: "#{user.username}"
    fill_in :user_password, with: "Password1"
    find("[type=submit]").click

    within("#signed-in-user") do
      expect(page).to have_content("#{user.username}")
    end

    find("#nav-sign-out").click

    expect(page).to have_content /signed out/i
    expect(page).to_not have_content("#{user.username}")
  end
end

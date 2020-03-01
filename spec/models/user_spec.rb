require 'rails_helper'

RSpec.describe User, type: :model do
  context "validation - " do
    it "is not valid without a password" do
      user = User.new(username: "something")

      expect(user).to_not be_valid
    end

    it "is valid without an email" do
      user = User.new({
        username: "something_else",
        password: "Password1"
      })
      expect(user).to be_valid
    end
  end

  context "authentication - " do
    it "doesn't store password in clear text" do
      user = User.new(username: "moses")
      user.password = "Password1"
      user.save

      expect(user).to be_persisted

      retrieved_user = User.find_by(username: "moses")
      expect(retrieved_user.password).to_not eq("moses")
    end
  end
end

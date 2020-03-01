FactoryBot.define do
  sequence :username do |i|
    "abe_lincoln_#{i}"
  end

  factory :user do
    username { generate(:username) }
    email { nil }
    password { "Password1" }
  end
end

FactoryBot.define do
  sequence(:shop_name) { |i| "Shop #{i}" }

  factory :shop do
    name { generate :shop_name }
    description { "A place to buy things" }
  end
end

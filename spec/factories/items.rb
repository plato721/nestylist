FactoryBot.define do
  sequence(:item_name) { |i| "Item #{i}"}
  factory :item do
    name { generate(:item_name) }
  end
end

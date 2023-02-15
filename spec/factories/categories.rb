# spec/factories/categories.rb
FactoryBot.define do
  factory :category do
    name { "Food" }
    icon { "🍔" }
    user
  end
end

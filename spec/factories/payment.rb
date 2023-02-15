FactoryBot.define do
  factory :payment do
    amount { 100 }
    user
    category
  end
end

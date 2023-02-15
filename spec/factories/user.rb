# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    sequence(:full_name) { |n| "User #{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password" }
  end
end


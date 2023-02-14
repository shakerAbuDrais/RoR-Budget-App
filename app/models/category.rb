class Category < ApplicationRecord
  has_many :category_payments
  has_many :payments, through: :category_payments
end

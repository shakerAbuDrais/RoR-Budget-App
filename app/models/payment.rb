class Payment < ApplicationRecord
  belongs_to :category
  has_many :category_payments
  has_many :categories, through: :category_payments
end
